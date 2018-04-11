package com.bpm.asset.entity;

import java.math.BigDecimal;
import java.util.Date;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelTarget;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "Asset", description = "预算说明")
@ExcelTarget("asset")
public class Asset {

	@ApiModelProperty(value = "用户id")
	@Excel(name = "用户id", orderNum = "0")
	private String userId;

	@ApiModelProperty(value = "用户组id")
	@Excel(name = "用户组id", orderNum = "1")
	private String groupId;
	//流程相关字段
	@ApiModelProperty(value = "租户code")
	@Excel(name = "流程实例bpmId", orderNum = "2")
	private String tenantCode;
	
	@ApiModelProperty(value = "单位Id")
//	@Excel(name = "单位Id", orderNum = "2")
	private String orgId;
	
	@ApiModelProperty(value = "流程实例bpmId")
	@Excel(name = "流程实例bpmId", orderNum = "2")
	private String bpmId;

	@ApiModelProperty(value = "卡片编号")
	@Excel(name = "卡片编号", orderNum = "3")
	private String cardNumber;

	@ApiModelProperty(value = "类别名称")
	@Excel(name = "类别名称", orderNum = "4")
	private Integer className;

	@ApiModelProperty(value = "增加方式")
	@Excel(name = "增加方式", replace = { "购置构建_1", "调拨_2","接收捐赠_3", "增加置换_4","其他增加_5"}, orderNum = "5")
	private Integer additionMethod;

	@ApiModelProperty(value = "原值")
	@Excel(name = "原值", orderNum = "6")
	private BigDecimal originalValue;

	@ApiModelProperty(value = "资产代码")
	@Excel(name = "资产代码", orderNum = "7")
	private String assetCode;

	@ApiModelProperty(value = "计量单位")
	@Excel(name = "计量单位", orderNum = "8")
	private Integer units;

	@ApiModelProperty(value = "价值类型")
	@Excel(name = "价值类型",replace = { "原值_1", "暂估值_2","重置值_3", "无价值_4","评估值_5" }, orderNum = "9")
	private Integer valueType;

	@ApiModelProperty(value = "财政性资金")
	@Excel(name = "财政性资金", orderNum = "10")
	private BigDecimal financialFunds;

	@ApiModelProperty(value = "净值")
	@Excel(name = "净值", orderNum = "11")
	private BigDecimal equity;

	@ApiModelProperty(value = "资产名称")
	@Excel(name = "资产名称", replace = { "资产1_1", "资产2_2" }, orderNum = "12")
	private String assetName;

	@ApiModelProperty(value = "数量")
	@Excel(name = "数量", orderNum = "13")
	private Integer numb;

	@ApiModelProperty(value = "经费来源")
	@Excel(name = "经费来源", orderNum = "14")
	private Integer fundingSources;

	@ApiModelProperty(value = "非财政性资金")
	@Excel(name = "非财政性资金", orderNum = "15")
	private BigDecimal unFinancialFunds;

	@ApiModelProperty(value = "总建筑面积")
	@Excel(name = "总建筑面积", orderNum = "16")
	private BigDecimal totalFloorage;

	@ApiModelProperty(value = "采购组织形式")
	@Excel(name = "采购组织形式",replace = { "政府集中采购_1", "部门集中采购_2","分散采购_3", "其他_4"},  orderNum = "17")
	private Integer procurementOrganization;

	@ApiModelProperty(value = "折旧状态")
	@Excel(name = "折旧状态",replace = { "提折旧_1", "不提折旧_2","已完成折旧_3"}, orderNum = "18")
	private Integer depreciationState;

	@ApiModelProperty(value = "使用面积")
	@Excel(name = "使用面积", orderNum = "19")
	private BigDecimal useArea;

	@ApiModelProperty(value = "使用权面积")
	@Excel(name = "使用权面积", orderNum = "20")
	private BigDecimal usufructArea;

	@ApiModelProperty(value = "摊销状态")
	@Excel(name = "摊销状态",replace = { "提折旧_1", "不提折旧_2","已完成折旧_3"}, orderNum = "21")
	private Integer amortizationState;

	@ApiModelProperty(value = "入账形式")
	@Excel(name = "入账形式",replace = { "已入账_1", "未入账_2"}, orderNum = "22")
	private Integer formEntry;

	@ApiModelProperty(value = "地类（用途）")
	@Excel(name = "地类（用途）", orderNum = "23")
	private String landType;

	@ApiModelProperty(value = "独用面积")
	@Excel(name = "独用面积", orderNum = "24")
	private BigDecimal singleArea;

	@ApiModelProperty(value = "使用权类型")
	@Excel(name = "使用权类型", replace = { "出让_1", "划拨_2","租赁_3" },orderNum = "25")
	private Integer usufructType;

	@ApiModelProperty(value = "产权分类")
	@Excel(name = "产权分类", replace = { "统一确权_1", "自有产权_2"},orderNum = "26")
	private Integer propertyType;

	@ApiModelProperty(value = "权属年限（月）")
	@Excel(name = "权属年限（月）", orderNum = "27")
	private Integer ownershipYears;

	@ApiModelProperty(value = "权属性质")
	@Excel(name = "权属性质",replace = { "国有_1", "集体_2"}, orderNum = "28")
	private Integer ownershipNature;

	@ApiModelProperty(value = "会计凭证号")
	@Excel(name = "会计凭证号", orderNum = "29")
	private String accountingVoucherNumber;

	@ApiModelProperty(value = "地号")
	@Excel(name = "地号", orderNum = "30")
	private String landNum;

	@ApiModelProperty(value = "土地证载明面积")
	@Excel(name = "土地证载明面积", orderNum = "31")
	private String landCertificate;

	@ApiModelProperty(value = "土地所有权人")
	@Excel(name = "土地所有权人", orderNum = "32")
	private String ownerLand;

	@ApiModelProperty(value = "土地级次")
	@Excel(name = "土地级次",replace = { "一级_1", "二级_2", "三级_3" }, orderNum = "33")
	private String landGradation;

	@ApiModelProperty(value = "权属证书编号")
	@Excel(name = "权属证书编号", orderNum = "34")
	private String ownershipNumber;

