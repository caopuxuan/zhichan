package com.bpm.asset.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "SubsidiaryFile", description = "资产附属文件")
public class SubsidiaryFile {

	@ApiModelProperty(value = "ID")
	private Integer id;

	@ApiModelProperty(value = "附件名称")
	private String name;

	@ApiModelProperty(value = "附件描述")
	private String described;

	@ApiModelProperty(value = "附件上传")
	private String upload;

	@ApiModelProperty(value = "卡片编号")
	private String cardNumber;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescribed() {
		return described;
	}

	public void setDescribed(String described) {
		this.described = described;
	}

	public String getUpload() {
		return upload;
	}

	public void setUpload(String upload) {
		this.upload = upload;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

}
