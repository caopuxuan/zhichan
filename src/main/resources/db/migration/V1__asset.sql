DROP TABLE IF EXISTS `t_asset_appurtenance` ;
CREATE TABLE `t_asset_appurtenance` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
`name` varchar(255) NULL COMMENT '�����豸��������',
`numb` int(10) NULL COMMENT '�����豸��������',
`remark` varchar(255) NULL COMMENT '��ע',
`card_number` varchar(200) NULL COMMENT '��Ƭ���',
PRIMARY KEY (`id`) 
);

DROP TABLE IF EXISTS `t_asset_subsidiary_file` ;
CREATE TABLE `t_asset_subsidiary_file` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) NULL COMMENT '��������',
`described` varchar(255) NULL COMMENT '��������',
`upload` varchar(255) NULL COMMENT '�����ϴ�',
`card_number` varchar(200) NULL COMMENT '��Ƭ���',
PRIMARY KEY (`id`) 
);

DROP TABLE IF EXISTS `t_asset_house_institutions` ;
CREATE TABLE `t_asset_house_institutions` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
`name` varchar(255) NULL COMMENT '������������',
`remark` varchar(255) NULL COMMENT '����',
`card_number` varchar(200) NULL COMMENT '��Ƭ���',
PRIMARY KEY (`id`) 
);

