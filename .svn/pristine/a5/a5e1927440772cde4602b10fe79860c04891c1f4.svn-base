package com.bpm.asset.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bpm.asset.entity.Asset;
import com.bpm.asset.entity.Classify;
import com.bpm.asset.entity.Dictionary;
import com.bpm.asset.vo.AssetVo;

@Service
public interface AssetService {
	
	public List<Dictionary> findByCode(String code);
	
	public List<Dictionary> findByCodeUnit(String code);
	
	public List<Classify> findByClassifyCode(String code);
	
	public int addAsset(AssetVo AssetVo);

	public int updateAsset(AssetVo AssetVo);

	public int deleteAsset(String cardNumber);

	public AssetVo findAssetById(String cid);
	
	public int updatebyCid(String cardNumber,int auditState,String auditOpinion);
	
	public List<Asset> findByBT(String column);
	
	public List<Asset> findByTZ(String column);

	public int updateAsset1(Asset asset);

	
//	public List<Asset> findByGroupId(Asset Asset);
	
}
