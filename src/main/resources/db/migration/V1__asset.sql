DROP TABLE IF EXISTS `t_asset_appurtenance` ;
CREATE TABLE `t_asset_appurtenance` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`name` varchar(255) NULL COMMENT '附属设备名称名称',
`numb` int(10) NULL COMMENT '附属设备数量数量',
`remark` varchar(255) NULL COMMENT '备注',
`card_number` varchar(200) NULL COMMENT '卡片编号',
PRIMARY KEY (`id`) 
);

DROP TABLE IF EXISTS `t_asset_subsidiary_file` ;
CREATE TABLE `t_asset_subsidiary_file` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) NULL COMMENT '附件名称',
`described` varchar(255) NULL COMMENT '附件描述',
`upload` varchar(255) NULL COMMENT '附件上传',
`card_number` varchar(200) NULL COMMENT '卡片编号',
PRIMARY KEY (`id`) 
);

DROP TABLE IF EXISTS `t_asset_house_institutions` ;
CREATE TABLE `t_asset_house_institutions` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`name` varchar(255) NULL COMMENT '所属机构名称',
`remark` varchar(255) NULL COMMENT '描述',
`card_number` varchar(200) NULL COMMENT '卡片编号',
PRIMARY KEY (`id`) 
);

DROP TABLE IF EXISTS `t_asset` ;
CREATE TABLE `t_asset` (
`class_name` int(8) NULL COMMENT '类别名称',
`addition_method` int(2) NULL COMMENT '增加方式',
`original_value` decimal(18,2) NULL COMMENT '原值',
`asset_code` varchar(50) NULL COMMENT '资产代码',
`units` int(2) NULL COMMENT '计量单位',
`value_type` int(2) NULL COMMENT '价值类型 1原值2暂估值3重置值4无价值5评估值',
`financial_funds` decimal(18,2) NULL COMMENT '财政性资金',
`equity` decimal(18,2) NULL COMMENT '净值',
`asset_name` varchar(50) NULL COMMENT '资产名称',
`numb` int(5) NULL COMMENT '数量',
`funding_sources` int(2) NULL COMMENT '经费来源',
`un_financial_funds` decimal(18,2) NULL COMMENT '非财政性资金',
`total_floorage` decimal(18,2) NULL COMMENT '总建筑面积',
`procurement_organization` int(2) NULL COMMENT '采购组织形式',
`depreciation_state` int(2) NULL COMMENT '折旧状态 1.提折旧2.不提折旧3.已完成折旧',
`use_area` decimal(18,2) NULL COMMENT '使用面积',
`usufruct_area` decimal(18,2) NULL COMMENT '使用权面积',
`amortization_state` int(2) NULL COMMENT '摊销状态',
`form_entry` int(2) NULL COMMENT '入账形式 1已入账2未入账',
`land_type` varchar(50) NULL COMMENT '地类（用途）',
`single_area` decimal(18,2) NULL COMMENT '独用面积',
`usufruct_type` int(2) NULL COMMENT '使用权类型  1出让2划拨3租赁',
`property_type` int(2) NULL COMMENT '产权分类  1统一确权2自有产权',
`ownership_years` int(10) NULL COMMENT '权属年限（月）',
`ownership_nature` int(2) NULL COMMENT '权属性质 1国有2集体',
`accounting_voucher_number` varchar(50) NULL COMMENT '会计凭证号',
`land_num` varchar(200) NULL COMMENT '地号',
`ownership_number` varchar(50) NULL COMMENT '权属证书编号',
`posting_date` date NULL COMMENT '财务入账日期',
`position` varchar(100) NULL COMMENT '坐落位置',
`apportion_area` decimal(18,2) NULL COMMENT '分摊面积',
`property_from` int(2) NULL COMMENT '产权形式  1有产权2无产权',
`ownership_certificate` varchar(50) NULL COMMENT '权属证明',
`ownership_date` date NULL COMMENT '权属证书发证时间',
`buildings` int(2) NULL COMMENT '建筑结构  1钢结构2钢混结构3砖混结构4砖木结构5其他',
`completion_date` date NULL COMMENT '竣工日期',
`use_department` varchar(50) NULL COMMENT '使用部门',
`start_time` date NULL COMMENT '开始使用时间',
`use_direction` varchar(50) NULL COMMENT '使用方向',
`unused_area` decimal(18,2) NULL COMMENT '土地闲置面积',
`rented_area` decimal(18,2) NULL COMMENT '出租面积',
`investment_value` decimal(18,2) NULL COMMENT '对外投资价值',
`custodian` varchar(50) NULL COMMENT '保管人',
`user_name` varchar(50) NULL COMMENT '使用人名称',
`expected_month` int(5) NULL COMMENT '预计使用月份',
`lend_area` decimal(18,2) NULL COMMENT '出借面积',
`rental_value` decimal(18,2) NULL COMMENT '出租价值',
`oth_use_area` decimal(18,2) NULL COMMENT '其他使用面积',
`lend_unit` varchar(50) NULL COMMENT '出借（出租）单位',
`buy_date` date NULL COMMENT '购置时间',
`used_month` int(5) NULL COMMENT '已使用月份',
`self_use_area` decimal(18,2) NULL COMMENT '自用面积',
`lend_value` decimal(18,2) NULL COMMENT '出借价值',
`investment_area` decimal(18,2) NULL COMMENT '对外投资面积',
`other_value` decimal(18,2) NULL COMMENT '其他价值',
`old_use_month` int(5) NULL COMMENT '旧资产原已使用月份',
`distribution_area` decimal(18,2) NULL COMMENT '配电面积',
`garage_area` decimal(18,2) NULL COMMENT '车库面积',
`underground_use_area` decimal(18,2) NULL COMMENT '地下使用面积',
`logistic_area` decimal(18,2) NULL COMMENT '自用：后勤面积',
`using_state` int(2) NULL COMMENT '使用状态 1在用2闲置3其他4毁损待报废',
`boardroom_area` decimal(18,2) NULL COMMENT '会议室面积',
`canteen_area` decimal(18,2) NULL COMMENT '食堂面积',
`self_use_value` decimal(18,2) NULL COMMENT '自用价值',
`card_number` varchar(200) NOT NULL COMMENT '卡片编号',
`group_id` varchar(50) NULL COMMENT '用户组id',
`user_id` varchar(50) NULL COMMENT '用户id',
`custom_coding` varchar(200) NULL COMMENT '自定义编码',
`original_name_assets` varchar(200) NULL COMMENT '资产原分类名称',
`label_description` varchar(200) NULL COMMENT '标签说明',
`remark` varchar(200) NULL COMMENT '备注',
`state_asset_allocation` int(200) NULL COMMENT '资产调拨状态',
`unit_name` varchar(200) NULL COMMENT '资产单位管理名称',
`house_situation` varchar(200) NULL COMMENT '房屋基本情况id',
`unit_area` decimal(18,2) NULL COMMENT '单位负担费用面积',
`machine_area` decimal(18,2) NULL COMMENT '机房面积',
`underground_area` decimal(18,2) NULL COMMENT '地下面积',
`land_certificate` varchar(200) NULL COMMENT '土地证载明面积',
`owner_land` varchar(200) NULL COMMENT '土地所有权人',
`land_gradation` varchar(200) NULL COMMENT '土地级次',
`management` int(2) NULL COMMENT '管理部门',
`unit_price` decimal(18,2) NULL COMMENT '单价',
`brand` varchar(50) NULL COMMENT '品牌',
`storage_place` varchar(50) NULL COMMENT '存放地点',
`device_coding` varchar(200) NULL COMMENT '信息设备编码',
`invoice_number` varchar(200) NULL COMMENT '发票号',
`supplier` varchar(50) NULL COMMENT '供应商',
`address` varchar(200) NULL COMMENT '地址',
`contacts` varchar(200) NULL COMMENT '联系人',
`maintenance_call` varchar(200) NULL COMMENT '维修电话',
`warranty_deadline` date NULL COMMENT '保修截止日期',
`after_service` varchar(200) NULL COMMENT '售后服务内容 ',
`contract_number` varchar(50) NULL COMMENT '合同编号',
`main_parameter` varchar(200) NULL COMMENT '主要参数',
`product_id` varchar(200) NULL COMMENT '产品序列号',
`manufacturer` varchar(50) NULL COMMENT '生产厂家',
`used_type` int(2) NULL COMMENT '设备用途',
`specification_model` varchar(50) NULL COMMENT '规格型号',
`file_number` varchar(50) NULL COMMENT '档案号',
`press` varchar(50) NULL COMMENT '出版社',
`publication_date` date NULL COMMENT '出版日期',
`antiques_lv` varchar(50) NULL COMMENT '文物等级',
`source_area` varchar(50) NULL COMMENT '来源地',
`collection_age` varchar(50) NULL COMMENT '藏品年代',
`certificate_have` varchar(200) NULL COMMENT '权属证书所有人',
`plate_number` varchar(50) NULL COMMENT '车牌号',
`frame_number` varchar(50) NULL COMMENT '车架号码',
`engine_number` varchar(50) NULL COMMENT '发动机号码',
`vehicle_ide_no` varchar(50) NULL COMMENT '车辆识别号',
`displacement` decimal(2,1) NULL DEFAULT 0 COMMENT '排量',
`seats` int(2) NULL COMMENT '车座数',
`new_energy` varchar(200) NULL COMMENT '是否新能源车',
`taxonomy` varchar(200) NULL COMMENT '车辆用途分类',
`unit_isno` varchar(50) NULL COMMENT '车籍单位是否本单位',
`car_register_unit` varchar(200) NULL COMMENT '车籍单位',
`compiling_situation` varchar(50) NULL COMMENT '编制情况',
`agents_logo` varchar(200) NULL COMMENT '是否喷涂执法标识',
`legal_type` varchar(200) NULL COMMENT '执法执勤用车分类',
`work_total` varchar(200) NULL COMMENT '工作总量',
`this_mileage` decimal(18,2) NULL COMMENT '本年行驶里程（公里）',
`all_mileage` decimal(18,2) NULL COMMENT '已行驶里程（公里）',
`label_type` varchar(50) NULL COMMENT '厂牌型号',
`origin` varchar(50) NULL COMMENT '车辆产地',
`car_price` decimal(18,2) NULL COMMENT '裸车价',
`purchase_tax` decimal(18,2) NULL COMMENT '购置税',
`other_expenses` decimal(18,2) NULL COMMENT '其他上户费用',
`pc_type` varchar(200) NULL COMMENT '台式机分类',
`information_type` varchar(200) NULL COMMENT '信息化设备分类',
`audit_state` int(10) NULL COMMENT '提交审核状态',
`audit_opinion` varchar(200) NULL COMMENT '审核意见',
`asset_first` int(10) NULL COMMENT '资产大类',
`deal_number` varchar(200) NULL COMMENT '处置编号',
`deal_status` varchar(200) NULL COMMENT '处置状态',
`deal_date` date NULL COMMENT '处置时间',
`news_date` date NULL COMMENT '新增时间',
`id` int(20) NOT NULL AUTO_INCREMENT,
`habitats` varchar(255) NULL COMMENT '产地',
`genera` varchar(255) NULL COMMENT '纲属科',
`add_years` date NULL COMMENT '出生/栽种年份',
PRIMARY KEY (`id`) 
);

