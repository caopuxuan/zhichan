package com.bpm.asset.vo;

import java.util.List;

import com.bpm.asset.entity.Deal;
import com.bpm.asset.entity.Annexes;
import com.bpm.asset.entity.Asset;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "DealVo", description = "资产整体对象")
public class DealVo {

	@ApiModelProperty(value = "资产处置主表")
	private Deal Deal;
	
	@ApiModelProperty(value = "资产附属文件")
	private List<Asset> Asset;
	
	@ApiModelProperty(value = "资产附属设备")
	private List<Annexes> Annexes;

	public Deal getDeal() {
		return Deal;
	}

	public void setDeal(Deal deal) {
		Deal = deal;
	}

	public List<Asset> getAsset() {
		return Asset;
	}

	public void setAsset(List<Asset> asset) {
		Asset = asset;
	}

	public List<Annexes> getAnnexes() {
		return Annexes;
	}

	public void setAnnexes(List<Annexes> annexes) {
		Annexes = annexes;
	}
	
}