	@ApiModelProperty(value = "财务入账日期")
	@Excel(name = "财务入账日期", orderNum = "35")
	private Date postingDate;

	@ApiModelProperty(value = "坐落位置")
	@Excel(name = "坐落位置", orderNum = "36")
	private String position;

	@ApiModelProperty(value = "分摊面积")
	@Excel(name = "分摊面积", orderNum = "37")
	private BigDecimal apportionArea;

	@ApiModelProperty(value = "产权形式")
	@Excel(name = "产权形式",replace = { "有产权_1", "无产权_2", "产权待界定_3"}, orderNum = "38")
	private Integer propertyFrom;

	@ApiModelProperty(value = "权属证明")
	@Excel(name = "权属证明", orderNum = "39")
	private String ownershipCertificate;

	@ApiModelProperty(value = "权属证书发证时间")
	@Excel(name = "权属证书发证时间", databaseFormat = "yyyyMMddHHmmss", format = "yyyy/MM/dd", orderNum = "40")
	private Date ownershipDate;

	@ApiModelProperty(value = "建筑结构")
	@Excel(name = "建筑结构",replace = { "钢结构_1", "钢混结构_2", "砖混结构_3","砖木结构_4","其他_5"}, orderNum = "41")
	private Integer buildings;

	@ApiModelProperty(value = "竣工日期")
	@Excel(name = "竣工日期", databaseFormat = "yyyyMMddHHmmss", format = "yyyy/MM/dd", orderNum = "42")
	private Date completionDate;

	@ApiModelProperty(value = "使用部门")
	@Excel(name = "使用部门", replace = { "部门1_1", "部门2_2" , "部门3_3"}, orderNum = "43")
	private String useDepartment;

	@ApiModelProperty(value = "开始使用时间")
	@Excel(name = "开始使用时间", databaseFormat = "yyyyMMddHHmmss", format = "yyyy/MM/ddd", orderNum = "44")
	private Date startTime;

	@ApiModelProperty(value = "使用方向")
	@Excel(name = "使用方向",replace = { "自用_1", "出租_2","出借_3", "闲置_4","其他_5", "其中后勤使用_6","对外投资_7", "自主经营_8","对外担保_9"}, orderNum = "45")
	private String useDirection;

	@ApiModelProperty(value = "土地闲置面积")
	@Excel(name = "土地闲置面积", orderNum = "46")
	private BigDecimal unusedArea;

	@ApiModelProperty(value = "出租面积")
	@Excel(name = "出租面积", orderNum = "47")
	private BigDecimal rentedArea;

	@ApiModelProperty(value = "对外投资价值")
	@Excel(name = "对外投资价值", orderNum = "48")
	private BigDecimal investmentValue;

	@ApiModelProperty(value = "保管人")
	@Excel(name = "保管人", orderNum = "49")
	private String custodian;

	@ApiModelProperty(value = "使用人名称")
	@Excel(name = "使用人名称", orderNum = "49")
	private String userName;

	@ApiModelProperty(value = "预计使用月份")
	@Excel(name = "预计使用月份", orderNum = "50")
	private Integer expectedMonth;

	@ApiModelProperty(value = "出借面积")
	@Excel(name = "出借面积", orderNum = "51")
	private BigDecimal lendArea;

	@ApiModelProperty(value = "出租价值")
	@Excel(name = "出租价值", orderNum = "52")
	private BigDecimal rentalValue;

	@ApiModelProperty(value = "其他使用面积")
	@Excel(name = "其他使用面积", orderNum = "53")
	private BigDecimal othUseArea;

	@ApiModelProperty(value = "出借（出租）单位")
	@Excel(name = "出借（出租）单位", orderNum = "54")
	private String lendUnit;

	@ApiModelProperty(value = "购置时间")
	@Excel(name = "购置时间", databaseFormat = "yyyyMMddHHmmss", format = "yyyy/MM/dd", orderNum = "55")
	private Date buyDate;

	@ApiModelProperty(value = "已使用月份")
	@Excel(name = "已使用月份", orderNum = "56")
	private Integer usedMonth;

	@ApiModelProperty(value = "自用面积")
	@Excel(name = "自用面积", orderNum = "57")
	private BigDecimal selfUseArea;

	@ApiModelProperty(value = "出借价值")
	@Excel(name = "出借价值", orderNum = "58")
	private BigDecimal lendValue;

	@ApiModelProperty(value = "对外投资面积")
	@Excel(name = "对外投资面积", orderNum = "59")
	private BigDecimal investmentArea;

	@ApiModelProperty(value = "其他价值")
	@Excel(name = "其他价值", orderNum = "60")
	private BigDecimal otherValue;

	@ApiModelProperty(value = "旧资产原已使用月份")
	@Excel(name = "旧资产原已使用月份", orderNum = "61")
	private Integer oldUseMonth;

	@ApiModelProperty(value = "配电面积")
	@Excel(name = "配电面积", orderNum = "62")
	private BigDecimal distributionArea;

	@ApiModelProperty(value = "车库面积")
	@Excel(name = "车库面积", orderNum = "63")
	private BigDecimal garageArea;

	@ApiModelProperty(value = "地下使用面积")
	@Excel(name = "地下使用面积", orderNum = "64")
	private BigDecimal undergroundUseArea;

	@ApiModelProperty(value = "自用：后勤面积")
	@Excel(name = "自用：后勤面积", orderNum = "65")
	private BigDecimal logisticArea;

	@ApiModelProperty(value = "使用状态")
	@Excel(name = "使用状态",replace = { "在用_1", "闲置_2","其他_3", "毁损待报废_4"}, orderNum = "66")
	private Integer usingState;

	@ApiModelProperty(value = "会议室面积")
	@Excel(name = "会议室面积", orderNum = "67")
	private BigDecimal boardroomArea;

	@ApiModelProperty(value = "食堂面积")
	@Excel(name = "食堂面积", orderNum = "68")
	private BigDecimal canteenArea;

	@ApiModelProperty(value = "单位负担费用面积")
	@Excel(name = "单位负担费用面积", orderNum = "69")
	private BigDecimal unitArea;

	@ApiModelProperty(value = "机房面积")
	@Excel(name = "机房面积", orderNum = "70")
	private BigDecimal machineArea;