DROP TABLE IF EXISTS `t_asset` ;
CREATE TABLE `t_asset` (
`class_name` int(8) NULL COMMENT '�������',
`addition_method` int(2) NULL COMMENT '���ӷ�ʽ',
`original_value` decimal(18,2) NULL COMMENT 'ԭֵ',
`asset_code` varchar(50) NULL COMMENT '�ʲ�����',
`units` int(2) NULL COMMENT '������λ',
`value_type` int(2) NULL COMMENT '��ֵ���� 1ԭֵ2�ݹ�ֵ3����ֵ4�޼�ֵ5����ֵ',
`financial_funds` decimal(18,2) NULL COMMENT '�������ʽ�',
`equity` decimal(18,2) NULL COMMENT '��ֵ',
`asset_name` varchar(50) NULL COMMENT '�ʲ�����',
`numb` int(5) NULL COMMENT '����',
`funding_sources` int(2) NULL COMMENT '������Դ',
`un_financial_funds` decimal(18,2) NULL COMMENT '�ǲ������ʽ�',
`total_floorage` decimal(18,2) NULL COMMENT '�ܽ������',
`procurement_organization` int(2) NULL COMMENT '�ɹ���֯��ʽ',
`depreciation_state` int(2) NULL COMMENT '�۾�״̬ 1.���۾�2.�����۾�3.������۾�',
`use_area` decimal(18,2) NULL COMMENT 'ʹ�����',
`usufruct_area` decimal(18,2) NULL COMMENT 'ʹ��Ȩ���',
`amortization_state` int(2) NULL COMMENT '̯��״̬',
`form_entry` int(2) NULL COMMENT '������ʽ 1������2δ����',
`land_type` varchar(50) NULL COMMENT '���ࣨ��;��',
`single_area` decimal(18,2) NULL COMMENT '�������',
`usufruct_type` int(2) NULL COMMENT 'ʹ��Ȩ����  1����2����3����',
`property_type` int(2) NULL COMMENT '��Ȩ����  1ͳһȷȨ2���в�Ȩ',
`ownership_years` int(10) NULL COMMENT 'Ȩ�����ޣ��£�',
`ownership_nature` int(2) NULL COMMENT 'Ȩ������ 1����2����',
`accounting_voucher_number` varchar(50) NULL COMMENT '���ƾ֤��',
`land_num` varchar(200) NULL COMMENT '�غ�',
`ownership_number` varchar(50) NULL COMMENT 'Ȩ��֤����',
`posting_date` date NULL COMMENT '������������',
`position` varchar(100) NULL COMMENT '����λ��',
`apportion_area` decimal(18,2) NULL COMMENT '��̯���',
`property_from` int(2) NULL COMMENT '��Ȩ��ʽ  1�в�Ȩ2�޲�Ȩ',
`ownership_certificate` varchar(50) NULL COMMENT 'Ȩ��֤��',
`ownership_date` date NULL COMMENT 'Ȩ��֤�鷢֤ʱ��',
`buildings` int(2) NULL COMMENT '�����ṹ  1�ֽṹ2�ֻ�ṹ3ש��ṹ4שľ�ṹ5����',
`completion_date` date NULL COMMENT '��������',
`use_department` varchar(50) NULL COMMENT 'ʹ�ò���',
`start_time` date NULL COMMENT '��ʼʹ��ʱ��',
`use_direction` varchar(50) NULL COMMENT 'ʹ�÷���',
`unused_area` decimal(18,2) NULL COMMENT '�����������',
`rented_area` decimal(18,2) NULL COMMENT '�������',
`investment_value` decimal(18,2) NULL COMMENT '����Ͷ�ʼ�ֵ',
`custodian` varchar(50) NULL COMMENT '������',
`user_name` varchar(50) NULL COMMENT 'ʹ��������',
`expected_month` int(5) NULL COMMENT 'Ԥ��ʹ���·�',
`lend_area` decimal(18,2) NULL COMMENT '�������',
`rental_value` decimal(18,2) NULL COMMENT '�����ֵ',
`oth_use_area` decimal(18,2) NULL COMMENT '����ʹ�����',
`lend_unit` varchar(50) NULL COMMENT '���裨���⣩��λ',
`buy_date` date NULL COMMENT '����ʱ��',
`used_month` int(5) NULL COMMENT '��ʹ���·�',
`self_use_area` decimal(18,2) NULL COMMENT '�������',
`lend_value` decimal(18,2) NULL COMMENT '�����ֵ',
`investment_area` decimal(18,2) NULL COMMENT '����Ͷ�����',
`other_value` decimal(18,2) NULL COMMENT '������ֵ',
`old_use_month` int(5) NULL COMMENT '���ʲ�ԭ��ʹ���·�',
`distribution_area` decimal(18,2) NULL COMMENT '������',
`garage_area` decimal(18,2) NULL COMMENT '�������',
`underground_use_area` decimal(18,2) NULL COMMENT '����ʹ�����',
`logistic_area` decimal(18,2) NULL COMMENT '���ã��������',
`using_state` int(2) NULL COMMENT 'ʹ��״̬ 1����2����3����4���������',
`boardroom_area` decimal(18,2) NULL COMMENT '���������',
`canteen_area` decimal(18,2) NULL COMMENT 'ʳ�����',
`self_use_value` decimal(18,2) NULL COMMENT '���ü�ֵ',
`card_number` varchar(200) NOT NULL COMMENT '��Ƭ���',
`group_id` varchar(50) NULL COMMENT '�û���id',
`user_id` varchar(50) NULL COMMENT '�û�id',
`custom_coding` varchar(200) NULL COMMENT '�Զ������',
`original_name_assets` varchar(200) NULL COMMENT '�ʲ�ԭ��������',
`label_description` varchar(200) NULL COMMENT '��ǩ˵��',
`remark` varchar(200) NULL COMMENT '��ע',
`state_asset_allocation` int(200) NULL COMMENT '�ʲ�����״̬',
`unit_name` varchar(200) NULL COMMENT '�ʲ���λ��������',
`house_situation` varchar(200) NULL COMMENT '���ݻ������id',
`unit_area` decimal(18,2) NULL COMMENT '��λ�����������',
`machine_area` decimal(18,2) NULL COMMENT '�������',
`underground_area` decimal(18,2) NULL COMMENT '�������',
`land_certificate` varchar(200) NULL COMMENT '����֤�������',
`owner_land` varchar(200) NULL COMMENT '��������Ȩ��',
`land_gradation` varchar(200) NULL COMMENT '���ؼ���',
`management` int(2) NULL COMMENT '������',
`unit_price` decimal(18,2) NULL COMMENT '����',
`brand` varchar(50) NULL COMMENT 'Ʒ��',
`storage_place` varchar(50) NULL COMMENT '��ŵص�',
`device_coding` varchar(200) NULL COMMENT '��Ϣ�豸����',
`invoice_number` varchar(200) NULL COMMENT '��Ʊ��',
`supplier` varchar(50) NULL COMMENT '��Ӧ��',
`address` varchar(200) NULL COMMENT '��ַ',
`contacts` varchar(200) NULL COMMENT '��ϵ��',
`maintenance_call` varchar(200) NULL COMMENT 'ά�޵绰',
`warranty_deadline` date NULL COMMENT '���޽�ֹ����',
`after_service` varchar(200) NULL COMMENT '�ۺ�������� ',
`contract_number` varchar(50) NULL COMMENT '��ͬ���',
`main_parameter` varchar(200) NULL COMMENT '��Ҫ����',
`product_id` varchar(200) NULL COMMENT '��Ʒ���к�',
`manufacturer` varchar(50) NULL COMMENT '��������',
`used_type` int(2) NULL COMMENT '�豸��;',
`specification_model` varchar(50) NULL COMMENT '����ͺ�',
`file_number` varchar(50) NULL COMMENT '������',
`press` varchar(50) NULL COMMENT '������',
`publication_date` date NULL COMMENT '��������',
`antiques_lv` varchar(50) NULL COMMENT '����ȼ�',
`source_area` varchar(50) NULL COMMENT '��Դ��',
`collection_age` varchar(50) NULL COMMENT '��Ʒ���',
`certificate_have` varchar(200) NULL COMMENT 'Ȩ��֤��������',
`plate_number` varchar(50) NULL COMMENT '���ƺ�',
`frame_number` varchar(50) NULL COMMENT '���ܺ���',
`engine_number` varchar(50) NULL COMMENT '����������',
`vehicle_ide_no` varchar(50) NULL COMMENT '����ʶ���',
`displacement` decimal(2,1) NULL DEFAULT 0 COMMENT '����',
`seats` int(2) NULL COMMENT '������',
`new_energy` varchar(200) NULL COMMENT '�Ƿ�����Դ��',
`taxonomy` varchar(200) NULL COMMENT '������;����',
`unit_isno` varchar(50) NULL COMMENT '������λ�Ƿ񱾵�λ',
`car_register_unit` varchar(200) NULL COMMENT '������λ',
`compiling_situation` varchar(50) NULL COMMENT '�������',
`agents_logo` varchar(200) NULL COMMENT '�Ƿ���Ϳִ����ʶ',
`legal_type` varchar(200) NULL COMMENT 'ִ��ִ���ó�����',
`work_total` varchar(200) NULL COMMENT '��������',
`this_mileage` decimal(18,2) NULL COMMENT '������ʻ��̣����',
`all_mileage` decimal(18,2) NULL COMMENT '����ʻ��̣����',
`label_type` varchar(50) NULL COMMENT '�����ͺ�',
`origin` varchar(50) NULL COMMENT '��������',
`car_price` decimal(18,2) NULL COMMENT '�㳵��',
`purchase_tax` decimal(18,2) NULL COMMENT '����˰',
`other_expenses` decimal(18,2) NULL COMMENT '�����ϻ�����',
`pc_type` varchar(200) NULL COMMENT '̨ʽ������',
`information_type` varchar(200) NULL COMMENT '��Ϣ���豸����',
`audit_state` int(10) NULL COMMENT '�ύ���״̬',
`audit_opinion` varchar(200) NULL COMMENT '������',
`asset_first` int(10) NULL COMMENT '�ʲ�����',
`deal_number` varchar(200) NULL COMMENT '���ñ��',
`deal_status` varchar(200) NULL COMMENT '����״̬',
`deal_date` date NULL COMMENT '����ʱ��',
`news_date` date NULL COMMENT '����ʱ��',
`id` int(20) NOT NULL AUTO_INCREMENT,
`habitats` varchar(255) NULL COMMENT '����',
`genera` varchar(255) NULL COMMENT '������',
`add_years` date NULL COMMENT '����/�������',
PRIMARY KEY (`id`) 
);

