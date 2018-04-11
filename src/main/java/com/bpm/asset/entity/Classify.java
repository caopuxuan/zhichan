package com.bpm.asset.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "Classify", description = "分类字典表")
public class Classify {

	@ApiModelProperty(value = "代码")
	private String code;

	@ApiModelProperty(value = "名称")
	private String name;
	
	@ApiModelProperty(value = "上级")
	private String pid;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}
}