	@ApiModelProperty(value = "地下面积")
	@Excel(name = "地下面积", orderNum = "71")
	private BigDecimal undergroundArea;

	@ApiModelProperty(value = "自用价值")
	@Excel(name = "自用价值", orderNum = "72")
	private BigDecimal selfUseValue;

	@ApiModelProperty(value = "自定义编码")
	@Excel(name = "自定义编码", orderNum = "73")
	private String customCoding;

	@ApiModelProperty(value = "资产原分类名称")
	@Excel(name = "资产原分类名称", orderNum = "74")
	private BigDecimal originalNameAssets;

	@ApiModelProperty(value = "标签说明")
	@Excel(name = "标签说明", orderNum = "75")
	private String labelDescription;

	@ApiModelProperty(value = "备注")
	@Excel(name = "备注", orderNum = "76")
	private String remark;

	@ApiModelProperty(value = "资产调拨状态")
	@Excel(name = "资产调拨状态", orderNum = "77")
	private Integer stateAssetAllocation;

	@ApiModelProperty(value = "资产管理单位名称")
	@Excel(name = "资产管理单位名称", orderNum = "78")
	private String unitName;

	// @ApiModelProperty(value = "添加资产附属设备id")
	// private String appurtenanceId;
	//
	// @ApiModelProperty(value = "资产附属文件id")
	// private String subsidiaryFileId;
	//
	// @ApiModelProperty(value = "房屋所属机构id")
	// private String houseInstitutionsId;

	@ApiModelProperty(value = "房屋基本情况")
	@Excel(name = "房屋基本情况", orderNum = "79")
	private String houseSituation;

	@ApiModelProperty(value = "单价")
	@Excel(name = "单价", orderNum = "80")
	private BigDecimal unitPrice;

	@ApiModelProperty(value = "品牌")
	@Excel(name = "品牌", orderNum = "81")
	private String brand;

	@ApiModelProperty(value = "存放地点")
	@Excel(name = "存放地点", orderNum = "82")
	private String storagePlace;

	@ApiModelProperty(value = "信息设备编码")
	@Excel(name = "信息设备编码", orderNum = "83")
	private String deviceCoding;

	@ApiModelProperty(value = "发票号")
	@Excel(name = "发票号", orderNum = "84")
	private String invoiceNumber;

	@ApiModelProperty(value = "供应商")
	@Excel(name = "供应商", orderNum = "85")
	private String supplier;

	@ApiModelProperty(value = "地址")
	@Excel(name = "地址", orderNum = "86")
	private String address;

	@ApiModelProperty(value = "联系人")
	@Excel(name = "联系人", orderNum = "87")
	private String contacts;

	@ApiModelProperty(value = "维修电话")
	@Excel(name = "维修电话", orderNum = "88")
	private String maintenanceCall;

	@ApiModelProperty(value = "保修截止日期")
	@Excel(name = "保修截止日期", databaseFormat = "yyyyMMddHHmmss", format = "yyyy/MM/dd", orderNum = "89")
	private Date warrantyDeadline;

	@ApiModelProperty(value = "售后服务内容")
	@Excel(name = "售后服务内容", orderNum = "90")
	private String afterService;

	@ApiModelProperty(value = "合同编号")
	@Excel(name = "合同编号", orderNum = "91")
	private String contractNumber;

	@ApiModelProperty(value = "主要参数")
	@Excel(name = "主要参数", orderNum = "92")
	private String mainParameter;

	@ApiModelProperty(value = "产品序列号")
	@Excel(name = "产品序列号", orderNum = "92")
	private String productId;

	@ApiModelProperty(value = "生产厂家")
	@Excel(name = "生产厂家", orderNum = "93")
	private String manufacturer;

	@ApiModelProperty(value = "设备用途")
	@Excel(name = "设备用途", replace = { "办公_1", "教学_2","培训_3", "执法_4","窗口_5", "专用_6", "其他_7" },orderNum = "94")
	private Integer usedType;

	@ApiModelProperty(value = "规格型号")
	@Excel(name = "规格型号", orderNum = "95")
	private String specificationModel;

	@ApiModelProperty(value = "档案号")
	@Excel(name = "档案号", orderNum = "96")
	private String fileNumber;

	@ApiModelProperty(value = "出版社")
	@Excel(name = "出版社", orderNum = "97")
	private String press;

	@ApiModelProperty(value = "出版日期")
	@Excel(name = "出版日期", databaseFormat = "yyyyMMddHHmmss", format = "yyyy/MM/dd", orderNum = "98")
	private Date publicationDate;

	@ApiModelProperty(value = "文物等级")
	@Excel(name = "文物等级", orderNum = "99")
	private String antiquesLv;

	@ApiModelProperty(value = "来源地")
	@Excel(name = "来源地", orderNum = "100")
	private String sourceArea;

	@ApiModelProperty(value = "藏品年代")
	@Excel(name = "藏品年代", orderNum = "101")
	private String collectionAge;

	@ApiModelProperty(value = "权属证书所有人")
	@Excel(name = "权属证书所有人", orderNum = "102")
	private String certificateHave;

	@ApiModelProperty(value = "车牌号")
	@Excel(name = "车牌号", orderNum = "103")
	private String plateNumber;

	@ApiModelProperty(value = "车架号码")
	@Excel(name = "车架号码", orderNum = "104")
	private String frameNumber;

	@ApiModelProperty(value = "发动机号码")
	@Excel(name = "发动机号码", orderNum = "105")
	private String engineNumber;

	@ApiModelProperty(value = "车辆识别号")
	@Excel(name = "车辆识别号", orderNum = "106")
	private String vehicleIdeNo;

	@ApiModelProperty(value = "排量")
	@Excel(name = "排量", orderNum = "107")
	private BigDecimal displacement;

	@ApiModelProperty(value = "车座数")
	@Excel(name = "车座数", orderNum = "108")
	private Integer seats;

	@ApiModelProperty(value = "是否新能源车")
	@Excel(name = "是否新能源车", orderNum = "109")
	private String newEnergy;

	@ApiModelProperty(value = "车辆分类用途")
	@Excel(name = "车辆分类用途", replace = { "一般公务用车_1", "专业用车技术_2","其他用车_3"}, orderNum = "110")
	private String taxonomy;