DROP TABLE IF EXISTS `t_dim_dictionary` ;
CREATE TABLE `t_dim_dictionary` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
`types` int(11) NULL COMMENT '���ִ���',
`valued` varchar(200) NULL COMMENT '������ʾֵ',
`code` varchar(200) NULL COMMENT '����',
`names` varchar(200) NULL COMMENT '��������',
PRIMARY KEY (`id`) 
);

DROP TABLE IF EXISTS `t_deal` ;
CREATE TABLE `t_deal` (
`deal_number` varchar(200) NOT NULL COMMENT '���ñ��',
`deal_mode` int(20) NULL COMMENT '���÷�ʽ',
`application_unit` int(20) NULL COMMENT '���뵥λ',
`applicant` varchar(100) NULL COMMENT '������',
`application_date` date NULL COMMENT '����ʱ��',
`application_reasons` varchar(255) NULL COMMENT '��������',
`equity` decimal(18,2) NULL COMMENT '�ʲ���ֵ',
`original` decimal(18,2) NULL COMMENT '�ʲ�ԭֵ',
`deal_status` int(2) NULL COMMENT '�������״̬',
`audit_opinion` varchar(200) NULL COMMENT '�������',
`user_id` varchar(100) NULL COMMENT '�û�id',
`group_id` varchar(100) NULL COMMENT '�û���id',
`id` int(20) NOT NULL AUTO_INCREMENT,
PRIMARY KEY (`id`) 
);

DROP TABLE IF EXISTS `t_annexes` ;
CREATE TABLE `t_annexes` (
`id` int(50) NOT NULL AUTO_INCREMENT COMMENT '����id',
`name` varchar(255) NULL COMMENT '��������',
`type` varchar(255) NULL COMMENT '��������',
`summary` varchar(255) NULL COMMENT '��������',
`deal_number` varchar(255) NULL COMMENT '���ñ��',
PRIMARY KEY (`id`) 
);

DROP TABLE IF EXISTS `t_dim_dictionary_unit` ;
CREATE TABLE `t_dim_dictionary_unit` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
`types` int(11) NULL COMMENT '���ִ���',
`valued` varchar(200) NULL COMMENT '������ʾֵ',
`code` varchar(200) NULL COMMENT '����',
`names` varchar(200) NULL COMMENT '��������',
PRIMARY KEY (`id`) 
);

