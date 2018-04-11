package com.bpm.asset.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bpm.asset.dao.AppurtenanceDao;
import com.bpm.asset.dao.HouseInstitutionsDao;
import com.bpm.asset.dao.SubsidiaryFileDao;
import com.bpm.asset.dao.AssetDao;
import com.bpm.asset.dao.DictionaryDao;
import com.bpm.asset.entity.Asset;
import com.bpm.asset.entity.Classify;
import com.bpm.asset.entity.Dictionary;
import com.bpm.asset.entity.Appurtenance;
import com.bpm.asset.entity.SubsidiaryFile;
import com.bpm.asset.service.AssetService;
import com.bpm.asset.service.FileService;
import com.bpm.asset.entity.HouseInstitutions;
import com.bpm.asset.vo.AssetVo;

@Service
public class AssetServiceImpl implements AssetService {

	@Resource
	private DictionaryDao DictionaryDao;

	@Resource
	private AssetDao AssetDao;

	@Resource
	private HouseInstitutionsDao HouseInstitutionsDao;

	@Resource
	private AppurtenanceDao AppurtenanceDao;
	
	@Resource
	private FileService FileService;

	@Resource
	private SubsidiaryFileDao SubsidiaryFileDao;
	
	@Override
	public int addAsset(AssetVo AssetVo) {

		String uid = UUID.randomUUID().toString();

		Asset Asset = AssetVo.getAsset();
		Asset.setCardNumber(uid);
		Asset.setGroupId("");
		Asset.setAuditState(1);
		Asset.setNewsDate(new Date());
		AssetDao.add(Asset);

		// 添加资产附属设备
		List<Appurtenance> App = AssetVo.getAppurtenance();
		if(App!=null){
			for (Appurtenance list : App) {
				list.setCardNumber(uid);
				AppurtenanceDao.add(list);
	
			}
		}
		// 资产附属文件
		List<SubsidiaryFile> Sub = AssetVo.getSubsidiaryFile();
		if(Sub!=null){
			for (SubsidiaryFile list : Sub) {
				list.setCardNumber(uid);
				SubsidiaryFileDao.add(list);
				//保存上传的附件
				//FileService.upload(list.getUpload(),uid);

			}
		}
		 // 房屋所属机构
		
		List<HouseInstitutions> Hou = AssetVo.getHouseInstitutions();
		if(Hou!=null){
			for (HouseInstitutions list : Hou) {
				list.setCardNumber(uid);
				HouseInstitutionsDao.add(list);
			}
		}
		

		return 1;
	}

	@Override
	public int updateAsset(AssetVo AssetVo) {
		// 更新资产主体---------------------------------------------------------------------
		Asset Asset = AssetVo.getAsset();
		AssetDao.update(Asset);
		String id = Asset.getCardNumber();
		// 更新资产附属设备------------------------------------------------------------------
		List<Appurtenance> appnew = AssetVo.getAppurtenance();
		List<Appurtenance> appold = AppurtenanceDao.findById(id);

		// 增加
		for (Appurtenance list : appnew) {
			if (list.getId() == null) {
				AppurtenanceDao.add(list);
			}
		}
		// 如果与新增加的列表对比没有则删除
		int i = 0;
		for (Appurtenance list : appold) {
			for (Appurtenance list2 : appnew) {
				if (list.getId() == list2.getId()) {
					i = 1;
				}
			}
			if (i == 0) {
				AppurtenanceDao.deleteById(list.getId());
			}
		}
		// 更新房屋所属机构------------------------------------------------------------------
		List<HouseInstitutions> hounew = AssetVo.getHouseInstitutions();
		List<HouseInstitutions> houold = HouseInstitutionsDao.findById(id);

		// 增加
		for (HouseInstitutions list : hounew) {
			if (list.getId() == null) {
				HouseInstitutionsDao.add(list);
			}
		}
		// 如果与新增加的列表对比没有则删除
		int j = 0;
		for (HouseInstitutions list : houold) {
			for (HouseInstitutions list2 : hounew) {
				if (list.getId() == list2.getId()) {
					j = 1;
				}
			}
			if (j == 0) {
				HouseInstitutionsDao.deleteById(list.getId());
			}
		}

		// 更新资产附属文件------------------------------------------------------------------
		List<SubsidiaryFile> subnew = AssetVo.getSubsidiaryFile();
		List<SubsidiaryFile> subold = SubsidiaryFileDao.findById(id);

		// 增加
		for (SubsidiaryFile list : subnew) {
			if (list.getId() == null) {
				SubsidiaryFileDao.add(list);
				//保存上传的附件
				//FileService.upload(list.getUpload(),id);
			}
		}
		// 如果与新增加的列表对比没有则删除
		int n = 0;
		for (SubsidiaryFile list : subold) {
			for (SubsidiaryFile list2 : subnew) {
				if (list.getId() == list2.getId()) {
					n = 1;
				}
			}
			if (n == 0) {
				SubsidiaryFileDao.deleteById(list.getId());
				//删除上传的附件
				FileService.deleteFile(list.getName(),id);
			}
		}
		return 1;
	}

	@Override
	public int deleteAsset(String cardNumber) {
		AssetDao.deleteById(cardNumber);
		HouseInstitutionsDao.deleteByCId(cardNumber);
		AppurtenanceDao.deleteByCId(cardNumber);
		SubsidiaryFileDao.deleteByCId(cardNumber);
		//删除上传的附件
		FileService.deleteFile(cardNumber);
		return 1;
	}

	@Override
	public AssetVo findAssetById(String id) {

		Asset as = AssetDao.findById(id);
		AssetVo vo = new AssetVo();
		if(SubsidiaryFileDao.findById(id)!=null){
			List<SubsidiaryFile> su = SubsidiaryFileDao.findById(id);
			vo.setSubsidiaryFile(su);
		}
		if(AppurtenanceDao.findById(id)!=null){
			List<Appurtenance> ap = AppurtenanceDao.findById(id);
			vo.setAppurtenance(ap);
		}
		if(HouseInstitutionsDao.findById(id)!=null){
			List<HouseInstitutions> hu = HouseInstitutionsDao.findById(id);
			vo.setHouseInstitutions(hu);
		}
		vo.setAsset(as);
		System.out.println(vo.toString());
		return vo;
	}
	


	@Override
	public List<Asset> findByBT(String column) {

		return AssetDao.findByBT(column);
	}
	
	@Override
	public List<Asset> findByTZ(String column) {

		return AssetDao.findByTZ(column);
	}

	@Override
	public int updatebyCid(String cardNumber, int auditState, String auditOpinion) {

		return AssetDao.updatebyCid(cardNumber, auditState, auditOpinion);
	}

	public List<Dictionary> findByCode(String code) {

		return DictionaryDao.findByCode(code);
	}
	public List<Dictionary> findByCodeUnit(String code) {

		return DictionaryDao.findByCodeUnit(code);
	}
	
	public List<Classify> findByClassifyCode(String code) {

		return DictionaryDao.findByClassifyCode(code);
	}

	@Override
	public int updateAsset1(Asset asset) {
		return AssetDao.update(asset);
		
	}

	
	
}