	@ApiModelProperty(value = "车籍是否本单位")
	@Excel(name = "车籍是否本单位", orderNum = "111")
	private String unitIsno;

	@ApiModelProperty(value = "车籍单位")
	@Excel(name = "车籍单位", orderNum = "112")
	private String carRegisterUnit;

	@ApiModelProperty(value = "编制情况")
	@Excel(name = "编制情况",replace = { "在编_1", "不在编_2","未核定车编_3"}, orderNum = "113")
	private String compilingSituation;

	@ApiModelProperty(value = "是否喷涂执法标识")
	@Excel(name = "是否喷涂执法标识", orderNum = "114")
	private String agentsLogo;

	@ApiModelProperty(value = "执法执勤用车分类")
	@Excel(name = "执法执勤用车分类", orderNum = "115")
	private String legalType;

	@ApiModelProperty(value = "工作总量")
	@Excel(name = "工作总量", orderNum = "116")
	private String workTotal;

	@ApiModelProperty(value = "本年行驶里程（公里）")
	@Excel(name = "本年行驶里程（公里）", orderNum = "117")
	private BigDecimal thisMileage;

	@ApiModelProperty(value = "已行驶里程（公里）")
	@Excel(name = "已行驶里程（公里）", orderNum = "118")
	private BigDecimal allMileage;

	@ApiModelProperty(value = "厂牌型号")
	@Excel(name = "厂牌型号", orderNum = "119")
	private String labelType;

	@ApiModelProperty(value = "车辆产地")
	@Excel(name = "车辆产地", orderNum = "120")
	private String origin;

	@ApiModelProperty(value = "裸车价")
	@Excel(name = "裸车价", orderNum = "121")
	private BigDecimal carPrice;

	@ApiModelProperty(value = "购置税")
	@Excel(name = "购置税", orderNum = "122")
	private BigDecimal purchaseTax;

	@ApiModelProperty(value = "其他上户费用")
	@Excel(name = "其他上户费用", orderNum = "123")
	private BigDecimal otherExpenses;

	@ApiModelProperty(value = "台式机分类")
	@Excel(name = "台式机分类", orderNum = "124")
	private String pcType;

	@ApiModelProperty(value = "信息化设备分类")
	@Excel(name = "信息化设备分类", orderNum = "125")
	private String informationType;

	@ApiModelProperty(value = "提交审核状态")
	@Excel(name = "提交审核状态", replace = { "待提交_1", "待审核_2","已审核_3", "待处置_4","已处置_5", "已退回_6" }, orderNum = "126")
	private Integer auditState;

	@ApiModelProperty(value = "管理部门")
//	@Excel(name = "管理部门", orderNum = "127") //与久期excel不一致，暂不导入导出
	private Integer management;

	@ApiModelProperty(value = "资产大类")
	@Excel(name = "资产大类",replace = { "土地_1", "房屋_2","构筑物_3", "通用设备_4","车辆_5", "专用设备_6","文物，陈列品_7", "图书、档案_8","家具、用具、装具_9", "特种动植物_10" }, orderNum = "128")
	private Integer assetFirst;

	@ApiModelProperty(value = "审核意见")
	@Excel(name = "129", orderNum = "129")
	private String auditOpinion;

	@ApiModelProperty(value = "处置编号")
	@Excel(name = "处置编号", orderNum = "130")
	private String dealNumber;

	@ApiModelProperty(value = "处置状态")
	@Excel(name = "处置状态", orderNum = "131")
	private String dealStatus;

	@ApiModelProperty(value = "处置时间")
	@Excel(name = "处置时间", databaseFormat = "yyyyMMddHHmmss", format = "yyyy/MM/dd", orderNum = "132")
	private Date dealDate;

	@ApiModelProperty(value = "新增时间")
	@Excel(name = "新增时间", databaseFormat = "yyyyMMddHHmmss", format = "yyyy/MM/dd", orderNum = "133")
	private Date newsDate;

	@ApiModelProperty(value = "id")
	@Excel(name = "id", orderNum = "134")
	private Integer id;
	
	@ApiModelProperty(value = "产地")
	@Excel(name = "产地", orderNum = "135")
	private Integer habitats;
	
	@ApiModelProperty(value = "纲属科")
	@Excel(name = "纲属科", orderNum = "136")
	private Integer genera;
	
	@ApiModelProperty(value = "出生/栽种年份")
//	@Excel(name = "出生/栽种年份", databaseFormat = "yyyyMMddHHmmss", format = "yyyy/MM/dd", orderNum = "137") //与久期excel不一致，暂不导入导出
	private Date addYears;
	
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

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public Integer getClassName() {
		return className;
	}

	public void setClassName(Integer className) {
		this.className = className;
	}

	public Integer getAdditionMethod() {
		return additionMethod;
	}

	public void setAdditionMethod(Integer additionMethod) {
		this.additionMethod = additionMethod;
	}

	public BigDecimal getOriginalValue() {
		return originalValue;
	}

	public void setOriginalValue(BigDecimal originalValue) {
		this.originalValue = originalValue;
	}

	public String getAssetCode() {
		return assetCode;
	}

	public void setAssetCode(String assetCode) {
		this.assetCode = assetCode;
	}

	public Integer getUnits() {
		return units;
	}

	public void setUnits(Integer units) {
		this.units = units;
	}

	public Integer getValueType() {
		return valueType;
	}

	public void setValueType(Integer valueType) {
		this.valueType = valueType;
	}

	public BigDecimal getFinancialFunds() {
		return financialFunds;
	}

	public void setFinancialFunds(BigDecimal financialFunds) {
		this.financialFunds = financialFunds;
	}

	public BigDecimal getEquity() {
		return equity;
	}

	public void setEquity(BigDecimal equity) {
		this.equity = equity;
	}

