package com.bpm.asset.entity;

import java.math.BigDecimal;
import java.util.Date;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "Deal", description = "资产处置主体")
public class Deal {

	@ApiModelProperty(value = "处置编号")
	private String dealNumber;

	@ApiModelProperty(value = "处置方式")
	private Integer dealMode;

	@ApiModelProperty(value = "申请单位")
	private Integer applicationUnit;

	@ApiModelProperty(value = "申请人")
	private String applicant;

	@ApiModelProperty(value = "申请时间")
	private Date applicationDate;

	@ApiModelProperty(value = "申请理由")
	private String applicationReasons;

	@ApiModelProperty(value = "资产净值")
	private BigDecimal equity;

	@ApiModelProperty(value = "资产原值")
	private BigDecimal original;

	@ApiModelProperty(value = "处置状态")
	private Integer dealStatus;

	@ApiModelProperty(value = "用户id")
	private String userId;

	@ApiModelProperty(value = "用户组id")
	private String groupId;
	
	@ApiModelProperty(value = "组织Id")//流程引入时增加，组织机构信息
	private String orgId;

	@ApiModelProperty(value = "bpmId")//流程引入时增加 ，流程实例Id
	private String bpmId;
	@ApiModelProperty(value = "id")
	private Integer id;

	public String getDealNumber() {
		return dealNumber;
	}

	public void setDealNumber(String dealNumber) {
		this.dealNumber = dealNumber;
	}

	public Integer getDealMode() {
		return dealMode;
	}

	public void setDealMode(Integer dealMode) {
		this.dealMode = dealMode;
	}

	public Integer getApplicationUnit() {
		return applicationUnit;
	}

	public void setApplicationUnit(Integer applicationUnit) {
		this.applicationUnit = applicationUnit;
	}

	public String getApplicant() {
		return applicant;
	}

	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}

	public Date getApplicationDate() {
		return applicationDate;
	}

	public void setApplicationDate(Date applicationDate) {
		this.applicationDate = applicationDate;
	}

	public String getApplicationReasons() {
		return applicationReasons;
	}

	public void setApplicationReasons(String applicationReasons) {
		this.applicationReasons = applicationReasons;
	}

	public BigDecimal getEquity() {
		return equity;
	}

	public void setEquity(BigDecimal equity) {
		this.equity = equity;
	}

	public BigDecimal getOriginal() {
		return original;
	}

	public void setOriginal(BigDecimal original) {
		this.original = original;
	}

	public Integer getDealStatus() {
		return dealStatus;
	}

	public void setDealStatus(Integer dealStatus) {
		this.dealStatus = dealStatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getBpmId() {
		return bpmId;
	}

	public void setBpmId(String bpmId) {
		this.bpmId = bpmId;
	}

}
