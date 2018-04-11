package com.bpm.asset.vo;

import java.util.List;

import com.bpm.asset.entity.Asset;
import com.bpm.asset.entity.Appurtenance;
import com.bpm.asset.entity.SubsidiaryFile;
import com.bpm.asset.entity.HouseInstitutions;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "AssetVo", description = "资产整体对象")
public class AssetVo {

	@ApiModelProperty(value = "资产主表")
	private Asset Asset;
	
	@ApiModelProperty(value = "资产附属文件")
	private List<SubsidiaryFile> SubsidiaryFile;
	
	@ApiModelProperty(value = "房屋所属机构")
	private List<HouseInstitutions> HouseInstitutions;
	
	@ApiModelProperty(value = "资产附属设备")
	private List<Appurtenance> Appurtenance;

	public Asset getAsset() {
		return Asset;
	}

	public void setAsset(Asset asset) {
		Asset = asset;
	}

	public List<SubsidiaryFile> getSubsidiaryFile() {
		return SubsidiaryFile;
	}

	public void setSubsidiaryFile(List<SubsidiaryFile> subsidiaryFile) {
		SubsidiaryFile = subsidiaryFile;
	}

	public List<HouseInstitutions> getHouseInstitutions() {
		return HouseInstitutions;
	}

	public void setHouseInstitutions(List<HouseInstitutions> houseInstitutions) {
		HouseInstitutions = houseInstitutions;
	}

	public List<Appurtenance> getAppurtenance() {
		return Appurtenance;
	}

	public void setAppurtenance(List<Appurtenance> appurtenance) {
		Appurtenance = appurtenance;
	}
	
}
