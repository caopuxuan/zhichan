package com.bpm.asset.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bpm.asset.dao.AssetDao;
import com.bpm.asset.dao.DealDao;
import com.bpm.asset.dao.AnnexesDao;
import com.bpm.asset.entity.Asset;
import com.bpm.asset.entity.Deal;
import com.bpm.asset.entity.Annexes;
import com.bpm.asset.service.DealService;
import com.bpm.asset.vo.DealVo;

@Service
public class DealServiceImpl implements DealService {

	@Resource
	private DealDao DealDao;

	@Resource
	private AnnexesDao AnnexesDao;

	@Resource
	private AssetDao AssetDao;

	// 处置条件查询
	@Override
	public List<Deal> findByBT(String column) {
		return DealDao.findByBT(column);
	}

	// 删除
	@Override
	public int deleteDeal(String dealNumber) {

		AnnexesDao.deleteByDId(dealNumber);
		DealDao.deleteById(dealNumber);
		AssetDao.updateDealbyDid(dealNumber);
		return 1;
	}

	// 新增
	@Override
	public int addDeal(DealVo DealVo) {

		String uid = UUID.randomUUID().toString();

		Deal Deal = DealVo.getDeal();
		Deal.setDealNumber(uid);
		Deal.setGroupId("");
		Deal.setUserId("");
		Deal.setApplicationDate(new Date());
		DealDao.add(Deal);

		// 处置附件
		List<Annexes> Ann = DealVo.getAnnexes();
		for (Annexes list : Ann) {
			list.setDealNumber(uid);
			AnnexesDao.add(list);
		}
		// 资产卡片关联处置
		List<Asset> as = DealVo.getAsset();
		for (Asset list : as) {
			AssetDao.updateDealbyCid(4, uid, list.getCardNumber());
		}
		return 1;
	}

	// 更新
	@Override
	public int updateDeal(DealVo DealVo) {

		// 更新资产主体---------------------------------------------------------------------
		Deal Deal = DealVo.getDeal();
		DealDao.update(Deal);
		String id = Deal.getDealNumber();

		// 更新资产附属文件------------------------------------------------------------------
		List<Annexes> annnew = DealVo.getAnnexes();
		List<Annexes> annold = AnnexesDao.findById(id);

		// 增加
		for (Annexes list : annnew) {
			if (list.getId() == null) {
				AnnexesDao.add(list);
			}
		}
		// 如果与新增加的列表对比没有则删除
		int n = 0;
		for (Annexes list : annold) {
			for (Annexes list2 : annnew) {
				if (list.getId() == list2.getId()) {
					n = 1;
				}
			}
			if (n == 0) {
				AnnexesDao.deleteById(list.getId());
			}
		}

		// 资产卡片更新
		// 更新资产附属文件------------------------------------------------------------------
		List<Asset> assnew = DealVo.getAsset();
		List<Asset> assold = AssetDao.findByDId(id);

		// 增加 更新资产卡片的状态
		for (Asset list : assnew) {
			if (list.getAuditState() == 3) {
				AssetDao.updateDealbyCid(4, id, list.getCardNumber());
			}
		}
		// 如果与新增加的列表对比没有则删除
		int x = 0;
		for (Asset list : assold) {
			for (Asset list2 : assnew) {
				if (list.getCardNumber() == list2.getCardNumber()) {
					x = 1;
				}
			}
			if (x == 0) {
				AssetDao.updateDealbyCid(3, "", list.getCardNumber());
			}
		}

		return 1;

	}

	// 编辑查询
	@Override
	public DealVo findDealById(String dealNumber) {

		List<Asset> as = AssetDao.findByDId(dealNumber);
		List<Annexes> an = AnnexesDao.findById(dealNumber);
		Deal de = DealDao.findById(dealNumber);
		DealVo vo = new DealVo();
		vo.setDeal(de);
		vo.setAnnexes(an);
		vo.setAsset(as);
		return vo;

	}

	// 提交审核
	@Override
	public int updatebyDid(String dealNumber, int dealStatus, String auditOpinion) {
		//如果处置单审核通过 修改资产卡片状态为以处置
				if(dealStatus==3){
					AssetDao.updateAssetbyDid(dealNumber);
				}
		return DealDao.updatebyDid(dealNumber, dealStatus, auditOpinion);
	}

	@Override
	public void updateDeal1(Deal deal) {
		
		DealDao.update(deal);
	}

}