	public String getAssetName() {
		return assetName;
	}

	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}

	public Integer getNumb() {
		return numb;
	}

	public void setNumb(Integer numb) {
		this.numb = numb;
	}

	public Integer getFundingSources() {
		return fundingSources;
	}

	public void setFundingSources(Integer fundingSources) {
		this.fundingSources = fundingSources;
	}

	public BigDecimal getUnFinancialFunds() {
		return unFinancialFunds;
	}

	public void setUnFinancialFunds(BigDecimal unFinancialFunds) {
		this.unFinancialFunds = unFinancialFunds;
	}

	public BigDecimal getTotalFloorage() {
		return totalFloorage;
	}

	public void setTotalFloorage(BigDecimal totalFloorage) {
		this.totalFloorage = totalFloorage;
	}

	public Integer getProcurementOrganization() {
		return procurementOrganization;
	}

	public void setProcurementOrganization(Integer procurementOrganization) {
		this.procurementOrganization = procurementOrganization;
	}

	public Integer getDepreciationState() {
		return depreciationState;
	}

	public void setDepreciationState(Integer depreciationState) {
		this.depreciationState = depreciationState;
	}

	public BigDecimal getUseArea() {
		return useArea;
	}

	public void setUseArea(BigDecimal useArea) {
		this.useArea = useArea;
	}

	public BigDecimal getUsufructArea() {
		return usufructArea;
	}

	public void setUsufructArea(BigDecimal usufructArea) {
		this.usufructArea = usufructArea;
	}

	public Integer getAmortizationState() {
		return amortizationState;
	}

	public void setAmortizationState(Integer amortizationState) {
		this.amortizationState = amortizationState;
	}

	public Integer getFormEntry() {
		return formEntry;
	}

	public void setFormEntry(Integer formEntry) {
		this.formEntry = formEntry;
	}

	public String getLandType() {
		return landType;
	}

	public void setLandType(String landType) {
		this.landType = landType;
	}

	public BigDecimal getSingleArea() {
		return singleArea;
	}

	public void setSingleArea(BigDecimal singleArea) {
		this.singleArea = singleArea;
	}

	public Integer getUsufructType() {
		return usufructType;
	}

	public void setUsufructType(Integer usufructType) {
		this.usufructType = usufructType;
	}

	public Integer getPropertyType() {
		return propertyType;
	}

	public void setPropertyType(Integer propertyType) {
		this.propertyType = propertyType;
	}

	public Integer getOwnershipYears() {
		return ownershipYears;
	}

	public void setOwnershipYears(Integer ownershipYears) {
		this.ownershipYears = ownershipYears;
	}

	public Integer getOwnershipNature() {
		return ownershipNature;
	}

	public void setOwnershipNature(Integer ownershipNature) {
		this.ownershipNature = ownershipNature;
	}

	public String getAccountingVoucherNumber() {
		return accountingVoucherNumber;
	}

	public void setAccountingVoucherNumber(String accountingVoucherNumber) {
		this.accountingVoucherNumber = accountingVoucherNumber;
	}

	public String getLandNum() {
		return landNum;
	}

	public void setLandNum(String landNum) {
		this.landNum = landNum;
	}

	public String getLandCertificate() {
		return landCertificate;
	}

	public void setLandCertificate(String landCertificate) {
		this.landCertificate = landCertificate;
	}

	public String getOwnerLand() {
		return ownerLand;
	}

	public void setOwnerLand(String ownerLand) {
		this.ownerLand = ownerLand;
	}

	public String getLandGradation() {
		return landGradation;
	}

	public void setLandGradation(String landGradation) {
		this.landGradation = landGradation;
	}

	public String getOwnershipNumber() {
		return ownershipNumber;
	}

	public void setOwnershipNumber(String ownershipNumber) {
		this.ownershipNumber = ownershipNumber;
	}

	public Date getPostingDate() {
		return postingDate;
	}

	public void setPostingDate(Date postingDate) {
		this.postingDate = postingDate;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public BigDecimal getApportionArea() {
		return apportionArea;
	}

	public void setApportionArea(BigDecimal apportionArea) {
		this.apportionArea = apportionArea;
	}

	public Integer getPropertyFrom() {
		return propertyFrom;
	}

	public void setPropertyFrom(Integer propertyFrom) {
		this.propertyFrom = propertyFrom;
	}

	public String getOwnershipCertificate() {
		return ownershipCertificate;
	}

	public void setOwnershipCertificate(String ownershipCertificate) {
		this.ownershipCertificate = ownershipCertificate;
	}

	public Date getOwnershipDate() {
		return ownershipDate;
	}

	public void setOwnershipDate(Date ownershipDate) {
		this.ownershipDate = ownershipDate;
	}

	public Integer getBuildings() {
		return buildings;
	}

	public void setBuildings(Integer buildings) {
		this.buildings = buildings;
	}

	public Date getCompletionDate() {
		return completionDate;
	}

	public void setCompletionDate(Date completionDate) {
		this.completionDate = completionDate;
	}

	public String getUseDepartment() {
		return useDepartment;
	}

	public void setUseDepartment(String useDepartment) {
		this.useDepartment = useDepartment;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public String getUseDirection() {
		return useDirection;
	}

	public void setUseDirection(String useDirection) {
		this.useDirection = useDirection;
	}

	public BigDecimal getUnusedArea() {
		return unusedArea;
	}

	public void setUnusedArea(BigDecimal unusedArea) {
		this.unusedArea = unusedArea;
	}

	public BigDecimal getRentedArea() {
		return rentedArea;
	}

	public void setRentedArea(BigDecimal rentedArea) {
		this.rentedArea = rentedArea;
	}

	public BigDecimal getInvestmentValue() {
		return investmentValue;
	}

	public void setInvestmentValue(BigDecimal investmentValue) {
		this.investmentValue = investmentValue;
	}

	public String getCustodian() {
		return custodian;
	}

	public void setCustodian(String custodian) {
		this.custodian = custodian;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getExpectedMonth() {
		return expectedMonth;
	}

	public void setExpectedMonth(Integer expectedMonth) {
		this.expectedMonth = expectedMonth;
	}

	public BigDecimal getLendArea() {
		return lendArea;
	}

	public void setLendArea(BigDecimal lendArea) {
		this.lendArea = lendArea;
	}

	public BigDecimal getRentalValue() {
		return rentalValue;
	}

	public void setRentalValue(BigDecimal rentalValue) {
		this.rentalValue = rentalValue;
	}

	public BigDecimal getOthUseArea() {
		return othUseArea;
	}

	public void setOthUseArea(BigDecimal othUseArea) {
		this.othUseArea = othUseArea;
	}

	public String getLendUnit() {
		return lendUnit;
	}

	public void setLendUnit(String lendUnit) {
		this.lendUnit = lendUnit;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public Integer getUsedMonth() {
		return usedMonth;
	}

	public void setUsedMonth(Integer usedMonth) {
		this.usedMonth = usedMonth;
	}

	public BigDecimal getSelfUseArea() {
		return selfUseArea;
	}

	public void setSelfUseArea(BigDecimal selfUseArea) {
		this.selfUseArea = selfUseArea;
	}

	public BigDecimal getLendValue() {
		return lendValue;
	}

	public void setLendValue(BigDecimal lendValue) {
		this.lendValue = lendValue;
	}

	public BigDecimal getInvestmentArea() {
		return investmentArea;
	}

	public void setInvestmentArea(BigDecimal investmentArea) {
		this.investmentArea = investmentArea;
	}

	public BigDecimal getOtherValue() {
		return otherValue;
	}

	public void setOtherValue(BigDecimal otherValue) {
		this.otherValue = otherValue;
	}

	public Integer getOldUseMonth() {
		return oldUseMonth;
	}

	public void setOldUseMonth(Integer oldUseMonth) {
		this.oldUseMonth = oldUseMonth;
	}

	public BigDecimal getDistributionArea() {
		return distributionArea;
	}

	public void setDistributionArea(BigDecimal distributionArea) {
		this.distributionArea = distributionArea;
	}

	public BigDecimal getGarageArea() {
		return garageArea;
	}

	public void setGarageArea(BigDecimal garageArea) {
		this.garageArea = garageArea;
	}

	public BigDecimal getUndergroundUseArea() {
		return undergroundUseArea;
	}

	public void setUndergroundUseArea(BigDecimal undergroundUseArea) {
		this.undergroundUseArea = undergroundUseArea;
	}

	public BigDecimal getLogisticArea() {
		return logisticArea;
	}

	public void setLogisticArea(BigDecimal logisticArea) {
		this.logisticArea = logisticArea;
	}

	public Integer getUsingState() {
		return usingState;
	}

	public void setUsingState(Integer usingState) {
		this.usingState = usingState;
	}

	public BigDecimal getBoardroomArea() {
		return boardroomArea;
	}

	public void setBoardroomArea(BigDecimal boardroomArea) {
		this.boardroomArea = boardroomArea;
	}

	public BigDecimal getCanteenArea() {
		return canteenArea;
	}

	public void setCanteenArea(BigDecimal canteenArea) {
		this.canteenArea = canteenArea;
	}

	public BigDecimal getUnitArea() {
		return unitArea;
	}

	public void setUnitArea(BigDecimal unitArea) {
		this.unitArea = unitArea;
	}

	public BigDecimal getMachineArea() {
		return machineArea;
	}

	public void setMachineArea(BigDecimal machineArea) {
		this.machineArea = machineArea;
	}

	public BigDecimal getUndergroundArea() {
		return undergroundArea;
	}

	public void setUndergroundArea(BigDecimal undergroundArea) {
		this.undergroundArea = undergroundArea;
	}

	public BigDecimal getSelfUseValue() {
		return selfUseValue;
	}

	public void setSelfUseValue(BigDecimal selfUseValue) {
		this.selfUseValue = selfUseValue;
	}

	public String getCustomCoding() {
		return customCoding;
	}

	public void setCustomCoding(String customCoding) {
		this.customCoding = customCoding;
	}

	public String getLabelDescription() {
		return labelDescription;
	}

	public void setLabelDescription(String labelDescription) {
		this.labelDescription = labelDescription;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	// public String getAppurtenanceId() {
	// return appurtenanceId;
	// }
	//
	// public void setAppurtenanceId(String appurtenanceId) {
	// this.appurtenanceId = appurtenanceId;
	// }
	//
	// public String getSubsidiaryFileId() {
	// return subsidiaryFileId;
	// }
	//
	// public void setSubsidiaryFileId(String subsidiaryFileId) {
	// this.subsidiaryFileId = subsidiaryFileId;
	// }
	//
	// public String getHouseInstitutionsId() {
	// return houseInstitutionsId;
	// }
	//
	// public void setHouseInstitutionsId(String houseInstitutionsId) {
	// this.houseInstitutionsId = houseInstitutionsId;
	// }

	public String getHouseSituation() {
		return houseSituation;
	}

	public void setHouseSituation(String houseSituation) {
		this.houseSituation = houseSituation;
	}

	public BigDecimal getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(BigDecimal unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getStoragePlace() {
		return storagePlace;
	}

	public void setStoragePlace(String storagePlace) {
		this.storagePlace = storagePlace;
	}

	public String getDeviceCoding() {
		return deviceCoding;
	}

	public void setDeviceCoding(String deviceCoding) {
		this.deviceCoding = deviceCoding;
	}

	public String getInvoiceNumber() {
		return invoiceNumber;
	}

	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getMaintenanceCall() {
		return maintenanceCall;
	}

	public void setMaintenanceCall(String maintenanceCall) {
		this.maintenanceCall = maintenanceCall;
	}

	public Date getWarrantyDeadline() {
		return warrantyDeadline;
	}

	public void setWarrantyDeadline(Date warrantyDeadline) {
		this.warrantyDeadline = warrantyDeadline;
	}

	public String getAfterService() {
		return afterService;
	}

	public void setAfterService(String afterService) {
		this.afterService = afterService;
	}

	public String getContractNumber() {
		return contractNumber;
	}

	public void setContractNumber(String contractNumber) {
		this.contractNumber = contractNumber;
	}

	public String getMainParameter() {
		return mainParameter;
	}

	public void setMainParameter(String mainParameter) {
		this.mainParameter = mainParameter;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public Integer getUsedType() {
		return usedType;
	}

	public void setUsedType(Integer usedType) {
		this.usedType = usedType;
	}

	public String getSpecificationModel() {
		return specificationModel;
	}

	public void setSpecificationModel(String specificationModel) {
		this.specificationModel = specificationModel;
	}

	public String getFileNumber() {
		return fileNumber;
	}

	public void setFileNumber(String fileNumber) {
		this.fileNumber = fileNumber;
	}

	public String getPress() {
		return press;
	}

	public void setPress(String press) {
		this.press = press;
	}

	public Date getPublicationDate() {
		return publicationDate;
	}

	public void setPublicationDate(Date publicationDate) {
		this.publicationDate = publicationDate;
	}

	public String getAntiquesLv() {
		return antiquesLv;
	}

	public void setAntiquesLv(String antiquesLv) {
		this.antiquesLv = antiquesLv;
	}

	public String getSourceArea() {
		return sourceArea;
	}

	public void setSourceArea(String sourceArea) {
		this.sourceArea = sourceArea;
	}

	public String getCollectionAge() {
		return collectionAge;
	}

	public void setCollectionAge(String collectionAge) {
		this.collectionAge = collectionAge;
	}

	public String getCertificateHave() {
		return certificateHave;
	}

	public void setCertificateHave(String certificateHave) {
		this.certificateHave = certificateHave;
	}

	public String getPlateNumber() {
		return plateNumber;
	}

	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}

	public String getFrameNumber() {
		return frameNumber;
	}

	public void setFrameNumber(String frameNumber) {
		this.frameNumber = frameNumber;
	}

	public String getEngineNumber() {
		return engineNumber;
	}

	public void setEngineNumber(String engineNumber) {
		this.engineNumber = engineNumber;
	}

	public String getVehicleIdeNo() {
		return vehicleIdeNo;
	}

	public void setVehicleIdeNo(String vehicleIdeNo) {
		this.vehicleIdeNo = vehicleIdeNo;
	}

	public BigDecimal getDisplacement() {
		return displacement;
	}

	public void setDisplacement(BigDecimal displacement) {
		this.displacement = displacement;
	}

	public Integer getSeats() {
		return seats;
	}

	public void setSeats(Integer seats) {
		this.seats = seats;
	}

	public String getNewEnergy() {
		return newEnergy;
	}

	public void setNewEnergy(String newEnergy) {
		this.newEnergy = newEnergy;
	}

	public String getTaxonomy() {
		return taxonomy;
	}

	public void setTaxonomy(String taxonomy) {
		this.taxonomy = taxonomy;
	}

	public String getUnitIsno() {
		return unitIsno;
	}

	public void setUnitIsno(String unitIsno) {
		this.unitIsno = unitIsno;
	}

	public String getCarRegisterUnit() {
		return carRegisterUnit;
	}

	public void setCarRegisterUnit(String carRegisterUnit) {
		this.carRegisterUnit = carRegisterUnit;
	}

	public String getCompilingSituation() {
		return compilingSituation;
	}

	public void setCompilingSituation(String compilingSituation) {
		this.compilingSituation = compilingSituation;
	}

	public String getAgentsLogo() {
		return agentsLogo;
	}

	public void setAgentsLogo(String agentsLogo) {
		this.agentsLogo = agentsLogo;
	}

	public String getLegalType() {
		return legalType;
	}

	public void setLegalType(String legalType) {
		this.legalType = legalType;
	}

	public String getWorkTotal() {
		return workTotal;
	}

	public void setWorkTotal(String workTotal) {
		this.workTotal = workTotal;
	}

	public BigDecimal getThisMileage() {
		return thisMileage;
	}

	public void setThisMileage(BigDecimal thisMileage) {
		this.thisMileage = thisMileage;
	}

	public BigDecimal getAllMileage() {
		return allMileage;
	}

	public void setAllMileage(BigDecimal allMileage) {
		this.allMileage = allMileage;
	}

	public String getLabelType() {
		return labelType;
	}

	public void setLabelType(String labelType) {
		this.labelType = labelType;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public BigDecimal getCarPrice() {
		return carPrice;
	}

	public void setCarPrice(BigDecimal carPrice) {
		this.carPrice = carPrice;
	}

	public BigDecimal getPurchaseTax() {
		return purchaseTax;
	}

	public void setPurchaseTax(BigDecimal purchaseTax) {
		this.purchaseTax = purchaseTax;
	}

	public BigDecimal getOtherExpenses() {
		return otherExpenses;
	}

	public void setOtherExpenses(BigDecimal otherExpenses) {
		this.otherExpenses = otherExpenses;
	}

	public String getPcType() {
		return pcType;
	}

	public void setPcType(String pcType) {
		this.pcType = pcType;
	}

	public String getInformationType() {
		return informationType;
	}

	public void setInformationType(String informationType) {
		this.informationType = informationType;
	}

	public Integer getAuditState() {
		return auditState;
	}

	public void setAuditState(Integer auditState) {
		this.auditState = auditState;
	}

	public Integer getManagement() {
		return management;
	}

	public void setManagement(Integer management) {
		this.management = management;
	}

	public Integer getAssetFirst() {
		return assetFirst;
	}

	public void setAssetFirst(Integer assetFirst) {
		this.assetFirst = assetFirst;
	}

	public BigDecimal getOriginalNameAssets() {
		return originalNameAssets;
	}

	public void setOriginalNameAssets(BigDecimal originalNameAssets) {
		this.originalNameAssets = originalNameAssets;
	}

	public Integer getStateAssetAllocation() {
		return stateAssetAllocation;
	}

	public void setStateAssetAllocation(Integer stateAssetAllocation) {
		this.stateAssetAllocation = stateAssetAllocation;
	}

	public String getAuditOpinion() {
		return auditOpinion;
	}

	public void setAuditOpinion(String auditOpinion) {
		this.auditOpinion = auditOpinion;
	}

	public String getDealNumber() {
		return dealNumber;
	}

	public void setDealNumber(String dealNumber) {
		this.dealNumber = dealNumber;
	}

	public String getDealStatus() {
		return dealStatus;
	}

	public void setDealStatus(String dealStatus) {
		this.dealStatus = dealStatus;
	}

	public Date getDealDate() {
		return dealDate;
	}

	public void setDealDate(Date dealDate) {
		this.dealDate = dealDate;
	}

	public Date getNewsDate() {
		return newsDate;
	}

	public void setNewsDate(Date newsDate) {
		this.newsDate = newsDate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getHabitats() {
		return habitats;
	}

	public void setHabitats(Integer habitats) {
		this.habitats = habitats;
	}

	public Integer getGenera() {
		return genera;
	}

	public void setGenera(Integer genera) {
		this.genera = genera;
	}

	public Date getAddYears() {
		return addYears;
	}

	public void setAddYears(Date addYears) {
		this.addYears = addYears;
	}

	public String getBpmId() {
		return bpmId;
	}

	public void setBpmId(String bpmId) {
		this.bpmId = bpmId;
	}

	
	public String getTenantCode() {
		return tenantCode;
	}

	public void setTenantCode(String tenantCode) {
		this.tenantCode = tenantCode;
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	@Override
	public String toString() {
		return "Asset [userId=" + userId + ", groupId=" + groupId + ", bpmId=" + bpmId + ", cardNumber=" + cardNumber
				+ ", className=" + className + ", additionMethod=" + additionMethod + ", originalValue=" + originalValue
				+ ", assetCode=" + assetCode + ", units=" + units + ", valueType=" + valueType + ", financialFunds="
				+ financialFunds + ", equity=" + equity + ", assetName=" + assetName + ", numb=" + numb
				+ ", fundingSources=" + fundingSources + ", unFinancialFunds=" + unFinancialFunds + ", totalFloorage="
				+ totalFloorage + ", procurementOrganization=" + procurementOrganization + ", depreciationState="
				+ depreciationState + ", useArea=" + useArea + ", usufructArea=" + usufructArea + ", amortizationState="
				+ amortizationState + ", formEntry=" + formEntry + ", landType=" + landType + ", singleArea="
				+ singleArea + ", usufructType=" + usufructType + ", propertyType=" + propertyType + ", ownershipYears="
				+ ownershipYears + ", ownershipNature=" + ownershipNature + ", accountingVoucherNumber="
				+ accountingVoucherNumber + ", landNum=" + landNum + ", landCertificate=" + landCertificate
				+ ", ownerLand=" + ownerLand + ", landGradation=" + landGradation + ", ownershipNumber="
				+ ownershipNumber + ", postingDate=" + postingDate + ", position=" + position + ", apportionArea="
				+ apportionArea + ", propertyFrom=" + propertyFrom + ", ownershipCertificate=" + ownershipCertificate
				+ ", ownershipDate=" + ownershipDate + ", buildings=" + buildings + ", completionDate=" + completionDate
				+ ", useDepartment=" + useDepartment + ", startTime=" + startTime + ", useDirection=" + useDirection
				+ ", unusedArea=" + unusedArea + ", rentedArea=" + rentedArea + ", investmentValue=" + investmentValue
				+ ", custodian=" + custodian + ", userName=" + userName + ", expectedMonth=" + expectedMonth
				+ ", lendArea=" + lendArea + ", rentalValue=" + rentalValue + ", othUseArea=" + othUseArea
				+ ", lendUnit=" + lendUnit + ", buyDate=" + buyDate + ", usedMonth=" + usedMonth + ", selfUseArea="
				+ selfUseArea + ", lendValue=" + lendValue + ", investmentArea=" + investmentArea + ", otherValue="
				+ otherValue + ", oldUseMonth=" + oldUseMonth + ", distributionArea=" + distributionArea
				+ ", garageArea=" + garageArea + ", undergroundUseArea=" + undergroundUseArea + ", logisticArea="
				+ logisticArea + ", usingState=" + usingState + ", boardroomArea=" + boardroomArea + ", canteenArea="
				+ canteenArea + ", unitArea=" + unitArea + ", machineArea=" + machineArea + ", undergroundArea="
				+ undergroundArea + ", selfUseValue=" + selfUseValue + ", customCoding=" + customCoding
				+ ", originalNameAssets=" + originalNameAssets + ", labelDescription=" + labelDescription + ", remark="
				+ remark + ", stateAssetAllocation=" + stateAssetAllocation + ", unitName=" + unitName
				+ ", houseSituation=" + houseSituation + ", unitPrice=" + unitPrice + ", brand=" + brand
				+ ", storagePlace=" + storagePlace + ", deviceCoding=" + deviceCoding + ", invoiceNumber="
				+ invoiceNumber + ", supplier=" + supplier + ", address=" + address + ", contacts=" + contacts
				+ ", maintenanceCall=" + maintenanceCall + ", warrantyDeadline=" + warrantyDeadline + ", afterService="
				+ afterService + ", contractNumber=" + contractNumber + ", mainParameter=" + mainParameter
				+ ", productId=" + productId + ", manufacturer=" + manufacturer + ", usedType=" + usedType
				+ ", specificationModel=" + specificationModel + ", fileNumber=" + fileNumber + ", press=" + press
				+ ", publicationDate=" + publicationDate + ", antiquesLv=" + antiquesLv + ", sourceArea=" + sourceArea
				+ ", collectionAge=" + collectionAge + ", certificateHave=" + certificateHave + ", plateNumber="
				+ plateNumber + ", frameNumber=" + frameNumber + ", engineNumber=" + engineNumber + ", vehicleIdeNo="
				+ vehicleIdeNo + ", displacement=" + displacement + ", seats=" + seats + ", newEnergy=" + newEnergy
				+ ", taxonomy=" + taxonomy + ", unitIsno=" + unitIsno + ", carRegisterUnit=" + carRegisterUnit
				+ ", compilingSituation=" + compilingSituation + ", agentsLogo=" + agentsLogo + ", legalType="
				+ legalType + ", workTotal=" + workTotal + ", thisMileage=" + thisMileage + ", allMileage=" + allMileage
				+ ", labelType=" + labelType + ", origin=" + origin + ", carPrice=" + carPrice + ", purchaseTax="
				+ purchaseTax + ", otherExpenses=" + otherExpenses + ", pcType=" + pcType + ", informationType="
				+ informationType + ", auditState=" + auditState + ", management=" + management + ", assetFirst="
				+ assetFirst + ", auditOpinion=" + auditOpinion + ", dealNumber=" + dealNumber + ", dealStatus="
				+ dealStatus + ", dealDate=" + dealDate + ", newsDate=" + newsDate + ", id=" + id + ", habitats="
				+ habitats + ", genera=" + genera + ", addYears=" + addYears + "]";
	}
	
}