DROP TABLE IF EXISTS `t_dim_dictionary` ;
CREATE TABLE `t_dim_dictionary` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`types` int(11) NULL COMMENT '区分代码',
`valued` varchar(200) NULL COMMENT '中文显示值',
`code` varchar(200) NULL COMMENT '代码',
`names` varchar(200) NULL COMMENT '类型名称',
PRIMARY KEY (`id`) 
);

DROP TABLE IF EXISTS `t_deal` ;
CREATE TABLE `t_deal` (
`deal_number` varchar(200) NOT NULL COMMENT '处置编号',
`deal_mode` int(20) NULL COMMENT '处置方式',
`application_unit` int(20) NULL COMMENT '申请单位',
`applicant` varchar(100) NULL COMMENT '申请人',
`application_date` date NULL COMMENT '申请时间',
`application_reasons` varchar(255) NULL COMMENT '申请理由',
`equity` decimal(18,2) NULL COMMENT '资产净值',
`original` decimal(18,2) NULL COMMENT '资产原值',
`deal_status` int(2) NULL COMMENT '处置审核状态',
`audit_opinion` varchar(200) NULL COMMENT '审核描述',
`user_id` varchar(100) NULL COMMENT '用户id',
`group_id` varchar(100) NULL COMMENT '用户组id',
`id` int(20) NOT NULL AUTO_INCREMENT,
PRIMARY KEY (`id`) 
);

DROP TABLE IF EXISTS `t_annexes` ;
CREATE TABLE `t_annexes` (
`id` int(50) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`name` varchar(255) NULL COMMENT '附件名称',
`type` varchar(255) NULL COMMENT '附件类型',
`summary` varchar(255) NULL COMMENT '附件概述',
`deal_number` varchar(255) NULL COMMENT '处置编号',
PRIMARY KEY (`id`) 
);

DROP TABLE IF EXISTS `t_dim_dictionary_unit` ;
CREATE TABLE `t_dim_dictionary_unit` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`types` int(11) NULL COMMENT '区分代码',
`valued` varchar(200) NULL COMMENT '中文显示值',
`code` varchar(200) NULL COMMENT '代码',
`names` varchar(200) NULL COMMENT '类型名称',
PRIMARY KEY (`id`) 
);

