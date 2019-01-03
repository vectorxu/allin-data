CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_ad_attachment` (
  `id` bigint COMMENT '',
  `ad_att_name` string COMMENT '广告物料名称',
  `ad_name_url` string COMMENT '广告物料名称链接',
  `ad_att_abstract` string COMMENT '广告物料描述',
  `ad_abstract_url` string COMMENT '广告物料描述链接',
  `ad_att_type` int COMMENT '物料类型',
  `ad_att_format` string COMMENT '物料格式',
  `ad_att_height` string COMMENT '物料高',
  `ad_att_width` string COMMENT '物料宽',
  `ad_att_url` string COMMENT '附件url',
  `ad_additional_url` string COMMENT '附加url',
  `link_url` string COMMENT '链接url',
  `upload_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `ad_att_tag_type` int COMMENT '物料分类(1-未分类,2-已分类)',
  `ad_att_tag_id` string COMMENT '物料学组ID集合',
  `ad_att_tag` string COMMENT '物料学组集合'
) COMMENT '广告物料'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_ad_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_ad_position` (
  `id` bigint COMMENT '',
  `ad_position_name` string COMMENT '广告位名称',
  `owner_site_id` int COMMENT '所属站点id',
  `owner_site_name` string COMMENT '所属站点名称',
  `owner_channel_id` bigint COMMENT '所属频道id',
  `owner_channel_name` string COMMENT '所属频道名称',
  `owner_column_id` bigint COMMENT '所属栏目id',
  `owner_column_name` string COMMENT '所属栏目名称',
  `type_id` int COMMENT '广告位类型(1-固定、2-轮播)',
  `position_height` string COMMENT '广告位高',
  `position_width` string COMMENT '广告位宽',
  `ad_position_body` string COMMENT '广告位模版',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '广告位'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_ad_position';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_ad_position_profile` (
  `id` bigint COMMENT '',
  `ad_profile_id` bigint COMMENT '广告id',
  `ad_profile_name` string COMMENT '广告名称',
  `owner_position_id` bigint COMMENT '所属广告位',
  `owner_position_name` string COMMENT '所属广告位名称',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '广告位广告对应关系'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_ad_position_profile';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_ad_profile` (
  `id` bigint COMMENT '',
  `ad_profile_name` string COMMENT '广告名称',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '广告'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_ad_profile';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_ad_profile_attachment` (
  `id` bigint COMMENT '',
  `ad_att_id` bigint COMMENT '广告物料id',
  `ad_att_name` string COMMENT '广告物料名称',
  `ad_name_url` string COMMENT '广告物料名称链接',
  `ad_att_abstract` string COMMENT '广告物料描述',
  `ad_abstract_url` string COMMENT '广告物料描述链接',
  `owner_profile_id` bigint COMMENT '所属广告id',
  `owner_profile_name` string COMMENT '所属广告名称',
  `ad_att_type` int COMMENT '物料类型',
  `ad_att_format` string COMMENT '物料格式',
  `ad_att_height` string COMMENT '物料高',
  `ad_att_width` string COMMENT '物料宽',
  `ad_att_url` string COMMENT '附件url',
  `ad_additional_url` string COMMENT '附加url',
  `link_url` string COMMENT '链接url',
  `upload_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `is_header` int COMMENT '是否置顶'
) COMMENT '广告与物料对应关系'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_ad_profile_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_article_vc` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '',
  `customer_id` bigint COMMENT '',
  `root_id` int COMMENT '',
  `parents_id` int COMMENT '',
  `page_top` string COMMENT '',
  `frontpage` string COMMENT '',
  `title` string COMMENT '',
  `content` string COMMENT '',
  `author` string COMMENT '',
  `level_id` int COMMENT '',
  `op_ip` string COMMENT '',
  `class_name` string COMMENT '',
  `click_num` int COMMENT '',
  `create_date` timestamp COMMENT '',
  `bbs_reply` int COMMENT '',
  `reply_flag` string COMMENT '',
  `last_date` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_article_vc';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_caos_comm_organization` (
  `id` bigint COMMENT '',
  `org_type` int COMMENT '(1-骨科分会委员会,2-骨科分会委员会)',
  `org_name` string COMMENT '名头',
  `org_url` string COMMENT '组织链接',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `group_content` string COMMENT '组织架构分组',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT 'CAOS组织架构基础表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_caos_comm_organization';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_caos_customer_appeal` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `first_name` string COMMENT '名',
  `last_name` string COMMENT '姓',
  `email` string COMMENT '会员邮箱',
  `payment_mode` int COMMENT '付款方式',
  `pay_account` string COMMENT '关联付款账号信息',
  `trade_no` string COMMENT '交易号(第三方)',
  `remark` string COMMENT '备注',
  `create_time` timestamp COMMENT '创建时间',
  `handle_status` int COMMENT '处理状态',
  `handle_time` timestamp COMMENT '处理时间',
  `handle_usr` string COMMENT '处理人',
  `handle_remark` string COMMENT '处理回复内容',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员申诉'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_caos_customer_appeal';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_caos_customer_baseinfo` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id,CAOS+customer_id=member_code',
  `member_id` bigint COMMENT 'caos-member-id',
  `ref_customer_id` bigint COMMENT '唯医会员id',
  `email` string COMMENT '邮箱',
  `init_passwd` string COMMENT 'caos-明码密码',
  `passwd` string COMMENT '密码',
  `first_name` string COMMENT '名',
  `last_name` string COMMENT '姓',
  `sex_id` int COMMENT '性别id',
  `id_card` string COMMENT '身份证号码',
  `certificates_id` int COMMENT '证件类型',
  `certificates_code` string COMMENT '证件号码',
  `company` string COMMENT '单位名称',
  `medical_title_id` int COMMENT '职称id',
  `medical_title` string COMMENT '职称姓名',
  `areas_expertise_id` bigint COMMENT '亚专业id（擅长领域）',
  `areas_expertise` string COMMENT '亚专业名称',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `detail_address` string COMMENT '详细地址',
  `mobile` string COMMENT '详细地址',
  `zip_code` string COMMENT '邮政编码',
  `is_check_email` int COMMENT '是否验证邮箱',
  `is_pay` int COMMENT '是否缴费',
  `summary` string COMMENT '简介',
  `logo_url` string COMMENT '头像logo地址',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `customer_url` string COMMENT '个人url',
  `page_storage_path` string COMMENT '个人简介存储路径',
  `check_email_time` timestamp COMMENT '验证邮箱时间',
  `is_certificates` int COMMENT '是否制证(0-未制证,1-制证)',
  `site_id` int COMMENT '站点id',
  `is_check_mobile` int COMMENT '是否验证手机',
  `check_mobile_time` timestamp COMMENT '验证手机时间',
  `valid_time` timestamp COMMENT '有效时间',
  `contact_mobile` string COMMENT '联系手机',
  `contact_email` string COMMENT '联系邮箱',
  `phone` string COMMENT '座机',
  `phone_code` string COMMENT '座机区号',
  `phone_extension` string COMMENT '座机分机'
) COMMENT 'CAOS会员信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_caos_customer_baseinfo';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_caos_customer_organization` (
  `id` bigint COMMENT '',
  `org_id` int COMMENT '届',
  `level_id` int COMMENT '级别',
  `level_name` string COMMENT '名头(会长副会长...)',
  `org_type` int COMMENT '类型（1-组织架构、2-工作委员会、3-工作组）',
  `org_name` string COMMENT '名称',
  `customer_id` bigint COMMENT '会员id',
  `first_name` string COMMENT '名',
  `last_name` string COMMENT '姓',
  `company` string COMMENT '单位名称',
  `customer_url` string COMMENT '会员链接',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT 'CAOS组织架构'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_caos_customer_organization';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_caos_customer_payment` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `email` string COMMENT '会员邮箱',
  `ord_name` string COMMENT '订单名称',
  `payment_mode` int COMMENT '付款方式',
  `paid_money` decimal COMMENT '支付金额(实付)',
  `sum_money` decimal COMMENT '订单金额(应付)',
  `affixation` decimal COMMENT '附加费',
  `pay_time` timestamp COMMENT '付款时间',
  `valid_start_time` timestamp COMMENT '有效开始时间',
  `valid_end_time` timestamp COMMENT '有效结束时间',
  `ord_no` bigint COMMENT '系统订单号',
  `trade_no` string COMMENT '交易号(第三方)',
  `is_success` string COMMENT '返回状态',
  `notify_type` string COMMENT '返回类型',
  `buyer_id` string COMMENT '返回账户id',
  `buyer_account` string COMMENT '返回账户',
  `return_msg` string COMMENT '第三方返回信息',
  `notify_time` timestamp COMMENT '返回时间',
  `is_inv` int COMMENT '是否需要发票(0-不要发票 1-需要发票)',
  `inv_title` string COMMENT '发票title',
  `inv_detail` string COMMENT '发票明细',
  `inv_money` decimal COMMENT '发票金额',
  `inv_status` int COMMENT '发票状态',
  `inv_time` timestamp COMMENT '开票时间',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `detail_address` string COMMENT '详细地址',
  `zip_code` string COMMENT '邮政编码',
  `contact_tel` string COMMENT '联系电话',
  `consignee` string COMMENT '收件人',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '关联站点(1-allin 2-CAOS)',
  `valid_code` string COMMENT '加密链接',
  `is_valid` int COMMENT '是否有效'
) COMMENT '缴费信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_caos_customer_payment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_caos_organization_level` (
  `id` bigint COMMENT '',
  `level_name` string COMMENT '名头',
  `org_id` bigint COMMENT '组织架构id',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT 'CAOS组织架构与登记对应关系'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_caos_organization_level';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_case_additional` (
  `id` bigint COMMENT '',
  `additional_id` bigint COMMENT '附加信息id',
  `case_id` bigint COMMENT '病例id',
  `additional_name` string COMMENT '附加信息名称',
  `additional_type` int COMMENT '附加信息类型（1-随访记录，2-手术记录，3-诊断依据，4-鉴别诊断,5-康复计划,6-临床转归,7-诊断）',
  `additional_option` string COMMENT '附加信息选项（随访记录：年_月，临床转归：1-治愈，2-好转，3-未愈，4-死亡，5-无效，6-其他）',
  `additional_place` string COMMENT '附加信息地点',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '病例附加信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_case_additional';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_case_additional_attachment` (
  `id` bigint COMMENT '',
  `additional_id` bigint COMMENT '病例附加信息id',
  `case_id` bigint COMMENT '病例id',
  `case_att_name` string COMMENT '附件说明（图片标题等）',
  `att_type` int COMMENT '附件类型：1-图片，2-视频',
  `att_size` string COMMENT '附件大小：KB',
  `att_format` string COMMENT '附件格式：jpg、png...',
  `att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、8-480*320、9-1280*720、10-900*600、12-300*200、13-450*300、14-750*500)',
  `att_height` string COMMENT '附件高度',
  `att_width` string COMMENT '附件宽度',
  `att_url` string COMMENT '附件url',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功,3-转码中',
  `play_time` string COMMENT '播放时长',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '病例附加信息附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_case_additional_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_case_additional_supplement` (
  `id` bigint COMMENT '',
  `additional_id` bigint COMMENT '附加信息id',
  `case_id` bigint COMMENT '病例id',
  `additional_type` int COMMENT '附加信息类型（1-随访记录，2-手术记录，3-诊断依据，4-鉴别诊断,5-康复计划,6-临床转归）',
  `content` string COMMENT '附加信息内容',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '病例附加信息字段内容表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_case_additional_supplement';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_case_attachment` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `case_att_name` string COMMENT '附件说明（图片标题等）',
  `case_category_id` int COMMENT '附件类别：1-术前，2-术中，3-术后',
  `case_att_type` int COMMENT '附件类型：1-图片，2-视频......',
  `case_att_size` string COMMENT '附件大小：KB',
  `case_att_format` string COMMENT '附件格式：jpg、mp4...',
  `case_att_spec` string COMMENT '附件规格：高清、标清',
  `case_att_height` string COMMENT '附件高度',
  `case_att_width` string COMMENT '附件宽度',
  `case_att_url` string COMMENT '附件url',
  `upload_time` timestamp COMMENT '新闻附件上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `send_site_id` int COMMENT '站点',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功,3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `play_time` string COMMENT '播放时长',
  `play_num` bigint COMMENT '播放次数',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT ''
) COMMENT '病例附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_case_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_case_baseinfo` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `case_name` string COMMENT '病例名称',
  `case_type` int COMMENT '病例类型(0.未审核病例、2.手术病例、3.非手术病例)',
  `ref_customer_id` bigint COMMENT '相关会员id',
  `sex_id` int COMMENT '病例中患者性别',
  `age` string COMMENT '病例中患者年龄',
  `areas_expertise` string COMMENT '所属专业',
  `main_narrate` string COMMENT '主诉',
  `illness_history` string COMMENT '现病史',
  `professional_checking` string COMMENT '专科检查',
  `discussion` string COMMENT '文字讨论',
  `collection_num` bigint COMMENT '被收藏数',
  `follow_fans_num` bigint COMMENT '被关注数',
  `review_num` bigint COMMENT '被评论数',
  `reprint_num` bigint COMMENT '被转发数',
  `share_num` bigint COMMENT '被分享数',
  `create_time` timestamp COMMENT '创建时间',
  `moidfy_time` timestamp COMMENT '最近一次修改时间',
  `publish_time` timestamp COMMENT '发布时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `case_status` int COMMENT '1-提交审核、2-审核通过、3-审核拒绝',
  `reason` string COMMENT '审核拒绝原因',
  `is_customer_essential` int COMMENT '是否精华（会员设置）',
  `is_header` int COMMENT '是否置顶',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `web_storage_path` string COMMENT '手机版存储路径',
  `page_storage_path` string COMMENT '电脑版存储路径',
  `case_url` string COMMENT '病例url',
  `tpl_path` string COMMENT '模版路径or模版id',
  `prefer_up_num` bigint COMMENT '赞数',
  `browse_num` bigint COMMENT '浏览数',
  `send_site_id` int COMMENT '',
  `sort_list_authority` bigint COMMENT '列表排序权重',
  `age_month` string COMMENT '月',
  `age_day` string COMMENT '日',
  `sort_authority_secondary` bigint COMMENT '次要列表排序权重',
  `is_draft` int COMMENT '是否草稿',
  `activity_id` bigint COMMENT '活动id',
  `activity_status` int COMMENT '活动状态',
  `share_page_short_url` string COMMENT '电脑版存储路径转换的短链接',
  `share_web_short_url` string COMMENT '手机版存储路径转换的短链接',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `score` double COMMENT '评分数',
  `score_num` double COMMENT '评分人数',
  `operation_level` int COMMENT '手术分级：1-一级手术，2-二级手术，3-三级手术，4-四级手术',
  `is_systematics` int COMMENT '是否体系化课程：1-是，0-否'
) COMMENT '病例基础信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_case_baseinfo';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_case_supplement` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `treatment_record` string COMMENT '诊疗记录',
  `operation_name` string COMMENT '手术名称',
  `intraoperative_info` string COMMENT '术中信息',
  `product_info` string COMMENT '产品信息',
  `auxiliary_info` string COMMENT '辅助检查',
  `diagnosis_info` string COMMENT '诊断(已不再使用，数据迁移至case_additional表)',
  `past_history` string COMMENT '既往史',
  `personal_history` string COMMENT '个人史',
  `family_history` string COMMENT '家族史',
  `create_time` timestamp COMMENT '创建时间',
  `modify_time` timestamp COMMENT '修改时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `update_time` timestamp COMMENT ''
) COMMENT '病例补充信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_case_supplement';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_case_tag` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `case_name` string COMMENT '病例名称',
  `tag_id` bigint COMMENT 'tag_id',
  `tag_name` string COMMENT 'tag名称',
  `tag_parent_id` bigint COMMENT 'tag父节点',
  `tag_full_path` string COMMENT 'tag完全路径',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创作日期'
) COMMENT '病例-tag-mapping'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_case_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_case_tag_20181103` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `case_name` string COMMENT '病例名称',
  `tag_id` bigint COMMENT 'tag_id',
  `tag_name` string COMMENT 'tag名称',
  `tag_parent_id` bigint COMMENT 'tag父节点',
  `tag_full_path` string COMMENT 'tag完全路径',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创作日期'
) COMMENT '病例-tag-mapping'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_case_tag_20181103';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_clean_customer_auth` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `old_company_id` string COMMENT '',
  `company_id` bigint COMMENT '医院id',
  `company` string COMMENT '工作单位',
  `hospital_name` string COMMENT '医院名称',
  `hospital_othername` string COMMENT '别名',
  `hospital_type_id` int COMMENT '医院类型',
  `hospital_level_id` int COMMENT '医院等级'
) COMMENT '会员认证信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_clean_customer_auth';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity` (
  `id` bigint COMMENT '',
  `activity_id` bigint COMMENT '活动id',
  `activity_name` string COMMENT '活动名称',
  `activity_url` string COMMENT '活动url',
  `activity_intro` string COMMENT '会议简介',
  `activity_host` string COMMENT '主办方',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `activity_pic_url` string COMMENT '活动主图地址',
  `is_header` int COMMENT '是否置顶',
  `activity_type` int COMMENT '1-官方视频Pk活动、2-非官方视频PK活动、3-拜耳活动',
  `page_link_url` string COMMENT 'PC跳转路径',
  `web_link_url` string COMMENT '手机跳转路径',
  `page_banner_url` string COMMENT 'PC端Banner图片url',
  `page_banner_bgimg_url` string COMMENT 'PC端Banner底图url',
  `web_banner_url` string COMMENT 'H5端Banner图片url',
  `page_bgimg_url` string COMMENT 'PC端背景图片url',
  `page_bgcolor` string COMMENT 'PC端背景颜色',
  `share_title` string COMMENT '分享标题',
  `share_content` string COMMENT '分享话术',
  `share_pic_url` string COMMENT '分享图片url',
  `seo_name` string COMMENT 'seo名称',
  `seo_summary` string COMMENT 'seo描述',
  `seo_key_word` string COMMENT 'seo关键词',
  `tpl_path` string COMMENT '模板路径',
  `nav_selected_color` string COMMENT '导航栏选中文字颜色',
  `nav_unselected_color` string COMMENT '导航栏未选中文字颜色',
  `nav_unselected_bgcolor` string COMMENT '未选中背景颜色',
  `nav_selected_bgcolor` string COMMENT '选中项背景颜色',
  `is_show_tag` int COMMENT '资源列表页是否显示标签（0-不显示，1-显示）',
  `activity_tag_name` string COMMENT '标签名称',
  `activity_tag_color` string COMMENT '标签颜色',
  `promoted_name` string COMMENT '晋级阶段名称(拼接字符串)',
  `resource_limit` int COMMENT '参赛作品个数限制(0-不限制个数)'
) COMMENT '活动信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_choose` (
  `id` bigint COMMENT '',
  `choose_id` bigint COMMENT '筛选id',
  `choose_title` string COMMENT '筛选名称',
  `is_match` int COMMENT '是否匹配活动属性（0-不匹配，1-匹配）',
  `activity_id` bigint COMMENT '活动id',
  `activity_name` string COMMENT '活动名称',
  `activity_type` int COMMENT '活动属性类型（1-视频，2-文库，4-话题，7-病例，8-地区）',
  `show_num` int COMMENT '显示层级数',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `create_time` timestamp COMMENT '创建时间',
  `score_count` int COMMENT '关联评分次数',
  `is_show_promoted` int COMMENT '晋级标识显示（0-不显示，1-显示晋级第二阶段标识，2-显示晋级第三阶段标识...）'
) COMMENT '活动筛选表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_choose';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_choose_property` (
  `id` bigint COMMENT '',
  `choose_id` bigint COMMENT '筛选id',
  `property_id` bigint COMMENT '资源属性id',
  `property_name` string COMMENT '属性名称',
  `parent_id` bigint COMMENT '父节点',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `property_full_path` string COMMENT '上级路径（拼串形式存放上级propertyId）',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '活动筛选属性表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_choose_property';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_choose_recommend` (
  `id` bigint COMMENT '',
  `choose_id` bigint COMMENT '筛选id',
  `property_id` bigint COMMENT '资源属性id',
  `property_name` string COMMENT '属性名称',
  `parent_id` bigint COMMENT '父节点',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `property_full_path` string COMMENT '上级路径（拼串形式存放上级propertyId）',
  `resource_id` bigint COMMENT '资源id',
  `resource_name` string COMMENT '资源名称',
  `resource_type` int COMMENT '资源类型',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `create_time` timestamp COMMENT '创建时间',
  `publish_time` timestamp COMMENT '资源发布时间'
) COMMENT '活动筛选资源属性对应表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_choose_recommend';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_column` (
  `id` bigint COMMENT 'id',
  `column_name` string COMMENT '栏目名称',
  `recommend_type` int COMMENT '推荐类型 （1-推荐资源、2-推荐会员、3-推荐自定义资源、4-推荐调查问卷、5-推荐新闻、6-推荐筛选)',
  `resource_source` int COMMENT '排行榜资源来源（1-全站、2-手动添加，3-活动资源）',
  `activity_id` bigint COMMENT '排行榜活动资源id',
  `activity_type` int COMMENT '排行榜活动资源id类型（1、视频，7-病例 , 8-参赛地区）',
  `property_full_path` string COMMENT '排行榜活动资源多级筛选项（拼串形式保存）',
  `is_promoted` int COMMENT '排行榜活动资源是否晋级（0-否，1-是）',
  `is_show_sort` int COMMENT '排行榜资源是否显示序号（0-否，1-是）',
  `ranking_resource_type` int COMMENT '排行榜资源类型（1-视频,2-文库,4-话题,7-病例、8-会员）',
  `resource_sort_type` int COMMENT '排行榜排序方式（1-发布时间降序 2-浏览量降序 3-点赞降序 4-收藏数降序 5-评论数降序 6-粉丝数降序）',
  `resource_num` int COMMENT '排行榜资源个数',
  `resource_tag_id` bigint COMMENT '排行榜专业id',
  `resource_tag_name` string COMMENT '排行榜专业名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '所属站点',
  `setting_element` string COMMENT '自定义元素（1-浏览数，2-收藏数，3-评论数，4-点赞数，5-粉丝数，6-关注数，7-贡献数）',
  `interactive_operation` string COMMENT '交互操作（1-点赞，2-评分结果）',
  `is_page` int COMMENT '是否分页（0-否、1-是）',
  `page_num` int COMMENT '页内条数',
  `is_ranking` int COMMENT '是否是排行榜（0-不是，1-是）',
  `resource_own_type` int COMMENT '排行榜资源所属类型 （-1.全部）;1.视频（1-手术视频，2-课程视频，3-会议视频，4-专家访谈视频）7.病例（0-未审核病例，2-手术病例，3-非手术病例）',
  `is_sort` int COMMENT '是否需要排序（0-否，1-是）',
  `is_show_more` int COMMENT '是否展示更多（0-否，1-是）',
  `more_page_url` string COMMENT '更多PC跳转地址',
  `more_web_url` string COMMENT '更多H5跳转地址',
  `resource_start_time` timestamp COMMENT '排行榜资源发布起始时间',
  `resource_end_time` timestamp COMMENT '排行榜资源发布结束时间',
  `resource_time_type` int COMMENT '1-发布时间、2－时间区间',
  `is_show_area` int COMMENT '是否显示地区（0-否、1-是）',
  `activity_resource_type` int COMMENT '排行榜活动关联资源类型（1-视频、2-文库、4-话题、7-病例）',
  `score_count` int COMMENT '关联评分次数',
  `is_show_promoted` int COMMENT '晋级标识显示（0-不显示，1-显示晋级第二阶段标识，2-显示晋级第三阶段标识...）'
) COMMENT '活动栏目信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_column';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_column_recommend` (
  `id` bigint COMMENT 'id',
  `column_id` bigint COMMENT '所属栏目id',
  `recommend_type` int COMMENT '推荐类型 （1-推荐资源、2-推荐会员、3-推荐自定义资源、4-推荐调查问卷、5-推荐新闻、6-推荐筛选)',
  `resource_type` int COMMENT '资源类型 （ 1-视频,2-文库,4-话题,7-病例、8-会员、9-调查问卷、10-新闻、11-筛选）',
  `ref_id` bigint COMMENT '关联id',
  `logo_pic_url` string COMMENT '徽标图片url',
  `cover_pic_url` string COMMENT '封面图片url',
  `title` string COMMENT '标题/姓名',
  `author` string COMMENT '作者',
  `medical_title` string COMMENT '职称',
  `hospital_name` string COMMENT '医院',
  `pc_url` string COMMENT 'pc链接url',
  `h5_url` string COMMENT '手机链接url',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `summary` string COMMENT '简介',
  `ref_customer_id` bigint COMMENT '作者关联id',
  `app_url` string COMMENT 'app手机端存储路径'
) COMMENT '活动栏目推荐资源信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_column_recommend';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_component` (
  `id` bigint COMMENT 'id',
  `component_id` bigint COMMENT '组件id',
  `component_name` string COMMENT '组件名称',
  `component_type` int COMMENT '组件类型(1-资源列表，2-会员列表，3-排行榜，4-新闻，5-推荐位，6-滚动栏，7-调查问卷，8-地区入口)',
  `title_location` int COMMENT '标题位置（1-居左显示,2-居中显示,3-居右显示）',
  `list_style` int COMMENT '列表样式（1-左图右文，2-左文右图，3-上图下文，4-上文下图）',
  `scroll_type` int COMMENT '滚动类型（1-资源，2-会员，3-自定义）',
  `ranking_type` int COMMENT '排行榜类型（1-资源，2-会员）',
  `tpl_content` string COMMENT '模板内容',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '所属站点'
) COMMENT '活动组件信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_component';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_customer` (
  `id` bigint COMMENT '',
  `activity_id` bigint COMMENT '活动id',
  `column_id` bigint COMMENT '栏目id',
  `channel_id` bigint COMMENT '频道id',
  `customer_id` bigint COMMENT '专家id',
  `ref_id` bigint COMMENT '资源id',
  `ref_customer_id` bigint COMMENT '会员id',
  `ref_type` int COMMENT '关联类型(1-视频,2-文库,4-话题,7-病例)',
  `resource_create_time` timestamp COMMENT '资源创建时间',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `score_state` int COMMENT '评分状态: 1-已评分 0-未评分',
  `record_id` bigint COMMENT '阶段评分记录id',
  `resource_num` int COMMENT '资源编号'
) COMMENT '活动专家配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_customer';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_event` (
  `id` bigint COMMENT '',
  `event_id` bigint COMMENT '事件id',
  `activity_id` bigint COMMENT '活动id',
  `event_type` int COMMENT '事件类型(1-活动流程...)',
  `event_process_type` int COMMENT '活动流程(1.海选报名、2.专家评审 、3.大众评选 、 4.现场展示和颁奖)',
  `event_name` string COMMENT '事件名称',
  `start_time` timestamp COMMENT '事件开始时间',
  `end_time` timestamp COMMENT '事件结束时间',
  `event_remark` string COMMENT '事件说明',
  `event_url` string COMMENT '事件链接',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `event_bgcolor` string COMMENT '事件名称背景颜色'
) COMMENT '会议事件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_event';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_event_config` (
  `id` bigint COMMENT '',
  `config_id` bigint COMMENT '配置id',
  `event_id` bigint COMMENT '活动事件id',
  `config_type` int COMMENT '1-报名信息',
  `config_title` string COMMENT '配置项名称',
  `config_intro` string COMMENT '配置项说明',
  `config_data_type` int COMMENT '1(1-报名基本信息,2-选择地区,3-选择类别,4-上传资源)',
  `property_full_path` string COMMENT '筛选路径（拼串形式存放如 1_大地区，2_小地区）',
  `upload_type` string COMMENT '上传资源类型（1-视频,2-文库,4-话题,7-病例）',
  `custom_form` string COMMENT '自定义表单项(1-邮箱、2-临床时间)',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '活动事件配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_event_config';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_expert` (
  `id` bigint COMMENT '',
  `record_id` bigint COMMENT '阶段评分记录id',
  `group_id` bigint COMMENT '分组id',
  `customer_id` bigint COMMENT '专家id',
  `assign_resource_num` int COMMENT '分配作品数',
  `unfinish_resource_num` int COMMENT '未评作品数',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '活动专家'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_expert';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_expert_20181008` (
  `id` bigint COMMENT '',
  `record_id` bigint COMMENT '阶段评分记录id',
  `group_id` bigint COMMENT '分组id',
  `customer_id` bigint COMMENT '专家id',
  `assign_resource_num` int COMMENT '分配作品数',
  `unfinish_resource_num` int COMMENT '未评作品数',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '活动专家'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_expert_20181008';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_expert_group` (
  `id` bigint COMMENT '',
  `record_id` bigint COMMENT '阶段评分记录id',
  `group_name` string COMMENT '分组名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '专家分组'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_expert_group';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_layout` (
  `id` bigint COMMENT 'id',
  `layout_id` bigint COMMENT '布局信息id',
  `layout_name` string COMMENT '布局名称',
  `layout_pic_url` string COMMENT '布局样式图片url',
  `tpl_content` string COMMENT '模板内容',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '所属站点',
  `file_path` string COMMENT '文件路径'
) COMMENT '活动样式布局信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_layout';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_layout_module` (
  `id` bigint COMMENT 'id',
  `layout_id` bigint COMMENT '布局信息id',
  `layout_module` string COMMENT '布局模块（A、B、C、D）',
  `module_location` string COMMENT '模块位置（上、中、下）',
  `module_width` string COMMENT '模块宽',
  `module_height` string COMMENT '模块高',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '活动样式布局对应模块信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_layout_module';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_menu` (
  `id` bigint COMMENT '',
  `activity_id` bigint COMMENT '活动id',
  `activity_menu_id` bigint COMMENT '活动菜单id',
  `activity_menu_name` string COMMENT '活动菜单项',
  `activity_menu_url` string COMMENT '菜单项url地址',
  `tpl_path` string COMMENT 'tpl路径',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `tree_level` int COMMENT '节点级别',
  `parent_id` bigint COMMENT '父节点',
  `content_type` int COMMENT '内容类别(1-内部页面、2-外网链接)',
  `layout_id` bigint COMMENT '布局信息id',
  `app_url` string COMMENT 'appUrl'
) COMMENT '活动菜单项'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_menu';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_menu_layout_module` (
  `id` bigint COMMENT '',
  `activity_menu_id` bigint COMMENT '活动菜单id',
  `layout_id` bigint COMMENT '布局信息id',
  `layout_module` string COMMENT '布局模块（A、B、C、D）',
  `component_type` int COMMENT '组件类型(1-资源列表，2-会员列表，3-排行榜，4-新闻，5-推荐位，6-滚动栏，7-调查问卷，8-地区入口)',
  `component_id` bigint COMMENT '组件id',
  `column_id` bigint COMMENT '栏目id',
  `column_name` string COMMENT '栏目名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `title` string COMMENT '组件标题'
) COMMENT '活动菜单布局模块信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_menu_layout_module';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_menu_recommend` (
  `id` bigint COMMENT '',
  `activity_id` bigint COMMENT '活动id',
  `activity_menu_id` bigint COMMENT '活动菜单id',
  `recommend_type` int COMMENT '1-栏目,2-广告位',
  `recommend_id` bigint COMMENT '关联id',
  `recommend_num` int COMMENT '推荐显示条数',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `type_id` int COMMENT '关联类型id(1-栏目,2-广告位)'
) COMMENT '活动菜单对应信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_menu_recommend';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_news` (
  `id` bigint COMMENT 'id',
  `news_id` bigint COMMENT '新闻id',
  `news_name` string COMMENT '新闻标题',
  `news_author` string COMMENT '新闻作者',
  `news_body` string COMMENT '新闻内容',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '活动新闻表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_news';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_news_attachment` (
  `id` bigint COMMENT 'id',
  `news_id` bigint COMMENT '新闻id',
  `news_att_format` string COMMENT '新闻附件格式',
  `news_att_height` string COMMENT '新闻附件高度',
  `news_att_width` string COMMENT '新闻附件宽度',
  `news_att_url` string COMMENT '新闻附件url',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '活动新闻附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_news_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_property` (
  `id` bigint COMMENT '',
  `activity_id` bigint COMMENT '活动id',
  `activity_type` int COMMENT '活动id类型（1、视频，7-病例）',
  `property_id` bigint COMMENT '资源属性id',
  `property_name` string COMMENT '属性名称',
  `parent_id` bigint COMMENT '父节点',
  `property_desc` string COMMENT '属性描述',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `property_full_path` string COMMENT '上级路径（拼串形式存放上级propertyId）',
  `video_num` bigint COMMENT '视频数',
  `topic_num` bigint COMMENT '话题数',
  `doc_num` bigint COMMENT '文库数',
  `case_num` bigint COMMENT '病例资源数',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `tpl_path` string COMMENT 'tpl路径'
) COMMENT '活动资源属性对应表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_property';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_property_recommend` (
  `id` bigint COMMENT '',
  `activity_id` bigint COMMENT '活动id',
  `property_id` bigint COMMENT '活动属性id',
  `property_level` int COMMENT '属性级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `parent_id` bigint COMMENT '父节点',
  `property_full_path` string COMMENT '上级路径（拼串形式存放上级propertyId）',
  `recommend_type` int COMMENT '1-栏目,2-广告位,3-新闻栏目,4-资源列表栏目',
  `recommend_id` bigint COMMENT '关联id 栏目id和广告位id',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '活动属性对应信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_property_recommend';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_question` (
  `id` bigint COMMENT 'id',
  `question_id` bigint COMMENT '题目id',
  `question_type` int COMMENT '题目类型（1-单选、2-多选、3-填空题）',
  `question_show_type` int COMMENT '题目展示类型（1-文字、2、图片、图文混排）',
  `question_content` string COMMENT '题目内容',
  `question_author` string COMMENT '出题人',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `questionnaire_id` bigint COMMENT '问卷id',
  `question_option_max` int COMMENT '最多项',
  `question_option_min` int COMMENT '最少项',
  `is_required_status` int COMMENT '1-必填、0-非必填'
) COMMENT '活动问卷题目'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_question';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_question_answer` (
  `id` bigint COMMENT 'id',
  `questionnaire_id` bigint COMMENT '问卷id',
  `question_id` bigint COMMENT '题目id',
  `question_type` int COMMENT '题目类型（1-单选、2-多选、3-填空题）',
  `option_mark` string COMMENT '选项(A,B,C,D,E)',
  `customer_id` bigint COMMENT '会员id',
  `answer_content` string COMMENT '答题内容',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `op_ip` string COMMENT '操作ip'
) COMMENT '活动答题表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_question_answer';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_question_attachment` (
  `id` bigint COMMENT 'id',
  `question_id` bigint COMMENT '题目id',
  `option_att_name` string COMMENT '题目附件标题',
  `option_att_format` string COMMENT '题目附件格式',
  `option_att_height` string COMMENT '题目附件高度',
  `option_att_width` string COMMENT '题目附件宽度',
  `option_att_url` string COMMENT '题目附件url',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '活动题目附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_question_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_question_option` (
  `id` bigint COMMENT 'id',
  `question_id` bigint COMMENT '题目id',
  `option_mark` string COMMENT '选项(A,B,C,D,E)',
  `option_content` string COMMENT '选项内容',
  `option_pic_url` string COMMENT '选项图片url',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `is_required_status` int COMMENT '0-非必填、1-必填',
  `option_show_type` int COMMENT '选项展示类型（1-文字、2、图片、图文混排）'
) COMMENT '活动问卷题目选项表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_question_option';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_questionnaire` (
  `id` bigint COMMENT 'id',
  `questionnaire_id` bigint COMMENT '问卷id',
  `questionnaire_title` string COMMENT '问卷标题',
  `questionnaire_type` int COMMENT '1-问卷调查、2-问卷投票',
  `is_page` int COMMENT '是否分页（0-否、1-是）',
  `page_num` int COMMENT '页内题数',
  `questionnaire_summary` string COMMENT '问卷说明',
  `questionnaire_pic_url` string COMMENT '问卷图片url',
  `share_title` string COMMENT '分享标题',
  `share_content` string COMMENT '分享话术',
  `share_pic_url` string COMMENT '分享图片url',
  `user_type` int COMMENT '1-需登录、2-需认证、3-无限制',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `is_show_result` int COMMENT '1-不显示投票结果、2-显示投票结果',
  `is_share_state` int COMMENT '1-填写后分享、2-填写后不分享',
  `end_content` string COMMENT '结束话术内容'
) COMMENT '活动问卷主表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_questionnaire';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_questionnaire_attachment` (
  `id` bigint COMMENT 'id',
  `questionnaire_id` bigint COMMENT '问卷id',
  `questionnaire_att_name` string COMMENT '问卷附件标题',
  `questionnaire_att_format` string COMMENT '问卷附件格式',
  `questionnaire_att_height` string COMMENT '问卷附件高度',
  `questionnaire_att_width` string COMMENT '问卷附件宽度',
  `questionnaire_att_url` string COMMENT '问卷附件url',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '活动问卷附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_questionnaire_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_register` (
  `id` bigint COMMENT '',
  `activity_id` bigint COMMENT '活动id',
  `activity_type` int COMMENT '活动id类型（1、视频，7-病例）',
  `customer_id` bigint COMMENT '会员id',
  `first_name` string COMMENT '名',
  `last_name` string COMMENT '姓',
  `company_id` bigint COMMENT '医院id',
  `company` string COMMENT '工作单位',
  `medical_title` string COMMENT '医师职称',
  `contact_mobile` string COMMENT '联系手机',
  `contact_email` string COMMENT '联系邮箱',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `clinical_year` string COMMENT '临床时间',
  `site_id` int COMMENT '站点'
) COMMENT '活动报名表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_register';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_register_property` (
  `id` bigint COMMENT '',
  `activity_id` bigint COMMENT '活动id',
  `activity_type` int COMMENT '报名类型（5-赛区、6-类别）',
  `customer_id` bigint COMMENT '会员id',
  `property_id_list` string COMMENT '资源属性idList',
  `property_name` string COMMENT '属性名称',
  `property_full_path` string COMMENT '属性路径（拼串形式存放上级propertyId）',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点'
) COMMENT '活动报名属性对应表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_register_property';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_resource_property` (
  `id` bigint COMMENT '',
  `activity_id` bigint COMMENT '活动id',
  `activity_type` int COMMENT '活动id类型（1-视频、2-文库、4-话题、7-病例、8-区域赛、9-半决赛）',
  `property_id` bigint COMMENT '资源属性id',
  `property_name` string COMMENT '属性名称',
  `parent_id` bigint COMMENT '父节点',
  `property_full_path` string COMMENT '上级路径（拼串形式存放上级propertyId）',
  `resource_id` bigint COMMENT '资源id',
  `resource_type` int COMMENT '资源类型',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `assign_exper_num` int COMMENT '分配专家数',
  `finish_state` int COMMENT '评分情况:1-全部完成 0-未全部完成',
  `unfinish_exper_num` int COMMENT '未评分专家数',
  `resource_num` int COMMENT '资源编号'
) COMMENT '活动资源属性对应表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_resource_property';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_score` (
  `id` bigint COMMENT '',
  `score_id` bigint COMMENT '活动评分配置id',
  `activity_id` bigint COMMENT '活动id',
  `score_type` int COMMENT '评分类型(老版：1-视频、2-手术病例、3-非手术病例；新版：1-视频、2-文库、4-话题、7-病例)',
  `score_term_type` int COMMENT '评分项类型(0.打分、1.评论)',
  `score_total` int COMMENT '总分值',
  `config_name` string COMMENT '配置项名称',
  `config_remark` string COMMENT '配置项说明',
  `tree_level` int COMMENT '节点级别',
  `parent_id` bigint COMMENT '父节点',
  `is_leaf` int COMMENT '是否子节点(0-否、1-是)',
  `config_full_path` string COMMENT '上级路径（拼串形式存放上级score_id）',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `record_id` bigint COMMENT '阶段评分记录id',
  `score_remark` string COMMENT '评分说明'
) COMMENT '活动评分配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_score';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_activity_score_record` (
  `id` bigint COMMENT '',
  `record_id` bigint COMMENT '阶段评分记录id',
  `activity_id` bigint COMMENT '活动id',
  `score_count` int COMMENT '评分次数',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '活动阶段评分记录'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_activity_score_record';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_album` (
  `id` bigint COMMENT '',
  `album_id` bigint COMMENT '专辑id',
  `album_name` string COMMENT '专辑名称',
  `album_desc` string COMMENT '专辑描述',
  `album_type` int COMMENT '专辑类型(1-系列，2-)',
  `ref_customer_id` bigint COMMENT '相关会员id',
  `video_num` bigint COMMENT '视频数',
  `topic_num` bigint COMMENT '话题数',
  `doc_num` bigint COMMENT '文库数',
  `case_num` bigint COMMENT '病例数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `share_num` bigint COMMENT '分享数',
  `up_num` bigint COMMENT '被别人赞数',
  `follow_num` bigint COMMENT '关注人数',
  `subscribe_num` bigint COMMENT '订阅数量',
  `create_time` timestamp COMMENT '创建时间',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `is_valid` int COMMENT '',
  `sort_id` int COMMENT '排序',
  `tpl_path` string COMMENT '模版路径or模版id',
  `web_storage_path` string COMMENT '手机版地址',
  `page_storage_path` string COMMENT 'pc版地址'
) COMMENT '专辑'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_album';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_album_resource` (
  `id` bigint COMMENT '',
  `album_id` bigint COMMENT '专辑id',
  `album_name` string COMMENT '专辑名称',
  `album_type` int COMMENT '专辑类型(1-系列，2-)',
  `ref_id` bigint COMMENT '关联资源id',
  `ref_type` int COMMENT '关联类型(1-视频，2-文库，4-话题 ,7-病例)',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '',
  `sort_id` int COMMENT '排序',
  `is_header` int COMMENT '是否置顶'
) COMMENT '专辑'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_album_resource';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_book_catalogue` (
  `id` bigint COMMENT '',
  `book_id` bigint COMMENT '书id-doc_id中doc_type为17',
  `catalogue_id` bigint COMMENT '目录id',
  `catalogue_name` string COMMENT '目录名称',
  `catalogue_type` int COMMENT '目录类型1-书籍与目录对应关系、2-目录与资源对应关系',
  `parent_id` bigint COMMENT '父节点',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否是子节点(0-否,1-是)',
  `parent_full_path` string COMMENT '上级路径',
  `ref_id` bigint COMMENT '资源id',
  `ref_type` bigint COMMENT '资源类型（1-视频，2-文库，4-话题 ,7-病例,18-文章,19-电子书视频）',
  `video_num` bigint COMMENT '视频数',
  `doc_num` bigint COMMENT '文章数',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '电子书目录'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_book_catalogue';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_brochure` (
  `id` bigint COMMENT '',
  `brochure_id` bigint COMMENT '锦囊id',
  `brochure_name` string COMMENT '锦囊名称',
  `brochure_desc` string COMMENT '锦囊描述',
  `customer_id_list` string COMMENT '讲师idList逗号分隔',
  `areas_expertise_id` string COMMENT '所属专业id',
  `question_num` int COMMENT '问题总数',
  `answer_num` int COMMENT '答案总数',
  `suggest_num` int COMMENT '反馈总数',
  `browse_num` int COMMENT '浏览数（学习人数）',
  `is_valid` int COMMENT '是否有效',
  `remark` string COMMENT '备注',
  `sort_id` int COMMENT '顺序号',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '站点id'
) COMMENT '锦囊主表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_brochure';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_brochure_answer` (
  `id` bigint COMMENT '',
  `brochure_id` bigint COMMENT '锦囊id',
  `question_id` bigint COMMENT '问题id',
  `answer_id` bigint COMMENT '答案id',
  `att_type` int COMMENT '附件类型，0-无，1-图片，2-视频',
  `ref_type` int COMMENT '引用资源类型1-视频,2-文库,7-病例',
  `ref_id` bigint COMMENT '引用资源id',
  `answer_content` string COMMENT '回复内容',
  `node_id` bigint COMMENT '资源锚点Id',
  `remark` string COMMENT '备注',
  `is_valid` int COMMENT '是否有效',
  `sort_id` int COMMENT '顺序号',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '站点id'
) COMMENT '锦囊回复表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_brochure_answer';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_brochure_attachment` (
  `id` bigint COMMENT '',
  `brochure_id` bigint COMMENT '锦囊id',
  `question_id` bigint COMMENT '问题id',
  `answer_id` bigint COMMENT '答案id',
  `category_type` int COMMENT '附件类别：1-封面2-分享3-回复',
  `att_type` int COMMENT '附件类型：1-图片，2-视频,',
  `att_size` string COMMENT '附件大小：KB',
  `att_format` string COMMENT '附件格式：jpg、mp4...',
  `att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、8-480*320、9-1280*720、10-900*600、12-300*200、13-450*300、14-750*500)',
  `att_height` string COMMENT '附件高度',
  `att_width` string COMMENT '附件宽度',
  `att_url` string COMMENT '附件url',
  `send_site_id` int COMMENT '站点',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功,3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `play_time` string COMMENT '播放时长',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '锦囊附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_brochure_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_brochure_question` (
  `id` bigint COMMENT '',
  `brochure_id` bigint COMMENT '锦囊id',
  `question_id` bigint COMMENT '问题id',
  `question_name` string COMMENT '问题名称',
  `remark` string COMMENT '备注',
  `browse_num` bigint COMMENT '浏览数',
  `is_valid` int COMMENT '是否有效',
  `sort_id` int COMMENT '顺序号',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '站点id'
) COMMENT '锦囊问题表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_brochure_question';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_catalog_resource` (
  `id` bigint COMMENT '',
  `catalog_id` bigint COMMENT '目录id',
  `resource_type` int COMMENT '资源类型：1-视频，2-文库，7-病例',
  `resource_id` bigint COMMENT '资源id',
  `is_systematics` int COMMENT '是否体系内课程：1-体系内，0-非体系内',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `course_id` bigint COMMENT '课程id'
) COMMENT '体系化课程目录与资源关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_catalog_resource';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_channel` (
  `ID` bigint COMMENT '',
  `channel_name` string COMMENT '',
  `channel_desc` string COMMENT '',
  `channel_url` string COMMENT '',
  `seo_meta_description` string COMMENT '',
  `seo_meta_keyword` string COMMENT '',
  `seo_title` string COMMENT '',
  `sort_order` bigint COMMENT '',
  `is_valid` int COMMENT '',
  `tpl_id` int COMMENT '',
  `page_storage_path` string COMMENT '',
  `site_id` int COMMENT '站点id',
  `share_short_url` string COMMENT '转换的短链接',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_channel';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_column` (
  `ID` bigint COMMENT '',
  `owner_channel_id` bigint COMMENT '',
  `column_name` string COMMENT '',
  `column_desc` string COMMENT '',
  `column_type` int COMMENT '',
  `column_url` string COMMENT '',
  `banner_pic_type` string COMMENT '',
  `sort_order` int COMMENT '',
  `is_valid` int COMMENT '',
  `tpl_path` string COMMENT '模板路径',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_column';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_column_config` (
  `id` bigint COMMENT '',
  `column_id` bigint COMMENT '栏目id',
  `column_name` string COMMENT '栏目名称',
  `column_type` int COMMENT '栏目类型1-课程聚合2-视频聚合3-直播聚合4-活动5-骨科会议',
  `column_desc` string COMMENT '栏目介绍',
  `resource_num` int COMMENT '资源量',
  `study_num` int COMMENT '学习人数',
  `column_url_scheme` string COMMENT 'url_Scheme',
  `show_type` int COMMENT '显示位置0-不显示1-首页',
  `is_header` int COMMENT '是否置顶1-是0-否',
  `is_valid` int COMMENT '是否有效',
  `sort_id` int COMMENT '顺序号',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '站点id'
) COMMENT '栏目主表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_column_config';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_column_config_attachment` (
  `id` bigint COMMENT '',
  `column_id` bigint COMMENT '栏目id',
  `course_id` bigint COMMENT '课程id',
  `ref_id` bigint COMMENT '关联id',
  `column_type` int COMMENT '栏目类型0-栏目1-课程聚合2-视频聚合3-活动',
  `att_type` int COMMENT '附件类型：1-头图，2-分享图片,3-列表页配图',
  `att_size` string COMMENT '附件大小：KB',
  `att_format` string COMMENT '附件格式：jpg、png...',
  `att_spec` string COMMENT '附件规格(1-原图)',
  `att_height` string COMMENT '附件高度',
  `att_width` string COMMENT '附件宽度',
  `att_url` string COMMENT '附件url',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效 1-有效 0-无效',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间'
) COMMENT '栏目附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_column_config_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_column_config_course` (
  `id` bigint COMMENT '',
  `column_id` bigint COMMENT '栏目id',
  `course_id` bigint COMMENT '课程id',
  `course_name` string COMMENT '课程名称',
  `anthology_num` int COMMENT '选集总数',
  `areas_expertise_id` string COMMENT '专业id',
  `suit_crowd` string COMMENT '适合人群',
  `course_desc` string COMMENT '课程介绍',
  `customer_desc` string COMMENT '讲师介绍',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '站点id'
) COMMENT '课程型栏目配置'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_column_config_course';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_column_config_resource` (
  `id` bigint COMMENT '',
  `column_id` bigint COMMENT '栏目id',
  `column_sub_id` bigint COMMENT '栏目二级结构id',
  `column_type` int COMMENT '栏目类型1-课程聚合2-视频聚合3-直播聚合4-活动配置',
  `ref_id` bigint COMMENT '资源id(视频id,关联直播id)',
  `ref_desc` string COMMENT '资源介绍',
  `anthology_name` string COMMENT '选集名称',
  `customer_id_list` string COMMENT '讲师idList逗号分隔',
  `play_back_id` string COMMENT '回播id',
  `ref_live_id` string COMMENT '直播id',
  `activity_mobile_url` string COMMENT '活动H5链接url',
  `user_name` string COMMENT '编辑人',
  `source_type` int COMMENT '来源1-新后台2-老后台',
  `authority` int COMMENT '观看权限(1所有、2登录、3认证)',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '站点id'
) COMMENT '栏目_资源关系'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_column_config_resource';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_course` (
  `id` bigint COMMENT '',
  `course_id` bigint COMMENT '课程id',
  `course_name` string COMMENT '课程名称',
  `course_describe` string COMMENT '课程简介',
  `course_subject_team_id` int COMMENT '专业学组id',
  `course_subject_team_name` string COMMENT '专业学组名称',
  `course_cover_pic_url` string COMMENT '封面图片链接',
  `platform_id` int COMMENT '所属平台id: 1骨科，2手外',
  `update_user` string COMMENT '更新人名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `course_price` double COMMENT '体系化课程价格，默认0.0为限免',
  `catalog_num` bigint COMMENT '体系化课程课时数量',
  `total_learn_num` bigint COMMENT '总浏览数',
  `total_collection_num` bigint COMMENT '总收藏数',
  `update_time` timestamp COMMENT '更新时间',
  `is_prefer` int COMMENT '是否为推荐课程'
) COMMENT '体系化课程'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_course';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_course_catalog` (
  `id` bigint COMMENT '',
  `catalog_id` bigint COMMENT '目录id',
  `catalog_name` string COMMENT '目录名称',
  `course_id` bigint COMMENT '课程id',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '体系化课程目录表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_course_catalog';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_doc` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文库id（生成id规则：毫秒数）',
  `doc_name` string COMMENT '名称',
  `doc_type` int COMMENT '类型（1-教材、2-指南 、3-期刊、4-讲义、17-书籍、18-文章、21-解剖知识,22-诊疗技术,23-经典病例,24-骨科教程,25-产品详解,26-技术操作,27-手术技巧,28-学术进展,29-经验总结,30-产品手册,31-学术会议,32-行业动态）',
  `doc_author` string COMMENT '作者 冗余存储串',
  `doc_translator` string COMMENT '译者 冗余存储串',
  `doc_source` string COMMENT '来源',
  `doc_abstract` string COMMENT '摘要',
  `doc_press` string COMMENT '出版社',
  `doc_publication_code` string COMMENT '出版号',
  `doc_journal_year` string COMMENT '期刊号年份',
  `doc_journal_month` string COMMENT '期刊号月份',
  `doc_journal_code` string COMMENT '期刊号',
  `doc_url` string COMMENT '文库url',
  `page_storage_path` string COMMENT '',
  `doc_logo_url` string COMMENT '缩略图',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `create_time` timestamp COMMENT '创作日期',
  `publish_time` timestamp COMMENT '发布日期',
  `last_note_time` timestamp COMMENT '最新笔记日期 ',
  `last_discuss_time` timestamp COMMENT '最近讨论日期',
  `last_review_time` timestamp COMMENT '最近评论日期',
  `browse_num` bigint COMMENT '浏览数',
  `note_num` bigint COMMENT '笔记数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `share_num` bigint COMMENT '分享数',
  `prefer_up_num` bigint COMMENT '赞数',
  `doc_score` double COMMENT '文库分数',
  `is_customer_essential` int COMMENT '是否精华（会员设置）',
  `is_sys_essential` int COMMENT '是否精华（系统设置）',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效,2-系统删除、3-用户删除)',
  `doc_status` int COMMENT '1-提交审核、2-审核通过、3-审核拒绝、4-该文档附件不合格',
  `reason` string COMMENT '审核拒绝原因',
  `tpl_path` string COMMENT '模版路径or模版id',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `web_storage_path` string COMMENT '手机版存储路径',
  `send_site_id` int COMMENT '',
  `sort_list_authority` bigint COMMENT '列表排序权重',
  `follow_num` bigint COMMENT '关注数',
  `sort_authority_secondary` bigint COMMENT '次要列表排序权重',
  `external_url` string COMMENT '外部url',
  `is_draft` int COMMENT '是否草稿',
  `app_storage_path` string COMMENT 'app存储路径',
  `qiniu_id` string COMMENT '七牛文库唯一id',
  `qiniu_status` int COMMENT '七牛文库处理状态0－未上传，1－上传成功，2－转码成功',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `share_page_short_url` string COMMENT '电脑版存储路径转换的短链接',
  `share_web_short_url` string COMMENT '手机版存储路径转换的短链接',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `score` double COMMENT '评分数',
  `score_num` double COMMENT '评分人数',
  `operation_level` int COMMENT '手术分级：1-一级手术，2-二级手术，3-三级手术，4-四级手术',
  `is_systematics` int COMMENT '是否体系化课程：1-是，0-否',
  `activity_id` bigint COMMENT '活动id',
  `activity_status` int COMMENT '活动状态'
) COMMENT '文库信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_doc';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_doc_20181212` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文库id（生成id规则：毫秒数）',
  `doc_name` string COMMENT '名称',
  `doc_type` int COMMENT '类型（1-教材、2-指南 、3-期刊、4-讲义、17-书籍、18-文章、21-解剖知识,22-诊疗技术,23-经典病例,24-骨科教程,25-产品详解,26-技术操作,27-手术技巧,28-学术进展,29-经验总结,30-产品手册,31-学术会议,32-行业动态）',
  `doc_author` string COMMENT '作者 冗余存储串',
  `doc_translator` string COMMENT '译者 冗余存储串',
  `doc_source` string COMMENT '来源',
  `doc_abstract` string COMMENT '摘要',
  `doc_press` string COMMENT '出版社',
  `doc_publication_code` string COMMENT '出版号',
  `doc_journal_year` string COMMENT '期刊号年份',
  `doc_journal_month` string COMMENT '期刊号月份',
  `doc_journal_code` string COMMENT '期刊号',
  `doc_url` string COMMENT '文库url',
  `page_storage_path` string COMMENT '',
  `doc_logo_url` string COMMENT '缩略图',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `create_time` timestamp COMMENT '创作日期',
  `publish_time` timestamp COMMENT '发布日期',
  `last_note_time` timestamp COMMENT '最新笔记日期 ',
  `last_discuss_time` timestamp COMMENT '最近讨论日期',
  `last_review_time` timestamp COMMENT '最近评论日期',
  `browse_num` bigint COMMENT '浏览数',
  `note_num` bigint COMMENT '笔记数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `share_num` bigint COMMENT '分享数',
  `prefer_up_num` bigint COMMENT '赞数',
  `doc_score` double COMMENT '文库分数',
  `is_customer_essential` int COMMENT '是否精华（会员设置）',
  `is_sys_essential` int COMMENT '是否精华（系统设置）',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效,2-系统删除、3-用户删除)',
  `doc_status` int COMMENT '1-提交审核、2-审核通过、3-审核拒绝、4-该文档附件不合格',
  `reason` string COMMENT '审核拒绝原因',
  `tpl_path` string COMMENT '模版路径or模版id',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `web_storage_path` string COMMENT '手机版存储路径',
  `send_site_id` int COMMENT '',
  `sort_list_authority` bigint COMMENT '列表排序权重',
  `follow_num` bigint COMMENT '关注数',
  `sort_authority_secondary` bigint COMMENT '次要列表排序权重',
  `external_url` string COMMENT '外部url',
  `is_draft` int COMMENT '是否草稿',
  `app_storage_path` string COMMENT 'app存储路径',
  `qiniu_id` string COMMENT '七牛文库唯一id',
  `qiniu_status` int COMMENT '七牛文库处理状态0－未上传，1－上传成功，2－转码成功',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `share_page_short_url` string COMMENT '电脑版存储路径转换的短链接',
  `share_web_short_url` string COMMENT '手机版存储路径转换的短链接',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `score` double COMMENT '评分数',
  `score_num` double COMMENT '评分人数',
  `operation_level` int COMMENT '手术分级：1-一级手术，2-二级手术，3-三级手术，4-四级手术',
  `is_systematics` int COMMENT '是否体系化课程：1-是，0-否',
  `activity_id` bigint COMMENT '活动id',
  `activity_status` int COMMENT '活动状态'
) COMMENT '文库信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_doc_20181212';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_doc_attachment` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文库id',
  `doc_att_type` int COMMENT '文库资源类型：1-图片，2-视频,3-文档, 4-电子书文件',
  `doc_att_size` string COMMENT '文库资源大小：KB',
  `doc_att_format` string COMMENT '文库资源格式：jpg、mp4...',
  `doc_att_spec` string COMMENT '文库附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、19-650*230、20-300*300、21-122*166)',
  `doc_att_height` string COMMENT '文库资源高度',
  `doc_att_width` string COMMENT '文库资源宽度',
  `doc_att_url` string COMMENT '文库资源url',
  `upload_time` timestamp COMMENT '文库资源上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `is_download` int COMMENT '默认值0未下载,1已从七牛下载',
  `ref_id` bigint COMMENT '关联资源id、电子书文章存放视频id',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT ''
) COMMENT '文库附件详细信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_doc_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_doc_attachment_20181212` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文库id',
  `doc_att_type` int COMMENT '文库资源类型：1-图片，2-视频,3-文档, 4-电子书文件',
  `doc_att_size` string COMMENT '文库资源大小：KB',
  `doc_att_format` string COMMENT '文库资源格式：jpg、mp4...',
  `doc_att_spec` string COMMENT '文库附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、19-650*230、20-300*300、21-122*166)',
  `doc_att_height` string COMMENT '文库资源高度',
  `doc_att_width` string COMMENT '文库资源宽度',
  `doc_att_url` string COMMENT '文库资源url',
  `upload_time` timestamp COMMENT '文库资源上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `is_download` int COMMENT '默认值0未下载,1已从七牛下载',
  `ref_id` bigint COMMENT '关联资源id、电子书文章存放视频id',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT ''
) COMMENT '文库附件详细信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_doc_attachment_20181212';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_doc_author` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文库编号',
  `doc_name` string COMMENT '文库名称',
  `author_type` int COMMENT '类型（1-第一作者，2-第一译者，3-联名作者，4-联名译者，5-转载，6-副主译，7-参与人员）',
  `author_id` bigint COMMENT '作者、译者编号',
  `author_name` string COMMENT '作者、译者名称',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创作日期'
) COMMENT '文库作者译者对应关系'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_doc_author';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_doc_content` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文库id（生成id规则：毫秒数）',
  `language_flag` int COMMENT '0-中文、1-英文',
  `doc_content` string COMMENT '评论内容',
  `create_time` timestamp COMMENT '创作日期',
  `tpl_path` string COMMENT '模板路径',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效,2-用户删除)',
  `send_site_id` int COMMENT '站点'
) COMMENT '文库图文结合信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_doc_content';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_doc_content_20181212` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文库id（生成id规则：毫秒数）',
  `language_flag` int COMMENT '0-中文、1-英文',
  `doc_content` string COMMENT '评论内容',
  `create_time` timestamp COMMENT '创作日期',
  `tpl_path` string COMMENT '模板路径',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效,2-用户删除)',
  `send_site_id` int COMMENT '站点'
) COMMENT '文库图文结合信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_doc_content_20181212';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_doc_en` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文库id',
  `doc_name_en` string COMMENT '文库英文名字',
  `doc_abstract_en` string COMMENT '文库英文摘要',
  `create_time` timestamp COMMENT '创作日期',
  `last_update_time` timestamp COMMENT '最后修改时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '文库英文信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_doc_en';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_doc_tag` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文库id',
  `doc_name` string COMMENT '文库标题',
  `tag_id` bigint COMMENT 'tag_id',
  `tag_name` string COMMENT 'tag名称',
  `tag_parent_id` bigint COMMENT 'tag父节点',
  `tag_full_path` string COMMENT 'tag完全路径',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建日期',
  `send_site_id` int COMMENT '站点'
) COMMENT '文库-tag-mapping'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_doc_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_doc_tag_20181103` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文库id',
  `doc_name` string COMMENT '文库标题',
  `tag_id` bigint COMMENT 'tag_id',
  `tag_name` string COMMENT 'tag名称',
  `tag_parent_id` bigint COMMENT 'tag父节点',
  `tag_full_path` string COMMENT 'tag完全路径',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建日期',
  `send_site_id` int COMMENT '站点'
) COMMENT '文库-tag-mapping'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_doc_tag_20181103';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_hot_property` (
  `id` bigint COMMENT '',
  `parent_property_name` string COMMENT '所属专业名称',
  `property_id` bigint COMMENT '属性id',
  `property_name` string COMMENT '属性名称',
  `resource_num` bigint COMMENT '资源数',
  `hot_type` int COMMENT '0-冷启动，1-非冷启动',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建日期',
  `update_time` timestamp COMMENT '创建日期',
  `platform_id` int COMMENT '所属平台(1-骨科、2-手外科)'
) COMMENT '热门属性表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_hot_property';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_joa` (
  `ID` bigint COMMENT '',
  `joa_title` string COMMENT '题标',
  `joa_title_english` string COMMENT '文英标题',
  `joa_author` string COMMENT '作者',
  `joa_summary` string COMMENT '摘要',
  `joa_url` string COMMENT '',
  `joa_column` string COMMENT '类别',
  `joa_status` string COMMENT '',
  `joa_issue_year` string COMMENT '期刊号',
  `joa_issue_month` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_joa';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_link` (
  `id` bigint COMMENT '',
  `owner_channel_id` bigint COMMENT '',
  `owner_column_id` bigint COMMENT '',
  `link_title` string COMMENT '链接标题',
  `link_url` string COMMENT '链接url',
  `sort_order` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_link';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_message` (
  `id` bigint COMMENT '',
  `message_id` bigint COMMENT '消息id',
  `scene_id` bigint COMMENT '场景id',
  `is_send_push` int COMMENT '是否发送手机推送消息：0-否，1-是',
  `is_send_email` int COMMENT '是否发送邮件：0-否，1-是',
  `is_send_sms` int COMMENT '是否发送短信：0-否，1-是',
  `is_enter_message` int COMMENT '是否进入用户消息（0-不进入1-进入）',
  `template_email_id` bigint COMMENT '邮件模板id',
  `template_sms_id` bigint COMMENT '短信模板id',
  `template_push_id` bigint COMMENT '推送消息模板id',
  `message_name` string COMMENT '消息名称',
  `message_first_result` int COMMENT '1，2，3，4，跳转相关消息列表; 5-消息推送; >5跳转消息列表主页',
  `message_execution_path` string COMMENT '消息执行路径',
  `message_execution_time` timestamp COMMENT '消息执行时间',
  `create_time` timestamp COMMENT '创作日期',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `site_id` int COMMENT '站点id',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `message_execution_param` string COMMENT '消息执行附带参数'
) COMMENT '消息信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_message';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_message_scene` (
  `id` bigint COMMENT '',
  `scene_id` bigint COMMENT '场景id',
  `scene_name` string COMMENT '场景名称',
  `link_url` string COMMENT '',
  `create_time` timestamp COMMENT '创作日期',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `site_id` int COMMENT '站点id',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
) COMMENT '消息场景信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_message_scene';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_message_scene_20180717` (
  `id` bigint COMMENT '',
  `scene_id` bigint COMMENT '场景id',
  `scene_name` string COMMENT '场景名称',
  `link_url` string COMMENT '',
  `create_time` timestamp COMMENT '创作日期',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `site_id` int COMMENT '站点id',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
) COMMENT '消息场景信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_message_scene_20180717';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_message_template` (
  `id` bigint COMMENT '',
  `template_id` bigint COMMENT '模板id',
  `template_title` string COMMENT '模板title',
  `template_content` string COMMENT '模板内容',
  `create_time` timestamp COMMENT '创作日期',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `site_id` int COMMENT '站点id',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
) COMMENT '消息模板信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_message_template';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_news` (
  `id` bigint COMMENT '',
  `news_id` bigint COMMENT '新闻id',
  `owner_channel_id` bigint COMMENT '所属频道id',
  `owner_column_id` bigint COMMENT '',
  `news_type` int COMMENT '新闻类型',
  `news_name` string COMMENT '新闻标题',
  `news_author` string COMMENT '新闻作者',
  `news_translator` string COMMENT '译者',
  `news_source` string COMMENT '来源',
  `news_abstract` string COMMENT '新闻摘要',
  `news_body` string COMMENT '新闻内容',
  `news_status` int COMMENT '新闻状态',
  `news_url` string COMMENT '新闻url',
  `page_storage_path` string COMMENT '',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `create_time` timestamp COMMENT '创建日期',
  `publish_time` timestamp COMMENT '发布日期',
  `browse_num` bigint COMMENT '浏览数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `share_num` bigint COMMENT '分享数',
  `prefer_up_num` bigint COMMENT '赞数',
  `news_score` double COMMENT '新闻分数',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `wap_storage_path` string COMMENT '手机版存储路径',
  `caos_storage_path` string COMMENT 'CAOS存储路径',
  `caos_en_storage_path` string COMMENT 'CAOS-EN存储路径',
  `tpl_path` string COMMENT '模版路径or模版id'
) COMMENT '新闻表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_news';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_news_attachment` (
  `id` bigint COMMENT '',
  `news_id` bigint COMMENT '新闻id',
  `news_att_type` int COMMENT '新闻附件类型：1-图片，2-视频......',
  `news_att_size` string COMMENT '新闻附件大小：KB',
  `news_att_format` string COMMENT '新闻附件格式：jpg、mp4...',
  `news_att_spec` string COMMENT '新闻附件规格：高清、标清',
  `news_att_height` string COMMENT '新闻附件高度',
  `news_att_width` string COMMENT '新闻附件宽度',
  `news_att_url` string COMMENT '新闻附件url',
  `upload_time` timestamp COMMENT '新闻附件上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '新闻附件详细信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_news_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_news_tag` (
  `id` bigint COMMENT '',
  `news_id` bigint COMMENT '新闻id',
  `news_name` string COMMENT '新闻标题',
  `tag_id` bigint COMMENT 'tag_id',
  `tag_name` string COMMENT 'tag名称',
  `tag_parent_id` bigint COMMENT 'tag父节点',
  `tag_full_path` string COMMENT 'tag完全路径',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '新闻-tag-mapping'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_news_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_organization` (
  `id` int COMMENT 'id',
  `name` string COMMENT '组织名称',
  `introduction` string COMMENT '组织简介',
  `signature` string COMMENT '个性签名',
  `org_url` string COMMENT '组织官网url',
  `head_img_url` string COMMENT '头图url',
  `logo_url` string COMMENT 'logo地址url',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `update_person` string COMMENT '更新人',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效 0-无效，1-有效'
) COMMENT '组织表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_organization';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_organization_introduction` (
  `id` int COMMENT 'id',
  `img_url` string COMMENT '图片url',
  `img_description` string COMMENT '图片描述',
  `organization_id` int COMMENT '组织id',
  `width` string COMMENT '图片宽度',
  `height` string COMMENT '图片高度',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `is_valid` int COMMENT '是否有效 0-无效，1-有效'
) COMMENT '组织-简介和图片表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_organization_introduction';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_organization_member` (
  `id` int COMMENT '组织成员id',
  `organization_id` int COMMENT '组织id',
  `organization_title_id` int COMMENT '职位id',
  `organization_title_name` string COMMENT '组织职位名称',
  `organization_member_name` string COMMENT '组织成员名称',
  `organization_member_company_id` bigint COMMENT '组织成员医院id',
  `organization_member_company` string COMMENT '组织成员所在医院',
  `organization_member_medical_title_id` bigint COMMENT '组织成员职称id',
  `organization_member_medical_title` string COMMENT '组织成员职称',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '是否有效 0-无效 1-有效',
  `create_time` timestamp COMMENT '',
  `ref_customer_id` bigint COMMENT '关联唯医用户id',
  `author_id` bigint COMMENT '作者ID'
) COMMENT '组织成员'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_organization_member';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_organization_news` (
  `id` int COMMENT 'id',
  `news_body` string COMMENT '新闻内容',
  `organization_id` int COMMENT '组织id',
  `app_url` string COMMENT 'app端链接',
  `h5_url` string COMMENT 'H5端链接',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `update_person` string COMMENT '更新人',
  `is_valid` int COMMENT '是否有效 0-无效，1-有效'
) COMMENT '组织新闻表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_organization_news';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_organization_resource_property` (
  `id` int COMMENT '',
  `organization_id` int COMMENT '组织id',
  `organization_name` string COMMENT '组织名称',
  `resource_id` bigint COMMENT '关联资源id',
  `resource_type` int COMMENT '资源类型（1-视频，2-文库,3-图片）',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '是否有效 0-无效，1-有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '组织-资源关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_organization_resource_property';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_organization_title` (
  `id` int COMMENT 'id',
  `name` string COMMENT '职位名称',
  `organization_id` int COMMENT '组织id',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `sort_id` int COMMENT '排序号',
  `sort_type` int COMMENT '排序类型（1-顺序号排序，2-姓氏拼音首字母排序）',
  `is_valid` int COMMENT '是否有效 0-无效，1-有效'
) COMMENT '组织成员职位表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_organization_title';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_pdf_pic` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '涉及资源id',
  `resource_type` int COMMENT '资源类型1-视频、2-文库、4-话题、7-病例 、8-回应',
  `att_id` bigint COMMENT '对应附件id',
  `att_size` string COMMENT '资源大小：KB',
  `att_format` string COMMENT '资源格式：jpg、mp4...',
  `att_spec` string COMMENT '附件规格(1-原始文件、2-压缩文件)',
  `att_height` string COMMENT '资源高度',
  `att_width` string COMMENT '资源宽度',
  `att_url` string COMMENT '资源url',
  `upload_time` timestamp COMMENT '资源上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点'
) COMMENT 'pdf对应图片信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_pdf_pic';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_pdf_pic_20181212` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '涉及资源id',
  `resource_type` int COMMENT '资源类型1-视频、2-文库、4-话题、7-病例 、8-回应',
  `att_id` bigint COMMENT '对应附件id',
  `att_size` string COMMENT '资源大小：KB',
  `att_format` string COMMENT '资源格式：jpg、mp4...',
  `att_spec` string COMMENT '附件规格(1-原始文件、2-压缩文件)',
  `att_height` string COMMENT '资源高度',
  `att_width` string COMMENT '资源宽度',
  `att_url` string COMMENT '资源url',
  `upload_time` timestamp COMMENT '资源上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点'
) COMMENT 'pdf对应图片信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_pdf_pic_20181212';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_rank` (
  `id` bigint COMMENT '',
  `rank_id` bigint COMMENT '榜单id',
  `rank_name` string COMMENT '榜单名称',
  `create_time` timestamp COMMENT '创建时间',
  `user_id` bigint COMMENT '操作用户id',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '操作来源 1-唯医官网pc、2-唯医手机H5、3-CAOS、4-CAOS手机、5-ios、6-android、7-CAOS-EN、8-MED-IOS、9-MED-Android、10-后台、11-MED-H5'
) COMMENT '榜单信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_rank';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_rank_sub` (
  `id` bigint COMMENT '',
  `rank_id` bigint COMMENT '榜单id',
  `resource_id` bigint COMMENT '资源id',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，4-话题,7-病例,9-人)',
  `create_time` timestamp COMMENT '创建时间',
  `user_id` bigint COMMENT '操作用户id',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '操作来源 1-唯医官网pc、2-唯医手机H5、3-CAOS、4-CAOS手机、5-ios、6-android、7-CAOS-EN、8-MED-IOS、9-MED-Android、10-后台、11-MED-H5',
  `sort_id` int COMMENT '顺序号',
  `is_header` int COMMENT '是否置顶'
) COMMENT '榜单资源表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_rank_sub';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_recommend` (
  `ID` bigint COMMENT '',
  `owner_channel_id` bigint COMMENT '所属频道ID',
  `owner_column_id` bigint COMMENT '所属栏目ID',
  `recommend_type` int COMMENT '推荐类型 1-推荐会员 2-推荐视频 3-推荐新闻 4-推荐链接 5-推荐文库',
  `ref_id` bigint COMMENT '关联ID',
  `ref_name` string COMMENT '',
  `recommend_url` string COMMENT '链接url',
  `sort_order` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效 1-有效 0-无效',
  `remark` string COMMENT '备注',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_recommend';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_recommend_column` (
  `ID` bigint COMMENT '',
  `owner_channel_id` bigint COMMENT '',
  `column_name` string COMMENT '',
  `column_desc` string COMMENT '',
  `column_type` int COMMENT '',
  `column_url` string COMMENT '',
  `banner_pic_type` string COMMENT '',
  `sort_order` int COMMENT '',
  `is_valid` int COMMENT '',
  `tpl_path` string COMMENT '模板路径'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_recommend_column';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_resource` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '物料id',
  `resource_name` string COMMENT '物料名称',
  `owner_channel_id` bigint COMMENT '所属频道id',
  `page_size` int COMMENT '每页的条目数',
  `user_id` string COMMENT '操作人',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)'
) COMMENT '物料信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_resource';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_resource_category` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '资源id',
  `resource_type` int COMMENT '资源类型(1-视频,2-文库，3-会议，4-话题，7-病例)',
  `category_id` bigint COMMENT '外部资源id',
  `category_type` int COMMENT '外部资源类型(4-产品，5-品牌)',
  `category_name` string COMMENT '外部资源名称',
  `create_time` timestamp COMMENT '创建日期',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '资源-外部资源-对照表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_resource_category';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_resource_other_relation` (
  `id` bigint COMMENT '',
  `resource_type` int COMMENT '1-文库2-视频',
  `allin_resource_id` bigint COMMENT '唯医资源id',
  `med_resource_id` bigint COMMENT '医栈资源id',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '唯医资源与医栈资源重复数据关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_resource_other_relation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_resource_portrait` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '资源id',
  `resource_type` int COMMENT '资源类别 1-视频 2-文库 7-病例',
  `portrait_type` int COMMENT '画像类别：1-敏感资源',
  `portrait_content` string COMMENT '描述',
  `is_valid` int COMMENT '是否有效 0-无效 1-有效',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '每次更新时间'
) COMMENT '资源画像'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_resource_portrait';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_resource_property` (
  `id` bigint COMMENT '',
  `resource_type` int COMMENT '资源类型(1-视频,2-文库,4-话题,7-病例)',
  `resource_id` bigint COMMENT '资源id',
  `resource_name` string COMMENT '资源标题',
  `property_id` bigint COMMENT '属性id',
  `property_name` string COMMENT '属性名称',
  `tree_level` int COMMENT '节点级别',
  `property_parent_id` bigint COMMENT 'tag父节点',
  `property_full_path` string COMMENT 'tag完全路径',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建日期',
  `property_path_name` string COMMENT 'tag完全路径名称',
  `property_type_id` int COMMENT '资源属性类型id(1-解剖学、2-骨科学、3-手术学)',
  `update_time` timestamp COMMENT ''
) COMMENT '资源-属性-对照表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_resource_property';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_resource_property_20180706` (
  `id` bigint COMMENT '',
  `resource_type` int COMMENT '资源类型(1-视频,2-文库,4-话题,7-病例)',
  `resource_id` bigint COMMENT '资源id',
  `resource_name` string COMMENT '资源标题',
  `property_id` bigint COMMENT '属性id',
  `property_name` string COMMENT '属性名称',
  `tree_level` int COMMENT '节点级别',
  `property_parent_id` bigint COMMENT 'tag父节点',
  `property_full_path` string COMMENT 'tag完全路径',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建日期',
  `property_path_name` string COMMENT 'tag完全路径名称',
  `property_type_id` int COMMENT '资源属性类型id(1-解剖学、2-骨科学、3-手术学)'
) COMMENT '资源-属性-对照表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_resource_property_20180706';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_resource_property_20181101` (
  `id` bigint COMMENT '',
  `resource_type` int COMMENT '资源类型(1-视频,2-文库,4-话题,7-病例)',
  `resource_id` bigint COMMENT '资源id',
  `resource_name` string COMMENT '资源标题',
  `property_id` bigint COMMENT '属性id',
  `property_name` string COMMENT '属性名称',
  `tree_level` int COMMENT '节点级别',
  `property_parent_id` bigint COMMENT 'tag父节点',
  `property_full_path` string COMMENT 'tag完全路径',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建日期',
  `property_path_name` string COMMENT 'tag完全路径名称',
  `property_type_id` int COMMENT '资源属性类型id(1-解剖学、2-骨科学、3-手术学)'
) COMMENT '资源-属性-对照表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_resource_property_20181101';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_resource_property_20181103` (
  `id` bigint COMMENT '',
  `resource_type` int COMMENT '资源类型(1-视频,2-文库,4-话题,7-病例)',
  `resource_id` bigint COMMENT '资源id',
  `resource_name` string COMMENT '资源标题',
  `property_id` bigint COMMENT '属性id',
  `property_name` string COMMENT '属性名称',
  `tree_level` int COMMENT '节点级别',
  `property_parent_id` bigint COMMENT 'tag父节点',
  `property_full_path` string COMMENT 'tag完全路径',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建日期',
  `property_path_name` string COMMENT 'tag完全路径名称',
  `property_type_id` int COMMENT '资源属性类型id(1-解剖学、2-骨科学、3-手术学)'
) COMMENT '资源-属性-对照表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_resource_property_20181103';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_resource_property_videolist` (
  `id` bigint COMMENT '',
  `property_id` bigint COMMENT '属性id',
  `tree_level` int COMMENT '节点级别',
  `video_id_list` string COMMENT '资源标题'
) COMMENT '资源-属性-对照表-videolist'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_resource_property_videolist';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_resource_sign` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '资源id',
  `resource_name` string COMMENT '资源名称',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，4-话题, 7-病例, 9-人)',
  `resource_sign` int COMMENT '资源标签(1-最新、2-最热、3-参赛、4-获奖)',
  `create_time` timestamp COMMENT '创建时间',
  `user_id` bigint COMMENT '操作用户id',
  `is_valid` int COMMENT '是否有效'
) COMMENT '资源标签表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_resource_sign';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_resource_sub` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '物料id',
  `ref_id` string COMMENT '内容id',
  `ref_type` int COMMENT '内容类型(1-视频，2-文库，3-会议,4-话题，7-病例，12-活动,13-专辑,14-广告，15-榜单，16-专题)',
  `ref_location` int COMMENT '列表中位置',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `user_id` string COMMENT '操作人',
  `is_valid` int COMMENT '是否有效',
  `ref_name` string COMMENT '内容'
) COMMENT '物料资源表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_resource_sub';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_resource_supplement` (
  `id` bigint COMMENT '',
  `resource_type` int COMMENT '资源类型(1-视频,2-文库,4-话题,7-病例)',
  `resource_id` bigint COMMENT '资源id',
  `remarks` string COMMENT '备注信息',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建日期'
) COMMENT '资源补充信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_resource_supplement';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_search_hotkey` (
  `id` bigint COMMENT 'id',
  `search_key` string COMMENT '搜索热词',
  `recommend_type` int COMMENT '推荐类型（0-不推荐，1-推荐，2-预填充词）',
  `source_type` int COMMENT '来源（0-系统，1-运营添加）',
  `heat_id` int COMMENT '实际热度',
  `remarks` string COMMENT '运营词备注',
  `sort_id` int COMMENT '线上排序号',
  `is_valid` int COMMENT '是否有效（0-无效，1-有效）',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间',
  `redirect_url` string COMMENT '跳转URL'
) COMMENT '搜索热词表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_search_hotkey';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_search_keyword` (
  `id` bigint COMMENT '',
  `key_word` string COMMENT 'keyword',
  `search_num` int COMMENT '搜索次数',
  `is_valid` int COMMENT '状态',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间'
) COMMENT '搜索建议词'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_search_keyword';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_special` (
  `id` bigint COMMENT '',
  `special_id` bigint COMMENT '业务id',
  `special_title` string COMMENT '栏目标题',
  `special_sub_title` string COMMENT '栏目副标题',
  `special_type` int COMMENT '栏目类型(1-特色栏目)',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效 1-有效 0-无效',
  `modify_time` timestamp COMMENT '更新时间',
  `create_time` timestamp COMMENT '创建时间',
  `seo_name` string COMMENT 'seo名称',
  `seo_describe` string COMMENT 'seo描述',
  `seo_keyword` string COMMENT 'seo关键字',
  `share_title` string COMMENT '分享标题',
  `share_desc` string COMMENT '分享简介'
) COMMENT '特色栏目管理'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_special';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_special_attachment` (
  `id` bigint COMMENT '',
  `special_id` bigint COMMENT '栏目id',
  `att_type` int COMMENT '附件类型：1-栏目封面图，2-pc端Banner图片,3-pc端Banner底图,4-H5端Banner图片',
  `att_size` string COMMENT '附件大小：KB',
  `att_format` string COMMENT '附件格式：jpg、png...',
  `att_spec` string COMMENT '附件规格(1-原图)',
  `att_height` string COMMENT '附件高度',
  `att_width` string COMMENT '附件宽度',
  `att_url` string COMMENT '附件url',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效 1-有效 0-无效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '特色栏目附件'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_special_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_special_category` (
  `id` bigint COMMENT '',
  `category_id` bigint COMMENT '分类id',
  `special_id` bigint COMMENT '栏目id',
  `category_name` string COMMENT '名称',
  `category_full_path` string COMMENT '上级路径（拼串形式存放上级tagId）',
  `parent_id` bigint COMMENT '父节点',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效 1-有效 0-无效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '特色栏目分类目录'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_special_category';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_special_category_resource` (
  `id` bigint COMMENT '',
  `category_id` bigint COMMENT '分类id',
  `ref_type` int COMMENT '资源类型(1-视频,2-文库,4-话题,7-病例)',
  `ref_id` bigint COMMENT '资源id',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效 1-有效 0-无效',
  `binding_time` timestamp COMMENT '绑定时间',
  `create_time` timestamp COMMENT '创建日期'
) COMMENT '特色分类目录与资源关联表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_special_category_resource';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_special_content` (
  `id` bigint COMMENT '',
  `special_id` bigint COMMENT '栏目id',
  `content_type` int COMMENT '内容类型(1-文本)',
  `content` string COMMENT '内容',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效 1-有效 0-无效',
  `modify_time` timestamp COMMENT '修改时间',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '特色栏目公告'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_special_content';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_special_recommend` (
  `id` bigint COMMENT '',
  `special_id` bigint COMMENT '栏目id',
  `recommend_type` int COMMENT '推荐类型(1-推荐讲师)',
  `ref_id` bigint COMMENT '关联ID',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效 1-有效 0-无效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '特色栏目推荐'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_special_recommend';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_theme` (
  `id` bigint COMMENT '',
  `theme_id` bigint COMMENT '业务id',
  `theme_name` string COMMENT '专题名称',
  `theme_intro` string COMMENT '专题简介',
  `theme_type` int COMMENT '专题类型(0-专题、1-专题汇总)',
  `theme_ref_style` int COMMENT '资源展示风格(0-左图片右文字、1-左文字右图片、2-上图片下文字、3-上文字下图片)',
  `web_menu_style` int COMMENT '手机菜单风格(0-切换、1-定位)',
  `page_menu_style` int COMMENT 'pc菜单风格(0-横向、1-纵向)',
  `share_title` string COMMENT '分享标题',
  `share_content` string COMMENT '分享话术',
  `seo_name` string COMMENT 'seo名称',
  `seo_desc` string COMMENT 'seo描述',
  `seo_key_word` string COMMENT 'seo关键词',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `is_header` int COMMENT '是否置顶',
  `theme_group` int COMMENT '专题分组（0-待分组、1-基础骨病、2-骨科技术、3-精品栏目、4-特色专题）',
  `theme_keyword` string COMMENT '关键词'
) COMMENT '专题配置'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_theme';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_theme_ad` (
  `id` bigint COMMENT '',
  `theme_id` bigint COMMENT '专题id',
  `ad_name` string COMMENT '广告名称',
  `ad_type` int COMMENT '广告类型(0-标题(图片形式存储)、1-广告)',
  `ad_height` int COMMENT '广告高',
  `ad_width` int COMMENT '广告宽',
  `ad_pic_url` string COMMENT '广告图片地址',
  `web_link_url` string COMMENT '手机跳转路径',
  `page_link_url` string COMMENT 'PC跳转路径',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '专题广告配置'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_theme_ad';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_theme_attachment` (
  `id` bigint COMMENT '',
  `ref_id` bigint COMMENT '主表id',
  `ref_type` int COMMENT '主表类型(0-专题、1-菜单)',
  `bg_color_style` string COMMENT '背景色#2b29...',
  `att_scene` int COMMENT '场景(专题:0-区域一、1-区域二、2-区域三;菜单:0-标题(图片形式存储)、1-选中、2-未选中)',
  `att_height` int COMMENT '附件高',
  `att_width` int COMMENT '附件宽',
  `att_link_url` string COMMENT '附件链接路径',
  `att_pic_url` string COMMENT '附件图片地址',
  `site_id` int COMMENT '站点配置(1-唯医PC、2-唯医H5...)',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '专题附件信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_theme_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_theme_menu` (
  `id` bigint COMMENT '',
  `menu_id` bigint COMMENT '业务id',
  `theme_id` bigint COMMENT '专题id',
  `menu_name` string COMMENT '菜单名称',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '专题菜单配置'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_theme_menu';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_theme_resource` (
  `id` bigint COMMENT '',
  `theme_resource_id` bigint COMMENT '业务id',
  `theme_id` bigint COMMENT '专题id(冗余存储)',
  `menu_id` bigint COMMENT '菜单id',
  `ref_id` bigint COMMENT '推荐资源id',
  `ref_type` int COMMENT '资源类型(1-视频，2-文库，4-话题，7-病例，99-专题)',
  `ref_exclusive_type` int COMMENT '资源专属类型(2-文库(教材、指南、期刊、讲义、病例........))',
  `ref_name` string COMMENT '资源名称',
  `ref_name_prefix` string COMMENT '资源前缀',
  `ref_name_suffix` string COMMENT '资源后缀',
  `ref_customer_id` bigint COMMENT '资源关联会员id',
  `ref_introduce` string COMMENT '文字介绍',
  `ref_author` string COMMENT '资源作者(冗余存储)',
  `ref_company` string COMMENT '工作单位(冗余存储)',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '专题关联资源'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_theme_resource';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_theme_resource_attachment` (
  `id` bigint COMMENT '',
  `theme_resource_id` bigint COMMENT '关联专题资源id',
  `menu_id` bigint COMMENT '菜单id(冗余存储)',
  `theme_id` bigint COMMENT '专题id(冗余存储)',
  `ref_id` bigint COMMENT '推荐资源id',
  `cover_pic_url` string COMMENT '封面',
  `logo_pic_url` string COMMENT '徽标',
  `web_link_url` string COMMENT '手机跳转路径',
  `page_link_url` string COMMENT 'PC跳转路径',
  `logo_pic_width` int COMMENT '徽标宽',
  `logo_pic_height` int COMMENT '徽标高',
  `cover_pic_width` int COMMENT '封面宽',
  `cover_pic_height` int COMMENT '封面高',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '专题关联资源附件'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_theme_resource_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_theme_tpl` (
  `id` bigint COMMENT '',
  `theme_id` bigint COMMENT '专题id',
  `theme_storage_path` string COMMENT '专题访问路径',
  `site_id` int COMMENT '站点配置(1-唯医PC、2-唯医H5...)',
  `tpl_path` string COMMENT '模版路径or模版id',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '专题tpl配置'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_theme_tpl';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_topic` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `topic_id` bigint COMMENT '话题id',
  `topic_name` string COMMENT '话题title',
  `topic_type` int COMMENT '话题类型 1.随便聊聊 2.专业 3.进修感想',
  `topic_discuss` string COMMENT '',
  `topic_url` string COMMENT '话题页url',
  `tpl_path` string COMMENT '模版路径or模版id',
  `page_storage_path` string COMMENT 'pc版地址',
  `web_storage_path` string COMMENT '手机版地址',
  `create_time` timestamp COMMENT '创作日期',
  `publish_time` timestamp COMMENT '发布日期',
  `last_reply_time` timestamp COMMENT '最后回复时间',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `share_num` bigint COMMENT '分享数',
  `prefer_up_num` bigint COMMENT '赞数',
  `browse_num` bigint COMMENT '浏览数',
  `follow_fans_num` bigint COMMENT '被关注数',
  `is_customer_essential` int COMMENT '是否精华（会员设置）',
  `is_sys_essential` int COMMENT '是否精华（系统设置）',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `send_site_id` int COMMENT '',
  `sort_list_authority` bigint COMMENT '列表排序权重',
  `sort_authority_secondary` bigint COMMENT '次要列表排序权重',
  `is_draft` int COMMENT '是否草稿',
  `share_page_short_url` string COMMENT 'pc版地址转换的短链接',
  `share_web_short_url` string COMMENT '手机版地址转换的短链接',
  `app_storage_path` string COMMENT 'app存储路径',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `activity_id` bigint COMMENT '活动id',
  `activity_status` int COMMENT '活动状态'
) COMMENT '话题'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_topic';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_topic_attachment` (
  `id` bigint COMMENT '',
  `topic_id` bigint COMMENT '话题id',
  `topic_att_type` int COMMENT '资源类型：1-图片，2-视频,3-文档',
  `topic_att_size` string COMMENT '资源大小：KB',
  `topic_att_format` string COMMENT '资源格式：jpg、mp4...',
  `topic_att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52)',
  `topic_att_height` string COMMENT '资源高度',
  `topic_att_width` string COMMENT '资源宽度',
  `topic_att_url` string COMMENT '资源url',
  `upload_time` timestamp COMMENT '资源上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `send_site_id` int COMMENT '站点',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功,3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `play_time` string COMMENT '播放时长',
  `play_num` bigint COMMENT '播放次数',
  `topic_att_name` string COMMENT '附件说明（图片标题等）',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '话题附件'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_topic_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_topic_content` (
  `id` bigint COMMENT '',
  `topic_id` bigint COMMENT '话题id',
  `content_type` int COMMENT '文本类型 0-文本，1-图片，2-视频',
  `content` string COMMENT '内容',
  `topic_att_name` string COMMENT '附件描述',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `sort_id` int COMMENT '排序',
  `send_site_id` int COMMENT '',
  `topic_att_id` bigint COMMENT '附件表中的id'
) COMMENT '话题内容表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_topic_content';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_topic_tag` (
  `id` bigint COMMENT '',
  `topic_id` bigint COMMENT '话题id',
  `topic_name` string COMMENT '话题标题',
  `tag_id` bigint COMMENT 'tag_id',
  `tag_name` string COMMENT 'tag名称',
  `tag_parent_id` bigint COMMENT 'tag父节点',
  `tag_full_path` string COMMENT 'tag完全路径',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建日期',
  `send_site_id` int COMMENT '站点'
) COMMENT '话题tag'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_topic_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_toplist` (
  `id` bigint COMMENT '',
  `toplist_type` int COMMENT '榜单类型(1-贡献榜，2-活跃榜)',
  `start_time` timestamp COMMENT '榜单开始时间',
  `end_time` timestamp COMMENT '榜单结束时间',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `show_num` int COMMENT '前台显示数量',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '发送渠道',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '榜单配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_toplist';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_video` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `video_name` string COMMENT '视频标题',
  `video_type` int COMMENT '视频类型(1-手术视频，2-课程视频，3-会议视频，4-专家访谈视频,19-电子书视频 )20-解剖知识、21-诊疗技术 、22-经典病例、23-骨科教程、24-产品详解、25-技术操作、26-手术技巧、27-学术进展、28-经验总结、29-学术会议、30-行业动态',
  `video_ebook_catagory` int COMMENT '电子书视频分类(1-视诊/触诊 2-活动度 3-肌力检查 4-操作 5-特殊检查)',
  `video_author` string COMMENT '视频作者 冗余存储串',
  `video_translator` string COMMENT '视频译者 冗余存储串',
  `video_source` string COMMENT '视频来源',
  `video_abstract` string COMMENT '视频摘要',
  `video_status` int COMMENT '视频状态',
  `video_url` string COMMENT '视频url',
  `video_logo_url` string COMMENT '缩略图地址',
  `page_storage_path` string COMMENT '播放器存储路径',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `create_time` timestamp COMMENT '创作时间',
  `publish_time` timestamp COMMENT '发布时间',
  `note_num` bigint COMMENT '笔记数',
  `topic_num` bigint COMMENT '话题数',
  `follow_num` bigint COMMENT '关注数',
  `play_num` bigint COMMENT '播放数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `share_num` bigint COMMENT '分享数',
  `prefer_up_num` bigint COMMENT '赞数',
  `video_score` double COMMENT '评分',
  `is_customer_essential` int COMMENT '是否精华（会员设置）',
  `is_sys_essential` int COMMENT '是否精华（系统设置）',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `web_storage_path` string COMMENT '手机版存储路径',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `play_time` string COMMENT '播放时长',
  `tpl_path` string COMMENT '模版路径or模版id',
  `send_site_id` int COMMENT '',
  `sort_list_authority` bigint COMMENT '列表排序权重',
  `sort_authority_secondary` bigint COMMENT '次要列表排序权重',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `activity_id` bigint COMMENT '活动id',
  `activity_status` int COMMENT '活动状态',
  `approval_status` int COMMENT '1-提交审核、2-一级审核通过、3-二级审核通过，4-审核拒绝',
  `approval_reason` string COMMENT '审核说明',
  `share_page_short_url` string COMMENT '电脑版存储路径转换的短链接',
  `share_web_short_url` string COMMENT '手机版存储路径转换的短链接',
  `qrcode_url` string COMMENT '二维码保存地址',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `score` double COMMENT '评分数',
  `score_num` double COMMENT '评分人数',
  `operation_level` int COMMENT '手术分级：1-一级手术，2-二级手术，3-三级手术，4-四级手术',
  `is_systematics` int COMMENT '是否体系化课程：1-是，0-否',
  `belong_course_id_list` string COMMENT '所属课程idList(3.0课程型栏目)',
  `belong_column_id_list` string COMMENT '所属栏目idList(3.0栏目视频聚合)'
) COMMENT '视频'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_video';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_video_20180620` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `video_name` string COMMENT '视频标题',
  `video_type` int COMMENT '视频类型(1-手术视频，2-课程视频，3-会议视频，4-专家访谈视频,19-电子书视频)',
  `video_ebook_catagory` int COMMENT '电子书视频分类(1-视诊/触诊 2-活动度 3-肌力检查 4-操作 5-特殊检查)',
  `video_author` string COMMENT '视频作者 冗余存储串',
  `video_translator` string COMMENT '视频译者 冗余存储串',
  `video_source` string COMMENT '视频来源',
  `video_abstract` string COMMENT '视频摘要',
  `video_status` int COMMENT '视频状态',
  `video_url` string COMMENT '视频url',
  `video_logo_url` string COMMENT '缩略图地址',
  `page_storage_path` string COMMENT '播放器存储路径',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `create_time` timestamp COMMENT '创作时间',
  `publish_time` timestamp COMMENT '发布时间',
  `note_num` bigint COMMENT '笔记数',
  `topic_num` bigint COMMENT '话题数',
  `follow_num` bigint COMMENT '关注数',
  `play_num` bigint COMMENT '播放数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `share_num` bigint COMMENT '分享数',
  `prefer_up_num` bigint COMMENT '赞数',
  `video_score` double COMMENT '评分',
  `is_customer_essential` int COMMENT '是否精华（会员设置）',
  `is_sys_essential` int COMMENT '是否精华（系统设置）',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `web_storage_path` string COMMENT '手机版存储路径',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `play_time` string COMMENT '播放时长',
  `tpl_path` string COMMENT '模版路径or模版id',
  `send_site_id` int COMMENT '',
  `sort_list_authority` bigint COMMENT '列表排序权重',
  `sort_authority_secondary` bigint COMMENT '次要列表排序权重',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `activity_id` bigint COMMENT '活动id',
  `activity_status` int COMMENT '活动状态',
  `approval_status` int COMMENT '1-提交审核、2-一级审核通过、3-二级审核通过，4-审核拒绝',
  `approval_reason` string COMMENT '审核说明',
  `share_page_short_url` string COMMENT '电脑版存储路径转换的短链接',
  `share_web_short_url` string COMMENT '手机版存储路径转换的短链接',
  `qrcode_url` string COMMENT '二维码保存地址',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `score` double COMMENT '评分数',
  `score_num` double COMMENT '评分人数',
  `operation_level` int COMMENT '手术分级：1-一级手术，2-二级手术，3-三级手术，4-四级手术',
  `is_systematics` int COMMENT '是否体系化课程：1-是，0-否'
) COMMENT '视频'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_video_20180620';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_video_20181212` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `video_name` string COMMENT '视频标题',
  `video_type` int COMMENT '视频类型(1-手术视频，2-课程视频，3-会议视频，4-专家访谈视频,19-电子书视频 )20-解剖知识、21-诊疗技术 、22-经典病例、23-骨科教程、24-产品详解、25-技术操作、26-手术技巧、27-学术进展、28-经验总结、29-学术会议、30-行业动态',
  `video_ebook_catagory` int COMMENT '电子书视频分类(1-视诊/触诊 2-活动度 3-肌力检查 4-操作 5-特殊检查)',
  `video_author` string COMMENT '视频作者 冗余存储串',
  `video_translator` string COMMENT '视频译者 冗余存储串',
  `video_source` string COMMENT '视频来源',
  `video_abstract` string COMMENT '视频摘要',
  `video_status` int COMMENT '视频状态',
  `video_url` string COMMENT '视频url',
  `video_logo_url` string COMMENT '缩略图地址',
  `page_storage_path` string COMMENT '播放器存储路径',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `create_time` timestamp COMMENT '创作时间',
  `publish_time` timestamp COMMENT '发布时间',
  `note_num` bigint COMMENT '笔记数',
  `topic_num` bigint COMMENT '话题数',
  `follow_num` bigint COMMENT '关注数',
  `play_num` bigint COMMENT '播放数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `share_num` bigint COMMENT '分享数',
  `prefer_up_num` bigint COMMENT '赞数',
  `video_score` double COMMENT '评分',
  `is_customer_essential` int COMMENT '是否精华（会员设置）',
  `is_sys_essential` int COMMENT '是否精华（系统设置）',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `web_storage_path` string COMMENT '手机版存储路径',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `play_time` string COMMENT '播放时长',
  `tpl_path` string COMMENT '模版路径or模版id',
  `send_site_id` int COMMENT '',
  `sort_list_authority` bigint COMMENT '列表排序权重',
  `sort_authority_secondary` bigint COMMENT '次要列表排序权重',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `activity_id` bigint COMMENT '活动id',
  `activity_status` int COMMENT '活动状态',
  `approval_status` int COMMENT '1-提交审核、2-一级审核通过、3-二级审核通过，4-审核拒绝',
  `approval_reason` string COMMENT '审核说明',
  `share_page_short_url` string COMMENT '电脑版存储路径转换的短链接',
  `share_web_short_url` string COMMENT '手机版存储路径转换的短链接',
  `qrcode_url` string COMMENT '二维码保存地址',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `score` double COMMENT '评分数',
  `score_num` double COMMENT '评分人数',
  `operation_level` int COMMENT '手术分级：1-一级手术，2-二级手术，3-三级手术，4-四级手术',
  `is_systematics` int COMMENT '是否体系化课程：1-是，0-否',
  `belong_course_id_list` string COMMENT '所属课程idList(3.0课程型栏目)',
  `belong_column_id_list` string COMMENT '所属栏目idList(3.0栏目视频聚合)'
) COMMENT '视频'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_video_20181212';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_video_attachment` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `video_att_type` int COMMENT '视频附件类型：1-图片，2-视频......',
  `video_att_size` string COMMENT '视频附件大小：KB',
  `video_att_format` string COMMENT '视频附件格式：jpg、mp4...',
  `video_att_spec` string COMMENT '视频附件规格：(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、 7-75*52、19-230*650、22-75*75 、23-388*690 、24-109*157、25-150*225)',
  `video_att_height` string COMMENT '视频附件高度',
  `video_att_width` string COMMENT '视频附件宽度',
  `video_att_url` string COMMENT '视频附件url',
  `upload_time` timestamp COMMENT '视频附件上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `is_download` int COMMENT '默认值0未下载,1已从七牛下载',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT ''
) COMMENT '视频附件详细信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_video_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_video_attachment_20181212` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `video_att_type` int COMMENT '视频附件类型：1-图片，2-视频......',
  `video_att_size` string COMMENT '视频附件大小：KB',
  `video_att_format` string COMMENT '视频附件格式：jpg、mp4...',
  `video_att_spec` string COMMENT '视频附件规格：(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、 7-75*52、19-230*650、22-75*75 、23-388*690 、24-109*157、25-150*225)',
  `video_att_height` string COMMENT '视频附件高度',
  `video_att_width` string COMMENT '视频附件宽度',
  `video_att_url` string COMMENT '视频附件url',
  `upload_time` timestamp COMMENT '视频附件上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `is_download` int COMMENT '默认值0未下载,1已从七牛下载',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT ''
) COMMENT '视频附件详细信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_video_attachment_20181212';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_video_author` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频编号',
  `video_name` string COMMENT '视频名称',
  `author_type` int COMMENT '类型（1-作者，2-译者，3-来源）',
  `author_id` bigint COMMENT '作者、译者、来源编号',
  `author_name` string COMMENT '作者、译者、来源名称',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创作日期'
) COMMENT '视频作者译者对应关系'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_video_author';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_video_crop` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `video_type` int COMMENT '视频类型',
  `crop_type` int COMMENT '切片类型（0-原始视频、m3u8,1-ts）',
  `crop_status` int COMMENT '切片状态（1-未切片，2-切片成功，3-切片失败）',
  `crop_set_time` bigint COMMENT '切片时长',
  `crop_ts_url` string COMMENT 'ts文件地址',
  `crop_m3u8_url` string COMMENT 'm3u8文件地址',
  `create_time` timestamp COMMENT '',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '',
  `video_att_spec` string COMMENT '视频附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、8-480*320、9-1280*720、10-900*600、12-300*200、13-450*300、14-750*500)',
  `qiniu_id` string COMMENT '七牛id',
  `crop_ts_time` double COMMENT '每片ts播放时长'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_video_crop';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_video_crop_20180703_1` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `video_type` int COMMENT '视频类型',
  `crop_type` int COMMENT '切片类型（0-原始视频、m3u8,1-ts）',
  `crop_status` int COMMENT '切片状态（1-未切片，2-切片成功，3-切片失败）',
  `crop_set_time` bigint COMMENT '切片时长',
  `crop_ts_url` string COMMENT 'ts文件地址',
  `crop_m3u8_url` string COMMENT 'm3u8文件地址',
  `create_time` timestamp COMMENT '',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '',
  `video_att_spec` string COMMENT '视频附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、8-480*320、9-1280*720、10-900*600、12-300*200、13-450*300、14-750*500)',
  `qiniu_id` string COMMENT '七牛id',
  `crop_ts_time` double COMMENT '每片ts播放时长'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_video_crop_20180703_1';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_video_node` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `resource_type` int COMMENT '资源类型',
  `node_time` int COMMENT '节点时间',
  `node_type` int COMMENT '1.简述,3.思考题,4-学习要点',
  `ref_id_list` string COMMENT '引用资源id串',
  `ref_type` int COMMENT '引用资源类型(2-习题 3-思考题)',
  `create_time` timestamp COMMENT '',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `node_name` string COMMENT '节点名称',
  `node_desc` string COMMENT '节点描述',
  `node_id` bigint COMMENT '笔记id',
  `ref_customer_id` bigint COMMENT '发布会员id',
  `node_state` int COMMENT '笔记状态0-未审核，1-已通过，2-已屏蔽',
  `video_name` string COMMENT '视频名称',
  `reason` string COMMENT '拒绝原因',
  `op_user_name` string COMMENT '审核人姓名',
  `source_type` int COMMENT '锚点笔记来源，1-老后台，2-前台用户（3.0视频笔记）',
  `update_time` timestamp COMMENT '更新时间'
) COMMENT '视频节点表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_video_node';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_video_node_20181115` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `resource_type` int COMMENT '资源类型',
  `node_time` int COMMENT '节点时间',
  `node_type` int COMMENT '1.简述,3.思考题,4-学习要点',
  `ref_id_list` string COMMENT '引用资源id串',
  `ref_type` int COMMENT '引用资源类型(2-习题 3-思考题)',
  `create_time` timestamp COMMENT '',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `node_name` string COMMENT '节点名称',
  `node_desc` string COMMENT '节点描述',
  `node_id` bigint COMMENT '笔记id',
  `ref_customer_id` bigint COMMENT '发布会员id',
  `node_state` int COMMENT '笔记状态0-未审核，1-已通过，2-已屏蔽',
  `video_name` string COMMENT '视频名称',
  `reason` string COMMENT '拒绝原因',
  `op_user_name` string COMMENT '审核人姓名',
  `source_type` int COMMENT '锚点笔记来源，1-老后台，2-前台用户（3.0视频笔记）',
  `update_time` timestamp COMMENT '更新时间'
) COMMENT '视频节点表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_video_node_20181115';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_video_supplement` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `video_translation_title` string COMMENT '关联翻译标题',
  `video_keyword` string COMMENT '关键词',
  `video_recommend` string COMMENT '推荐指数',
  `ref_customer_id` bigint COMMENT '编辑医师会员id',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '视频补充信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_video_supplement';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_video_tag` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `video_name` string COMMENT '视频标题',
  `tag_id` bigint COMMENT 'tag_id',
  `tag_name` string COMMENT 'tag名称',
  `tag_parent_id` bigint COMMENT 'tag父节点',
  `tag_full_path` string COMMENT 'tag完全路径',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建日期',
  `send_site_id` int COMMENT '站点'
) COMMENT '视频-tag-mapping'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_video_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cms_video_tag_20181103` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `video_name` string COMMENT '视频标题',
  `tag_id` bigint COMMENT 'tag_id',
  `tag_name` string COMMENT 'tag名称',
  `tag_parent_id` bigint COMMENT 'tag父节点',
  `tag_full_path` string COMMENT 'tag完全路径',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建日期',
  `send_site_id` int COMMENT '站点'
) COMMENT '视频-tag-mapping'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cms_video_tag_20181103';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_col_ad` (
  `id` bigint COMMENT 'id',
  `ad_id` bigint COMMENT '广告id',
  `ad_name` string COMMENT '广告名称',
  `ad_att_width` string COMMENT '广告宽',
  `ad_att_height` string COMMENT '广告高',
  `ad_att_url` string COMMENT '广告图片url',
  `page_link_url` string COMMENT 'pc跳转地址',
  `web_link_url` string COMMENT '手机跳转地址',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '广告表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_col_ad';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_col_column` (
  `id` bigint COMMENT 'id',
  `column_name` string COMMENT '栏目名称',
  `recommend_type` int COMMENT '推荐类型 （1-推荐资源、2-推荐会员、3-推荐自定义资源、4-推荐调查问卷、5-推荐新闻、6-推荐专题)',
  `resource_source` int COMMENT '排行榜资源来源（1-全站、2-手动添加）',
  `resource_type` int COMMENT '排行榜资源类型（1-视频、2-病例、3-文库、4-话题、5-会员）',
  `resource_end_time` timestamp COMMENT '排行榜资源发布结束时间',
  `resource_sort_type` int COMMENT '排行榜排序方式（1-发布时间降序 2-浏览量降序 3-点赞降序 4-收藏数降序 5-评论数降序 6-粉丝数降序）',
  `resource_start_time` timestamp COMMENT '排行榜资源发布起始时间',
  `resource_num` int COMMENT '排行榜资源个数',
  `resource_tag_id` bigint COMMENT '排行榜专业id',
  `resource_tag_name` string COMMENT '排行榜专业名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '所属站点',
  `setting_element` string COMMENT '自定义元素（1-浏览数，2-收藏数，3-评论数，4-点赞数，5-粉丝数，6-关注数，7-贡献数）',
  `interactive_operation` string COMMENT '交互操作（1-点赞）',
  `is_page` int COMMENT '是否分页（0-否、1-是）',
  `page_num` int COMMENT '页内条数',
  `is_ranking` int COMMENT '是否是排行榜（0-不是，1-是）',
  `resource_own_type` int COMMENT '排行榜资源所属类型 （-1.全部）;1.视频（1-手术视频，2-课程视频，3-会议视频，4-专家访谈视频）2.病例（0-未审核病例，2-手术病例，3-非手术病例）3.文库（1-教材，2-指南，3-期刊，4-讲义）',
  `is_show_more` int COMMENT '是否展示更多（0-否，1-是）',
  `more_page_url` string COMMENT '更多PC跳转地址',
  `more_web_url` string COMMENT '更多H5跳转地址',
  `resource_time_type` int COMMENT '1-发布时间、2－时间区间'
) COMMENT '栏目信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_col_column';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_col_column_recommend` (
  `id` bigint COMMENT 'id',
  `column_id` bigint COMMENT '所属栏目id',
  `recommend_type` int COMMENT '推荐类型 （1-推荐资源、2-推荐会员、3-推荐自定义资源、4-推荐调查问卷、5-推荐新闻、6-推荐专题)',
  `resource_type` int COMMENT '资源类型 （ 1-视频 、2-病例、3-文库 、4-话题、5-会员、6-调查问卷、7-新闻、8-专题）',
  `ref_id` bigint COMMENT '关联id',
  `logo_pic_url` string COMMENT '徽标图片url',
  `cover_pic_url` string COMMENT '封面图片url',
  `title` string COMMENT '标题/姓名',
  `author` string COMMENT '作者',
  `medical_title` string COMMENT '职称',
  `hospital_name` string COMMENT '医院',
  `pc_url` string COMMENT 'pc链接url',
  `h5_url` string COMMENT '手机链接url',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `summary` string COMMENT '简介',
  `ref_customer_id` bigint COMMENT '作者关联id',
  `app_url` string COMMENT 'app手机端存储路径',
  `update_time` timestamp COMMENT ''
) COMMENT '栏目推荐资源信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_col_column_recommend';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_col_component` (
  `id` bigint COMMENT 'id',
  `component_id` bigint COMMENT '组件id',
  `component_name` string COMMENT '组件名称',
  `component_type` int COMMENT '组件类型(1-资源列表，2-会员列表，3-排行榜，4-新闻，5-推荐位，6-滚动栏，7-调查问卷，8-专题列表)',
  `title_location` int COMMENT '标题位置（1-居左显示,2-居中显示,3-居右显示）',
  `list_style` int COMMENT '列表样式（1-左图右文，2-左文右图，3-上图下文，4-上文下图）',
  `scroll_type` int COMMENT '滚动类型（1-资源，2-会员，3-自定义）',
  `ranking_type` int COMMENT '排行榜类型（1-资源，2-会员）',
  `tpl_content` string COMMENT '模板内容',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '所属站点'
) COMMENT '组件信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_col_component';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_col_layout` (
  `id` bigint COMMENT 'id',
  `layout_id` bigint COMMENT '布局信息id',
  `layout_name` string COMMENT '布局名称',
  `layout_pic_url` string COMMENT '布局样式图片url',
  `tpl_content` string COMMENT '模板内容',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '所属站点',
  `file_path` string COMMENT '文件路径'
) COMMENT '样式布局信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_col_layout';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_col_layout_module` (
  `id` bigint COMMENT 'id',
  `layout_id` bigint COMMENT '布局信息id',
  `layout_module` string COMMENT '布局模块（A、B、C、D）',
  `module_location` string COMMENT '模块位置（上、中、下）',
  `module_width` string COMMENT '模块宽',
  `module_height` string COMMENT '模块高',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '样式布局对应模块信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_col_layout_module';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_col_menu_layout_module` (
  `id` bigint COMMENT '',
  `theme_menu_id` bigint COMMENT '专题菜单id',
  `layout_id` bigint COMMENT '布局信息id',
  `layout_module` string COMMENT '布局模块（A、B、C、D）',
  `component_type` int COMMENT '组件类型(1-资源列表，2-会员列表，3-排行榜，4-新闻，5-推荐位，6-滚动栏，7-调查问卷，8-专题列表)',
  `component_id` bigint COMMENT '组件id',
  `column_id` bigint COMMENT '栏目id',
  `column_name` string COMMENT '栏目名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `title` string COMMENT '组件标题'
) COMMENT '专题菜单布局模块信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_col_menu_layout_module';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_col_news` (
  `id` bigint COMMENT 'id',
  `news_id` bigint COMMENT '新闻id',
  `news_name` string COMMENT '新闻标题',
  `news_author` string COMMENT '新闻作者',
  `news_body` string COMMENT '新闻内容',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '新闻表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_col_news';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_col_news_attachment` (
  `id` bigint COMMENT 'id',
  `news_id` bigint COMMENT '新闻id',
  `news_att_format` string COMMENT '新闻附件格式',
  `news_att_height` string COMMENT '新闻附件高度',
  `news_att_width` string COMMENT '新闻附件宽度',
  `news_att_url` string COMMENT '新闻附件url',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '新闻附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_col_news_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_col_question` (
  `id` bigint COMMENT 'id',
  `question_id` bigint COMMENT '题目id',
  `question_type` int COMMENT '题目类型（1-单选、2-多选、3-填空题、4-简答）',
  `question_show_type` int COMMENT '题目展示类型（1-文字、2、图片、图文混排）',
  `question_content` string COMMENT '题目内容',
  `question_author` string COMMENT '出题人',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `questionnaire_id` bigint COMMENT '问卷id',
  `question_option_max` int COMMENT '最多项',
  `question_option_min` int COMMENT '最少项',
  `is_required_status` int COMMENT '1-必填、0-非必填'
) COMMENT '问卷题目'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_col_question';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_col_question_answer` (
  `id` bigint COMMENT 'id',
  `questionnaire_id` bigint COMMENT '问卷id',
  `question_id` bigint COMMENT '题目id',
  `question_type` int COMMENT '题目类型（1-单选、2-多选、3-填空题、4-简答）',
  `option_mark` string COMMENT '选项(A,B,C,D,E)',
  `customer_id` bigint COMMENT '会员id',
  `answer_content` string COMMENT '答题内容',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `op_ip` string COMMENT '操作ip'
) COMMENT '答题表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_col_question_answer';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_col_question_attachment` (
  `id` bigint COMMENT 'id',
  `question_id` bigint COMMENT '题目id',
  `option_att_name` string COMMENT '题目附件标题',
  `option_att_format` string COMMENT '题目附件格式',
  `option_att_height` string COMMENT '题目附件高度',
  `option_att_width` string COMMENT '题目附件宽度',
  `option_att_url` string COMMENT '题目附件url',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '题目附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_col_question_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_col_question_option` (
  `id` bigint COMMENT 'id',
  `question_id` bigint COMMENT '题目id',
  `option_mark` string COMMENT '选项(A,B,C,D,E)',
  `option_content` string COMMENT '选项内容',
  `option_pic_url` string COMMENT '选项图片url',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `option_show_type` int COMMENT '选项展示类型（1-文字、2、图片、图文混排）',
  `is_required_status` int COMMENT '0-非必填、1-必填'
) COMMENT '问卷题目选项表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_col_question_option';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_col_questionnaire` (
  `id` bigint COMMENT 'id',
  `questionnaire_id` bigint COMMENT '问卷id',
  `questionnaire_title` string COMMENT '问卷标题',
  `questionnaire_type` int COMMENT '1-问卷调查、2-问卷投票',
  `is_page` int COMMENT '是否分页（0-否、1-是）',
  `page_num` int COMMENT '页内题数',
  `questionnaire_summary` string COMMENT '问卷说明',
  `questionnaire_pic_url` string COMMENT '问卷图片url',
  `share_title` string COMMENT '分享标题',
  `share_content` string COMMENT '分享话术',
  `share_pic_url` string COMMENT '分享图片url',
  `user_type` int COMMENT '1-需登录、2-需认证、3-无限制',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `is_show_result` int COMMENT '1-不显示投票结果、2-显示投票结果',
  `is_share_state` int COMMENT '1-填写后分享、2-填写后不分享',
  `end_content` string COMMENT '结束话术内容'
) COMMENT '问卷主表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_col_questionnaire';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_col_questionnaire_attachment` (
  `id` bigint COMMENT 'id',
  `questionnaire_id` bigint COMMENT '问卷id',
  `questionnaire_att_name` string COMMENT '问卷附件标题',
  `questionnaire_att_format` string COMMENT '问卷附件格式',
  `questionnaire_att_height` string COMMENT '问卷附件高度',
  `questionnaire_att_width` string COMMENT '问卷附件宽度',
  `questionnaire_att_url` string COMMENT '问卷附件url',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '问卷附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_col_questionnaire_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_col_theme` (
  `id` bigint COMMENT 'id',
  `theme_id` bigint COMMENT '专题id',
  `theme_name` string COMMENT '专题名称',
  `theme_summary` string COMMENT '专题简介',
  `theme_type` int COMMENT '专题类型（0-专题、1-专题汇总）',
  `nav_selected_color` string COMMENT '导航栏选中文字颜色',
  `nav_unselected_color` string COMMENT '导航栏未选中文字颜色',
  `nav_unselected_bgcolor` string COMMENT '未选中背景颜色',
  `nav_selected_bgcolor` string COMMENT '选中项背景颜色',
  `share_title` string COMMENT '分享标题',
  `share_content` string COMMENT '分享话术',
  `seo_name` string COMMENT 'seo名称',
  `seo_summary` string COMMENT 'seo描述',
  `seo_key_word` string COMMENT 'seo关键词',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `share_pic_url` string COMMENT '分享图片url',
  `theme_url` string COMMENT '专题url',
  `page_link_url` string COMMENT 'PC跳转路径',
  `web_link_url` string COMMENT '手机跳转路径',
  `tpl_path` string COMMENT '模板路径',
  `page_banner_url` string COMMENT 'PC端Banner图片url',
  `page_banner_bgimg_url` string COMMENT 'PC端Banner底图url',
  `web_banner_url` string COMMENT 'H5端Banner图片url',
  `page_bgimg_url` string COMMENT 'PC端背景图片url',
  `page_bgcolor` string COMMENT 'PC端背景颜色',
  `theme_group` int COMMENT '专题分组（0-待分组、1-基础骨病、2-骨科技术、3-精品栏目、4-特色专题）',
  `theme_keyword` string COMMENT '关键词'
) COMMENT '专题信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_col_theme';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_col_theme_menu` (
  `id` bigint COMMENT 'id',
  `theme_menu_id` bigint COMMENT '专题菜单id',
  `theme_id` bigint COMMENT '专题id',
  `menu_name` string COMMENT '菜单名称',
  `content_type` int COMMENT '内容类别(1-内部页面、2-外网链接)',
  `url` string COMMENT 'url地址',
  `menu_level` int COMMENT '菜单级别',
  `menu_parent_id` bigint COMMENT '菜单上级id',
  `layout_id` bigint COMMENT '布局信息id',
  `site_id` int COMMENT '所属站点',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `app_url` string COMMENT 'appUrl'
) COMMENT '专题菜单配置信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_col_theme_menu';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_activity_property` (
  `id` bigint COMMENT '',
  `property_id` bigint COMMENT '资源属性id',
  `property_name` string COMMENT '属性名称',
  `property_desc` string COMMENT '属性描述',
  `video_num` bigint COMMENT '视频数',
  `topic_num` bigint COMMENT '话题数',
  `doc_num` bigint COMMENT '文库数',
  `case_num` bigint COMMENT '病例资源数',
  `follow_num` bigint COMMENT '关注人订阅人',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '活动资源属性基础表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_activity_property';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_academic_degree` (
  `id` bigint COMMENT '',
  `academic_degree_name` string COMMENT '名称',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否启用'
) COMMENT '学位'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_academic_degree';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_application` (
  `id` bigint COMMENT '主键',
  `sdk_id` bigint COMMENT '插件id',
  `sdk_name` string COMMENT '插件名称',
  `sdk_version` string COMMENT '插件版本（例：101）',
  `sdk_desc` string COMMENT '描述',
  `sdk_url` string COMMENT '插件下载地址',
  `download_num` bigint COMMENT '下载次数',
  `update_time` timestamp COMMENT '更新时间',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点id',
  `app_version` string COMMENT 'app版本号',
  `is_valid` int COMMENT '是否有效',
  `type` int COMMENT '插件类型(1-插件,2-证书)'
) COMMENT '移动应用及插件管理'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_application';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_areas_expertise` (
  `id` bigint COMMENT '',
  `region_id` bigint COMMENT '编码',
  `parent_id` bigint COMMENT '父节点',
  `areas_expertise_name` string COMMENT '名称',
  `tree_level` string COMMENT '节点级别',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '专业领域'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_areas_expertise';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_author` (
  `id` bigint COMMENT '',
  `author_first_name` string COMMENT '作者名',
  `author_last_name` string COMMENT '作者姓',
  `ref_customer_id` bigint COMMENT '相关会员id',
  `author_intro` string COMMENT '作者简介',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '变更时间'
) COMMENT '作者信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_author';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_author_resource` (
  `id` bigint COMMENT '',
  `author_id` bigint COMMENT '',
  `author_first_name` string COMMENT '作者名',
  `author_last_name` string COMMENT '作者姓',
  `ref_resource_id` bigint COMMENT '作品id',
  `ref_resource_name` string COMMENT '作品名称',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '作者、译者作品'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_author_resource';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_blacklist` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `mobile` string COMMENT '手机号',
  `email` string COMMENT '邮箱',
  `unite_name_weixin` string COMMENT '微信号',
  `customer_role` int COMMENT '1-系统、2-组织、3-厂商、4-患者、5-普通医生、6-认证医生',
  `first_name` string COMMENT '名',
  `last_name` string COMMENT '姓',
  `full_name` string COMMENT '姓名',
  `company_id` bigint COMMENT '医院id',
  `company` string COMMENT '工作单位',
  `department` string COMMENT '科室／部门',
  `areas_expertise` string COMMENT '专业领域',
  `medical_title_id` int COMMENT '医师职称id',
  `medical_title` string COMMENT '医师职称',
  `social_title` string COMMENT '社会职称',
  `school_id` bigint COMMENT '学校id',
  `school_name` string COMMENT '学校名称',
  `major_id` bigint COMMENT '专业id',
  `major_name` string COMMENT '专业名称',
  `degree_id` int COMMENT '学位',
  `degree_name` string COMMENT '学位名称',
  `blacklist_type` int COMMENT '类型(0-黑名单,1-工作账号，2-假人账号)',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
) COMMENT '会员黑名单'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_blacklist';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_certificate` (
  `id` int COMMENT '证书ID',
  `certificate` string COMMENT '证书',
  `expressions` string COMMENT '判断规则，正则表达式',
  `state` int COMMENT '状态',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '证件类型'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_certificate';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_clinical` (
  `id` bigint COMMENT '',
  `clinical_id` bigint COMMENT '基础数据id',
  `clinical_name` string COMMENT '属性名称',
  `clinical_abstract` string COMMENT '属性描述',
  `clinical_type` int COMMENT '类型(1-input,2-radio,3-checkbox,4-select,5-text,6-图片,7-视频,8-年月日控件，9-年月日时分控件，10-月周天控件,11-年月日下拉控件,12-文本值,13-图片采集时间类型，14-选项值,15-疼痛(VAS)评分，16-DASH评分，17-JOA评分，18-Harris评分，19-ASES评分，20-HSS评分，21-Mayo肘关节功能评分，22-Majeed评分，23-Gibbons骶神经损伤分级，24-Samantha X线评分，25-SF-36评分，26-QOL评分，27-UCLA评分，28-踝关节Kofoed评分,29-Constant-Murphy评分,30-Neer评分)',
  `is_require` int COMMENT '是否必填（0-否，1-是）',
  `is_add` int COMMENT '是否可添加（0-否，1-是）',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `full_path` string COMMENT '上级路径（拼串形式存放上级data_id）',
  `parent_id` bigint COMMENT '父节点',
  `sort_id` int COMMENT '排序',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效',
  `limit_term` string COMMENT '限制条件'
) COMMENT '多中心平台模板基础数据信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_clinical';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_config` (
  `id` bigint COMMENT '',
  `site_id` int COMMENT '站点id',
  `type_id` int COMMENT '类型id',
  `config_id` bigint COMMENT '属性id',
  `config_name` string COMMENT '属性名称',
  `config_value` string COMMENT '属性值',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '属性数据字典'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_config';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_department` (
  `id` bigint COMMENT '',
  `department_id` bigint COMMENT '编码',
  `parent_id` bigint COMMENT '父节点',
  `department_name` string COMMENT '科室名称',
  `tree_level` string COMMENT '节点级别',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '多层级科室'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_department';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_dimension` (
  `id` bigint COMMENT '',
  `dimension_name` string COMMENT '维度名称',
  `dimension_structure` int COMMENT '结构:1一级形态2多级形态',
  `is_valid` int COMMENT '是否有效 1是 0否',
  `sort_id` int COMMENT '排序',
  `send_site_id` int COMMENT '站点id',
  `create_time` timestamp COMMENT '创建时间',
  `last_update_time` timestamp COMMENT '更新时间'
) COMMENT '标签维度表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_dimension';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_dimension_property` (
  `id` bigint COMMENT '',
  `dimension_property_id` bigint COMMENT '维度关系主键id',
  `dimension_id` bigint COMMENT '第一维度所选标签的id',
  `dimension_tree_level` int COMMENT '第一维度所选标签的节点级别',
  `property_id` bigint COMMENT '标签id',
  `property_type_id` bigint COMMENT '资源属性类型id',
  `property_name` string COMMENT '标签名称',
  `parent_id` bigint COMMENT '标签父级id',
  `property_desc` string COMMENT '属性描述',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否为子节点',
  `property_full_path` string COMMENT '全路径',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `sort_id` int COMMENT '排序',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '维度和标签关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_dimension_property';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_dimension_relation` (
  `id` bigint COMMENT '',
  `relation_name` string COMMENT '关联关系名称',
  `first_dimension_id` bigint COMMENT '一级维度id',
  `first_dimension_name` string COMMENT '一级维度名称',
  `second_dimension_id` bigint COMMENT '二级维度id',
  `second_dimension_name` string COMMENT '二级维度名称',
  `op_id` bigint COMMENT '操作人id',
  `op_user` string COMMENT '操作人',
  `op_ip` string COMMENT '操作ip',
  `is_valid` int COMMENT '是否有效',
  `sort_id` int COMMENT '排序',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `last_update_time` timestamp COMMENT '更新时间'
) COMMENT '关联关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_dimension_relation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_education` (
  `id` bigint COMMENT '',
  `education_name` string COMMENT '名称',
  `state` int COMMENT '状态',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `education_name_en` string COMMENT '名称en'
) COMMENT '学历'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_education';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_factor` (
  `id` bigint COMMENT '',
  `factor_type` int COMMENT '因子类型',
  `factor_type_desc` string COMMENT '因子类型描述',
  `factor_score` double COMMENT '评分',
  `factor_weight` double COMMENT '权重',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `platform_id` int COMMENT '平台(1-唯医;2-医栈)'
) COMMENT '影响因子配置'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_factor';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_factor_20180627` (
  `id` bigint COMMENT '',
  `factor_type` int COMMENT '因子类型',
  `factor_type_desc` string COMMENT '因子类型描述',
  `factor_score` double COMMENT '评分',
  `factor_weight` double COMMENT '权重',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `platform_id` int COMMENT '平台(1-唯医;2-医栈)'
) COMMENT '影响因子配置'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_factor_20180627';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_filter` (
  `id` bigint COMMENT '',
  `filter_id` bigint COMMENT '业务id',
  `filter_sence` int COMMENT '应用场景(1-专业|疾病|术士、2-类型、3-标签)',
  `filter_sence_type` int COMMENT '应用场景下的类型(1-(0-专业,1-疾病,2-术士)...)',
  `filter_parent_id` bigint COMMENT '父节点',
  `filter_tree_level` int COMMENT '节点级别',
  `filter_full_path` string COMMENT '上级路径（拼串形式存放上级业务ID）',
  `filter_is_leaf` int COMMENT '关联节点级别',
  `ref_id` bigint COMMENT '资源业务id',
  `ref_type` int COMMENT '资源类型',
  `ref_second_type` int COMMENT '资源二级类型(视频(手术视频、课程视频、会议视频、专家访谈)...)',
  `ref_name` string COMMENT '资源名称(冗余)',
  `ref_rename` string COMMENT '资源重命名',
  `ref_name_en` string COMMENT '资源英文名称(冗余)',
  `ref_desc` string COMMENT '资源描述(冗余)',
  `ref_url` string COMMENT '资源的url地址(冗余)',
  `is_hot` int COMMENT '是否是热数据',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)'
) COMMENT '发现过滤表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_filter';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_filter_20181101` (
  `id` bigint COMMENT '',
  `filter_id` bigint COMMENT '业务id',
  `filter_sence` int COMMENT '应用场景(1-专业|疾病|术士、2-类型、3-标签)',
  `filter_sence_type` int COMMENT '应用场景下的类型(1-(0-专业,1-疾病,2-术士)...)',
  `filter_parent_id` bigint COMMENT '父节点',
  `filter_tree_level` int COMMENT '节点级别',
  `filter_full_path` string COMMENT '上级路径（拼串形式存放上级业务ID）',
  `filter_is_leaf` int COMMENT '关联节点级别',
  `ref_id` bigint COMMENT '资源业务id',
  `ref_type` int COMMENT '资源类型',
  `ref_second_type` int COMMENT '资源二级类型(视频(手术视频、课程视频、会议视频、专家访谈)...)',
  `ref_name` string COMMENT '资源名称(冗余)',
  `ref_rename` string COMMENT '资源重命名',
  `ref_name_en` string COMMENT '资源英文名称(冗余)',
  `ref_desc` string COMMENT '资源描述(冗余)',
  `ref_url` string COMMENT '资源的url地址(冗余)',
  `is_hot` int COMMENT '是否是热数据',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)'
) COMMENT '发现过滤表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_filter_20181101';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_hospital` (
  `id` bigint COMMENT '',
  `hospital_name` string COMMENT '医院名称',
  `hospital_othername` string COMMENT '别名',
  `hospital_type_id` int COMMENT '医院类型',
  `hospital_triage_level` int COMMENT '会诊级别1-一级2-二级',
  `hospital_type_id_old` int COMMENT '',
  `hospital_level_id` int COMMENT '医院等级',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `hospital_address` string COMMENT '医院地址',
  `hospital_tele` string COMMENT '医院联系电话',
  `hospital_department` string COMMENT '重点科室',
  `hospital_management` string COMMENT '经营方式',
  `hospital_post` string COMMENT '邮编',
  `hospital_website` string COMMENT '医院网址',
  `state` int COMMENT '医院打分-用于搜索',
  `is_internet` int COMMENT '是否唯医互联网骨科医院0-否1-是',
  `is_top` int COMMENT '是否全国骨科top10医院1-是0-否',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `source` int COMMENT '数据来源：0-后台添加，1-用户补充，2-好大夫，3-人工校对',
  `is_verify` int COMMENT '是否验证：0-未验证，1-已验证',
  `update_time` timestamp COMMENT ''
) COMMENT '医院列表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_hospital';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_hospital_20180202` (
  `id` bigint COMMENT '',
  `hospital_name` string COMMENT '医院名称',
  `hospital_othername` string COMMENT '别名',
  `hospital_type_id` int COMMENT '医院类型',
  `hospital_triage_level` int COMMENT '会诊级别1-一级2-二级',
  `hospital_type_id_old` int COMMENT '',
  `hospital_level_id` int COMMENT '医院等级',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `hospital_address` string COMMENT '医院地址',
  `hospital_tele` string COMMENT '医院联系电话',
  `hospital_department` string COMMENT '重点科室',
  `hospital_management` string COMMENT '经营方式',
  `hospital_post` string COMMENT '邮编',
  `hospital_website` string COMMENT '医院网址',
  `state` int COMMENT '医院打分-用于搜索',
  `is_internet` int COMMENT '是否唯医互联网骨科医院0-否1-是',
  `is_top` int COMMENT '是否全国骨科top10医院1-是0-否',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `source` int COMMENT '数据来源：0-后台添加，1-用户补充'
) COMMENT '医院列表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_hospital_20180202';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_hospital_20180613` (
  `id` bigint COMMENT '',
  `hospital_name` string COMMENT '医院名称',
  `hospital_othername` string COMMENT '别名',
  `hospital_type_id` int COMMENT '医院类型',
  `hospital_triage_level` int COMMENT '会诊级别1-一级2-二级',
  `hospital_type_id_old` int COMMENT '',
  `hospital_level_id` int COMMENT '医院等级',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `hospital_address` string COMMENT '医院地址',
  `hospital_tele` string COMMENT '医院联系电话',
  `hospital_department` string COMMENT '重点科室',
  `hospital_management` string COMMENT '经营方式',
  `hospital_post` string COMMENT '邮编',
  `hospital_website` string COMMENT '医院网址',
  `state` int COMMENT '医院打分-用于搜索',
  `is_internet` int COMMENT '是否唯医互联网骨科医院0-否1-是',
  `is_top` int COMMENT '是否全国骨科top10医院1-是0-否',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `source` int COMMENT '数据来源：0-后台添加，1-用户补充，2-好大夫，3-人工校对',
  `is_verify` int COMMENT '是否验证：0-未验证，1-已验证'
) COMMENT '医院列表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_hospital_20180613';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_hospital_20180614` (
  `id` bigint COMMENT '',
  `hospital_name` string COMMENT '医院名称',
  `hospital_othername` string COMMENT '别名',
  `hospital_type_id` int COMMENT '医院类型',
  `hospital_triage_level` int COMMENT '会诊级别1-一级2-二级',
  `hospital_type_id_old` int COMMENT '',
  `hospital_level_id` int COMMENT '医院等级',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `hospital_address` string COMMENT '医院地址',
  `hospital_tele` string COMMENT '医院联系电话',
  `hospital_department` string COMMENT '重点科室',
  `hospital_management` string COMMENT '经营方式',
  `hospital_post` string COMMENT '邮编',
  `hospital_website` string COMMENT '医院网址',
  `state` int COMMENT '医院打分-用于搜索',
  `is_internet` int COMMENT '是否唯医互联网骨科医院0-否1-是',
  `is_top` int COMMENT '是否全国骨科top10医院1-是0-否',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `source` int COMMENT '数据来源：0-后台添加，1-用户补充，2-好大夫，3-人工校对',
  `is_verify` int COMMENT '是否验证：0-未验证，1-已验证'
) COMMENT '医院列表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_hospital_20180614';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_hospital_20180615` (
  `id` bigint COMMENT '',
  `hospital_name` string COMMENT '医院名称',
  `hospital_othername` string COMMENT '别名',
  `hospital_type_id` int COMMENT '医院类型',
  `hospital_triage_level` int COMMENT '会诊级别1-一级2-二级',
  `hospital_type_id_old` int COMMENT '',
  `hospital_level_id` int COMMENT '医院等级',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `hospital_address` string COMMENT '医院地址',
  `hospital_tele` string COMMENT '医院联系电话',
  `hospital_department` string COMMENT '重点科室',
  `hospital_management` string COMMENT '经营方式',
  `hospital_post` string COMMENT '邮编',
  `hospital_website` string COMMENT '医院网址',
  `state` int COMMENT '医院打分-用于搜索',
  `is_internet` int COMMENT '是否唯医互联网骨科医院0-否1-是',
  `is_top` int COMMENT '是否全国骨科top10医院1-是0-否',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `source` int COMMENT '数据来源：0-后台添加，1-用户补充，2-好大夫，3-人工校对',
  `is_verify` int COMMENT '是否验证：0-未验证，1-已验证'
) COMMENT '医院列表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_hospital_20180615';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_hospital_20180625` (
  `id` bigint COMMENT '',
  `hospital_name` string COMMENT '医院名称',
  `hospital_othername` string COMMENT '别名',
  `hospital_type_id` int COMMENT '医院类型',
  `hospital_triage_level` int COMMENT '会诊级别1-一级2-二级',
  `hospital_type_id_old` int COMMENT '',
  `hospital_level_id` int COMMENT '医院等级',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `hospital_address` string COMMENT '医院地址',
  `hospital_tele` string COMMENT '医院联系电话',
  `hospital_department` string COMMENT '重点科室',
  `hospital_management` string COMMENT '经营方式',
  `hospital_post` string COMMENT '邮编',
  `hospital_website` string COMMENT '医院网址',
  `state` int COMMENT '医院打分-用于搜索',
  `is_internet` int COMMENT '是否唯医互联网骨科医院0-否1-是',
  `is_top` int COMMENT '是否全国骨科top10医院1-是0-否',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `source` int COMMENT '数据来源：0-后台添加，1-用户补充，2-好大夫，3-人工校对',
  `is_verify` int COMMENT '是否验证：0-未验证，1-已验证'
) COMMENT '医院列表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_hospital_20180625';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_hospital_attachment` (
  `id` bigint COMMENT '',
  `hospital_id` bigint COMMENT '医院id',
  `hospital_att_type` int COMMENT '医院资源类型：1-图片，2-视频,3-文档',
  `hospital_att_size` string COMMENT '医院资源大小：KB',
  `hospital_att_format` string COMMENT '医院资源格式：jpg、mp4...',
  `hospital_att_spec` string COMMENT '医院附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52)',
  `hospital_att_height` string COMMENT '医院资源高度',
  `hospital_att_width` string COMMENT '医院资源宽度',
  `hospital_att_url` string COMMENT '医院资源url',
  `upload_time` timestamp COMMENT '医院资源上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '医院附件详细信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_hospital_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_hospital_hdf_correct_clean` (
  `hospital_id` bigint COMMENT '平台医院id',
  `hospital_name` string COMMENT '平台医院名称',
  `hospital_othername_hdf` string COMMENT '好大夫别名',
  `hospital_type_hdf` string COMMENT '好大夫医院类型',
  `hospital_level_hdf` string COMMENT '好大夫医院等级',
  `province_hdf` string COMMENT '好大夫省',
  `city_hdf` string COMMENT '好大夫市',
  `district_hdf` string COMMENT '好大夫区/县',
  `hospital_address_hdf` string COMMENT '好大夫医院地址',
  `hospital_tele_hdf` string COMMENT '好大夫医院联系电话',
  `province_hdf_id` int COMMENT '好大夫省id',
  `city_hdf_id` int COMMENT '好大夫市id',
  `district_hdf_id` int COMMENT '好大夫区/县id',
  `hospital_type_hdf_id` int COMMENT '好大夫医院类型id',
  `hospital_level_hdf_id` int COMMENT '好大夫医院等级id'
) COMMENT '医院列表-校验清洗'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_hospital_hdf_correct_clean';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_hospital_level` (
  `id` int COMMENT '',
  `hospital_level` string COMMENT '医院等级'
) COMMENT '医院等级'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_hospital_level';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_hospital_level_correct` (
  `id` int COMMENT '',
  `hospital_level` string COMMENT '医院等级'
) COMMENT '医院等级'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_hospital_level_correct';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_hospital_type` (
  `id` int COMMENT '',
  `hospital_type` string COMMENT '医院类型'
) COMMENT '医院类型'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_hospital_type';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_hospital_type_correct` (
  `id` int COMMENT '',
  `hospital_type` string COMMENT '医院类型'
) COMMENT '医院类型'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_hospital_type_correct';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_inforate` (
  `id` bigint COMMENT '',
  `info_id` int COMMENT '信息标识:1-头像、2-姓名、3-性别、4-生日、5-职称、6-医院、7-专业领域、8-个人简介、9-工作经历、
  10-教育背景、11-继续教育、12-获得荣誉、13-科研基金、14-社会任职、15-学术专著、16-发明专利),17-认证信息-(18-认证资料,19-姓名、   20-生日、21-职称、22-医院、23-专业领域)',
  `info_name` string COMMENT '信息名称',
  `info_type` int COMMENT '0-基本信息,1-认证信息',
  `rate` string COMMENT '百分比',
  `remark` string COMMENT '提示内容',
  `parent_id` bigint COMMENT '父节点',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `authority` int COMMENT '权重',
  `create_time` timestamp COMMENT '创建日期',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
) COMMENT '会员简历完成度配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_inforate';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_language` (
  `id` bigint COMMENT '',
  `language_name` string COMMENT '语言能力',
  `language_name_en` string COMMENT '语言能力en'
) COMMENT '语言能力字典表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_language';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_logo_url` (
  `id` bigint COMMENT '',
  `ref_id` bigint COMMENT 'logo相关id',
  `logo_type` string COMMENT '1-作者，2-译者，3-来源,4-会员头像,5-tags_logo,6-会议,7-学校logo,8-组织背景图,9-组织主页头图,10-会员头像,11-简历头像',
  `logo_spec` string COMMENT 'logo规格(0-头像原图、1-头像个人主页、2-头像动态、3-头像推荐-文章-视频终端页、4-头像回复、5-会议logo、6-会议大图)',
  `logo_height` string COMMENT '图片高度',
  `logo_width` string COMMENT '图片宽度',
  `logo_size` string COMMENT '图片大小KB',
  `logo_url` string COMMENT 'logo地址',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功,3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `play_time` string COMMENT '播放时长',
  `logo_att_format` string COMMENT '附件格式：jpg、mp4...',
  `logo_att_name` string COMMENT '附件说明（图片标题等）',
  `site_id` int COMMENT '站点',
  `update_time` timestamp COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_logo_url';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_logo_url_20181212` (
  `id` bigint COMMENT '',
  `ref_id` bigint COMMENT 'logo相关id',
  `logo_type` string COMMENT '1-作者，2-译者，3-来源,4-会员头像,5-tags_logo,6-会议,7-学校logo,8-组织背景图,9-组织主页头图,10-会员头像,11-简历头像',
  `logo_spec` string COMMENT 'logo规格(0-头像原图、1-头像个人主页、2-头像动态、3-头像推荐-文章-视频终端页、4-头像回复、5-会议logo、6-会议大图)',
  `logo_height` string COMMENT '图片高度',
  `logo_width` string COMMENT '图片宽度',
  `logo_size` string COMMENT '图片大小KB',
  `logo_url` string COMMENT 'logo地址',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功,3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `play_time` string COMMENT '播放时长',
  `logo_att_format` string COMMENT '附件格式：jpg、mp4...',
  `logo_att_name` string COMMENT '附件说明（图片标题等）',
  `site_id` int COMMENT '站点',
  `update_time` timestamp COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_logo_url_20181212';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_major` (
  `id` bigint COMMENT '',
  `major_id` bigint COMMENT '编码',
  `parent_id` bigint COMMENT '父节点',
  `major_title` string COMMENT '名称',
  `tree_level` string COMMENT '节点级别',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '专业'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_major';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_marryage` (
  `id` int COMMENT '',
  `marryage` string COMMENT '婚姻状况',
  `is_valid` int COMMENT '是否有效'
) COMMENT '婚姻状况基础表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_marryage';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_medical_title` (
  `id` int COMMENT '',
  `medical_title_id` int COMMENT '职称类型ID',
  `medical_title` string COMMENT '职称',
  `state` int COMMENT '状态',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `medical_title_en` string COMMENT '职称en'
) COMMENT '医生职称表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_medical_title';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_nationality` (
  `id` bigint COMMENT '',
  `nationality` string COMMENT '民族'
) COMMENT '民族字典表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_nationality';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_navigation` (
  `id` bigint COMMENT '',
  `navigation_id` bigint COMMENT '导航id',
  `navigation_name` string COMMENT '导航名称',
  `navigation_type` int COMMENT '导航类型ID(1-全站导航，2-热门导航，3-发现页按，4-发现页活动专家，5-视频频道页，6-文库频道页，7-话题频道页，8-病例频道页,9-3.0首页固定位)',
  `create_time` timestamp COMMENT '创建时间',
  `page_storage_path` string COMMENT '网站版菜单项存储路径',
  `web_storage_path` string COMMENT '手机版菜单项存储路径',
  `app_storage_para` string COMMENT 'app存储参数',
  `is_valid` int COMMENT '是否有效',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `sort_id` int COMMENT '顺序号',
  `update_time` timestamp COMMENT '更新时间'
) COMMENT '动态入口表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_navigation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_navigation_attachment` (
  `id` bigint COMMENT '',
  `navigation_id` bigint COMMENT '导航id',
  `navigation_att_type` int COMMENT '资源类型：1-图片，2-视频,3-文档,4-视频缩略图',
  `navigation_att_size` string COMMENT '资源大小：KB',
  `navigation_att_format` string COMMENT '资源格式：jpg、mp4...',
  `navigation_att_spec` string COMMENT '附件规格(1-原始文件)',
  `navigation_att_height` string COMMENT '资源高度',
  `navigation_att_width` string COMMENT '资源宽度',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `navigation_att_url` string COMMENT '资源url',
  `upload_time` timestamp COMMENT '资源上传时间',
  `attachment_type` int COMMENT '附件类型(1-默认，2-新增)',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '动态入口附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_navigation_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_notice_config` (
  `id` bigint COMMENT '',
  `notice_id` bigint COMMENT ' 通知类型(53-医师审核通过、54医师审核拒绝、60-管理自定义通知,61-话题屏蔽通知,62-视频屏蔽通知,63-病例屏蔽通知,64-文章屏蔽通知,65-评论屏蔽通知，66-引用通知 )',
  `notice_title` string COMMENT '消息标题',
  `notice_content` string COMMENT '消息内容,截取字符',
  `page_storage_path` string COMMENT '网站PC存储路径',
  `web_storage_path` string COMMENT '手机版H5存储路径',
  `app_storage_parh` string COMMENT 'app手机端存储路径',
  `create_time` timestamp COMMENT '配置时间(yyyy-mm-dd  hh:mm:ss)',
  `send_site_id` int COMMENT '操作来源 （1-pc、2-H5、5-ios、6-android）',
  `is_valid` int COMMENT '是否有效'
) COMMENT '系统消息配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_notice_config';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_politics_status` (
  `id` bigint COMMENT '',
  `politics_status` string COMMENT '政治面貌'
) COMMENT '政治面貌字典表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_politics_status';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_prompt` (
  `id` bigint COMMENT '',
  `scene` int COMMENT '场景说明(1-认证操作 2-认证证件页提示)',
  `prompt_condition` string COMMENT '条件(配合场景1-0:游客 1-1:登录用户 1-2:V1认证拒绝 1-3:V1认证通过(住院以上) 1-4:V1认证通过(医学生、护士) 1-5:V2认证拒绝)2-1姓名，2-2单位，2-3职称，2-4医师执业证，2-5医师资格证，2-6医师职称证，2-7身 
份证，2-8工作证，2-9毕业证，2-10学生证，2-11医学学历证',
  `prompt_message` string COMMENT '提示信息',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `sort_id` string COMMENT '顺序',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '提示信息配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_prompt';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_property` (
  `id` bigint COMMENT '',
  `property_type_id` bigint COMMENT '资源属性类型id(1-解剖学、2-疾病名称、3-手术目录)',
  `property_id` bigint COMMENT '资源属性id',
  `property_name` string COMMENT '属性名称',
  `parent_id` bigint COMMENT '父节点',
  `property_desc` string COMMENT '属性描述',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `property_full_path` string COMMENT '上级路径（拼串形式存放上级propertyId）',
  `video_num` bigint COMMENT '视频数',
  `topic_num` bigint COMMENT '话题数',
  `doc_num` bigint COMMENT '文库数',
  `case_num` bigint COMMENT '病例资源数',
  `follow_num` bigint COMMENT '关注人订阅人',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)'
) COMMENT '资源属性表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_property';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_property_20181101` (
  `id` bigint COMMENT '',
  `property_type_id` bigint COMMENT '资源属性类型id(1-解剖学、2-疾病名称、3-手术目录)',
  `property_id` bigint COMMENT '资源属性id',
  `property_name` string COMMENT '属性名称',
  `parent_id` bigint COMMENT '父节点',
  `property_desc` string COMMENT '属性描述',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `property_full_path` string COMMENT '上级路径（拼串形式存放上级propertyId）',
  `video_num` bigint COMMENT '视频数',
  `topic_num` bigint COMMENT '话题数',
  `doc_num` bigint COMMENT '文库数',
  `case_num` bigint COMMENT '病例资源数',
  `follow_num` bigint COMMENT '关注人订阅人',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)'
) COMMENT '资源属性表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_property_20181101';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_quantization` (
  `id` bigint COMMENT '',
  `quantization_id` bigint COMMENT '基础数据id',
  `quantization_name` string COMMENT '属性名称',
  `quantization_abstract` string COMMENT '属性描述',
  `quantization_remark` string COMMENT '评分项备注',
  `quantization_result` string COMMENT '评分结果说明',
  `quantization_type` int COMMENT '类型(16-DASH评分，17-JOA评分，18-Harris评分，19-ASES评分，20-HSS评分，21-Mayo肘关节功能评分，22-Majeed评分，23-Gibbons骶神经损伤分级，24-Samantha X线评分，25-SF-36评分，26-QOL评分，27-UCLA评分，28-踝关节Kofoed评分,29-Constant-Murphy评分)',
  `info_type` int COMMENT '类型(1-input,2-radio,3-checkbox,4-select,5-文本值,6-选项值,7-单选嵌套下拉，8-多选嵌套下拉)',
  `calculate_type` int COMMENT '类型(1-相加总和)',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `full_path` string COMMENT '上级路径（拼串形式存放上级data_id）',
  `parent_id` bigint COMMENT '父节点',
  `sort_id` int COMMENT '排序',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '量表信息基础数据表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_quantization';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_ques` (
  `id` bigint COMMENT '',
  `ques_type_id` int COMMENT '问题类型id',
  `ques_type` string COMMENT '问题类型',
  `ques_cont` string COMMENT '问题内容',
  `create_time` timestamp COMMENT '创建问题时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '问题基础表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_ques';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_region` (
  `id` bigint COMMENT '',
  `region_id` bigint COMMENT '编码',
  `parent_id` bigint COMMENT '父节点',
  `region_name` string COMMENT '名称',
  `tree_level` string COMMENT '节点级别',
  `is_valid` int COMMENT '是否有效',
  `region_name_en` string COMMENT '拼音'
) COMMENT '地址四级联动'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_region';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_region_20180613` (
  `id` bigint COMMENT '',
  `region_id` bigint COMMENT '编码',
  `parent_id` bigint COMMENT '父节点',
  `region_name` string COMMENT '名称',
  `tree_level` string COMMENT '节点级别',
  `is_valid` int COMMENT '是否有效',
  `region_name_en` string COMMENT '拼音'
) COMMENT '地址四级联动'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_region_20180613';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_role_config` (
  `id` bigint COMMENT '',
  `site_id` int COMMENT '站点id',
  `role_id` int COMMENT '1-系统、2-组织、3-厂商、4-患者、5-普通医生、6-认证医生、7-医学生',
  `type_id` int COMMENT '1-会员认证提供证件...',
  `ref_id` bigint COMMENT '关联id',
  `ref_value` string COMMENT '关联值',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '角色配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_role_config';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_school` (
  `id` bigint COMMENT '',
  `school_name` string COMMENT '学校名称',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `school_address` string COMMENT '学校地址',
  `school_website` string COMMENT '学校网址'
) COMMENT '学校'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_school';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_score_config` (
  `id` bigint COMMENT '',
  `answer_title` string COMMENT '答案标签',
  `answer_type` int COMMENT '答案所属类型(1-视频、2-文库、4-话题、7-病例)',
  `sort_id` int COMMENT '显示顺序',
  `is_valid` int COMMENT '是否有效(0-无效、1-有效)',
  `send_site_id` int COMMENT '关联站点配置(1-唯医官网、11-MED-H5、13-医鼎官网)',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '评分答案配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_score_config';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_score_level` (
  `id` bigint COMMENT '',
  `score_level` int COMMENT '星级(1~5星)',
  `score_guide` string COMMENT '评分引导语',
  `score_question` string COMMENT '问题',
  `score_answer_behalf` int COMMENT '答案代表（1-好、2-不好）',
  `answer_type` int COMMENT '答案所属类型(1-视频、2-文库、4-话题、7-病例)',
  `sort_id` int COMMENT '显示顺序',
  `is_valid` int COMMENT '是否有效(0-无效、1-有效)',
  `send_site_id` int COMMENT '关联站点配置(1-唯医官网、11-MED-H5、13-医鼎官网)',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '评分等级对照表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_score_level';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_sex` (
  `id` int COMMENT '',
  `sex` string COMMENT '性别',
  `is_valid` int COMMENT '是否有效'
) COMMENT '性别基础表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_sex';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_share` (
  `id` bigint COMMENT '',
  `scene_type` int COMMENT '1-搜索, 2-列表, 3-分会场列表, 4-个人中心发布, 5-个人中心回复, 6-终端页, 7-直播终端 页, 8-回播终端页,13-按专业, 14-按类型, 15-按专题， 16-标签专题, 17-权威专家, 18-热门活动,19-我的主页, 20-他人主页,21-按疾病,22-按术式, 23-ugc直播（主播分享）（正在直播）,24-ugc直播（观众分享）（正在直播）,25-ugc直播（主播分享）（预约）,26-ugc直播（观众分享）（预约）,27-电子书,28-进修列表页,29-进修终端页,71-体系化课程列表，72-体系化课程详情页，74-已上榜榜单页，75-未上榜榜单页，76-菁英课堂，77-骨课大讲堂，78-骨切磋',
  `resource_type` int COMMENT '资源类型(0-All, 1-视频, 2-文库, 3-会议,31-新版会议, 4-话题, 7-病例, 9-医师/人，17-书籍，51-UGC直播)',
  `share_channel` int COMMENT '分享的渠道类型(1-微信朋友圈, 2-微信朋友, 3-QQ空间, 4-QQ好友, 5-新浪微博, 6-短信)',
  `share_title` string COMMENT '分享出去显示的标题',
  `share_desc` string COMMENT '分享出去显示的简介/摘要',
  `share_image_url` string COMMENT '分享出去显示的图片/缩略图地址',
  `url_prefix` string COMMENT '长连接固定网址前缀/网站域名',
  `create_time` timestamp COMMENT '记录创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT 'APP分享页面配置'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_share';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_share_20181101` (
  `id` bigint COMMENT '',
  `scene_type` int COMMENT '1-搜索, 2-列表, 3-分会场列表, 4-个人中心发布, 5-个人中心回复, 6-终端页, 7-直播终端 页, 8-回播终端页,13-按专业, 14-按类型, 15-按专题， 16-标签专题, 17-权威专家, 18-热门活动,19-我的主页, 20-他人主页,21-按疾病,22-按术式, 23-ugc直播（主播分享）（正在直播）,24-ugc直播（观众分享）（正在直播）,25-ugc直播（主播分享）（预约）,26-ugc直播（观众分享）（预约）,27-电子书,28-进修列表页,29-进修终端页,71-体系化课程列表，72-体系化课程详情页，74-已上榜榜单页，75-未上榜榜单页，76-菁英课堂，77-骨课大讲堂，78-骨切磋',
  `resource_type` int COMMENT '资源类型(0-All, 1-视频, 2-文库, 3-会议,31-新版会议, 4-话题, 7-病例, 9-医师/人，17-书籍，51-UGC直播)',
  `share_channel` int COMMENT '分享的渠道类型(1-微信朋友圈, 2-微信朋友, 3-QQ空间, 4-QQ好友, 5-新浪微博, 6-短信)',
  `share_title` string COMMENT '分享出去显示的标题',
  `share_desc` string COMMENT '分享出去显示的简介/摘要',
  `share_image_url` string COMMENT '分享出去显示的图片/缩略图地址',
  `url_prefix` string COMMENT '长连接固定网址前缀/网站域名',
  `create_time` timestamp COMMENT '记录创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT 'APP分享页面配置'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_share_20181101';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_share_20181211` (
  `id` bigint COMMENT '',
  `scene_type` int COMMENT '1-搜索, 2-列表, 3-分会场列表, 4-个人中心发布, 5-个人中心回复, 6-终端页, 7-直播终端 页, 8-回播终端页,13-按专业, 14-按类型, 15-按专题， 16-标签专题, 17-权威专家, 18-热门活动,19-我的主页, 20-他人主页,21-按疾病,22-按术式, 23-ugc直播（主播分享）（正在直播）,24-ugc直播（观众分享）（正在直播）,25-ugc直播（主播分享）（预约）,26-ugc直播（观众分享）（预约）,27-电子书,28-进修列表页,29-进修终端页,71-体系化课程列表，72-体系化课程详情页，74-已上榜榜单页，75-未上榜榜单页，76-菁英课堂，77-骨课大讲堂，78-骨切磋',
  `resource_type` int COMMENT '资源类型(0-All, 1-视频, 2-文库, 3-会议,31-新版会议, 4-话题, 7-病例, 9-医师/人，17-书籍，51-UGC直播)',
  `share_channel` int COMMENT '分享的渠道类型(1-微信朋友圈, 2-微信朋友, 3-QQ空间, 4-QQ好友, 5-新浪微博, 6-短信)',
  `share_title` string COMMENT '分享出去显示的标题',
  `share_desc` string COMMENT '分享出去显示的简介/摘要',
  `share_image_url` string COMMENT '分享出去显示的图片/缩略图地址',
  `url_prefix` string COMMENT '长连接固定网址前缀/网站域名',
  `create_time` timestamp COMMENT '记录创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT 'APP分享页面配置'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_share_20181211';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_solr_factor` (
  `id` bigint COMMENT '',
  `solr_scene` int COMMENT '应用场景(1-视频 2-文库 4-话题 7-病例 6-人)',
  `factor_id` bigint COMMENT '因子id',
  `factor_name` string COMMENT '权重字段名称',
  `factor_name_en` string COMMENT '权重字段英文名称',
  `factor_score` double COMMENT '评分',
  `factor_score` double COMMENT '评分',
  `factor_weight` double COMMENT '权重',
  `create_time` timestamp COMMENT '创建时间',
  `platform_id` int COMMENT '平台(1-唯医;2-医栈)',
  `is_valid` int COMMENT '是否有效'
) COMMENT '搜索权重设置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_solr_factor';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_solr_factor_20180608` (
  `id` bigint COMMENT '',
  `solr_scene` int COMMENT '应用场景(1-视频 2-文库 4-话题 7-病例 6-人)',
  `factor_id` bigint COMMENT '因子id',
  `factor_name` string COMMENT '权重字段名称',
  `factor_name_en` string COMMENT '权重字段英文名称',
  `factor_score` double COMMENT '评分',
  `factor_weight` double COMMENT '权重',
  `create_time` timestamp COMMENT '创建时间',
  `platform_id` int COMMENT '平台(1-唯医;2-医栈)',
  `is_valid` int COMMENT '是否有效'
) COMMENT '搜索权重设置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_solr_factor_20180608';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_tag` (
  `id` bigint COMMENT '',
  `parent_id` bigint COMMENT '父节点',
  `tag_name` string COMMENT '名称',
  `tag_name_en` string COMMENT '英文名称',
  `tag_type` int COMMENT 'tag类型(1-系统分类,2-用户分类)',
  `tag_url` string COMMENT 'tag的url地址',
  `tag_desc` string COMMENT 'tags描述',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `tag_full_path` string COMMENT '上级路径（拼串形式存放上级tagId）',
  `video_num` bigint COMMENT '视频数',
  `topic_num` bigint COMMENT '话题数',
  `doc_num` bigint COMMENT '文库数',
  `article_num` bigint COMMENT '文章数',
  `note_num` bigint COMMENT '笔记数',
  `customer_id` bigint COMMENT '会员id',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `follow_num` bigint COMMENT '关注人订阅人',
  `case_num` bigint COMMENT '病例资源数',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)'
) COMMENT 'tags'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_tag_prod` (
  `id` bigint COMMENT '',
  `tag_name` string COMMENT '名称',
  `tag_name_en` string COMMENT '英文名称',
  `tag_type` int COMMENT '标签类型(1-系统分类,2-用户分类)',
  `tag_url` string COMMENT '标签的url地址',
  `tag_logo_url` string COMMENT '标签图片地址',
  `tag_desc` string COMMENT '标签描述',
  `customer_id` bigint COMMENT '会员id',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT 'tag字典表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_tag_prod';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_tag_relation` (
  `id` bigint COMMENT '',
  `tag_id` bigint COMMENT 'tagId',
  `tag_name` string COMMENT 'tag名称',
  `tag_url` string COMMENT 'tag的url地址',
  `tag_relation` int COMMENT 'tag关系(1-上级,2-相似)',
  `relation_tag_id` bigint COMMENT '关联tagId',
  `relation_tag_name` string COMMENT '关联tag名称',
  `relation_tag_url` string COMMENT '关联tag的url地址',
  `customer_id` bigint COMMENT '会员id',
  `group_id` bigint COMMENT '分组id',
  `group` string COMMENT '分组名称',
  `create_time` timestamp COMMENT '创建时间',
  `is_sys` int COMMENT '是否系统设置',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT 'tag关联表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_tag_relation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_unite_login` (
  `id` int COMMENT '',
  `unite_name` string COMMENT '联合登录渠道',
  `app_id` string COMMENT '',
  `app_key` string COMMENT '',
  `app_secret` string COMMENT '',
  `open_key` string COMMENT '',
  `api_key` string COMMENT '',
  `apikey_secret` string COMMENT '',
  `quest_add` string COMMENT '',
  `callback` string COMMENT '',
  `access_token` string COMMENT '',
  `open_id` string COMMENT ''
) COMMENT '联合登录'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_unite_login';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_data_wechat_token` (
  `id` bigint COMMENT '',
  `app_id` string COMMENT 'key',
  `token` string COMMENT '口令',
  `is_valid` smallint COMMENT '是否有效',
  `update_time` timestamp COMMENT '更新时间',
  `remark` string COMMENT '备注'
) COMMENT '微信接口信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_data_wechat_token';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_hospital_level_yunhong` (
  `id` bigint COMMENT '',
  `hospital_name` string COMMENT '医院名称',
  `hospital_score` bigint COMMENT '医院等级得分'
) COMMENT '医院等级表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_hospital_level_yunhong';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_state_config` (
  `id` bigint COMMENT '',
  `state_type` int COMMENT '1-进修审核状态',
  `state` int COMMENT '审核状态 1.(1-申请未提交、2-等待初审、3-初审未通过、4-等待电话面试、5-电话面试未通过、6-等待面试、7-面试未通过、8-面试已通过、9-活动截止)',
  `state_name` string COMMENT '审核状态名称',
  `email_title` string COMMENT '邮件标题',
  `email_content` string COMMENT '邮件内容',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `state_type_name` string COMMENT '场景描述（state_type）'
) COMMENT '审核状态配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_state_config';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_tag_property_mapping` (
  `id` bigint COMMENT '',
  `tag_id` bigint COMMENT '学组-老标签',
  `tag_name` string COMMENT '名称',
  `tag_name_en` string COMMENT '英文名称',
  `property_id` bigint COMMENT '新标签属性id',
  `property_name` string COMMENT '属性名称',
  `tree_level` int COMMENT '节点级别',
  `property_parent_id` bigint COMMENT 'tag父节点',
  `property_full_path` string COMMENT 'tag完全路径',
  `is_valid` int COMMENT '是否有效',
  `user_id` bigint COMMENT '后台操作用户id',
  `create_time` timestamp COMMENT '配置时间(yyyy-mm-dd  hh:mm:ss)',
  `send_site_id` int COMMENT '操作来源 1-唯医官网pc、2-唯医手机H5、3-CAOS、4-CAOS手机、5-ios、6-android、7-CAOS-EN、8-MED-IOS、9-MED-Android、10-后台、11-MED-H5'
) COMMENT '学组与标签对照关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_tag_property_mapping';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_comm_unite_login` (
  `id` int COMMENT '',
  `unite_name` string COMMENT '联合登录渠道',
  `app_id` string COMMENT '',
  `app_key` string COMMENT '',
  `app_secret` string COMMENT '',
  `open_key` string COMMENT '',
  `api_key` string COMMENT '',
  `apikey_secret` string COMMENT '',
  `quest_add` string COMMENT '',
  `callback` string COMMENT '',
  `access_token` string COMMENT '',
  `open_id` string COMMENT ''
) COMMENT '联合登录'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_comm_unite_login';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_conference` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '会议id',
  `con_name` string COMMENT '会议名称',
  `con_url` string COMMENT '会议url',
  `con_main_pic_url` string COMMENT '会议主图地址',
  `con_place` string COMMENT '会议地点',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家id',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `con_intro` string COMMENT '会议简介',
  `con_date_list_url` string COMMENT '会议日程安排',
  `con_host` string COMMENT '主办方',
  `con_note_url` string COMMENT '参会须知',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `con_scale` string COMMENT '会议规模',
  `con_contact_tele` string COMMENT '联系电话',
  `con_contact_person` string COMMENT '联系人',
  `con_contact_email` string COMMENT '联系邮箱',
  `con_contact_address` string COMMENT '联系地址',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `con_logo_url` string COMMENT '',
  `news_column_id` bigint COMMENT '关联新闻栏目id',
  `overview_column_id` bigint COMMENT '关联概况新闻栏目id',
  `specialist_column_id` bigint COMMENT '关联专家栏目id',
  `ad_position_id` bigint COMMENT '所关联广告位id',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `create_time` timestamp COMMENT '创建时间',
  `shoot_state` int COMMENT '拍摄状态(0-不拍摄,1-拍摄)',
  `subject_team_id` string COMMENT '学组Id(骨科: 9999-综合,2-关节,7-脊柱,9-创伤,10000-其他 手外: 99999-综合,823-手外科先天性手部畸形的治疗,832-骨关节,844-臀丛及周围神经,849-再植与再造,851-手部创面修复)',
  `update_time` timestamp COMMENT ''
) COMMENT '会议信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_conference';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_conference_agenda` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '所属主会议id',
  `con_sub_id` bigint COMMENT '分会id',
  `con_type` int COMMENT '日程类型（1-开幕式、2-闭幕，3-分会）',
  `con_name` string COMMENT '会议名称',
  `con_content` string COMMENT '主讲内容',
  `con_place` string COMMENT '会议地点',
  `moderator` string COMMENT '会议主持人',
  `reach_date` timestamp COMMENT '到会时间（日期）',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `lecturer` string COMMENT '讲师',
  `topic` string COMMENT '专题',
  `ref_video_id` bigint COMMENT '相关视频id',
  `is_online` int COMMENT '是否在线直播',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `live_id` string COMMENT '直播id',
  `play_back_id` string COMMENT '回播id',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT ''
) COMMENT '会议日程'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_conference_agenda';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_conference_attachment` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '会议id',
  `con_sub_id` bigint COMMENT '分会场编号',
  `con_att_type` int COMMENT '会议附件类型：1-图片，2-视频,3-默认海报模板,4-自定义海报模板......',
  `con_att_size` string COMMENT '会议附件大小：KB',
  `con_att_format` string COMMENT '会议附件格式：jpg、mp4...',
  `con_att_spec` string COMMENT '会议附件规格：高清、标清...',
  `con_att_height` string COMMENT '会议附件高度',
  `con_att_width` string COMMENT '会议附件宽度',
  `con_att_url` string COMMENT '会议附件url',
  `upload_time` timestamp COMMENT '会议附件上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会议附件详细信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_conference_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_conference_course` (
  `id` bigint COMMENT '',
  `course_id` bigint COMMENT '会议课程id',
  `course_name` string COMMENT '课程名称',
  `con_id` bigint COMMENT '会议id',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `course_status` int COMMENT '课程状态(1-可预约,2-不可预约,3-可加入队列等待,4-其他状态)',
  `course_scale` string COMMENT '课程规模',
  `course_address` string COMMENT '课程地址',
  `total_quantity` int COMMENT '总数量',
  `remain_quantity` int COMMENT '剩余数量',
  `select_quantity` int COMMENT '选择数量',
  `queue_quantity` int COMMENT '排队数量',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会议课程主表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_conference_course';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_conference_course_agenda` (
  `id` bigint COMMENT '',
  `course_id` bigint COMMENT '课程id',
  `con_agenda_id` bigint COMMENT '会议日程id',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会议课程子表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_conference_course_agenda';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_conference_event` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '会议id',
  `con_event` string COMMENT '事件名称',
  `start_time` timestamp COMMENT '事件开始时间',
  `end_time` timestamp COMMENT '事件结束时间',
  `event_url` string COMMENT '事件链接',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会议事件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_conference_event';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_conference_menu` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '会议id',
  `con_menu` string COMMENT '会议菜单项',
  `menu_url_allin` string COMMENT '网站版菜单项url地址',
  `page_storage_path` string COMMENT '网站版菜单项存储路径',
  `web_storage_path` string COMMENT '手机版菜单项存储路径',
  `caos_storage_path` string COMMENT 'CAOS菜单项存储路径',
  `tpl_path` string COMMENT 'tpl路径',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `tree_level` int COMMENT '节点级别',
  `parent_id` bigint COMMENT '父节点',
  `share_short_url` string COMMENT '转换的短链接'
) COMMENT '会议菜单项'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_conference_menu';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_conference_menu_recommend` (
  `id` bigint COMMENT '',
  `site_id` int COMMENT '站点id',
  `con_id` bigint COMMENT '会议id',
  `menu_id` bigint COMMENT '菜单id',
  `recommend_type` int COMMENT '1-栏目,2-广告位',
  `recommend_id` bigint COMMENT '关联id',
  `recommend_num` int COMMENT '推荐显示条数',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `type_id` int COMMENT '关联类型id(1-栏目,2-广告位)'
) COMMENT '会议菜单对应信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_conference_menu_recommend';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_conference_person` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '会议id',
  `con_name` string COMMENT '会议',
  `person_name` string COMMENT '参会人姓名',
  `person_logo_url` string COMMENT '个人照片地址',
  `sex_id` int COMMENT '性别id',
  `sex` string COMMENT '性别',
  `age` string COMMENT '年龄',
  `person_intro` string COMMENT '参会人简介',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '参会人员'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_conference_person';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_conference_pic` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '会议编号',
  `con_sub_id` bigint COMMENT '分会场编号',
  `con_pic_type` int COMMENT '图片类型(1-会议头图,等等)',
  `con_pic_url` string COMMENT '图片地址',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会议图片'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_conference_pic';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_conference_product` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '会议id',
  `product_id` bigint COMMENT '商品id',
  `group_id` bigint COMMENT '所属组id（1-厂商、2-医生）',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会议商品对应关系'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_conference_product';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_conference_register` (
  `id` bigint COMMENT '',
  `user_id` bigint COMMENT '参会人员id',
  `con_id` bigint COMMENT '会议id',
  `email` string COMMENT '邮箱',
  `regist_email_time` timestamp COMMENT '注册邮箱时间',
  `mobile` string COMMENT '手机号',
  `regist_mobile_time` timestamp COMMENT '注册手机时间',
  `weixin_code` string COMMENT '微信号',
  `init_passwd` string COMMENT '明码密码',
  `passwd` string COMMENT '加密密码',
  `user_level_id` int COMMENT '参会人级别1-caos会员，2-普通医生，3-研究生',
  `caos_customer_id` bigint COMMENT '关联caos会员id',
  `last_name` string COMMENT '姓',
  `first_name` string COMMENT '名',
  `areas_expertise_id` bigint COMMENT '擅长领域id',
  `areas_expertise` string COMMENT '擅长领域',
  `company` string COMMENT '单位',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `detail_address` string COMMENT '详细地址',
  `zip_code` string COMMENT '邮政编码',
  `is_pay` int COMMENT '是否缴费',
  `pay_time` timestamp COMMENT '付款时间',
  `is_print` int COMMENT '是否打印确认函',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点id',
  `contact_mobile` string COMMENT '联系手机',
  `contact_email` string COMMENT '联系邮箱'
) COMMENT '参会注册'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_conference_register';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_conference_register_course` (
  `id` bigint COMMENT '',
  `user_id` bigint COMMENT '参会人id',
  `course_id` bigint COMMENT '课程id',
  `course_name` string COMMENT '课程名称',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `select_status` int COMMENT '选课状态(0-确认中,1-选中,2-排队中,3-未选中,4-取消)',
  `is_email` int COMMENT '是否发送邮件',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点id'
) COMMENT '参会人选课情况'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_conference_register_course';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_conference_register_identity` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '会议id',
  `usr_id` bigint COMMENT '参会者id',
  `identity_id` int COMMENT '1-发言人、2-主持人、3-vip... ...',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '参会者身份表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_conference_register_identity';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_conference_register_old` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '会议id',
  `con_sub_id` bigint COMMENT '分会id',
  `customer_id` bigint COMMENT '会员id',
  `apply_reg_timestamp` timestamp COMMENT '申请登记时间',
  `reg_state` int COMMENT '登记状态',
  `approval_reg_timestamp` timestamp COMMENT '批准时间',
  `register_desc` string COMMENT '申请描述',
  `is_room` int COMMENT '是否住宿',
  `is_board` int COMMENT '是否就餐',
  `is_expert` int COMMENT '是否专家',
  `is_pay` int COMMENT '是否缴费',
  `sort_id` int COMMENT '排序'
) COMMENT '参会登记'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_conference_register_old';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_conference_sub` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '会议id',
  `con_sub_name` string COMMENT '会议名称',
  `con_sub_place` string COMMENT '会议地点',
  `con_sub_intro` string COMMENT '会议简介',
  `con_host` string COMMENT '主办方',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `live_id` string COMMENT '直播id',
  `play_back_id` string COMMENT '回播id',
  `is_online` int COMMENT '是否在线直播',
  `authority` int COMMENT '观看权限(1所有、2登录、3认证、4caos缴费)',
  `authcode` string COMMENT '普通参加者口令',
  `con_sub_type` int COMMENT '1-分会,2-卫星会',
  `con_sub_pic_url` string COMMENT '分会直播主图地址',
  `con_sub_web_url` string COMMENT '分会web直播主图地址',
  `con_sub_room` string COMMENT '安卓,ios直播房间号',
  `online_short_link` string COMMENT '直播短链接',
  `back_short_link` string COMMENT '回播短链接',
  `online_long_link` string COMMENT '直播长链接',
  `back_long_link` string COMMENT '回播长链接',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '分会信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_conference_sub';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_conference_tag` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '会议id',
  `con_name` string COMMENT '会议标题',
  `tag_id` bigint COMMENT 'tag_id',
  `tag_name` string COMMENT 'tag名称',
  `tag_parent_id` bigint COMMENT 'tag父节点',
  `tag_full_path` string COMMENT 'tag完全路径',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会议-tag-mapping'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_conference_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cooperation_invoke_api` (
  `id` bigint COMMENT '',
  `title_id` string COMMENT '文章id',
  `ref_customer_id` bigint COMMENT '对应会员id(oe等合作组织会员id)',
  `invoke_element` string COMMENT '元素名称',
  `content` string COMMENT '元素内容：原文/翻译/校对(xmljson等)',
  `api_url` string COMMENT '对方接口地址',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `doc_id` bigint COMMENT '文库id'
) COMMENT '第三方合作接口表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cooperation_invoke_api';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cooperation_invoke_element` (
  `id` bigint COMMENT '',
  `title_id` string COMMENT '文章id',
  `ref_customer_id` bigint COMMENT '对应会员id(oe等合作组织会员id)',
  `type_id` int COMMENT '1原文、2译文、3校对',
  `invoke_element` string COMMENT '元素名称',
  `content` string COMMENT '元素内容：原文/翻译/校对',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `doc_id` bigint COMMENT '文库id'
) COMMENT '第三方资源元素'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cooperation_invoke_element';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_cooperation_resource` (
  `id` bigint COMMENT '',
  `ref_customer_id` bigint COMMENT '对应会员id(oe等合作组织会员id)',
  `type_id` int COMMENT '1原文、2译文、3校对',
  `tpl_path` string COMMENT '模版路径',
  `title_id` string COMMENT '文章id',
  `title` string COMMENT '文章标题',
  `resource_abstract` string COMMENT '摘要',
  `resource_body` string COMMENT '正文',
  `last_modify_time` timestamp COMMENT '最近一次修改时间',
  `create_time` timestamp COMMENT '创建时间',
  `resource_status` int COMMENT '状态',
  `is_valid` int COMMENT '是否有效',
  `doc_id` bigint COMMENT '文库id'
) COMMENT '第三方资源'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_cooperation_resource';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_ability_attribute` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '医生id',
  `content_describe` string COMMENT '内容描述',
  `content_type` int COMMENT '内容类型：1-患者美誉2-执业成就3-学术能力',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `sort_id` int COMMENT '排序id',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `send_site_id` int COMMENT '站点id'
) COMMENT '医生能力属性表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_ability_attribute';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_activity_score` (
  `id` bigint COMMENT '',
  `activity_id` bigint COMMENT '活动id',
  `customer_id` bigint COMMENT '专家id',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `ref_id` bigint COMMENT '关联id',
  `ref_type` int COMMENT '关联类型(1-视频,2-文库,4-话题,7-病例)',
  `score_type` int COMMENT '评分类型(老版：1-视频、2-手术病例、3-非手术病例；新版：1-视频、2-文库、4-话题、7-病例)',
  `score` double COMMENT '总得分',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `record_id` bigint COMMENT '阶段评分记录id'
) COMMENT '活动会员总分表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_activity_score';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_activity_score_detail` (
  `id` bigint COMMENT '',
  `activity_id` bigint COMMENT '活动id',
  `customer_id` bigint COMMENT '专家id',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `score_id` bigint COMMENT '活动评分配置id',
  `ref_id` bigint COMMENT '关联id',
  `ref_type` int COMMENT '关联类型(1-视频,2-文库,4-话题,7-病例)',
  `score_type` int COMMENT '评分类型(1-视频、2-手术病例、3-非手术病例)',
  `score` double COMMENT '得分数',
  `score_term_type` int COMMENT '评分项类型(0.打分、1.评论)',
  `score_remark` string COMMENT '评论描述',
  `config_name` string COMMENT '配置项名称',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `record_id` bigint COMMENT '阶段评分记录id'
) COMMENT '活动会员评分明细表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_activity_score_detail';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_activity_score_result` (
  `id` bigint COMMENT '',
  `activity_id` bigint COMMENT '活动id',
  `ref_customer_id` bigint COMMENT '会员id',
  `property_id` bigint COMMENT '资源属性id',
  `ref_id` bigint COMMENT '关联id',
  `ref_type` int COMMENT '关联类型(1-视频,2-文库,4-话题,7-病例)',
  `score_type` int COMMENT '评分类型(老版：1-视频、2-手术病例、3-非手术病例；新版：1-视频、2-文库、4-话题、7-病例)',
  `property_full_path` string COMMENT '上级路径（拼串形式存放上级propertyId）',
  `score` decimal COMMENT '总分值',
  `score_authority` decimal COMMENT '分值权重',
  `score_authority_secondary` decimal COMMENT '次要分值权重',
  `browse_num` bigint COMMENT '浏览数',
  `review_num` bigint COMMENT '评论数',
  `prefer_up_num` bigint COMMENT '赞数',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `share_num` bigint COMMENT '分享数',
  `record_id` bigint COMMENT '阶段评分记录id'
) COMMENT '会员活动结果表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_activity_score_result';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_address` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员ID',
  `address_id` bigint COMMENT '地址ID',
  `address_type` int COMMENT '地址类型：1-通讯地址,2-多中心用户信息',
  `address_default` int COMMENT '是否是默认：1-是；0-否',
  `address_consignee` string COMMENT '收货人',
  `mobile` string COMMENT '手机号',
  `tel_phone` string COMMENT '固定电话',
  `email` string COMMENT '邮箱',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省ID',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `address_full` string COMMENT '详细地址',
  `address_alias` string COMMENT '别名：家里、父母家、公司等',
  `postcode` string COMMENT '邮政编码',
  `send_site_id` int COMMENT '站点来源',
  `is_valid` int COMMENT '是否有效1-有效 0-无效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员地址表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_address';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_article` (
  `id` bigint COMMENT '',
  `article_id` bigint COMMENT '文章id（生成id规则：毫秒数）',
  `customer_id` bigint COMMENT '会员id',
  `article_name` string COMMENT '文章标题',
  `article_source` string COMMENT '文章来源',
  `article_abstract` string COMMENT '文章摘要',
  `article_url` string COMMENT '文章url',
  `article_status` int COMMENT '文章状态',
  `create_time` timestamp COMMENT '创作时间',
  `publish_time` timestamp COMMENT '发布时间',
  `browse_num` bigint COMMENT '浏览数',
  `note_num` bigint COMMENT '笔记数',
  `topic_num` bigint COMMENT '话题数',
  `follow_num` bigint COMMENT '关注数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `share_num` bigint COMMENT '分享数',
  `up_num` bigint COMMENT '赞数',
  `score` double COMMENT '评分',
  `is_customer_essential` int COMMENT '是否精华（会员设置）',
  `is_sys_essential` int COMMENT '是否精华（系统设置）',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员文章'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_article';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_article_attachment` (
  `id` bigint COMMENT '',
  `article_id` bigint COMMENT '文章id',
  `article_att_type` int COMMENT '文章附件类型：1-图片，2-视频......',
  `article_att_size` string COMMENT '文章附件大小：KB',
  `article_att_format` string COMMENT '文章附件格式：jpg、mp4...',
  `article_att_spec` string COMMENT '文章附件规格：高清、标清...',
  `article_att_height` string COMMENT '文章附件高度',
  `article_att_width` string COMMENT '文章附件宽度',
  `article_att_url` string COMMENT '文章附件url',
  `upload_time` timestamp COMMENT '文章附件上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '文章附件详细信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_article_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_article_body` (
  `id` bigint COMMENT '',
  `article_id` bigint COMMENT '文章标题',
  `article_body` string COMMENT '文章内容',
  `modify_time` timestamp COMMENT '更新时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员文章内容'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_article_body';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_article_resource` (
  `id` bigint COMMENT '',
  `article_id` bigint COMMENT '文章id',
  `article_resource_type` int COMMENT '文章资源类型：1-图片，2-视频......',
  `article_resource_size` string COMMENT '文章资源大小：KB',
  `article_resource_format` string COMMENT '文章资源格式：jpg、mp4...',
  `article_resource_url` string COMMENT '文章资源url',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '文章资源文件详细信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_article_resource';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_article_tag` (
  `id` bigint COMMENT '',
  `article_id` bigint COMMENT '文章id',
  `article_name` string COMMENT '文章标题',
  `tag_id` bigint COMMENT 'tag_id',
  `tag_name` string COMMENT 'tag名称',
  `tag_parent_id` bigint COMMENT 'tag父节点',
  `tag_full_path` string COMMENT 'tag完全路径',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '文章-tag-mapping'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_article_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_attachment_revise` (
  `id` bigint COMMENT '',
  `revise_id` bigint COMMENT '变更id',
  `customer_id` bigint COMMENT '会员id',
  `att_type` bigint COMMENT '附件类型(comm_data_certificate.id)',
  `att_code` string COMMENT '附件号码',
  `att_path` string COMMENT '附件地址',
  `att_format` string COMMENT '附件格式：jpg、mp4...',
  `update_att_type` bigint COMMENT '附件类型(comm_data_certificate.id)',
  `update_att_code` string COMMENT '附件号码',
  `update_att_path` string COMMENT '附件地址',
  `update_att_format` string COMMENT '附件格式：jpg、mp4...',
  `att_position_type` int COMMENT '位置标识',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `sort_id` int COMMENT '排序',
  `send_site_id` int COMMENT '站点'
) COMMENT '申请认证会员上传资料'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_attachment_revise';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_audit` (
  `id` bigint COMMENT '主键',
  `customer_id` bigint COMMENT '会员id',
  `audit_remark` string COMMENT '审核备注',
  `auditor` string COMMENT '审核人',
  `resource_id` bigint COMMENT '来源id（如认证变更id）',
  `audit_type` int COMMENT '审核类型(1-首次提交2-变更提交3-补全信息4-重新提交)',
  `audit_time` timestamp COMMENT '审核时间(处理时间)',
  `state` int COMMENT '认证状态(-1-无认证信息、0-二次提交认证、1-认证通过、2-运营确认、3-认证拒绝7-执业医师申请 8-执业医师确认 9-执业医师拒绝)',
  `audit_state` int COMMENT '处理状态(1-未处理2-已处理)',
  `send_site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效',
  `sort_id` int COMMENT '排序',
  `last_update_time` timestamp COMMENT '最后修改时间',
  `create_time` timestamp COMMENT '创建时间',
  `audit_change_state` int COMMENT '认证状态(1-未处理2-变更通过3-变更拒绝)',
  `refuse_reason` string COMMENT '审核拒绝原因'
) COMMENT '会员审核表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_audit';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_audit_201812110954` (
  `id` bigint COMMENT '主键',
  `customer_id` bigint COMMENT '会员id',
  `audit_remark` string COMMENT '审核备注',
  `auditor` string COMMENT '审核人',
  `resource_id` bigint COMMENT '来源id（如认证变更id）',
  `audit_type` int COMMENT '审核类型(1-首次提交2-变更提交3-补全信息4-重新提交)',
  `audit_time` timestamp COMMENT '审核时间(处理时间)',
  `state` int COMMENT '认证状态(-1-无认证信息、0-二次提交认证、1-认证通过、2-运营确认、3-认证拒绝7-执业医师申请 8-执业医师确认 9-执业医师拒绝)',
  `audit_state` int COMMENT '处理状态(1-未处理2-已处理)',
  `send_site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效',
  `sort_id` int COMMENT '排序',
  `last_update_time` timestamp COMMENT '最后修改时间',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员审核表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_audit_201812110954';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_auth` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `auth_date` timestamp COMMENT '认证时间',
  `first_name` string COMMENT '名',
  `last_name` string COMMENT '姓',
  `certificates_id` int COMMENT '证件类型',
  `certificates_code` string COMMENT '证件号码',
  `certificates_path` string COMMENT '证件附件地址',
  `qualification_code` string COMMENT '医师资格证',
  `qualification_path` string COMMENT '医师资格证附件地址',
  `company_id` bigint COMMENT '医院id',
  `company` string COMMENT '工作单位',
  `department` string COMMENT '科室／部门',
  `areas_expertise` string COMMENT '专业领域',
  `medical_title_id` int COMMENT '医师职称id',
  `medical_title` string COMMENT '医师职称',
  `social_title` string COMMENT '社会职称',
  `degree_certificate_code` string COMMENT '医学学位证号',
  `degree_certificate_path` string COMMENT '医学学位证附件地址',
  `school_id` bigint COMMENT '学校id',
  `school_name` string COMMENT '学校名称',
  `major_id` bigint COMMENT '专业id',
  `major_name` string COMMENT '专业名称',
  `degree_id` int COMMENT '学位',
  `degree_name` string COMMENT '学位名称',
  `state` int COMMENT '认证状态(-1-无认证信息、0-二次提交认证、1-认证通过、2-运营确认、3-认证拒绝)',
  `clinical_time` string COMMENT '临床时间',
  `send_site_id` int COMMENT '站点',
  `first_name_en` string COMMENT '名en',
  `last_name_en` string COMMENT '姓en',
  `medical_title_en` string COMMENT '医师职称en',
  `company_en` string COMMENT '工作单位',
  `full_name` string COMMENT '姓名',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `create_time` timestamp COMMENT '创建时间',
  `birth_year` timestamp COMMENT '出生年月日',
  `clinical_year` timestamp COMMENT '临床时间',
  `yesteryear_operation_num` int COMMENT '去年手术数',
  `precedingyear_operation_num` int COMMENT '前年手术数',
  `illness_id_list` string COMMENT '疾病idlist',
  `base_id` bigint COMMENT '基地id',
  `base_name` string COMMENT '基地',
  `receive_state` int COMMENT '接诊状态 0不接诊1接诊',
  `practice_auth_time` timestamp COMMENT '申请执业医生认证时间',
  `doctor_type` int COMMENT '执业医师类型1-轻问诊医生2-权威医生',
  `update_time` timestamp COMMENT ''
) COMMENT '会员认证信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_auth';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_auth_20180319` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `auth_date` timestamp COMMENT '认证时间',
  `first_name` string COMMENT '名',
  `last_name` string COMMENT '姓',
  `certificates_id` int COMMENT '证件类型',
  `certificates_code` string COMMENT '证件号码',
  `certificates_path` string COMMENT '证件附件地址',
  `qualification_code` string COMMENT '医师资格证',
  `qualification_path` string COMMENT '医师资格证附件地址',
  `company_id` bigint COMMENT '医院id',
  `company` string COMMENT '工作单位',
  `department` string COMMENT '科室／部门',
  `areas_expertise` string COMMENT '专业领域',
  `medical_title_id` int COMMENT '医师职称id',
  `medical_title` string COMMENT '医师职称',
  `social_title` string COMMENT '社会职称',
  `degree_certificate_code` string COMMENT '医学学位证号',
  `degree_certificate_path` string COMMENT '医学学位证附件地址',
  `school_id` bigint COMMENT '学校id',
  `school_name` string COMMENT '学校名称',
  `major_id` bigint COMMENT '专业id',
  `major_name` string COMMENT '专业名称',
  `degree_id` int COMMENT '学位',
  `degree_name` string COMMENT '学位名称',
  `state` int COMMENT '认证状态(-1-无认证信息、0-二次提交认证、1-认证通过、2-运营确认、3-认证拒绝)',
  `clinical_time` string COMMENT '临床时间',
  `send_site_id` int COMMENT '站点',
  `first_name_en` string COMMENT '名en',
  `last_name_en` string COMMENT '姓en',
  `medical_title_en` string COMMENT '医师职称en',
  `company_en` string COMMENT '工作单位',
  `full_name` string COMMENT '姓名',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `create_time` timestamp COMMENT '创建时间',
  `birth_year` timestamp COMMENT '出生年月日',
  `clinical_year` timestamp COMMENT '临床时间',
  `yesteryear_operation_num` int COMMENT '去年手术数',
  `precedingyear_operation_num` int COMMENT '前年手术数',
  `illness_id_list` string COMMENT '疾病idlist',
  `base_id` bigint COMMENT '基地id',
  `base_name` string COMMENT '基地',
  `receive_state` int COMMENT '接诊状态 0不接诊1接诊',
  `practice_auth_time` timestamp COMMENT '申请执业医生认证时间',
  `doctor_type` int COMMENT '执业医师类型1-轻问诊医生2-权威医生'
) COMMENT '会员认证信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_auth_20180319';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_auth_20180321` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `auth_date` timestamp COMMENT '认证时间',
  `first_name` string COMMENT '名',
  `last_name` string COMMENT '姓',
  `certificates_id` int COMMENT '证件类型',
  `certificates_code` string COMMENT '证件号码',
  `certificates_path` string COMMENT '证件附件地址',
  `qualification_code` string COMMENT '医师资格证',
  `qualification_path` string COMMENT '医师资格证附件地址',
  `company_id` bigint COMMENT '医院id',
  `company` string COMMENT '工作单位',
  `department` string COMMENT '科室／部门',
  `areas_expertise` string COMMENT '专业领域',
  `medical_title_id` int COMMENT '医师职称id',
  `medical_title` string COMMENT '医师职称',
  `social_title` string COMMENT '社会职称',
  `degree_certificate_code` string COMMENT '医学学位证号',
  `degree_certificate_path` string COMMENT '医学学位证附件地址',
  `school_id` bigint COMMENT '学校id',
  `school_name` string COMMENT '学校名称',
  `major_id` bigint COMMENT '专业id',
  `major_name` string COMMENT '专业名称',
  `degree_id` int COMMENT '学位',
  `degree_name` string COMMENT '学位名称',
  `state` int COMMENT '认证状态(-1-无认证信息、0-二次提交认证、1-认证通过、2-运营确认、3-认证拒绝)',
  `clinical_time` string COMMENT '临床时间',
  `send_site_id` int COMMENT '站点',
  `first_name_en` string COMMENT '名en',
  `last_name_en` string COMMENT '姓en',
  `medical_title_en` string COMMENT '医师职称en',
  `company_en` string COMMENT '工作单位',
  `full_name` string COMMENT '姓名',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `create_time` timestamp COMMENT '创建时间',
  `birth_year` timestamp COMMENT '出生年月日',
  `clinical_year` timestamp COMMENT '临床时间',
  `yesteryear_operation_num` int COMMENT '去年手术数',
  `precedingyear_operation_num` int COMMENT '前年手术数',
  `illness_id_list` string COMMENT '疾病idlist',
  `base_id` bigint COMMENT '基地id',
  `base_name` string COMMENT '基地',
  `receive_state` int COMMENT '接诊状态 0不接诊1接诊',
  `practice_auth_time` timestamp COMMENT '申请执业医生认证时间',
  `doctor_type` int COMMENT '执业医师类型1-轻问诊医生2-权威医生'
) COMMENT '会员认证信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_auth_20180321';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_auth_20180614` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `auth_date` timestamp COMMENT '认证时间',
  `first_name` string COMMENT '名',
  `last_name` string COMMENT '姓',
  `certificates_id` int COMMENT '证件类型',
  `certificates_code` string COMMENT '证件号码',
  `certificates_path` string COMMENT '证件附件地址',
  `qualification_code` string COMMENT '医师资格证',
  `qualification_path` string COMMENT '医师资格证附件地址',
  `company_id` bigint COMMENT '医院id',
  `company` string COMMENT '工作单位',
  `department` string COMMENT '科室／部门',
  `areas_expertise` string COMMENT '专业领域',
  `medical_title_id` int COMMENT '医师职称id',
  `medical_title` string COMMENT '医师职称',
  `social_title` string COMMENT '社会职称',
  `degree_certificate_code` string COMMENT '医学学位证号',
  `degree_certificate_path` string COMMENT '医学学位证附件地址',
  `school_id` bigint COMMENT '学校id',
  `school_name` string COMMENT '学校名称',
  `major_id` bigint COMMENT '专业id',
  `major_name` string COMMENT '专业名称',
  `degree_id` int COMMENT '学位',
  `degree_name` string COMMENT '学位名称',
  `state` int COMMENT '认证状态(-1-无认证信息、0-二次提交认证、1-认证通过、2-运营确认、3-认证拒绝)',
  `clinical_time` string COMMENT '临床时间',
  `send_site_id` int COMMENT '站点',
  `first_name_en` string COMMENT '名en',
  `last_name_en` string COMMENT '姓en',
  `medical_title_en` string COMMENT '医师职称en',
  `company_en` string COMMENT '工作单位',
  `full_name` string COMMENT '姓名',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `create_time` timestamp COMMENT '创建时间',
  `birth_year` timestamp COMMENT '出生年月日',
  `clinical_year` timestamp COMMENT '临床时间',
  `yesteryear_operation_num` int COMMENT '去年手术数',
  `precedingyear_operation_num` int COMMENT '前年手术数',
  `illness_id_list` string COMMENT '疾病idlist',
  `base_id` bigint COMMENT '基地id',
  `base_name` string COMMENT '基地',
  `receive_state` int COMMENT '接诊状态 0不接诊1接诊',
  `practice_auth_time` timestamp COMMENT '申请执业医生认证时间',
  `doctor_type` int COMMENT '执业医师类型1-轻问诊医生2-权威医生'
) COMMENT '会员认证信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_auth_20180614';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_auth_attachment` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `att_type` bigint COMMENT '附件类型(comm_data_certificate.id)',
  `att_code` string COMMENT '附件号码',
  `att_path` string COMMENT '附件地址',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效,扩展用于图片存储切换',
  `att_format` string COMMENT '附件格式：jpg、mp4...',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `send_site_id` int COMMENT '站点',
  `att_position_type` int COMMENT '位置标识',
  `sort_id` int COMMENT '排序'
) COMMENT '认证会员上传资料'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_auth_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_auth_attachment_20180731` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `att_type` bigint COMMENT '附件类型(comm_data_certificate.id)',
  `att_code` string COMMENT '附件号码',
  `att_path` string COMMENT '附件地址',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效,扩展用于图片存储切换',
  `att_format` string COMMENT '附件格式：jpg、mp4...',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `send_site_id` int COMMENT '站点',
  `att_position_type` int COMMENT '位置标识',
  `sort_id` int COMMENT '排序'
) COMMENT '认证会员上传资料'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_auth_attachment_20180731';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_auth_attachment_20180822` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `att_type` bigint COMMENT '附件类型(comm_data_certificate.id)',
  `att_code` string COMMENT '附件号码',
  `att_path` string COMMENT '附件地址',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效,扩展用于图片存储切换',
  `att_format` string COMMENT '附件格式：jpg、mp4...',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `send_site_id` int COMMENT '站点',
  `att_position_type` int COMMENT '位置标识',
  `sort_id` int COMMENT '排序'
) COMMENT '认证会员上传资料'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_auth_attachment_20180822';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_auth_attachment_20181107` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `att_type` bigint COMMENT '附件类型(comm_data_certificate.id)',
  `att_code` string COMMENT '附件号码',
  `att_path` string COMMENT '附件地址',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效,扩展用于图片存储切换',
  `att_format` string COMMENT '附件格式：jpg、mp4...',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `send_site_id` int COMMENT '站点',
  `att_position_type` int COMMENT '位置标识',
  `sort_id` int COMMENT '排序'
) COMMENT '认证会员上传资料'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_auth_attachment_20181107';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_auth_attachment_20181116` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `att_type` bigint COMMENT '附件类型(comm_data_certificate.id)',
  `att_code` string COMMENT '附件号码',
  `att_path` string COMMENT '附件地址',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效,扩展用于图片存储切换',
  `att_format` string COMMENT '附件格式：jpg、mp4...',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `send_site_id` int COMMENT '站点',
  `att_position_type` int COMMENT '位置标识',
  `sort_id` int COMMENT '排序'
) COMMENT '认证会员上传资料'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_auth_attachment_20181116';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_auth_operation` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员Id',
  `specialty_id` bigint COMMENT '专业Id',
  `specialty_name` string COMMENT '专业名称',
  `operation_id_list` string COMMENT '手术IdList',
  `operation_name_list` string COMMENT '手术名称list',
  `create_time` timestamp COMMENT '',
  `last_update_time` timestamp COMMENT '',
  `is_valid` int COMMENT '',
  `sort_id` int COMMENT '',
  `send_site_id` int COMMENT ''
) COMMENT '会员擅长手术表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_auth_operation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_auth_process` (
  `id` bigint COMMENT '',
  `auth_id` bigint COMMENT '认证信息id',
  `customer_id` bigint COMMENT '会员id',
  `auth_type` int COMMENT '类型：1：首次提交；2：二次提交;3:认证信息修改申请',
  `auth_date` timestamp COMMENT '认证时间',
  `auth_source` string COMMENT '认证来源（ip）',
  `auth_address` string COMMENT '认证地',
  `auth_way` string COMMENT '认证途径（手机、网站、app）',
  `state` int COMMENT '状态(-1-无认证信息、0-二次提交认证、1-认证通过、2-运营确认、3-认证拒绝、4-认证信息修改申请、5-认证信息修改确认、6-认证信息修改驳回)',
  `op_date` timestamp COMMENT '操作状态的时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `reason` string COMMENT '拒绝原因',
  `supplement` string COMMENT '补充资料',
  `is_send_email` bigint COMMENT '是否发送邮件（存放发送邮件的日志id）',
  `send_site_id` int COMMENT '站点',
  `update_full_name` string COMMENT '修改后名称',
  `update_areas_expertise` string COMMENT '修改后专业领域',
  `update_medical_title` string COMMENT '修改后医师职称',
  `update_workplace_type` bigint COMMENT '修改后单位类型1-医院2-学校',
  `update_workplace_id` bigint COMMENT '修改后单位Id',
  `update_workplace` string COMMENT '修改后单位',
  `before_full_name` string COMMENT '修改前名称',
  `before_areas_expertise` string COMMENT '修改前专业领域',
  `before_medical_title` string COMMENT '修改前医师职称',
  `before_workplace_type` bigint COMMENT '修改前单位类型1-医院2-学校',
  `before_workplace_id` bigint COMMENT '修改前单位Id',
  `before_workplace` string COMMENT '修改前单位',
  `before_platform_id` string COMMENT '修改前所属平台(1-骨科、2-手外科)',
  `update_platform_id` string COMMENT '修改后所属平台(1-骨科、2-手外科)',
  `create_time` timestamp COMMENT '创建时间',
  `before_clinical_year` timestamp COMMENT '修改前临床时间',
  `update_clinical_year` timestamp COMMENT '修改后临床时间'
) COMMENT '会员认证过程'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_auth_process';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_auth_refuse` (
  `id` bigint COMMENT '',
  `process_id` bigint COMMENT '认证过程id',
  `resoure_id` bigint COMMENT '审核话术来源id(comm_data_prompt)',
  `resource_content` string COMMENT '拒绝内容',
  `resource_question` string COMMENT '拒绝问题',
  `is_valid` int COMMENT '是否有效',
  `sort_id` int COMMENT '排序',
  `send_site_id` int COMMENT '站点id',
  `last_update_time` timestamp COMMENT '最后修改时间',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '审核过程拒绝表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_auth_refuse';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_auth_revise` (
  `id` bigint COMMENT '',
  `revise_id` bigint COMMENT '变更id',
  `customer_id` bigint COMMENT '',
  `full_name` string COMMENT '',
  `sex_id` int COMMENT '性别id',
  `sex` string COMMENT '性别',
  `birthday` string COMMENT '生日',
  `workplace_type` bigint COMMENT '修改前单位类型1-医院2-学校',
  `workplace_id` bigint COMMENT '修改前单位Id',
  `workplace` string COMMENT '修改前单位',
  `medical_title` string COMMENT '修改前医师职称',
  `platform_id` string COMMENT '修改前所属平台(1-骨科、2-手外科)',
  `areas_expertise` string COMMENT '专业领域',
  `update_full_name` string COMMENT '',
  `update_sex_id` int COMMENT '性别id',
  `update_sex` string COMMENT '性别',
  `update_birthday` string COMMENT '生日',
  `update_workplace_type` bigint COMMENT '修改后单位类型1-医院2-学校',
  `update_workplace_id` bigint COMMENT '修改后单位Id',
  `update_workplace` string COMMENT '修改后单位',
  `update_medical_title` string COMMENT '修改后医师职称',
  `update_platform_id` string COMMENT '修改所属平台(1-骨科、2-手外科)',
  `update_areas_expertise` string COMMENT '专业领域',
  `state` int COMMENT '状态0-申请中1-审核通过2-审核拒绝',
  `approval_time` timestamp COMMENT '',
  `create_time` timestamp COMMENT '',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '',
  `auth_type` int COMMENT '当前用户认证类型0-v1,1-v2',
  `reason` string COMMENT '拒绝理由'
) COMMENT '申请认证变更'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_auth_revise';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_baseinfo` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `level_id` int COMMENT '会员等级',
  `nickname` string COMMENT '昵称',
  `logo_url` string COMMENT '头像',
  `sex_id` int COMMENT '性别id',
  `sex` string COMMENT '性别',
  `marriage_id` int COMMENT '婚姻状况id',
  `marriage` string COMMENT '婚姻状况',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `areas_expertise` string COMMENT '专业领域',
  `summary` string COMMENT '摘要',
  `regist_time` timestamp COMMENT '注册时间',
  `regist_ip` string COMMENT '注册来源（ip）',
  `regist_address` string COMMENT '注册地',
  `regist_source` string COMMENT '注册途径（手机、网站、app）',
  `signature` string COMMENT '个性签名',
  `per_website` string COMMENT '个性网址',
  `baseinfo_url` string COMMENT '个人资料url',
  `recommend` string COMMENT '会员推荐语',
  `birthday` string COMMENT '生日',
  `send_site_id` int COMMENT '站点',
  `summary_en` string COMMENT '摘要en',
  `regist_address_en` string COMMENT '英文地址',
  `create_time` timestamp COMMENT '创建时间',
  `native_place_id` bigint COMMENT '籍贯id',
  `native_place` string COMMENT '籍贯',
  `nationality_id` bigint COMMENT '民族id',
  `nationality` string COMMENT '民族',
  `politics_status_id` bigint COMMENT '政治面貌id',
  `politics_status` string COMMENT '政治面貌',
  `send_word` string COMMENT '医生寄语',
  `expertise` string COMMENT '医生自定义擅长领域',
  `update_time` timestamp COMMENT ''
) COMMENT '会员基础信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_baseinfo';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_blacklist` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `blacklist_type` string COMMENT '黑名单类型',
  `blacklist_id` bigint COMMENT '黑名单id',
  `blacklist_name` string COMMENT '黑名单名称',
  `create_time` timestamp COMMENT '创建问题时间',
  `sort_id` int COMMENT '排序'
) COMMENT '会员自设置黑名单'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_blacklist';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_check_email` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `email` string COMMENT '会员邮箱',
  `email_content` string COMMENT '邮件内容',
  `check_email_url` string COMMENT 'url地址',
  `apply_source` int COMMENT '来源',
  `apply_time` timestamp COMMENT '提交时间',
  `send_mail_time` timestamp COMMENT '发送时间',
  `confirm_time` timestamp COMMENT '验证时间',
  `site_id` int COMMENT '关联站点(1-allin 2-CAOS)',
  `valid_code` string COMMENT '加密链接',
  `is_valid` int COMMENT '是否有效'
) COMMENT '验证邮箱'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_check_email';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_collection` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `collection_type` int COMMENT '收藏类型（1-视频，2-文库，3-会议，4-话题 ,5-笔记,6-体系化课程）',
  `ref_id` bigint COMMENT '收藏具体信息id',
  `ref_customer_id` bigint COMMENT '冗余存放资源相关会员id',
  `ref_name` string COMMENT '收藏具体信息名字',
  `ref_url` string COMMENT '收藏地址',
  `collection_category_id` bigint COMMENT '收藏分类',
  `collection_time` timestamp COMMENT '收藏时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效（0-取消收藏；1-添加收藏）',
  `ref_content` string COMMENT '资源对应摘要',
  `send_site_id` int COMMENT '发送渠道'
) COMMENT '会员收藏'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_collection';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_collection_category` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `parent_id` bigint COMMENT '父节点id',
  `collection_category_id` bigint COMMENT '分类id',
  `collection_category` string COMMENT '分类名称',
  `create_time` timestamp COMMENT '创建时间',
  `modify_time` timestamp COMMENT '修改时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员收藏分类'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_collection_category';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_config` (
  `id` bigint COMMENT '',
  `site_id` int COMMENT '站点id',
  `customre_id` bigint COMMENT '会员id',
  `ref_id` bigint COMMENT '关联属性id',
  `ref_name` string COMMENT '关联属性名称',
  `ref_value` string COMMENT '关联属性值',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '个人设置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_config';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_continuing_education` (
  `id` bigint COMMENT 'ID',
  `customer_id` bigint COMMENT '会员id',
  `site_ref_id` bigint COMMENT '网内关联继续教育id',
  `education_name` string COMMENT '继续教育title',
  `organization` string COMMENT '所属机构',
  `adress` string COMMENT '地点',
  `certificate` string COMMENT '获得证书',
  `cme_desc` string COMMENT '描述',
  `start_time` timestamp COMMENT '开始',
  `end_time` timestamp COMMENT '结束',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `language_flag` int COMMENT '0-中文、1-英文',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员继续教育信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_continuing_education';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_correct` (
  `id` bigint COMMENT '',
  `correct_id` bigint COMMENT '纠错内容序列号',
  `state` int COMMENT '纠错处理状态（1-等待，2-处理中，3-已处理）',
  `create_time` timestamp COMMENT '纠错时间((yyyy-mm-dd  hh:mm:ss))',
  `resource_id` bigint COMMENT '纠错对象ID',
  `resource_type` bigint COMMENT '资源类型(1-视频，2-文库，4-话题 ,7-病例)',
  `customer_id` bigint COMMENT '纠错人ID  ，如果没有可以为空',
  `review_id` bigint COMMENT '评论ID（备用）',
  `correct_content_origin` string COMMENT '纠错内容  原文',
  `correct_content_suggest` string COMMENT '纠错内容  新文',
  `deal_user_id` bigint COMMENT '纠错处理人(后台人员id)',
  `deal_time` timestamp COMMENT '纠错处理时间(yyyy-mm-dd  hh:mm:ss)',
  `deal_result` string COMMENT '处理方式-手动输入',
  `remark` string COMMENT '(备注) 允许管理员手动输入与编辑',
  `send_site_id` int COMMENT '操作来源 （1-pc、2-H5、5-ios、6-android）',
  `is_valid` int COMMENT '是否有效'
) COMMENT '用户纠错表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_correct';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_data_visualization` (
  `id` bigint COMMENT '',
  `result` string COMMENT '存储结果',
  `total` int COMMENT '统计的总数',
  `operation_time` string COMMENT '操作时间'
) COMMENT '会员数据可视化'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_data_visualization';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_discuss` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `parent_id` bigint COMMENT '父节点',
  `discuss_type` int COMMENT '（1-视频，2-文库，3-会议，4-话题 ,5-笔记）',
  `ref_id` bigint COMMENT '关联信息id',
  `discuss_content` string COMMENT '讨论内容',
  `publish_time` timestamp COMMENT '发布时间',
  `if_anonymous` int COMMENT '是否匿名',
  `recommend_num` bigint COMMENT '推荐数',
  `collection_num` bigint COMMENT '收藏数',
  `discuss_num` bigint COMMENT '评论数',
  `share_num` bigint COMMENT '转发数',
  `up_num` bigint COMMENT '点赞数',
  `if_header` int COMMENT '是否置顶',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员讨论'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_discuss';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_draft` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `ref_type` int COMMENT '草稿资源类型(1-视频，2-文库，4-话题,7-病例,8-回应)',
  `ref_id` bigint COMMENT '草稿资源id',
  `create_time` timestamp COMMENT '插入到数据库时间',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `is_valid` int COMMENT '是否有效',
  `is_remind` int COMMENT '是否提示编辑'
) COMMENT '会员草稿'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_draft';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_education` (
  `id` bigint COMMENT 'ID',
  `customer_id` bigint COMMENT '会员id',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家id',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `university_id` bigint COMMENT '学校id',
  `university` string COMMENT '学校名称',
  `start_time` timestamp COMMENT '就读开始时间',
  `end_time` timestamp COMMENT '就读结束时间',
  `up_now` int COMMENT '至今',
  `major_id` bigint COMMENT '专业id',
  `major` string COMMENT '专业',
  `education_id` bigint COMMENT '学历id',
  `education` string COMMENT '学历',
  `is_degree` int COMMENT '是否获得学位',
  `academic_degree_id` bigint COMMENT '学位id',
  `academic_degree` string COMMENT '学位',
  `total` int COMMENT '是否统招',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `language_flag` int COMMENT '0-中文、1-英文',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '教育背景'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_education';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_event` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `event_name` string COMMENT '事件名称',
  `event_type` int COMMENT '事件类型 1-系统自动生成 2-用户手动填写',
  `is_valid` int COMMENT '是否有效 1是 0否',
  `sort_id` int COMMENT '排序',
  `last_update_time` timestamp COMMENT '最后一次修改时间',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '用户大事件信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_event';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_fellowship` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `fellowship_id` bigint COMMENT 'fellowship项目编号',
  `fellowship_name` string COMMENT 'fellow项目名称',
  `state` int COMMENT '状态(1-申请未提交、2-等待初审、3-初审未通过、4-等待面试、5-面试未通过、6-面试已通过、7-活动截止)',
  `mobile` string COMMENT '电话',
  `weixin_code` string COMMENT '微信号',
  `email` string COMMENT '',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `detail_address` string COMMENT '详细地址',
  `zip_code` string COMMENT '邮政编码',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `is_agree_adjust` int COMMENT '是否同意调剂(0-不同意、1-同意)',
  `cv_time` timestamp COMMENT '确认简历时间',
  `is_advanced_members` int COMMENT '是否进修成员(0-不是、1-是)',
  `interview_result` string COMMENT '面试成绩',
  `certificates_id` int COMMENT '证件类型(1-身份证、2-护照、3-军官证)',
  `certificates_code` string COMMENT '证件号码',
  `highest_degree` int COMMENT '最高学历(1-博士后、2-博士研究生、3-硕士研究生、4-本科学士、5-大学专科)',
  `company_type` int COMMENT '单位性质(1-国有事业单位、2-私营)',
  `customer_type` int COMMENT '学员类型(1-地方人员、2-军人)',
  `practice_code` string COMMENT '医师执业证号',
  `qualification_code` string COMMENT '医师资格证号',
  `purpose_request` string COMMENT '进修目的及要求',
  `purpose_request_en` string COMMENT '进修目的及要求en',
  `company_id` bigint COMMENT '医院id',
  `company` string COMMENT '工作单位',
  `medical_title_id` int COMMENT '医师职称id',
  `medical_title` string COMMENT '医师职称',
  `medical_title_en` string COMMENT '医师职称en',
  `company_en` string COMMENT '工作单位en',
  `first_name` string COMMENT '名',
  `last_name` string COMMENT '姓',
  `first_name_en` string COMMENT '名en',
  `last_name_en` string COMMENT '姓en'
) COMMENT '会员fellowship'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_fellowship';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_fellowship_attachment` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `fellowship_id` bigint COMMENT '项目id',
  `fellowship_name` string COMMENT 'fellow项目名称',
  `fellowship_sub_id` bigint COMMENT 'fellow子项目',
  `fellowship_sub_name` string COMMENT 'fellow子项目',
  `fellowship_att_name` string COMMENT '',
  `fellowship_att_type` int COMMENT '上传内容：1-',
  `fellowship_att_format` string COMMENT '附件格式：jpg、mp4',
  `fellowship_att_url` string COMMENT '附件url',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点'
) COMMENT '会员fellowship资料表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_fellowship_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_fellowship_major` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `fellowship_id` bigint COMMENT 'fellow项目id',
  `fellowship_name` string COMMENT 'fellow项目名称',
  `fellowship_major_id` bigint COMMENT '业务主键id',
  `fellowship_department` int COMMENT '进修科室(1-骨科、2-大外科、3-临床)',
  `tag_id` bigint COMMENT 'tag_id',
  `tag_name` string COMMENT 'tag名称',
  `fellowship_date` string COMMENT '进修期限(1-两周、2-一个月、3-两个月、4-三个月、5-六个月、6-十二个月)',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员专业进修管理'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_fellowship_major';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_fellowship_state` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `fellowship_id` bigint COMMENT '项目id',
  `fellowship_name` string COMMENT 'fellow项目名称',
  `state` int COMMENT '状态',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员fellowship状态表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_fellowship_state';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_fellowship_sub` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `fellowship_id` bigint COMMENT 'fellowship项目编号',
  `fellowship_name` string COMMENT 'fellow项目名称',
  `fellowship_sub_id` bigint COMMENT 'fellowship子项目编号',
  `fellowship_sub_name` string COMMENT 'fellow子项目名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `stat_year` string COMMENT '年',
  `stat_month` string COMMENT '月',
  `stat_day` string COMMENT '日',
  `end_year` string COMMENT '年',
  `end_month` string COMMENT '月',
  `end_day` string COMMENT '日',
  `send_site_id` int COMMENT '站点'
) COMMENT '会员子fellowship'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_fellowship_sub';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_fellowship_topic` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `fellowship_id` bigint COMMENT 'fellowship项目编号',
  `topic_id` bigint COMMENT '话题id',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员进修话题关联表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_fellowship_topic';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_follow_category` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `follow_type` int COMMENT '（1-视频，2-文库，3-会议，4-话题 ,5-笔记，6-人）',
  `parent_id` bigint COMMENT '父节点id',
  `follow_category_id` bigint COMMENT '分类id',
  `follow_category` string COMMENT '分类名称',
  `create_time` timestamp COMMENT '创建时间',
  `modify_time` timestamp COMMENT '修改时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员关注分类'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_follow_category';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_follow_fans` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `fans_customer_id` bigint COMMENT '关注具体信息id',
  `fans_customer_name` string COMMENT '关注具体信息名称',
  `follow_time` timestamp COMMENT '关注时间',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地址',
  `is_valid` int COMMENT '是否有效',
  `relationship` int COMMENT '关系(1-未关注，2-已关注，3-粉丝，4-相互关注)',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `follow_type` int COMMENT '关注类型：1:人员关注，2:组织关注'
) COMMENT '会员关注－fans'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_follow_fans';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_follow_fans_20180608` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `fans_customer_id` bigint COMMENT '关注具体信息id',
  `fans_customer_name` string COMMENT '关注具体信息名称',
  `follow_time` timestamp COMMENT '关注时间',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地址',
  `is_valid` int COMMENT '是否有效',
  `relationship` int COMMENT '关系(1-未关注，2-已关注，3-粉丝，4-相互关注)',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员关注－fans'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_follow_fans_20180608';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_follow_fans_20181211` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `fans_customer_id` bigint COMMENT '关注具体信息id',
  `fans_customer_name` string COMMENT '关注具体信息名称',
  `follow_time` timestamp COMMENT '关注时间',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地址',
  `is_valid` int COMMENT '是否有效',
  `relationship` int COMMENT '关系(1-未关注，2-已关注，3-粉丝，4-相互关注)',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `follow_type` int COMMENT '关注类型：1:人员关注，2:组织关注'
) COMMENT '会员关注－fans'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_follow_fans_20181211';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_follow_people` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `ref_id` bigint COMMENT '关注具体信息id',
  `ref_name` string COMMENT '关注具体信息title',
  `follow_category` bigint COMMENT '关注人分类',
  `follow_time` timestamp COMMENT '关注时间',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地点',
  `is_valid` int COMMENT '是否有效',
  `relationship` int COMMENT '关系(1-未关注，2-已关注，3-粉丝，4-相互关注)',
  `is_permit` int COMMENT '是否禁止(0-不允许,１-允许)',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `follow_type` int COMMENT '关注类型：1:人员关注，2:组织关注'
) COMMENT '会员关注－人'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_follow_people';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_follow_people_20181211` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `ref_id` bigint COMMENT '关注具体信息id',
  `ref_name` string COMMENT '关注具体信息title',
  `follow_category` bigint COMMENT '关注人分类',
  `follow_time` timestamp COMMENT '关注时间',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地点',
  `is_valid` int COMMENT '是否有效',
  `relationship` int COMMENT '关系(1-未关注，2-已关注，3-粉丝，4-相互关注)',
  `is_permit` int COMMENT '是否禁止(0-不允许,１-允许)',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `follow_type` int COMMENT '关注类型：1:人员关注，2:组织关注'
) COMMENT '会员关注－人'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_follow_people_20181211';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_follow_resource` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `follow_type` int COMMENT '（1-视频，2-文库，3-会议，4-话题 ,5-笔记，6-标签属性,7-病例，61-新标签,8-特色栏目9-3.0课程栏目)',
  `ref_id` bigint COMMENT '关注具体信息id',
  `ref_name` string COMMENT '关注具体信息title',
  `follow_category` bigint COMMENT '关注分类',
  `follow_time` timestamp COMMENT '关注时间',
  `follow_url` string COMMENT '关注url',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地点',
  `is_valid` int COMMENT '是否有效',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '排序',
  `sort_ref_name` string COMMENT '关注资源名称首字母排序',
  `is_permit` int COMMENT '是否禁止(0-不允许,１-允许)',
  `send_site_id` int COMMENT '站点'
) COMMENT '会员关注－资源'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_follow_resource';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_follow_resource_20181101` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `follow_type` int COMMENT '（1-视频，2-文库，3-会议，4-话题 ,5-笔记，6-标签属性,7-病例，61-新标签,8-特色栏目9-3.0课程栏目)',
  `ref_id` bigint COMMENT '关注具体信息id',
  `ref_name` string COMMENT '关注具体信息title',
  `follow_category` bigint COMMENT '关注分类',
  `follow_time` timestamp COMMENT '关注时间',
  `follow_url` string COMMENT '关注url',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地点',
  `is_valid` int COMMENT '是否有效',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '排序',
  `sort_ref_name` string COMMENT '关注资源名称首字母排序',
  `is_permit` int COMMENT '是否禁止(0-不允许,１-允许)',
  `send_site_id` int COMMENT '站点'
) COMMENT '会员关注－资源'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_follow_resource_20181101';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_follow_resource_20181113` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `follow_type` int COMMENT '（1-视频，2-文库，3-会议，4-话题 ,5-笔记，6-标签属性,7-病例，61-新标签,8-特色栏目9-3.0课程栏目)',
  `ref_id` bigint COMMENT '关注具体信息id',
  `ref_name` string COMMENT '关注具体信息title',
  `follow_category` bigint COMMENT '关注分类',
  `follow_time` timestamp COMMENT '关注时间',
  `follow_url` string COMMENT '关注url',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地点',
  `is_valid` int COMMENT '是否有效',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '排序',
  `sort_ref_name` string COMMENT '关注资源名称首字母排序',
  `is_permit` int COMMENT '是否禁止(0-不允许,１-允许)',
  `send_site_id` int COMMENT '站点'
) COMMENT '会员关注－资源'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_follow_resource_20181113';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_fund` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `fund_code` string COMMENT '基金项目编号',
  `fund_name` string COMMENT '基金名称',
  `approval_time` timestamp COMMENT '批准时间',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `up_now` int COMMENT '至今',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `language_flag` int COMMENT '0-中文、1-英文'
) COMMENT '科研基金'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_fund';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_honor` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `honor_name` string COMMENT '荣誉名称',
  `award_department` string COMMENT '颁发机构',
  `award_year` string COMMENT '颁发年',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `language_flag` int COMMENT '0-中文、1-英文',
  `create_time` timestamp COMMENT '创建时间',
  `honor_type` int COMMENT '荣誉类型 默认：0-医生可见;1-患者可见'
) COMMENT '会员荣誉'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_honor';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_identify_code` (
  `id` bigint COMMENT '',
  `identify_code` string COMMENT '验证码',
  `batch_id` bigint COMMENT '批次号',
  `identify_type` int COMMENT '验证码类型(1-免认证验证码)',
  `create_usr` string COMMENT '生成人',
  `create_time` timestamp COMMENT '创建时间',
  `customer_id` bigint COMMENT '会员id',
  `op_time` timestamp COMMENT '使用时间',
  `op_site` int COMMENT '使用渠道',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员各业务验证码'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_identify_code';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_info_caos` (
  `id` bigint COMMENT '',
  `member_id` bigint COMMENT '会员id',
  `member_code` string COMMENT '会员号',
  `ref_customer_id` bigint COMMENT 'allin关联会员id',
  `password` string COMMENT '密码',
  `name` string COMMENT '姓名',
  `sex` string COMMENT '性别',
  `qualification_name` string COMMENT '资格证名称',
  `qualification_code` string COMMENT '资格证号',
  `certificates_code` string COMMENT '身份证号',
  `email` string COMMENT '邮箱',
  `mobile` string COMMENT '手机',
  `address` string COMMENT '地址',
  `post_code` string COMMENT '邮编',
  `hospital` string COMMENT '医院',
  `areas_expertise` string COMMENT '专业领域',
  `medical_title` string COMMENT '职称',
  `regist_time` timestamp COMMENT '注册时间',
  `create_time` timestamp COMMENT '创建时间',
  `modify_time` timestamp COMMENT '更改时间',
  `is_pay` int COMMENT '是否支付',
  `is_reg_mail_send` int COMMENT '',
  `is_pay_mail_send` int COMMENT '',
  `is_delivery_mail_send` int COMMENT '',
  `pay_update_people` string COMMENT '确认收款人',
  `unite_name_weixin` string COMMENT '联合登录微信',
  `unite_flag_weixin` int COMMENT '状态微信',
  `unite_time_weixin` timestamp COMMENT '绑定微信时间',
  `unite_flag` int COMMENT '联合登陆标志位(0-未邦定，1-已邦定)',
  `is_valid` int COMMENT '是否有效',
  `is_import` int COMMENT '是否批量导入',
  `is_import_mail_send` int COMMENT ''
) COMMENT '外站会员信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_info_caos';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_language` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `language_id` bigint COMMENT '语言能力id',
  `language_name` string COMMENT '语言能力',
  `award_year` string COMMENT '获得年',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `language_flag` int COMMENT '0-中文、1-英文',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员语言能力'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_language';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_level` (
  `id` bigint COMMENT '会员级别ID',
  `level_name` string COMMENT '会员级别'
) COMMENT '会员级别'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_level';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_login_log` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `login_type` int COMMENT '登陆退出错误',
  `op_date` timestamp COMMENT '操作时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '会员登陆日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_login_log';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_merge` (
  `id` bigint COMMENT '',
  `main_customer_id` bigint COMMENT '新会员账号id',
  `merge_customer_id` bigint COMMENT '老会员账号id',
  `create_time` timestamp COMMENT '创建时间',
  `deal_time` timestamp COMMENT '处理时间',
  `merge_state` int COMMENT '合并状态(1-待合并2-已合并3-v1通过4-v1拒绝5-v2通过6-v2拒绝)',
  `merge_type` int COMMENT '合并类型(1-用户发起2-运营发起)',
  `resource_type` int COMMENT '来源类型',
  `merge_remark` string COMMENT '合并备注',
  `send_site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效',
  `sort_id` int COMMENT '排序',
  `op_user` string COMMENT '处理人'
) COMMENT '会员合并表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_merge';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_message` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `send_customer_id` bigint COMMENT '会员id',
  `send_customer_name` string COMMENT '发送者姓名',
  `send_site_id` int COMMENT '消息发送渠道(site)',
  `message_type` int COMMENT '消息类型：1-会员消息,2-系统消息',
  `op_type` int COMMENT '操作类型(0-发布、1-评论、2-转发、3-收藏、4-分享、5-赞 、6-资源修改、51-文档审核通过 52-文档审核拒绝、53-医师审核通过、54-医师审核拒绝、60-管理自定义通知、61-话题屏蔽通知、62-视频屏蔽通知、63-病例屏蔽通知、64-文章屏蔽通知、65-评论屏蔽通知、66-引用通知、67-认证信息变更申请通过、68-认证信息申请变更驳回)',
  `ref_type` int COMMENT '消息关联资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ,6-人,7-病例)',
  `ref_id` bigint COMMENT '消息关联资源id',
  `ref_review_id` bigint COMMENT '消息关联回应id',
  `message_name` string COMMENT '消息标题',
  `message_body` string COMMENT '消息内容,截取字符',
  `create_time` timestamp COMMENT '消息时间',
  `read_time` timestamp COMMENT '查看时间',
  `is_read` int COMMENT '是否查看',
  `read_site_id` int COMMENT '阅读渠道(site)',
  `is_remind` int COMMENT '是否提醒看',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-tag,7-病例)',
  `ios_send_time` timestamp COMMENT 'ios推送时间',
  `android_send_time` timestamp COMMENT '安卓推送时间',
  `wx_send_time` timestamp COMMENT '微信推送时间',
  `notify_config_id` bigint COMMENT '会员消息推送配置表id',
  `message_src_time` timestamp COMMENT '消息源产生时间(评论发布时间提醒时间等)',
  `is_permit` int COMMENT '是否禁止发送推送(0-不允许,１-允许)',
  `page_storage_path` string COMMENT '网站PC存储路径',
  `web_storage_path` string COMMENT '手机版H5存储路径',
  `app_storage_parh` string COMMENT 'app手机端存储路径'
) COMMENT '会员消息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_message';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_message_20181107` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `send_customer_id` bigint COMMENT '会员id',
  `send_customer_name` string COMMENT '发送者姓名',
  `send_site_id` int COMMENT '消息发送渠道(site)',
  `message_type` int COMMENT '消息类型：1-会员消息,2-系统消息',
  `op_type` int COMMENT '操作类型(0-发布、1-评论、2-转发、3-收藏、4-分享、5-赞 、6-资源修改、51-文档审核通过 52-文档审核拒绝、53-医师审核通过、54-医师审核拒绝、60-管理自定义通知、61-话题屏蔽通知、62-视频屏蔽通知、63-病例屏蔽通知、64-文章屏蔽通知、65-评论屏蔽通知、66-引用通知、67-认证信息变更申请通过、68-认证信息申请变更驳回)',
  `ref_type` int COMMENT '消息关联资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ,6-人,7-病例)',
  `ref_id` bigint COMMENT '消息关联资源id',
  `ref_review_id` bigint COMMENT '消息关联回应id',
  `message_name` string COMMENT '消息标题',
  `message_body` string COMMENT '消息内容,截取字符',
  `create_time` timestamp COMMENT '消息时间',
  `read_time` timestamp COMMENT '查看时间',
  `is_read` int COMMENT '是否查看',
  `read_site_id` int COMMENT '阅读渠道(site)',
  `is_remind` int COMMENT '是否提醒看',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-tag,7-病例)',
  `ios_send_time` timestamp COMMENT 'ios推送时间',
  `android_send_time` timestamp COMMENT '安卓推送时间',
  `wx_send_time` timestamp COMMENT '微信推送时间',
  `notify_config_id` bigint COMMENT '会员消息推送配置表id',
  `message_src_time` timestamp COMMENT '消息源产生时间(评论发布时间提醒时间等)',
  `is_permit` int COMMENT '是否禁止发送推送(0-不允许,１-允许)',
  `page_storage_path` string COMMENT '网站PC存储路径',
  `web_storage_path` string COMMENT '手机版H5存储路径',
  `app_storage_parh` string COMMENT 'app手机端存储路径'
) COMMENT '会员消息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_message_20181107';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_message_201811071134` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `send_customer_id` bigint COMMENT '会员id',
  `send_customer_name` string COMMENT '发送者姓名',
  `send_site_id` int COMMENT '消息发送渠道(site)',
  `message_type` int COMMENT '消息类型：1-会员消息,2-系统消息',
  `op_type` int COMMENT '操作类型(0-发布、1-评论、2-转发、3-收藏、4-分享、5-赞 、6-资源修改、51-文档审核通过 52-文档审核拒绝、53-医师审核通过、54-医师审核拒绝、60-管理自定义通知、61-话题屏蔽通知、62-视频屏蔽通知、63-病例屏蔽通知、64-文章屏蔽通知、65-评论屏蔽通知、66-引用通知、67-认证信息变更申请通过、68-认证信息申请变更驳回)',
  `ref_type` int COMMENT '消息关联资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ,6-人,7-病例)',
  `ref_id` bigint COMMENT '消息关联资源id',
  `ref_review_id` bigint COMMENT '消息关联回应id',
  `message_name` string COMMENT '消息标题',
  `message_body` string COMMENT '消息内容,截取字符',
  `create_time` timestamp COMMENT '消息时间',
  `read_time` timestamp COMMENT '查看时间',
  `is_read` int COMMENT '是否查看',
  `read_site_id` int COMMENT '阅读渠道(site)',
  `is_remind` int COMMENT '是否提醒看',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-tag,7-病例)',
  `ios_send_time` timestamp COMMENT 'ios推送时间',
  `android_send_time` timestamp COMMENT '安卓推送时间',
  `wx_send_time` timestamp COMMENT '微信推送时间',
  `notify_config_id` bigint COMMENT '会员消息推送配置表id',
  `message_src_time` timestamp COMMENT '消息源产生时间(评论发布时间提醒时间等)',
  `is_permit` int COMMENT '是否禁止发送推送(0-不允许,１-允许)',
  `page_storage_path` string COMMENT '网站PC存储路径',
  `web_storage_path` string COMMENT '手机版H5存储路径',
  `app_storage_parh` string COMMENT 'app手机端存储路径'
) COMMENT '会员消息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_message_201811071134';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_message_201811191146` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `send_customer_id` bigint COMMENT '会员id',
  `send_customer_name` string COMMENT '发送者姓名',
  `send_site_id` int COMMENT '消息发送渠道(site)',
  `message_type` int COMMENT '消息类型：1-会员消息,2-系统消息',
  `op_type` int COMMENT '操作类型(0-发布、1-评论、2-转发、3-收藏、4-分享、5-赞 、6-资源修改、51-文档审核通过 52-文档审核拒绝、53-医师审核通过、54-医师审核拒绝、60-管理自定义通知、61-话题屏蔽通知、62-视频屏蔽通知、63-病例屏蔽通知、64-文章屏蔽通知、65-评论屏蔽通知、66-引用通知、67-认证信息变更申请通过、68-认证信息申请变更驳回)',
  `ref_type` int COMMENT '消息关联资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ,6-人,7-病例)',
  `ref_id` bigint COMMENT '消息关联资源id',
  `ref_review_id` bigint COMMENT '消息关联回应id',
  `message_name` string COMMENT '消息标题',
  `message_body` string COMMENT '消息内容,截取字符',
  `create_time` timestamp COMMENT '消息时间',
  `read_time` timestamp COMMENT '查看时间',
  `is_read` int COMMENT '是否查看',
  `read_site_id` int COMMENT '阅读渠道(site)',
  `is_remind` int COMMENT '是否提醒看',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-tag,7-病例)',
  `ios_send_time` timestamp COMMENT 'ios推送时间',
  `android_send_time` timestamp COMMENT '安卓推送时间',
  `wx_send_time` timestamp COMMENT '微信推送时间',
  `notify_config_id` bigint COMMENT '会员消息推送配置表id',
  `message_src_time` timestamp COMMENT '消息源产生时间(评论发布时间提醒时间等)',
  `is_permit` int COMMENT '是否禁止发送推送(0-不允许,１-允许)',
  `page_storage_path` string COMMENT '网站PC存储路径',
  `web_storage_path` string COMMENT '手机版H5存储路径',
  `app_storage_parh` string COMMENT 'app手机端存储路径'
) COMMENT '会员消息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_message_201811191146';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_message_config` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `is_review_push` int COMMENT '是否接收评论消息推送',
  `is_prefer_push` int COMMENT '是否接收点赞消息推送',
  `is_offical_push` int COMMENT '是否接收唯医官方消息推送',
  `create_time` timestamp COMMENT '',
  `update_time` timestamp COMMENT '',
  `is_valid` int COMMENT '',
  `site_id` int COMMENT ''
) COMMENT '会员消息设置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_message_config';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_message_history` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `send_customer_id` bigint COMMENT '会员id',
  `send_customer_name` string COMMENT '发送者姓名',
  `send_site_id` int COMMENT '消息发送渠道(site)',
  `message_type` int COMMENT '消息类型：1-会员消息,2-系统消息',
  `op_type` int COMMENT '操作类型(0-发布、1-评论、2-转发、3-收藏、4-分享、5-赞 、6-资源修改、51-文档审核通过 52-文档审核拒绝、53-会员审核通过、54-会员审核拒绝)',
  `ref_type` int COMMENT '消息关联资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ,6-人,7-病例)',
  `ref_id` bigint COMMENT '消息关联资源id',
  `ref_review_id` bigint COMMENT '消息关联回应id',
  `message_name` string COMMENT '消息标题',
  `message_body` string COMMENT '消息内容,截取字符',
  `create_time` timestamp COMMENT '消息时间',
  `read_time` timestamp COMMENT '查看时间',
  `is_read` int COMMENT '是否查看',
  `read_site_id` int COMMENT '阅读渠道(site)',
  `is_remind` int COMMENT '是否提醒看',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-tag,7-病例)',
  `ios_send_time` timestamp COMMENT 'ios推送时间',
  `android_send_time` timestamp COMMENT '安卓推送时间',
  `wx_send_time` timestamp COMMENT '微信推送时间',
  `notify_config_id` bigint COMMENT '会员消息推送配置表id',
  `message_src_time` timestamp COMMENT '消息源产生时间(评论发布时间提醒时间等)',
  `is_permit` int COMMENT '是否禁止发送推送(0-不允许,１-允许)',
  `page_storage_path` string COMMENT '网站PC存储路径',
  `web_storage_path` string COMMENT '手机版H5存储路径',
  `app_storage_parh` string COMMENT 'app手机端存储路径'
) COMMENT '会员消息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_message_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_movement` (
  `id` bigint COMMENT '',
  `movement_id` bigint COMMENT '云云id',
  `customer_id` bigint COMMENT '会员id',
  `movement_type` int COMMENT '云云类型(21-视频笔记，2-个人云云)',
  `movement_content` string COMMENT '云云内容',
  `ref_item_id` bigint COMMENT '关联id数组',
  `ref_item_type` bigint COMMENT '1-视频  71-手术标签  72-疾病标签',
  `ref_item_name` string COMMENT '关联id名称',
  `create_time` timestamp COMMENT '操作时间',
  `prefer_up_num` bigint COMMENT '赞数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `share_num` bigint COMMENT '分享数',
  `reprint_num` bigint COMMENT '转发数',
  `update_time` timestamp COMMENT '最近一次修改时间',
  `is_valid` int COMMENT '是否有效（0-无效;1-有效；2-系统屏蔽；3-用户删除)',
  `send_site_id` int COMMENT '站点',
  `is_header` int COMMENT '是否置顶1-是，0-否',
  `movement_activity_id` bigint COMMENT '云云活动id'
) COMMENT '会员云云'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_movement';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_movement_20181115` (
  `id` bigint COMMENT '',
  `movement_id` bigint COMMENT '云云id',
  `customer_id` bigint COMMENT '会员id',
  `movement_type` int COMMENT '云云类型(21-视频笔记，2-个人云云)',
  `movement_content` string COMMENT '云云内容',
  `ref_item_id` bigint COMMENT '关联id数组',
  `ref_item_type` bigint COMMENT '1-视频  71-手术标签  72-疾病标签',
  `ref_item_name` string COMMENT '关联id名称',
  `create_time` timestamp COMMENT '操作时间',
  `prefer_up_num` bigint COMMENT '赞数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `share_num` bigint COMMENT '分享数',
  `reprint_num` bigint COMMENT '转发数',
  `update_time` timestamp COMMENT '最近一次修改时间',
  `is_valid` int COMMENT '是否有效（0-无效;1-有效；2-系统屏蔽；3-用户删除)',
  `send_site_id` int COMMENT '站点'
) COMMENT '会员云云'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_movement_20181115';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_movement_20181211` (
  `id` bigint COMMENT '',
  `movement_id` bigint COMMENT '云云id',
  `customer_id` bigint COMMENT '会员id',
  `movement_type` int COMMENT '云云类型(21-视频笔记，2-个人云云)',
  `movement_content` string COMMENT '云云内容',
  `ref_item_id` bigint COMMENT '关联id数组',
  `ref_item_type` bigint COMMENT '1-视频  71-手术标签  72-疾病标签',
  `ref_item_name` string COMMENT '关联id名称',
  `create_time` timestamp COMMENT '操作时间',
  `prefer_up_num` bigint COMMENT '赞数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `share_num` bigint COMMENT '分享数',
  `reprint_num` bigint COMMENT '转发数',
  `update_time` timestamp COMMENT '最近一次修改时间',
  `is_valid` int COMMENT '是否有效（0-无效;1-有效；2-系统屏蔽；3-用户删除)',
  `send_site_id` int COMMENT '站点'
) COMMENT '会员云云'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_movement_20181211';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_movement_activity` (
  `id` bigint COMMENT '',
  `movement_activity_id` bigint COMMENT '古人云活动id',
  `movement_activity_name` string COMMENT '古人云活动名称',
  `movement_activity_url` string COMMENT '活动h5链接',
  `movement_num` int COMMENT '参与数(活动包含的古人云数量)',
  `browse_num` int COMMENT '浏览数',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `publish_time` timestamp COMMENT '发布时间',
  `visit_site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '骨人云活动表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_movement_activity';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_movement_activity_attachment` (
  `id` bigint COMMENT '',
  `movement_activity_id` bigint COMMENT '古人云活动id',
  `movement_att_type` int COMMENT '1-banner,2-头图',
  `att_size` string COMMENT '附件大小：KB',
  `att_format` string COMMENT '附件格式：jpgpng',
  `att_height` string COMMENT '附件高度',
  `att_width` string COMMENT '附件宽度',
  `att_url` string COMMENT '附件url',
  `is_show` int COMMENT '是否展示（0-不展示，1-展示）',
  `visit_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '骨人云活动附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_movement_activity_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_movement_attachment` (
  `id` bigint COMMENT '',
  `movement_id` bigint COMMENT '云云id',
  `att_name` string COMMENT '附件说明（图片标题等）',
  `att_type` int COMMENT '附件类型：1-图片，2-视频,,4-视频缩略图......',
  `att_size` string COMMENT '附件大小：KB',
  `att_format` string COMMENT '附件格式：jpg、mp4...',
  `att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、8-480*320、9-1280*720、10-900*600、12-300*200、13-450*300、14-750*500)',
  `att_height` string COMMENT '附件高度',
  `att_width` string COMMENT '附件宽度',
  `att_url` string COMMENT '附件url',
  `upload_time` timestamp COMMENT '附件上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `send_site_id` int COMMENT '站点',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功,3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `play_num` bigint COMMENT '播放次数',
  `play_time` string COMMENT '播放时长',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '云云附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_movement_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_movement_attachment_20181115` (
  `id` bigint COMMENT '',
  `movement_id` bigint COMMENT '云云id',
  `att_name` string COMMENT '附件说明（图片标题等）',
  `att_type` int COMMENT '附件类型：1-图片，2-视频,,4-视频缩略图......',
  `att_size` string COMMENT '附件大小：KB',
  `att_format` string COMMENT '附件格式：jpg、mp4...',
  `att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、8-480*320、9-1280*720、10-900*600、12-300*200、13-450*300、14-750*500)',
  `att_height` string COMMENT '附件高度',
  `att_width` string COMMENT '附件宽度',
  `att_url` string COMMENT '附件url',
  `upload_time` timestamp COMMENT '附件上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `send_site_id` int COMMENT '站点',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功,3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `play_num` bigint COMMENT '播放次数',
  `play_time` string COMMENT '播放时长',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '云云附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_movement_attachment_20181115';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_node` (
  `id` bigint COMMENT '',
  `customer_node_id` bigint COMMENT '业务主键',
  `customer_id` bigint COMMENT '会员id',
  `node_id` bigint COMMENT '笔记id',
  `sort_id` int COMMENT '排序',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `prefer_num` bigint COMMENT '赞数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `share_num` bigint COMMENT '分享数',
  `reprint_num` bigint COMMENT '转发数',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '视频笔记和用户关联表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_node';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_node_20181115` (
  `id` bigint COMMENT '',
  `customer_node_id` bigint COMMENT '业务主键',
  `customer_id` bigint COMMENT '会员id',
  `node_id` bigint COMMENT '笔记id',
  `sort_id` int COMMENT '排序',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `prefer_num` bigint COMMENT '赞数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `share_num` bigint COMMENT '分享数',
  `reprint_num` bigint COMMENT '转发数',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '视频笔记和用户关联表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_node_20181115';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_note` (
  `id` bigint COMMENT '',
  `customer_note_id` bigint COMMENT '会员笔记id（生成id规则：毫秒数）',
  `customer_id` bigint COMMENT '会员id',
  `parent_id` bigint COMMENT '父节点',
  `note_type` int COMMENT '类型（1-视频，2-文库，3-会议，4-话题）',
  `ref_id` bigint COMMENT '笔记对象id',
  `ref_name` string COMMENT '笔记对象名字',
  `note_name` string COMMENT '笔记标题',
  `note_content` string COMMENT '笔记内容',
  `publish_time` timestamp COMMENT '发布时间',
  `note_tag` string COMMENT 'TAGS',
  `is_public` int COMMENT '是否公开',
  `is_anonymous` int COMMENT '是否匿名',
  `recommend_num` bigint COMMENT '推荐数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `browse_num` bigint COMMENT '浏览数',
  `share_num` bigint COMMENT '分享数',
  `up_num` bigint COMMENT '点赞数',
  `down_num` bigint COMMENT '踩数',
  `follow_num` bigint COMMENT '关注数',
  `is_header` int COMMENT '是否置顶',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地址',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员笔记'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_note';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_note_tag` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `customer_note_id` bigint COMMENT '会员笔记id',
  `tag_id` bigint COMMENT 'tag_id',
  `tag_name` string COMMENT 'tag名称',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员笔记-tag-mapping'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_note_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_notify_config` (
  `id` bigint COMMENT '',
  `site_id` int COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `device_token` string COMMENT 'token',
  `is_online` int COMMENT '是否在线',
  `create_time` timestamp COMMENT '创建时间',
  `op_time` timestamp COMMENT '操作时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员消息推送配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_notify_config';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_notify_config_20180717` (
  `id` bigint COMMENT '',
  `site_id` int COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `device_token` string COMMENT 'token',
  `is_online` int COMMENT '是否在线',
  `create_time` timestamp COMMENT '创建时间',
  `op_time` timestamp COMMENT '操作时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员消息推送配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_notify_config_20180717';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_occupation` (
  `id` bigint COMMENT 'ID',
  `customer_id` bigint COMMENT '会员id',
  `unit` string COMMENT '工作单位',
  `department` string COMMENT '科室/部门',
  `occupation` string COMMENT '行政职务',
  `medical_title` string COMMENT '职位/职称名称',
  `address` string COMMENT '工作地点',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `up_now` int COMMENT '至今',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `is_default` int COMMENT '是否默认显示',
  `send_site_id` int COMMENT '站点',
  `language_flag` int COMMENT '0-中文、1-英文',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '职业信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_occupation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_occupation_20181227` (
  `id` bigint COMMENT 'ID',
  `customer_id` bigint COMMENT '会员id',
  `unit` string COMMENT '工作单位',
  `department` string COMMENT '科室/部门',
  `occupation` string COMMENT '行政职务',
  `medical_title` string COMMENT '职位/职称名称',
  `address` string COMMENT '工作地点',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `up_now` int COMMENT '至今',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `is_default` int COMMENT '是否默认显示',
  `send_site_id` int COMMENT '站点',
  `language_flag` int COMMENT '0-中文、1-英文',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '职业信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_occupation_20181227';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_opus` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `opus_name` string COMMENT '专著名称',
  `author_type` int COMMENT '1-第一作者，2-第一译者，3-联合作者、4-联合译者',
  `publisher` string COMMENT '出版机构',
  `publication_time` timestamp COMMENT '出版时间',
  `information` string COMMENT '引用信息',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `language_flag` int COMMENT '0-中文、1-英文'
) COMMENT '学术专著'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_opus';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_passwd_ques` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `ques_type` int COMMENT '找回密码申请加入等等',
  `ques_id` int COMMENT '问题id',
  `ques_cont` string COMMENT '问题内容',
  `answer_1` string COMMENT '问题答案选项1',
  `answer_2` string COMMENT '问题答案选项2',
  `answer_3` string COMMENT '问题答案选项3',
  `ques_answer` string COMMENT '问题正确答案',
  `create_time` timestamp COMMENT '创建问题时间',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地址',
  `sort_id` int COMMENT '排序'
) COMMENT '会员问题'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_passwd_ques';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_patent` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `patent_name` string COMMENT '专利名称',
  `patent_code` string COMMENT '专利编号',
  `patent_time` timestamp COMMENT '认证时间',
  `country` string COMMENT '国别',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `language_flag` int COMMENT '0-中文、1-英文'
) COMMENT '发明专利'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_patent';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_potential` (
  `id` bigint COMMENT '',
  `email` string COMMENT '广告物料名称',
  `send_status` int COMMENT '发送标志',
  `send_time` timestamp COMMENT '发送时间',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '潜在用户表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_potential';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_prefer` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `useful_type` int COMMENT '赞类型（1-视频，2-文库，3-会议，4-话题 ,5-笔记 ，7-病例，8-评论 ,9-人,10-顶人11-锦囊)',
  `up_down_type` int COMMENT '赞、踩 类型(0踩,1赞,2顶)',
  `ref_id` bigint COMMENT '赞具体信息id',
  `publish_time` timestamp COMMENT '发布时间',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地址',
  `if_anonymous` int COMMENT '是否匿名',
  `if_header` int COMMENT '是否置顶',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '发送渠道',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员赞踩'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_prefer';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_priv` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `baseinfo` int COMMENT '基础信息查看权限',
  `auth` int COMMENT '认证信息查看权限',
  `education` int COMMENT '教育背景查看权限',
  `continuing_edu` int COMMENT '继续教育查看权限',
  `topic` int COMMENT '话题显示title',
  `note` int COMMENT '笔记显示title',
  `discuss` int COMMENT '评论显示title'
) COMMENT '会员自配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_priv';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_pundits` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `create_time` timestamp COMMENT '创建时间((yyyy-mm-dd  hh:mm:ss))',
  `deal_user_id` bigint COMMENT '处理人',
  `deal_user_name` string COMMENT '处理人姓名 冗余',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '排序 人工干预',
  `send_site_id` int COMMENT '操作来源 （1-pc、2-H5、5-ios、6-android）',
  `is_valid` int COMMENT '是否有效',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `top_num` bigint COMMENT '被顶数',
  `pundits_group` int COMMENT '专家分类（0-未选择、1-关节、2-脊柱、3-创伤、4-其他）'
) COMMENT '会员权威专家表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_pundits';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_pundits_apply` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `customer_name` string COMMENT '会员姓名 冗余',
  `apply_customer_name` string COMMENT '申请人姓名 ',
  `apply_mobile` string COMMENT '申请人手机号',
  `apply_reason` string COMMENT '申请理由',
  `state` int COMMENT '处理状态（1-待处理，2-处理中，3-已处理）',
  `deal_user_id` bigint COMMENT '处理人',
  `deal_user_name` string COMMENT '处理人姓名 冗余',
  `deal_time` timestamp COMMENT '处理时间(yyyy-mm-dd  hh:mm:ss)',
  `create_time` timestamp COMMENT '创建时间((yyyy-mm-dd  hh:mm:ss))',
  `remark` string COMMENT '(备注) ',
  `send_site_id` int COMMENT '操作来源 （1-唯医官网pc、2-唯医手机H5、3-CAOS、4-CAOS手机、5-ios、6-android、7-CAOS-EN、8-MED-IOS、9-MED-Android、10-后台、11-MED-H5）',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员权威专家申请表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_pundits_apply';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_push_daily` (
  `id` int COMMENT '',
  `customer_id` bigint COMMENT '',
  `base_event_type_id` int COMMENT '事件类型ID。1:用户未完成认证，2:仅完成认证第一步，3:用户认证被拒绝，4:有新的患者回复、报道，5:骨人云有新的回复，6:教育资源有新的回复，7:收藏内容未观看，8:收到关注，9:收到点赞，10：订阅内容有更新，11:关注的人有新的发布',
  `event_days` int COMMENT '事件天数',
  `event_num` int COMMENT '事件数量。事件为云云或者资源评论以及它们的回复的时候,数量为回复数。有点赞的时候为点赞数，有关注的时候为关注数。',
  `ref_customer_id` bigint COMMENT '关注的人的customer_id',
  `resource_type` int COMMENT '关注的人新发布的资源的类型。1-视频，2-文库，3-会议，4-话题 ,5-笔记，7-病例，61-新标签,9-课程栏目，99-云云',
  `create_time` timestamp COMMENT '',
  `update_time` timestamp COMMENT '',
  `is_valid` int COMMENT ''
) COMMENT '召回每日事件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_push_daily';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_push_great_people` (
  `id` int COMMENT '',
  `level` tinyint COMMENT '1:级别一。2:级别二',
  `customer_id` bigint COMMENT '',
  `create_time` timestamp COMMENT '',
  `update_time` timestamp COMMENT '',
  `is_valid` tinyint COMMENT ''
) COMMENT '召回信息特殊人员表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_push_great_people';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_qr_code` (
  `id` bigint COMMENT '',
  `qr_code_type` int COMMENT '二维码应用类型：1-诊后报道 6-个人名片二维码',
  `customer_id` bigint COMMENT '医生id',
  `scene` string COMMENT '场景值',
  `action_name` string COMMENT '二维码类型：QR_LIMIT_SCENE为永久的整型参数值，QR_LIMIT_STR_SCENE为永久的字符串参数值',
  `ticket` string COMMENT '二维码ticket，凭借此ticket可以在有效时间内换取二维码',
  `qr_code_url` string COMMENT '二维码全路径',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '医生二维码'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_qr_code';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_qr_code_20180621` (
  `id` bigint COMMENT '',
  `qr_code_type` int COMMENT '二维码应用类型：1-诊后报道',
  `customer_id` bigint COMMENT '医生id',
  `scene` string COMMENT '场景值',
  `action_name` string COMMENT '二维码类型：QR_LIMIT_SCENE为永久的整型参数值，QR_LIMIT_STR_SCENE为永久的字符串参数值',
  `ticket` string COMMENT '二维码ticket，凭借此ticket可以在有效时间内换取二维码',
  `qr_code_url` string COMMENT '二维码全路径',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '医生二维码'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_qr_code_20180621';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_quote` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '引用会员id',
  `quote_id` bigint COMMENT '引用id',
  `quote_type` int COMMENT '引用类型：1-视频，2-文库，3-会议，4-话题 ,5-笔记，6-tag,7-病例,8-回复,9-人',
  `resource_id` bigint COMMENT 'quote_id的父节点',
  `resource_type` bigint COMMENT 'quote_id的父节点的类型：1-视频，2-文库，4-话题 ,7-病例',
  `ref_quote_id` bigint COMMENT '被引用资源id',
  `ref_quote_type` int COMMENT '被引用资源类型：1-视频，2-文库，4-话题 ,7-病例',
  `ref_quote_name` string COMMENT '被引用资源名称',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '操作来源(1-pc、2-H5、5-ios、6-android)'
) COMMENT '会员资源引用表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_quote';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_ref_education` (
  `id` bigint COMMENT 'ID',
  `customer_id` bigint COMMENT '会员id',
  `ref_id` bigint COMMENT '关联继续教育id',
  `ref_name` string COMMENT '继续教育title',
  `organization` string COMMENT '所属机构',
  `address` string COMMENT '地点',
  `education_desc` string COMMENT '描述',
  `start_time` timestamp COMMENT '开始',
  `end_time` timestamp COMMENT '结束',
  `is_valid` int COMMENT '是否有效'
) COMMENT '站内关联继续教育'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_ref_education';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_remind` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '发起提醒的会员id',
  `ref_customer_id` bigint COMMENT '提醒会员id',
  `ref_type` int COMMENT '相关资源类型（1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-tag,7-病例,8-回应,9-人）',
  `ref_id` bigint COMMENT '相关资源id',
  `ref_name` string COMMENT '相关资源名称',
  `ref_content` string COMMENT '相关资源内容',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-tag,7-病例)',
  `resource_id` bigint COMMENT '资源id',
  `send_site_id` int COMMENT '站点'
) COMMENT '会员提醒'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_remind';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_report` (
  `id` bigint COMMENT '',
  `state` int COMMENT '举报的状态(1-等待,2-处理中,3-已处理)',
  `create_time` timestamp COMMENT '提交时间',
  `resource_type` int COMMENT '资源类型ID(1-视频，2-文库，4-话题 ,7-病例)',
  `resource_id` bigint COMMENT '资源标题ID',
  `review_id` bigint COMMENT '评论内容ID',
  `customer_id` bigint COMMENT '举报人ID',
  `report_reason` string COMMENT '选择原因，以逗号分隔(0-含有广告内容，1-含有违法违规内容，2-含有政治等敏感内容，3-含有侵权信息，4-其他)',
  `report_content` string COMMENT '输入内容',
  `user_id` bigint COMMENT '处理人ID',
  `deal_time` timestamp COMMENT '处理时间',
  `deal_result` string COMMENT '处理方式(手动输入)',
  `remark` string COMMENT '备注',
  `send_site_id` int COMMENT '操作来源(1-pc、2-H5、5-ios、6-android)',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
) COMMENT '举报信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_report';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_reprint` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `reprint_type` int COMMENT '转发类型（1-视频，2-文库，3-会议，4-话题 ,5-笔记）',
  `ref_id` bigint COMMENT '转发具体信息id',
  `ref_customer_id` bigint COMMENT '冗余存放资源关联会员id',
  `ref_name` string COMMENT '转发具体信息名字',
  `ref_url` string COMMENT '转发地址',
  `reprint_time` timestamp COMMENT '转发时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效（0-取消转发；1-添加转发）',
  `send_site_id` int COMMENT '发送渠道',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员转发'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_reprint';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_reset_password` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `customer_email` string COMMENT '客户邮件地址',
  `email_content` string COMMENT '',
  `reset_password_url` string COMMENT '文章url',
  `apply_source` int COMMENT '申请来源:1-网站  2-手机wap',
  `apply_time` timestamp COMMENT '申请时间',
  `send_mail_time` timestamp COMMENT '邮件发送时间',
  `confirm_time` timestamp COMMENT '修改确认时间',
  `is_valid` int COMMENT '是否有效(过期跑定时任务置成无效,如24小时内有效)',
  `reset_site` int COMMENT '关联站点 1-caos 2-allin',
  `valid_code` string COMMENT '加密链接',
  `type_id` int COMMENT '验证类型(1-邮箱验证、2-手机验证)',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员找回密码'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_reset_password';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_resource_relationship` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `ref_id` bigint COMMENT '资源具体信息id',
  `ref_type` int COMMENT '资源类型（1-视频，2-文库，4-话题 ，7-病例）',
  `ref_name` string COMMENT '资源名称',
  `ref_customer_id` bigint COMMENT '资源相关会员id',
  `type` int COMMENT '类型0-不喜欢',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '操作渠道'
) COMMENT '会员与资源的关系'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_resource_relationship';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_resource_toplist` (
  `id` bigint COMMENT '',
  `toplist_id` bigint COMMENT '榜单id',
  `customer_id` bigint COMMENT '会员id',
  `resource_id` bigint COMMENT '资源id',
  `resource_name` string COMMENT '资源名称',
  `resource_type` int COMMENT '资源类型(1-视频,2-文库,4-话题,7-病例)',
  `browse_num` bigint COMMENT '资源浏览数',
  `review_num` bigint COMMENT '资源评论数',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '发送渠道',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '榜单资源'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_resource_toplist';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_review` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `parent_id` bigint COMMENT '父节点',
  `review_type` bigint COMMENT '评论类型（1-视频，2-文库，4-话题 ,7-病例）',
  `review_status` int COMMENT '评论状态（1-发布；2-系统屏蔽；3-用户删除；４－草稿）',
  `ref_id` bigint COMMENT '关联信息id',
  `ref_customer_id` bigint COMMENT '冗余存放资源关联会员id',
  `ref_url` string COMMENT '关联信息url',
  `review_content` string COMMENT '评论内容',
  `publish_time` timestamp COMMENT '发布时间',
  `recommend_num` bigint COMMENT '推荐数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `up_num` bigint COMMENT '点赞数',
  `down_num` bigint COMMENT '踩数',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地址',
  `if_anonymous` int COMMENT '是否匿名',
  `if_header` int COMMENT '是否置顶',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '发送渠道',
  `is_draft` int COMMENT '是否草稿',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员评论'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_review';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_review_20181115` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `parent_id` bigint COMMENT '父节点',
  `review_type` bigint COMMENT '评论类型（1-视频，2-文库，4-话题 ,7-病例）',
  `review_status` int COMMENT '评论状态（1-发布；2-系统屏蔽；3-用户删除；４－草稿）',
  `ref_id` bigint COMMENT '关联信息id',
  `ref_customer_id` bigint COMMENT '冗余存放资源关联会员id',
  `ref_url` string COMMENT '关联信息url',
  `review_content` string COMMENT '评论内容',
  `publish_time` timestamp COMMENT '发布时间',
  `recommend_num` bigint COMMENT '推荐数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `up_num` bigint COMMENT '点赞数',
  `down_num` bigint COMMENT '踩数',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地址',
  `if_anonymous` int COMMENT '是否匿名',
  `if_header` int COMMENT '是否置顶',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '发送渠道',
  `is_draft` int COMMENT '是否草稿',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员评论'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_review_20181115';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_review_attachment` (
  `id` bigint COMMENT '',
  `review_id` bigint COMMENT '评论id',
  `review_att_type` int COMMENT '资源类型：1-图片，2-视频,3-文档',
  `review_att_size` string COMMENT '资源大小：KB',
  `review_att_format` string COMMENT '资源格式：jpg、mp4...',
  `review_att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52)',
  `review_att_height` string COMMENT '资源高度',
  `review_att_width` string COMMENT '资源宽度',
  `review_att_url` string COMMENT '资源url',
  `upload_time` timestamp COMMENT '资源上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `send_site_id` int COMMENT '站点',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功,3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `play_time` string COMMENT '播放时长',
  `play_num` bigint COMMENT '播放次数',
  `review_att_name` string COMMENT '附件说明（图片标题等）',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员评论附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_review_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_review_insite` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `parent_id` bigint COMMENT '父节点',
  `review_type` bigint COMMENT '评论类型（站内资源:视频ppt等）',
  `ref_id` bigint COMMENT '关联信息id',
  `ref_url` string COMMENT '关联信息url',
  `review_content` string COMMENT '评论内容',
  `publish_time` timestamp COMMENT '发布时间',
  `recommend_num` int COMMENT '推荐数',
  `collection_num` int COMMENT '收藏数',
  `review_num` int COMMENT '评论数',
  `share_num` int COMMENT '转发数',
  `up_num` int COMMENT '点赞数',
  `down_num` int COMMENT '踩数',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地址',
  `if_anonymous` int COMMENT '是否匿名',
  `if_header` int COMMENT '是否置顶',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员评论-站内资源'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_review_insite';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_review_outsite` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `parent_id` bigint COMMENT '父节点',
  `review_type` bigint COMMENT '评论类型（站内资源:视频ppt等）',
  `ref_id` bigint COMMENT '关联信息id',
  `ref_url` string COMMENT '关联信息url',
  `review_content` string COMMENT '评论内容',
  `publish_time` timestamp COMMENT '发布时间',
  `recommend_num` int COMMENT '推荐数',
  `collection_num` int COMMENT '收藏数',
  `review_num` int COMMENT '评论数',
  `share_num` int COMMENT '转发数',
  `up_num` int COMMENT '点赞数',
  `down_num` int COMMENT '踩数',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地址',
  `if_anonymous` int COMMENT '是否匿名',
  `if_header` int COMMENT '是否置顶',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员评论-站外资源'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_review_outsite';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_role_priv` (
  `id` bigint COMMENT '',
  `customer_role` int COMMENT '会员id(customer_auth.customerRole)外键',
  `role_id` int COMMENT '权限id(0-发布、1-评论、2-转发、3-收藏、4-分享、5-赞...)',
  `role_type` int COMMENT '权限类型(0.操作、1.浏览)',
  `role_flag` int COMMENT '权限标示(0-false,1-true)',
  `role_op` string COMMENT '权限操作拼串存储(1,2,3)(1-c,2-u,3-r,4-d)',
  `create_time` timestamp COMMENT '创建日期',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
) COMMENT '会员角色配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_role_priv';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_score` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `score_type` int COMMENT '评分类型（1-视频、2-文库、4-话题 、7-病例）',
  `ref_id` bigint COMMENT '被评分具体信息id',
  `ref_name` string COMMENT '被评分资源名字',
  `ref_customer_id` bigint COMMENT '冗余资源作者会员Id',
  `score` double COMMENT '分数',
  `score_answer_behalf` int COMMENT '答案代表(1-好、2-不好)',
  `score_guide` string COMMENT '评分引导语',
  `score_question` string COMMENT '评分问题',
  `score_answer_content` string COMMENT '评分答案内容',
  `is_other` int COMMENT '是否有其他原因(0-无、1-有)',
  `other_content` string COMMENT '其它原因内容',
  `is_anonymous` int COMMENT '是否匿名评分(0-匿名、1-不匿名)',
  `sort_id` int COMMENT '排序号',
  `create_time` timestamp COMMENT '发布时间',
  `is_valid` int COMMENT '是否有效(0-无效、1-有效)',
  `send_site_id` int COMMENT '站点'
) COMMENT '会员评分'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_score';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_share` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `session_id` string COMMENT '用户session_id',
  `share_type` int COMMENT '分享类型（1-视频，2-文库，4-话题，7-病例，8－评论）',
  `share_sence` int COMMENT '分享场景 1-主页,2-视频应用页,3-文库应用页,4-视频内容页,5-文库内容页,6-个人主页,7-个人首页,8个人资料页,9话题内容页,10病例内容页,11会场页面,12评论内容页 13-病例应用页 14-话题应用页 15-fellowship应用页面 16-医师定考应用页面 17-视频列表页面 18-文库列表页面 19-话题列表页面 20-病例列表页面 21-年会内容页面 22-组织应用页面 23-厂商应用页面 24-会议直播页面-多会场 25-直播列表页面 26-会议回放页面 27-登录 28-注册 29-找回密码 30-医师频道页 31-医师列表页 32-搜索页面  33-视频pk页面
 34-搜索全部列表页  35-搜索病例列表页 36-搜索视频列表页 37-搜索话题列表页 38-搜索会议列表页 39-搜索医师列表页 40-搜索文库列表页 41-资源病例列表 42-资源话题列表 43-资源视频列表 44-资源会议列表 45- 资源文库列表 46-发布病例列表 47-发布话题列表 48-发布视频列表 49-回复内容列表 50-朋友圈	51-我的动态 52-他人动态 53-按专业 54-按疾病 55-按术式 56-按类型 57-标签专题 58-按专题 59-权威专家 60-热门活动 61-他人主页 62-专题详情 63 活动详情,64-ugc直播（主播分享）（正在直播）,65-ugc直播（观众分享）（正在直播）,66-ugc直播（主播分享）（预约）,67ugc直播（观众分享）（预约）',
  `share_content` string COMMENT '分享内容',
  `resource_id` bigint COMMENT '资源id',
  `resource_type` bigint COMMENT '资源类型（1-视频，2-文库，4-话题 ,7-病例）',
  `ref_id` bigint COMMENT '分享具体信息id',
  `ref_customer_id` bigint COMMENT '冗余存放资源关联会员id',
  `ref_url` string COMMENT '分享地址',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效（0-无效 1-有效）',
  `send_site_id` int COMMENT '发送渠道',
  `share_channel` int COMMENT '分享渠道（1-QQ空间，2-QQ好友，3-新浪微博，4-微信好友，5-微信朋友圈 ，6短信，7-邮件）'
) COMMENT '会员分享'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_share';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_skilled_illness` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '',
  `illness_id` bigint COMMENT '疾病id',
  `illness_name` string COMMENT '疾病名称',
  `create_time` timestamp COMMENT '创建时间',
  `last_update_time` timestamp COMMENT '最后修改时间',
  `is_valid` int COMMENT '是否有效0-无效1-有效',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点'
) COMMENT '会员擅长疾病'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_skilled_illness';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_skilled_operation` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '',
  `operation_id` bigint COMMENT '手术id',
  `operation_name` string COMMENT '手术名称',
  `specialty_id` bigint COMMENT '专科id',
  `specialty_name` string COMMENT '专科名称',
  `create_time` timestamp COMMENT '创建时间',
  `last_update_time` timestamp COMMENT '最后修改时间',
  `is_valid` int COMMENT '是否有效0-无效1-有效',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点'
) COMMENT '会员擅长手术'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_skilled_operation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_social` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `organization` string COMMENT '机构名称',
  `social_title` string COMMENT '职位名称',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `up_now` int COMMENT '至今',
  `is_default` int COMMENT '是否默认显示',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `language_flag` int COMMENT '0-中文、1-英文',
  `social_type` int COMMENT '社会任职类型：默认:0-医生可见;1-患者可见'
) COMMENT '社会任职'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_social';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_statistics` (
  `id` bigint COMMENT 'id',
  `customer_id` bigint COMMENT '会员id',
  `video_num` bigint COMMENT '视频数',
  `topic_num` bigint COMMENT '话题数',
  `doc_num` bigint COMMENT '文库数',
  `article_num` bigint COMMENT '文章数量',
  `note_num` bigint COMMENT '笔记数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `share_num` bigint COMMENT '分享数',
  `first_num` bigint COMMENT '沙发数',
  `friend_num` bigint COMMENT '好友数',
  `fans_num` bigint COMMENT '粉丝数',
  `follow_people_num` bigint COMMENT '关注人数',
  `follow_note_num` bigint COMMENT '关注笔记数',
  `follow_topic_num` bigint COMMENT '关注话题数',
  `draft_num` bigint COMMENT '草稿数',
  `trends_num` bigint COMMENT '动态数',
  `respond_review_num` bigint COMMENT '回应我的评论数',
  `case_num` bigint COMMENT '病例数量',
  `subscribe_num` bigint COMMENT '订阅数量',
  `person_up_num` bigint COMMENT '对人的赞数',
  `others_up_num` bigint COMMENT '被别人赞数',
  `first_author_num` bigint COMMENT '第一作者',
  `unite_author_num` bigint COMMENT '联合作者',
  `first_translator_num` bigint COMMENT '第一译者',
  `unite_translator_num` bigint COMMENT '联合译者',
  `follow_video_num` bigint COMMENT '关注视频数量',
  `follow_doc_num` bigint COMMENT '关注文库数量',
  `follow_tag_num` bigint COMMENT '关注标签数量',
  `follow_case_num` bigint COMMENT '关注病例数量',
  `remind_review_num` bigint COMMENT '评论提醒我的数量',
  `remind_resource_num` bigint COMMENT '资源发布提醒我的数量',
  `follow_trends_num` bigint COMMENT '我所关注的动态数量',
  `trend_sort_authority` bigint COMMENT '七日内动态类型1、2、4、7、8数量'
) COMMENT '会员基础统计表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_statistics';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_statistics_seventeen` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '医生id',
  `customer_name` string COMMENT '医生名称',
  `compay_id` string COMMENT '医院id',
  `compay_name` string COMMENT '医院名称',
  `medical_title_id` string COMMENT '头衔id',
  `medical_title_name` string COMMENT '头衔名称',
  `customer_type` int COMMENT '医生类型(1-kol,2-普通)',
  `browse_num` string COMMENT '资源被访问人次',
  `province_num` string COMMENT '覆盖省份数量',
  `company_num` string COMMENT '覆盖医院数量',
  `browse_people_num` string COMMENT '大于30分钟的浏览人数',
  `theme_num` string COMMENT '主题演讲次数',
  `patient_num` string COMMENT '患者人数',
  `hospital_level` string COMMENT '医院的等级分布',
  `medical_title` string COMMENT '头衔的分布',
  `cover_city_id` string COMMENT '覆盖医院所在市ID',
  `cover_city` string COMMENT '覆盖医院所在市名称',
  `farthest_province_id` string COMMENT '距离最远的省份ID',
  `farthest_province` string COMMENT '距离最远的省份名称',
  `farthest_city_id` string COMMENT '距离最远的市ID',
  `farthest_city` string COMMENT '距离最远的市名称',
  `study_customer_id` string COMMENT '学习者TOP2',
  `expert_customer_id` string COMMENT '专家医生id',
  `expert_customer_name` string COMMENT '专家医生名称',
  `expert_customer_company` string COMMENT '专家医院',
  `synthesized_ranking` string COMMENT '综合排名',
  `effect_numer` string COMMENT '影响力指数',
  `major_id` string COMMENT '专业id',
  `major_name` string COMMENT '专业',
  `major_ranking` string COMMENT '专业排名',
  `browse_time` string COMMENT '累计访问时间（小时）',
  `study_time` string COMMENT '离3点最近的在线访问时间',
  `study_resource_id` string COMMENT '学习时间最长资源id',
  `study_resource_name` string COMMENT '学习时间最长资源名称',
  `study_resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ,6-人,7-病例)',
  `study_resource_path` string COMMENT '学习时间最久资源路径',
  `browse_conference_num` string COMMENT '学习会议总和',
  `browse_conference_id` string COMMENT '学习会议top2',
  `conference_save_time` string COMMENT '用户参与会议节省时间',
  `browse_conference_content` string COMMENT '没有访问会议所属资源正文',
  `highest_resource_id` string COMMENT '最高UV资源id',
  `highest_resource_name` string COMMENT '最高UV资源名称',
  `highest_resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ,6-人,7-病例)',
  `highest_resource_uv` string COMMENT '最高UV资源名称',
  `highest_content` string COMMENT '没有最高访问资源记录内容',
  `search_keyword` string COMMENT '搜索词名称',
  `search_keyword_num` string COMMENT '搜索词次数',
  `search_keyword_content` string COMMENT '没有搜索记录，输出内容',
  `same_customer_first` string COMMENT '同地区学习时间最长ID',
  `same_customer_first_name` string COMMENT '同地区学习时间最长名称',
  `same_customer_first_title` string COMMENT '同地区学习时间最长头衔',
  `same_customer_second` string COMMENT '同地区学习时间第二',
  `same_customer_second_name` string COMMENT '同地区学习时间第二',
  `same_customer_second_title` string COMMENT '同地区学习时间第二',
  `same_customer_content` string COMMENT '同地区学习推荐内容',
  `follow_content` string COMMENT '关注内容',
  `follow_tag` string COMMENT '关注标签',
  `customer_keyword` string COMMENT '我的关键词',
  `customer_number` string COMMENT '用户学习指数',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效1-有效0-无效'
) COMMENT '会员基础统计表年统计表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_statistics_seventeen';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_statistics_stat` (
  `id` bigint COMMENT 'id',
  `year` string COMMENT '年',
  `customer_id` bigint COMMENT '会员id',
  `video_num` bigint COMMENT '视频数',
  `topic_num` bigint COMMENT '话题数',
  `doc_num` bigint COMMENT '文库数',
  `article_num` bigint COMMENT '文章数量',
  `note_num` bigint COMMENT '笔记数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `share_num` bigint COMMENT '分享数',
  `first_num` bigint COMMENT '沙发数',
  `friend_num` bigint COMMENT '好友数',
  `fans_num` bigint COMMENT '粉丝数',
  `follow_people_num` bigint COMMENT '关注人数',
  `follow_note_num` bigint COMMENT '关注笔记数',
  `follow_topic_num` bigint COMMENT '关注话题数',
  `draft_num` bigint COMMENT '草稿数',
  `trends_num` bigint COMMENT '动态数',
  `respond_review_num` bigint COMMENT '回应我的评论数',
  `case_num` bigint COMMENT '病例数量',
  `subscribe_num` bigint COMMENT '订阅数量',
  `person_up_num` bigint COMMENT '对人的赞数',
  `others_up_num` bigint COMMENT '被别人赞数',
  `first_author_num` bigint COMMENT '第一作者',
  `unite_author_num` bigint COMMENT '联合作者',
  `first_translator_num` bigint COMMENT '第一译者',
  `unite_translator_num` bigint COMMENT '联合译者',
  `follow_video_num` bigint COMMENT '关注视频数量',
  `follow_doc_num` bigint COMMENT '关注文库数量',
  `follow_tag_num` bigint COMMENT '关注标签数量',
  `follow_case_num` bigint COMMENT '关注病例数量',
  `remind_review_num` bigint COMMENT '评论提醒我的数量',
  `remind_resource_num` bigint COMMENT '资源发布提醒我的数量',
  `follow_trends_num` bigint COMMENT '我所关注的动态数量',
  `trend_sort_authority` bigint COMMENT '七日内动态类型1、2、4、7、8数量',
  `browse_video_long_time` string COMMENT '浏览视频最长时长',
  `browse_video_time` string COMMENT '浏览视频总时长',
  `browse_doc_num` bigint COMMENT '浏览文库数量',
  `browse_video_num` bigint COMMENT '浏览视频数量',
  `browse_case_num` bigint COMMENT '浏览病理数量',
  `star_level` string COMMENT '星级:一颗星,二颗星,三颗星,四颗星,五颗星',
  `follow_level` string COMMENT '评语：a）关注数:(0～10)-快去结交更多骨科医师吧！;b）关注数:(11～50)-更多骨医人脉，您值得拥有！;c）关注数:(51~150)-朋友这么多必须赞一个！;d）关注数：(>150)-会友无止境，知己满天下！',
  `worth_level` string COMMENT '价值等级',
  `worth_tag` string COMMENT '',
  `worth_percent` string COMMENT '',
  `conference_level` string COMMENT '数值规则：时间在0~1之间取1，大于等于1时取整',
  `browse_topic_num` bigint COMMENT '浏览话题数量',
  `unget_resource_num` bigint COMMENT '未get的资源数 = 平台资源总数（包括视频、病例、文库）数量 - 已浏览资源总数',
  `browsed_myvideo_num` bigint COMMENT '我上传的视频被浏览次数',
  `browsed_mycase_num` bigint COMMENT '我上传的病例被浏览次数',
  `browsed_mydoc_num` bigint COMMENT '我上传的文库被浏览次数',
  `first_follow` bigint COMMENT '第一个关注的人的会员ID',
  `last_follow` bigint COMMENT '第一个关注的人的会员ID',
  `title_level` string COMMENT '称号等级, 按用户浏览过的资源数据M判断',
  `browse_doc_time` string COMMENT '浏览文库总时长',
  `browse_topic_time` string COMMENT '浏览话题总时长',
  `browse_case_time` string COMMENT '浏览病例总时长',
  `browsed_mytopic_num` bigint COMMENT '我上传的话题被浏览次数',
  `download_num` bigint COMMENT '下载次数',
  `top_customer_browse` string COMMENT '用户浏览资源前三',
  `top_customer_social` string COMMENT '来往，用户社交，来往总数/来往最多的前两位',
  `sex_tag` string COMMENT '性别关键字',
  `title_tag` string COMMENT '职称关键字',
  `top_keyword` string COMMENT '用户关键字',
  `recommend_social` string COMMENT '来往为0时，推荐默认',
  `qr_code` string COMMENT '二维码',
  `create_time` timestamp COMMENT ''
) COMMENT '会员基础统计表年统计表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_statistics_stat';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_suggestion` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `site_id` bigint COMMENT '1-唯医官网,2-唯医手机,3-CAOS,4-ios',
  `suggestion` string COMMENT '建议内容',
  `system_version` string COMMENT '提交客户端版本信息',
  `equipment_version` string COMMENT '提交客户端设备版本信息',
  `network_environment` string COMMENT '提交客户端网络环境(2G、3G、4G等)',
  `create_time` timestamp COMMENT '创建记录时间',
  `suggestion_status` int COMMENT '状态(0-提交1-回复等)',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `suggestion_type` int COMMENT '类型：1-系统意见反馈2-专题反馈3-搜索反馈 4超时反馈 5无内容反馈 6摇一摇反馈 7摇一摇报错 8体系化课程异常 9会议预告反馈 10特色栏目反馈 11病历夹反馈12锦囊反馈',
  `state` int COMMENT '反馈处理状态（1-等待，2-处理中，3-已处理）',
  `browse_type` int COMMENT '1-主页,2-视频应用页,3-文库应用页,4-视频内容页,5-文库内容页,
6-个人主页, 7-个人首页,8-个人资料页,9-话题内容页,10-病例内容页,11-会场页面,12-评论内容页, 13-病例应用页,14-话题应用页,15-fellowship应用页面,
16-医师定考应用页面,17-视频列表页面, 18-文库列表页面,19-话题列表页面,20-病例列表页面,21-年会内容页面,22-组织应用页面, 
23-厂商应用页面,24-会议直播页面-多会场,25-直播列表页面,26-会议回放页面,27-登录,28-注册, 29-找回密码,30-医师频道页,
31-医师列表页,32-搜索页面,33-视频pk页面,34-专题页面,35-热门列表, 36-朋友圈,37-标签专题,38-每日最新,39-每周最新,
40-每日最热,41-每周最热,42-会议列表,43-发现首页, 44-按专业,45-按疾病,46-按术士,47-按标签,48-按类型,49-按专题,
50-权威专家,51-热门活动, 52-活动内容页,53-消息列表,54-关注提醒,55-评论我的,56-提醒我看,57-赞了我的,58-搜索视频,
59-搜索文库,60-搜索话题,61-搜索病例,62-搜索医师,63-搜索会议,64-我的贡献,65-我的动态,66-他人动态, 67-他人贡献,
68-他人简介,69-认证第一步,70-认证第二步,71-评论输入页面, 72-登录选择页,73-联合登录-微信登录,73-联合登录-caos登录,
74-找回密码-验证码输入,75-找回密码-重设置密码, 76-手机验证-输入手机号,77-手机验证-验证码输入,78-搜索-输入页,79-专题内容页, 
80-活动介绍,81-活动资源列表,82-活动-我的作品,83-病例编辑页,84-话题编辑页, 85-发布-选择页面,86-发布病例-专业选择,
87-病例影像资料页,88-草稿页,89-文档编辑页, 90-文章编辑页,91-视频编辑页,92-视频选拔-信息完善页,93-视频选拔-专业选择页,
94-会议日程页面,95-收藏页,96-TA的收藏,97-关注资源页,98-浏览记录,99-我的评论, 100-下载页-下载完成,101-下载页-正在下载,
102-简介编辑页,103-认证信息编辑页, 104-设置页面,105-账号安全,106-绑定微信,107-绑定手机,1',
  `source_id` bigint COMMENT '反馈信息来源（如体系化课程中的课程id等）'
) COMMENT '会员反馈表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_suggestion';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_suggestion_attachment` (
  `id` bigint COMMENT '',
  `customer_suggestion_id` bigint COMMENT '会员反馈id',
  `suggestion_att_name` string COMMENT '反馈附件标题',
  `suggestion_att_format` string COMMENT '反馈附件格式',
  `suggestion_att_height` string COMMENT '反馈附件高度',
  `suggestion_att_width` string COMMENT '反馈附件宽度',
  `suggestion_att_url` string COMMENT '反馈附件url',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序号',
  `is_valid` int COMMENT '是否有效',
  `suggestion_att_content` string COMMENT '反馈附件编辑内容'
) COMMENT '会员反馈附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_suggestion_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_supplement` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '用户id',
  `record_head` string COMMENT '备案头像',
  `is_record` int COMMENT '是否备案0-未备案1-已备案',
  `record_reason` string COMMENT '备案理由',
  `credit_rating` int COMMENT '信用评级1-优秀2-良好3-一般4-较差',
  `prac_rec_date` timestamp COMMENT '执业证取得时间',
  `cert_rec_date` timestamp COMMENT '资格证取得时间',
  `title_rec_date` timestamp COMMENT '职称证取得时间',
  `prac_type` string COMMENT '医师职业类别',
  `qualify_or_not` int COMMENT '近两个月定期考核是否合格',
  `auth_through_time` timestamp COMMENT '认证通过时间',
  `remarks_content` string COMMENT '管理员备注',
  `practice_introduction` string COMMENT '执业简介',
  `is_valid` int COMMENT '是否有效0-无效1-有效',
  `create_time` timestamp COMMENT '创建时间',
  `customer_quality` int COMMENT '医生质量等级 0-普通1-优质',
  `total_score` bigint COMMENT '综合分值',
  `customer_level` int COMMENT '医生级别（1-一级、2-二级、3-三级、4-四级、5-五级、6-六级）',
  `is_academician` int COMMENT '是否是两院院士（0-否、1-是）',
  `academician_content` string COMMENT '两院院士正文',
  `is_national_leaguer` int COMMENT '是否是国家级学术团体成员（0-否、1-是）',
  `national_leaguer_content` string COMMENT '国家级学术团体成员正文',
  `major_id_list` string COMMENT '专业方向Id串',
  `illness_id_list` string COMMENT '疾病方向Id串',
  `part_id_list` string COMMENT '擅治部位Id串',
  `operation_state` int COMMENT '手术医生状态（0-非手术、1-手术，2-非手术&手术）'
) COMMENT '会员补充信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_supplement';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_supplement_20180829` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '用户id',
  `is_record` int COMMENT '是否备案0-未备案1-已备案',
  `credit_rating` int COMMENT '信用评级1-优秀2-良好3-一般4-较差',
  `prac_rec_date` timestamp COMMENT '执业证取得时间',
  `cert_rec_date` timestamp COMMENT '资格证取得时间',
  `title_rec_date` timestamp COMMENT '职称证取得时间',
  `prac_type` string COMMENT '医师职业类别',
  `qualify_or_not` int COMMENT '近两个月定期考核是否合格',
  `auth_through_time` timestamp COMMENT '认证通过时间',
  `remarks_content` string COMMENT '管理员备注',
  `practice_introduction` string COMMENT '执业简介',
  `is_valid` int COMMENT '是否有效0-无效1-有效',
  `create_time` timestamp COMMENT '创建时间',
  `customer_quality` int COMMENT '医生质量等级 0-普通1-优质',
  `total_score` bigint COMMENT '综合分值',
  `customer_level` int COMMENT '医生级别（1-一级、2-二级、3-三级、4-四级、5-五级、6-六级）',
  `is_academician` int COMMENT '是否是两院院士（0-否、1-是）',
  `academician_content` string COMMENT '两院院士正文',
  `is_national_leaguer` int COMMENT '是否是国家级学术团体成员（0-否、1-是）',
  `national_leaguer_content` string COMMENT '国家级学术团体成员正文',
  `major_id_list` string COMMENT '专业方向Id串',
  `illness_id_list` string COMMENT '疾病方向Id串',
  `part_id_list` string COMMENT '擅治部位Id串',
  `operation_state` int COMMENT '手术医生状态（0-非手术、1-手术，2-非手术&手术）'
) COMMENT '会员补充信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_supplement_20180829';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_tag` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '医生id',
  `tag_type` int COMMENT '标签类型(1-kol)',
  `tag_name` string COMMENT '标签名称',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效1-有效0-无效'
) COMMENT '用户标签'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_topic` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `parent_id` bigint COMMENT '父话题id',
  `topic_name` string COMMENT '标题',
  `topic_content` string COMMENT '话题内容',
  `publish_time` timestamp COMMENT '发布时间',
  `last_reply_time` timestamp COMMENT '最后回复时间',
  `topic_type` int COMMENT '话题类型（1-视频，2-文库，3-会议，4-话题 ,5-笔记）',
  `ref_id` bigint COMMENT '关联id',
  `topic_tag` string COMMENT 'TAGS',
  `recommend_num` int COMMENT '推荐数',
  `collection_num` int COMMENT '收藏数',
  `discuss_num` int COMMENT '评论数',
  `browse_num` int COMMENT '浏览数',
  `share_num` int COMMENT '转发数',
  `up_num` int COMMENT '点赞数',
  `down_num` int COMMENT '踩数',
  `if_header` int COMMENT '是否置顶',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员话题'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_topic';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_toplist` (
  `id` bigint COMMENT '',
  `toplist_id` bigint COMMENT '榜单id',
  `toplist_type` int COMMENT '榜单类型(1-贡献榜，2-活跃榜)',
  `customer_id` bigint COMMENT '会员id',
  `video_num` bigint COMMENT '周视频贡献数',
  `doc_num` bigint COMMENT '周文库贡献数',
  `case_num` bigint COMMENT '周病例贡献数',
  `topic_num` bigint COMMENT '周话题贡献数',
  `browse_num` bigint COMMENT '周资源浏览数',
  `total_num` bigint COMMENT '周总贡献数',
  `active_num` decimal COMMENT '周活跃数',
  `customer_ranking` int COMMENT '用户名次',
  `is_new` int COMMENT '1-新上榜用户，0-非新上榜用户',
  `special_type` int COMMENT '特殊标识(0-未上榜，1-新上榜，2-连续上榜两周)',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '发送渠道',
  `create_time` timestamp COMMENT '创建时间',
  `review_num` bigint COMMENT '周评论数',
  `share_num` bigint COMMENT '周分享数'
) COMMENT '榜单用户'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_toplist';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_toplist_base_data` (
  `id` bigint COMMENT '',
  `toplist_id` bigint COMMENT '榜单id',
  `customer_id` bigint COMMENT '会员id',
  `ref_id` bigint COMMENT '关联id',
  `ref_type` int COMMENT '5-浏览,6-评论,7-分享',
  `res_id` bigint COMMENT '主题id',
  `res_name` string COMMENT '主题',
  `review_num` bigint COMMENT '主题评论',
  `browse_num` bigint COMMENT '主题浏览数',
  `res_type` int COMMENT '主题类型:1-视频，2-文库，4-话题 ,7-病例',
  `customer_ranking` int COMMENT '用户名次',
  `score` double COMMENT '系数',
  `op_time` timestamp COMMENT '操作时间',
  `creat_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员榜单基础数据'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_toplist_base_data';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_trends` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `trend_type` int COMMENT '动态类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-tag,7-病例,8-回应,9-人)',
  `trend_name` string COMMENT '动态名称',
  `trend_content` string COMMENT '动态内容',
  `op_id` string COMMENT '0-发布、1-回应、2-转发、3-收藏、4-分享、5-赞（拼串存放操作id）',
  `resource_id` bigint COMMENT '资源id',
  `resource_name` string COMMENT '资源显示名称',
  `resource_url` string COMMENT '资源url',
  `header_id` bigint COMMENT '头id',
  `header_name` string COMMENT '头信息名称',
  `header_url` string COMMENT '头url',
  `ref_id` string COMMENT '关联id数组',
  `op_date` timestamp COMMENT '操作时间',
  `trends_desc` string COMMENT '操作描述',
  `up_num` bigint COMMENT '赞数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `share_num` bigint COMMENT '分享数',
  `reprint_num` bigint COMMENT '转发数',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效（0-无效;1-有效；2-系统屏蔽；3-用户删除)',
  `cite_id` bigint COMMENT '',
  `parent_customer_id` bigint COMMENT '回应父级对应的会员id',
  `parent_cite_id` bigint COMMENT '回应父级对应的回应id',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-tag,7-病例)',
  `send_site_id` int COMMENT '站点'
) COMMENT '会员动态'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_trends';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_trends_20180731` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `trend_type` int COMMENT '动态类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-tag,7-病例,8-回应,9-人)',
  `trend_name` string COMMENT '动态名称',
  `trend_content` string COMMENT '动态内容',
  `op_id` string COMMENT '0-发布、1-回应、2-转发、3-收藏、4-分享、5-赞（拼串存放操作id）',
  `resource_id` bigint COMMENT '资源id',
  `resource_name` string COMMENT '资源显示名称',
  `resource_url` string COMMENT '资源url',
  `header_id` bigint COMMENT '头id',
  `header_name` string COMMENT '头信息名称',
  `header_url` string COMMENT '头url',
  `ref_id` string COMMENT '关联id数组',
  `op_date` timestamp COMMENT '操作时间',
  `trends_desc` string COMMENT '操作描述',
  `up_num` bigint COMMENT '赞数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `share_num` bigint COMMENT '分享数',
  `reprint_num` bigint COMMENT '转发数',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效（0-无效;1-有效；2-系统屏蔽；3-用户删除)',
  `cite_id` bigint COMMENT '',
  `parent_customer_id` bigint COMMENT '回应父级对应的会员id',
  `parent_cite_id` bigint COMMENT '回应父级对应的回应id',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-tag,7-病例)',
  `send_site_id` int COMMENT '站点'
) COMMENT '会员动态'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_trends_20180731';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_unite` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `nickname` string COMMENT '昵称',
  `mobile` string COMMENT '手机号',
  `unite_time_mobile` timestamp COMMENT '绑定手机时间',
  `email` string COMMENT '邮箱',
  `unite_time_email` timestamp COMMENT '绑定邮箱时间',
  `unite_id_qq` int COMMENT '联合登录qq_id',
  `unite_name_qq` string COMMENT '联合登录qq',
  `unite_flag_qq` int COMMENT '状态qq',
  `unite_time_qq` timestamp COMMENT '绑定qq时间',
  `unite_id_sina` int COMMENT '联合登录sina_id',
  `unite_name_sina` string COMMENT '联合登录sina',
  `unite_flag_sina` int COMMENT '状态sina',
  `unite_time_sina` timestamp COMMENT '绑定sina时间',
  `unite_id_baidu` int COMMENT '联合登录baidu_id',
  `unite_name_baidu` string COMMENT '联合登录baidu',
  `unite_flag_baidu` int COMMENT '状态baidu',
  `unite_time_baidu` timestamp COMMENT '绑定baidu时间',
  `unite_id_weixin` int COMMENT '',
  `unite_name_weixin` string COMMENT '微信号',
  `unite_flag_weixin` int COMMENT '状态weixin',
  `unite_time_weixin` timestamp COMMENT '邦定时间',
  `unite_id_caos` int COMMENT '联合登录caos',
  `unite_name_caos` string COMMENT 'caos账号',
  `unite_flag_caos` int COMMENT 'caos状态',
  `unite_time_caos` timestamp COMMENT '邦定时间',
  `passwd` string COMMENT '密码',
  `customer_role` int COMMENT '1-系统、2-组织、3-厂商、5-普通医生、6-认证医生、7-住陪学员、11-执业医师',
  `is_check_email` int COMMENT '是否验证邮箱',
  `is_check_mobile` int COMMENT '是否验证手机',
  `is_valid` int COMMENT '是否有效',
  `check_email_time` timestamp COMMENT '验证邮箱时间',
  `check_mobile_time` timestamp COMMENT '验证手机时间',
  `unite_name_zhgk` string COMMENT '中华骨科网帐号',
  `unite_time_zhgk` timestamp COMMENT '中华骨科网注册时间',
  `init_passwd` string COMMENT '明码密码',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT ''
) COMMENT '联合登陆'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_unite';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_unite_20180223` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `nickname` string COMMENT '昵称',
  `mobile` string COMMENT '手机号',
  `unite_time_mobile` timestamp COMMENT '绑定手机时间',
  `email` string COMMENT '邮箱',
  `unite_time_email` timestamp COMMENT '绑定邮箱时间',
  `unite_id_qq` int COMMENT '联合登录qq_id',
  `unite_name_qq` string COMMENT '联合登录qq',
  `unite_flag_qq` int COMMENT '状态qq',
  `unite_time_qq` timestamp COMMENT '绑定qq时间',
  `unite_id_sina` int COMMENT '联合登录sina_id',
  `unite_name_sina` string COMMENT '联合登录sina',
  `unite_flag_sina` int COMMENT '状态sina',
  `unite_time_sina` timestamp COMMENT '绑定sina时间',
  `unite_id_baidu` int COMMENT '联合登录baidu_id',
  `unite_name_baidu` string COMMENT '联合登录baidu',
  `unite_flag_baidu` int COMMENT '状态baidu',
  `unite_time_baidu` timestamp COMMENT '绑定baidu时间',
  `unite_id_weixin` int COMMENT '',
  `unite_name_weixin` string COMMENT '微信号',
  `unite_flag_weixin` int COMMENT '状态weixin',
  `unite_time_weixin` timestamp COMMENT '邦定时间',
  `unite_id_caos` int COMMENT '联合登录caos',
  `unite_name_caos` string COMMENT 'caos账号',
  `unite_flag_caos` int COMMENT 'caos状态',
  `unite_time_caos` timestamp COMMENT '邦定时间',
  `passwd` string COMMENT '密码',
  `customer_role` int COMMENT '1-系统、2-组织、3-厂商、5-普通医生、6-认证医生、7-住陪学员、11-执业医师',
  `is_check_email` int COMMENT '是否验证邮箱',
  `is_check_mobile` int COMMENT '是否验证手机',
  `is_valid` int COMMENT '是否有效',
  `check_email_time` timestamp COMMENT '验证邮箱时间',
  `check_mobile_time` timestamp COMMENT '验证手机时间',
  `unite_name_zhgk` string COMMENT '中华骨科网帐号',
  `unite_time_zhgk` timestamp COMMENT '中华骨科网注册时间',
  `init_passwd` string COMMENT '明码密码',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '联合登陆'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_unite_20180223';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_unite_20180619` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `nickname` string COMMENT '昵称',
  `mobile` string COMMENT '手机号',
  `unite_time_mobile` timestamp COMMENT '绑定手机时间',
  `email` string COMMENT '邮箱',
  `unite_time_email` timestamp COMMENT '绑定邮箱时间',
  `unite_id_qq` int COMMENT '联合登录qq_id',
  `unite_name_qq` string COMMENT '联合登录qq',
  `unite_flag_qq` int COMMENT '状态qq',
  `unite_time_qq` timestamp COMMENT '绑定qq时间',
  `unite_id_sina` int COMMENT '联合登录sina_id',
  `unite_name_sina` string COMMENT '联合登录sina',
  `unite_flag_sina` int COMMENT '状态sina',
  `unite_time_sina` timestamp COMMENT '绑定sina时间',
  `unite_id_baidu` int COMMENT '联合登录baidu_id',
  `unite_name_baidu` string COMMENT '联合登录baidu',
  `unite_flag_baidu` int COMMENT '状态baidu',
  `unite_time_baidu` timestamp COMMENT '绑定baidu时间',
  `unite_id_weixin` int COMMENT '',
  `unite_name_weixin` string COMMENT '微信号',
  `unite_flag_weixin` int COMMENT '状态weixin',
  `unite_time_weixin` timestamp COMMENT '邦定时间',
  `unite_id_caos` int COMMENT '联合登录caos',
  `unite_name_caos` string COMMENT 'caos账号',
  `unite_flag_caos` int COMMENT 'caos状态',
  `unite_time_caos` timestamp COMMENT '邦定时间',
  `passwd` string COMMENT '密码',
  `customer_role` int COMMENT '1-系统、2-组织、3-厂商、5-普通医生、6-认证医生、7-住陪学员、11-执业医师',
  `is_check_email` int COMMENT '是否验证邮箱',
  `is_check_mobile` int COMMENT '是否验证手机',
  `is_valid` int COMMENT '是否有效',
  `check_email_time` timestamp COMMENT '验证邮箱时间',
  `check_mobile_time` timestamp COMMENT '验证手机时间',
  `unite_name_zhgk` string COMMENT '中华骨科网帐号',
  `unite_time_zhgk` timestamp COMMENT '中华骨科网注册时间',
  `init_passwd` string COMMENT '明码密码',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '联合登陆'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_unite_20180619';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_unite_info` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `unite_id` int COMMENT '渠道id',
  `unite_info` string COMMENT '渠道信息',
  `unite_follow_state` int COMMENT '是否关注渠道信息',
  `unite_follow_time` timestamp COMMENT '关注时间',
  `unite_openid` string COMMENT '渠道唯一id',
  `unite_uuid` string COMMENT '联合id（用来关联其他平台）',
  `unite_nickname` string COMMENT '渠道中昵称',
  `unite_sex` int COMMENT '渠道中性别',
  `unite_language` string COMMENT '渠道中语言',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `unite_head_logo` string COMMENT '渠道头像链接',
  `unite_remark` string COMMENT '备注',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '渠道登陆扩展信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_unite_info';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_verification` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `type_id` int COMMENT '验证类型(1-邮箱验证、2-手机验证)',
  `account` string COMMENT '邮箱或手机号',
  `send_content` string COMMENT '发送内容',
  `verificate_url` string COMMENT 'url地址',
  `apply_source` int COMMENT '申请来源:1-网站  2-手机wap 3-ios',
  `apply_time` timestamp COMMENT '提交时间',
  `send_time` timestamp COMMENT '发送时间',
  `confirm_time` timestamp COMMENT '验证时间',
  `site_id` int COMMENT '关联站点(1-allin 2-CAOS)',
  `valid_code` string COMMENT '加密链接或手机验证码',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员帐号验证'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_verification';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_verification_history` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `type_id` int COMMENT '验证类型(1-邮箱验证、2-手机验证)',
  `account` string COMMENT '邮箱或手机号',
  `send_content` string COMMENT '发送内容',
  `verificate_url` string COMMENT 'url地址',
  `apply_source` int COMMENT '申请来源:1-网站  2-手机wap 3-ios',
  `apply_time` timestamp COMMENT '提交时间',
  `send_time` timestamp COMMENT '发送时间',
  `confirm_time` timestamp COMMENT '验证时间',
  `site_id` int COMMENT '关联站点(1-allin 2-CAOS)',
  `valid_code` string COMMENT '加密链接或手机验证码',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员帐号验证'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_verification_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_video_play` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `video_id` bigint COMMENT '视频id',
  `type_id` int COMMENT '1-播放、2-下载',
  `play_time` string COMMENT '关闭或暂停时播放时间点',
  `create_time` timestamp COMMENT '创建记录时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `time_type` int COMMENT '1-关闭或暂停时播放时间点、2-播放时长'
) COMMENT '会员播放视频时间点记录'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_video_play';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_vote` (
  `id` bigint COMMENT '',
  `vote_id` bigint COMMENT '投票id',
  `vote_name` string COMMENT '投票主题',
  `customer_id` bigint COMMENT '发布者',
  `type_id` int COMMENT '投票类型（1-单选，2-多选）',
  `ref_type` int COMMENT '关联类型（1-病例。。。）',
  `ref_id` bigint COMMENT '关联资源id（有可能病例等）',
  `answer` string COMMENT '正确答案（投票后显示内容）',
  `vote_num` bigint COMMENT '投票总数',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `create_time` timestamp COMMENT '创建时间',
  `publish_time` timestamp COMMENT '发布时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点'
) COMMENT '投票主表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_vote';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_vote_detail` (
  `id` bigint COMMENT '',
  `vote_id` bigint COMMENT '投票id',
  `vote_name` string COMMENT '投票主题',
  `ref_customer_id` bigint COMMENT '投票人',
  `options_id` string COMMENT '选项id（A、B、C…）',
  `options_name` string COMMENT '选项标题',
  `vote_time` timestamp COMMENT '投票时间',
  `vote_status` int COMMENT '投票状态（0-取消投票、1-投票）',
  `is_valid` int COMMENT '是否有效',
  `session_id` string COMMENT 'sessionId',
  `send_site_id` int COMMENT '发送渠道',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '投票明细'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_vote_detail';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_vote_options` (
  `id` bigint COMMENT '',
  `vote_id` bigint COMMENT '投票id',
  `vote_name` string COMMENT '投票主题',
  `options_id` string COMMENT '选项id（A、B、C…）',
  `options_name` string COMMENT '选项标题',
  `vote_num` bigint COMMENT '投票数量',
  `is_answer` int COMMENT '是否答案（0-否、1-是）',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `customer_summary` string COMMENT '十佳个人介绍',
  `ref_customer_id` bigint COMMENT '会员id',
  `web_storage_path` string COMMENT '手机版存储路径',
  `page_storage_path` string COMMENT 'PC版存储路径',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '投票选项表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_vote_options';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_customer_website_setting` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `website_url` string COMMENT '个人网站url',
  `template_id` bigint COMMENT '模板选择',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员设置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_customer_website_setting';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_delivery_ad` (
  `id` bigint COMMENT '主键',
  `delivery_ad_id` bigint COMMENT '广告ID',
  `delivery_plan_id` bigint COMMENT '广告计划ID',
  `delivery_position_id` bigint COMMENT '广告位ID',
  `delivery_ad_name` string COMMENT '广告名称',
  `delivery_publisher` string COMMENT '广告发布人',
  `delivery_ad_start_date` timestamp COMMENT '广告开始日期',
  `delivery_ad_end_date` timestamp COMMENT '广告结束日期',
  `delivery_ad_start_time` string COMMENT '投放开始时间',
  `delivery_ad_end_time` string COMMENT '投放结束时间',
  `delivery_ad_url` string COMMENT '跳转链接',
  `delivery_ad_audit_status` int COMMENT '审核状态:0初始状态1待审核 2审核通过 3审核未通过',
  `delivery_ad_status` int COMMENT '投放状态:1.暂停中 2.待投放 3.投放中 4.投放结束',
  `delivery_ad_type` int COMMENT '投放类型:1.长期投放 2.短期投放',
  `delivery_ad_time_type` int COMMENT '投放时间段类型:1.全时间段 2.特定时间段',
  `delivery_ad_pay` int COMMENT '付费模式:0.CPC 1.CPM',
  `delivery_ad_price` decimal COMMENT '广告出价',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '状态:0无效;1有效',
  `delivery_ad_platform` int COMMENT '广告投放平台：1唯医 、2医栈 、3 医鼎',
  `delivery_package_id` bigint COMMENT '定向包id'
) COMMENT '广告'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_delivery_ad';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_delivery_creative` (
  `id` bigint COMMENT '主键',
  `delivery_creative_id` bigint COMMENT '创意ID',
  `delivery_position_id` bigint COMMENT '广告位ID',
  `delivery_ad_id` bigint COMMENT '广告ID',
  `delivery_format` string COMMENT '创意格式',
  `delivery_creative_name` string COMMENT '创意名称',
  `delivery_creative_height` int COMMENT '创意高',
  `delivery_creative_width` int COMMENT '创意宽',
  `delivery_creative_url` string COMMENT '跳转路径',
  `delivery_creative_type` int COMMENT '创意类别:0文字链、1图文、2视频',
  `delivery_creative_info` string COMMENT '文字创意',
  `delivery_creative_pic_path` string COMMENT '图片存储路径',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '状态:0无效;1有效',
  `creative_state` int COMMENT '审核状态：0 未审核 1 审核通过 2 审核拒绝'
) COMMENT '广告创意'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_delivery_creative';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_delivery_operation_records` (
  `id` bigint COMMENT '主键',
  `operation_records_id` bigint COMMENT '操作id',
  `ref_user_id` bigint COMMENT '操作人',
  `operation_object_id` bigint COMMENT '操作标的物id',
  `operation_object_type` int COMMENT '操作对象类型:0操作对象（所有操作对象） 1账户信息 2推广计划 3广告 4定向包',
  `operation_records_type` int COMMENT '操作类型:0操作内容（所有的操作内容） 1增 2删 3改',
  `operation_records_before` string COMMENT '操作前的数据',
  `operation_records_after` string COMMENT '操作后的数据',
  `create_time` timestamp COMMENT '操作时间',
  `is_valid` int COMMENT '操作状态:0无效、1有效'
) COMMENT '广告操作记录表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_delivery_operation_records';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_delivery_package` (
  `id` bigint COMMENT '主键',
  `delivery_package_id` bigint COMMENT '定向包id',
  `ref_user_id` bigint COMMENT '操作人',
  `delivery_package_name` string COMMENT '定向包名称',
  `delivery_package_description` string COMMENT '定向包描述',
  `delivery_package_type` string COMMENT '定向包类型',
  `professional_title` string COMMENT '职称',
  `comm_data_tag_ids` string COMMENT '学组',
  `age` string COMMENT '年龄',
  `sex` string COMMENT '性别',
  `province` string COMMENT '省',
  `city` string COMMENT '市',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '定向包状态'
) COMMENT '定向包'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_delivery_package';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_delivery_plan` (
  `id` bigint COMMENT '主键',
  `delivery_plan_id` bigint COMMENT '广告计划ID',
  `delivery_plan_name` string COMMENT '广告计划名称',
  `delivery_plan_limitation` bigint COMMENT '每日限额',
  `delivery_plan_type` int COMMENT '投放方式：1.标准投放 2.加速投放',
  `delivery_plan_publisher` string COMMENT '发布人:关联登录用户id',
  `delivery_plan_state` int COMMENT '广告计划状态：0暂停 1 启用',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '状态:0无效;1有效'
) COMMENT '广告计划'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_delivery_plan';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_delivery_position` (
  `id` bigint COMMENT '主键',
  `delivery_position_id` bigint COMMENT '广告位ID',
  `delivery_position_name` string COMMENT '广告位名称',
  `delivery_position_platform` int COMMENT '广告投放平台:0PC、1安卓、2IOS、3H5',
  `delivery_position_type` int COMMENT '广告位类型:1图、2文字、3视频',
  `delivery_position_info` string COMMENT '广告标题描述',
  `delivery_sample_description` string COMMENT '广告示例描述',
  `delivery_position_height` int COMMENT '广告高',
  `delivery_position_width` int COMMENT '广告宽',
  `delivery_sample_name` string COMMENT '示例标题',
  `delivery_sample_path` string COMMENT '示例路径',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '状态:0无效;1有效'
) COMMENT '广告位'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_delivery_position';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_delivery_priv` (
  `id` bigint COMMENT '主键',
  `delivery_permissions_id` bigint COMMENT '广告权限ID',
  `ref_user_id` bigint COMMENT '会员ID',
  `delivery_permissions` string COMMENT '会员权限：1管理员；2观看员；3操作员',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '状态:0无效;1有效'
) COMMENT '广告权限'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_delivery_priv';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_fellowship` (
  `id` bigint COMMENT '',
  `fellowship_id` bigint COMMENT '会员id',
  `fellowship_name` string COMMENT '	fellow项目名称',
  `fellowship_summary` string COMMENT 'fellow简介',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `state` int COMMENT '状态',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `fellowship_main_id` bigint COMMENT 'fellowship主项目id',
  `fellowship_main_name` string COMMENT 'fellowship主项目名称'
) COMMENT 'fellowship'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_fellowship';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_fellowship_attachment` (
  `id` bigint COMMENT '',
  `fellowship_id` bigint COMMENT '会员id',
  `fellowship_name` string COMMENT 'fellow项目名称',
  `fellowship_sub_id` bigint COMMENT 'fellow子项目',
  `fellowship_sub_name` string COMMENT 'fellow子项目',
  `fellowship_att_type` int COMMENT '附件类型：1-logo、2-英文简历、3-推荐信',
  `fellowship_att_format` string COMMENT '附件格式：jpg、mp4',
  `fellowship_att_spec` string COMMENT '附件规格：(。。。',
  `fellowship_att_url` string COMMENT '附件url',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT 'fellowship附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_fellowship_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_fellowship_config` (
  `id` bigint COMMENT '',
  `config_id` bigint COMMENT '配置id',
  `fellowship_id` bigint COMMENT '子项目id',
  `config_type` int COMMENT '1-子项目流程,2-须提交信息，3-进修状态说明，4-进修志愿说明，5-知情同意书说明，6-同意调剂说明',
  `config_title` string COMMENT '配置项名称',
  `config_intro` string COMMENT '配置项说明',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `config_data_type` int COMMENT '2(1-报名基本信息,2-中文简历,3-英文简历,4-推荐信,5-语言能力证明,6-其他支持性材料)、3(1-申请未提交、2-等待初审、3-初审未通过、4-等待电话面试、5-电话面试未通过、6-等待面试、7-面试未通过、8-面试已通过、9-活动截止)',
  `is_mandatory` int COMMENT '0-非必填项、1-必填项',
  `config_body` string COMMENT '知情同意书内容',
  `config_data_num` int COMMENT '最小上传文件数',
  `create_time` timestamp COMMENT '创建时间',
  `custom_form` string COMMENT '自定义表单项(1-证件类型及号码、2-最高学历、3-单位性质、4-学员类型、5-医师执业证号、6-医师资格证号)'
) COMMENT 'fellowship配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_fellowship_config';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_fellowship_main` (
  `id` bigint COMMENT '',
  `fellowship_main_id` bigint COMMENT '会员id',
  `fellowship_main_name` string COMMENT 'fellow项目名称',
  `fellowship_main_summary` string COMMENT 'fellow简介',
  `fellowship_main_url` string COMMENT 'fellowship主链接',
  `fellowship_main_pic_url` string COMMENT 'fellowship主图地址',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `ad_position_id` bigint COMMENT '所关联广告位id',
  `fellowship_main_type` int COMMENT 'fellow项目类别(1-国外进修、2-国内进修，3-培训课程)',
  `fellowship_main_majors` string COMMENT '进修所属专业',
  `fellowship_main_date` string COMMENT '项目期限(1-两周、2-一个月、3-两个月、4-三个月、5-六个月、6-十二个月)',
  `share_title` string COMMENT '分享标题',
  `share_content` string COMMENT '分享话术',
  `share_pic_url` string COMMENT '分享图片url'
) COMMENT 'fellowship_main'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_fellowship_main';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_fellowship_main_menu` (
  `id` bigint COMMENT '',
  `fellowship_main_id` bigint COMMENT 'fellowshipId',
  `fellowship_main_menu` string COMMENT 'fellowship菜单项',
  `menu_url_allin` string COMMENT '网站版菜单项url地址',
  `page_storage_path` string COMMENT '网站版菜单项存储路径',
  `web_storage_path` string COMMENT '手机版菜单项存储路径',
  `caos_storage_path` string COMMENT 'CAOS菜单项存储路径',
  `tpl_path` string COMMENT 'tpl路径',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `tree_level` int COMMENT '节点级别',
  `parent_id` bigint COMMENT '父节点'
) COMMENT 'fellowship_main菜单项'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_fellowship_main_menu';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_fellowship_main_menu_recommend` (
  `id` bigint COMMENT '',
  `site_id` int COMMENT '站点id',
  `fellowship_main_id` bigint COMMENT '会议id',
  `menu_id` bigint COMMENT '菜单id',
  `recommend_type` int COMMENT '1-栏目,2-广告位',
  `recommend_id` bigint COMMENT '关联id',
  `recommend_num` int COMMENT '推荐显示条数',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `type_id` int COMMENT '关联类型id(1-栏目,2-广告位)'
) COMMENT 'fellowship_main菜单对应信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_fellowship_main_menu_recommend';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_fellowship_major` (
  `id` bigint COMMENT '',
  `fellowship_id` bigint COMMENT 'fellow项目id',
  `fellowship_name` string COMMENT 'fellow项目名称',
  `fellowship_major_id` bigint COMMENT '业务主键id',
  `fellowship_department` int COMMENT '进修科室(1-骨科、2-大外科、3-临床)',
  `tag_id` bigint COMMENT 'tag_id',
  `tag_name` string COMMENT 'tag名称',
  `fellowship_date` string COMMENT '进修期限(1-两周、2-一个月、3-两个月、4-三个月、5-六个月、6-十二个月)',
  `fellowship_time` string COMMENT '进修时间',
  `fellowship_describe` string COMMENT '进修描述',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '进修专业管理'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_fellowship_major';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_fellowship_rule` (
  `id` bigint COMMENT '',
  `fellowship_id` bigint COMMENT '会员id',
  `fellowship_name` string COMMENT 'fellow项目名称',
  `rule_name` string COMMENT '规则名称',
  `rule_url` string COMMENT '规则链接',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT 'fellowship项目规则'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_fellowship_rule';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_fellowship_sub` (
  `id` bigint COMMENT '',
  `fellowship_id` bigint COMMENT '会员id',
  `fellowship_name` string COMMENT 'fellow项目名称',
  `fellowship_sub_id` bigint COMMENT 'fellow子项目',
  `fellowship_sub_name` string COMMENT 'fellow子项目',
  `fellowship_sub_summary` string COMMENT 'fellow_sub简介',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `district` string COMMENT '区/县',
  `fellowship_sub_time` string COMMENT '进修时间'
) COMMENT 'fellowship_sub'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_fellowship_sub';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_kele_hospital_online` (
  `id` bigint COMMENT '',
  `hospital_name` string COMMENT '医院名称',
  `hospital_othername` string COMMENT '别名',
  `hospital_type_id` int COMMENT '医院类型',
  `hospital_triage_level` int COMMENT '会诊级别1-一级2-二级',
  `hospital_type_id_old` int COMMENT '',
  `hospital_level_id` int COMMENT '医院等级',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `hospital_address` string COMMENT '医院地址',
  `hospital_tele` string COMMENT '医院联系电话',
  `hospital_department` string COMMENT '重点科室',
  `hospital_management` string COMMENT '经营方式',
  `hospital_post` string COMMENT '邮编',
  `hospital_website` string COMMENT '医院网址',
  `state` int COMMENT '医院打分-用于搜索',
  `is_internet` int COMMENT '是否唯医互联网骨科医院0-否1-是',
  `is_top` int COMMENT '是否全国骨科top10医院1-是0-否',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `source` int COMMENT '数据来源：0-后台添加，1-用户补充，2-好大夫，3-人工校对',
  `is_verify` int COMMENT '是否验证：0-未验证，1-已验证'
) COMMENT '医院列表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_kele_hospital_online';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_kele_hospital_online_20180614` (
  `id` bigint COMMENT '',
  `hospital_name` string COMMENT '医院名称',
  `hospital_othername` string COMMENT '别名',
  `hospital_type_id` int COMMENT '医院类型',
  `hospital_triage_level` int COMMENT '会诊级别1-一级2-二级',
  `hospital_type_id_old` int COMMENT '',
  `hospital_level_id` int COMMENT '医院等级',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `hospital_address` string COMMENT '医院地址',
  `hospital_tele` string COMMENT '医院联系电话',
  `hospital_department` string COMMENT '重点科室',
  `hospital_management` string COMMENT '经营方式',
  `hospital_post` string COMMENT '邮编',
  `hospital_website` string COMMENT '医院网址',
  `state` int COMMENT '医院打分-用于搜索',
  `is_internet` int COMMENT '是否唯医互联网骨科医院0-否1-是',
  `is_top` int COMMENT '是否全国骨科top10医院1-是0-否',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `source` int COMMENT '数据来源：0-后台添加，1-用户补充，2-好大夫，3-人工校对',
  `is_verify` int COMMENT '是否验证：0-未验证，1-已验证'
) COMMENT '医院列表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_kele_hospital_online_20180614';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_kpi_employee` (
  `id` bigint COMMENT '',
  `employee_id` bigint COMMENT '员工编号',
  `employee_name` string COMMENT '员工姓名',
  `sex` int COMMENT '性别：1男 2女',
  `mobile` string COMMENT '联系电话',
  `user_login_name` string COMMENT '登录名',
  `department_id` bigint COMMENT '所属部门id',
  `department_name` string COMMENT '所属部门名称: 1-系统应用部,2-IT运维部,3-Android研发部,4-IOS研发部,5-Web前端研发部,6-测试部',
  `is_valid` int COMMENT '状态：0无效 1有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT 'kpi员工表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_kpi_employee';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_kpi_template` (
  `id` bigint COMMENT '',
  `kpi_template_id` bigint COMMENT 'kpi模板id',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `template_type` int COMMENT '类别：1-唯医，2-医鼎，3-医栈，4-唯医会诊，5-数据，6-IT',
  `kpi_task` string COMMENT '工作任务',
  `kpi_task_type` int COMMENT '工作类型：1-技术研究，2-项目研发，3-项目管理，4-部门管理，5-流程建设，6-培训分享，7-参会学习',
  `finish_execution` string COMMENT '完成情况',
  `finish_quality` string COMMENT '完成质量',
  `kpi_reason` string COMMENT '进度延迟原因',
  `update_time` string COMMENT '修改时间',
  `kpi_remark` string COMMENT '备注',
  `department_id` bigint COMMENT '所属部门id',
  `department_name` string COMMENT '所属部门名称: 1-系统应用部,2-IT运维部,3-Android研发部,4-IOS研发部,5-Web前端研发部,6-测试部',
  `employee_id` bigint COMMENT '所属员工编号',
  `employee_name` string COMMENT '所属员工姓名',
  `is_valid` int COMMENT '状态：0无效 1有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT 'kpi模板表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_kpi_template';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_med_doc` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文档id（生成id规则：毫秒数）',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `doc_name` string COMMENT '名称',
  `doc_type` int COMMENT '类型（1-解剖知识、2-诊疗技术 、3-经典病例、4-骨科教程、5-产品详解、6-技术操作、7-手术技巧、8-学术进展、9-经验总结、10-产品手册、11-学术会议、12-行业动态）',
  `doc_author` string COMMENT '作者 冗余存储串',
  `doc_translator` string COMMENT '译者 冗余存储串',
  `doc_source` string COMMENT '来源',
  `doc_abstract` string COMMENT '摘要',
  `doc_url` string COMMENT '文档url',
  `page_storage_path` string COMMENT 'pc存储路径',
  `doc_logo_url` string COMMENT '缩略图',
  `external_url` string COMMENT '外部url',
  `app_storage_path` string COMMENT 'app存储路径',
  `web_storage_path` string COMMENT '手机版存储路径',
  `doc_status` int COMMENT '1-提交审核、2-审核通过、3-审核拒绝、4-该文档附件不合格',
  `reason` string COMMENT '审核拒绝原因',
  `tpl_path` string COMMENT '模版(108-pdf,109-图文结合,110-pdf图集)',
  `is_draft` int COMMENT '是否草稿',
  `create_time` timestamp COMMENT '创作日期',
  `publish_time` timestamp COMMENT '发布日期',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `browse_num` bigint COMMENT '浏览数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `share_num` bigint COMMENT '分享数',
  `prefer_up_num` bigint COMMENT '赞数',
  `follow_num` bigint COMMENT '关注数',
  `is_customer_essential` int COMMENT '是否精华（会员设置）',
  `is_sys_essential` int COMMENT '是否精华（系统设置）',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '排序',
  `sort_list_authority` bigint COMMENT '列表排序权重',
  `sort_authority_secondary` bigint COMMENT '次要列表排序权重',
  `site_id` int COMMENT '站点id',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效,2-用户删除)',
  `ref_id` bigint COMMENT '关联产品id'
) COMMENT '文库信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_med_doc';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_med_doc_attachment` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文档id',
  `doc_att_type` int COMMENT '文档资源类型：1-图片，2-视频,3-文档,4-PDF',
  `doc_att_size` string COMMENT '文档资源大小：KB',
  `doc_att_format` string COMMENT '文档资源格式：jpg、mp4...',
  `doc_att_spec` string COMMENT '文档附件规格(1-原始文件、2-缩略图源文件、3-650*230、4-300*300)',
  `doc_att_height` string COMMENT '文档资源高度',
  `doc_att_width` string COMMENT '文档资源宽度',
  `doc_att_url` string COMMENT '文档资源url',
  `upload_time` timestamp COMMENT '文档资源上传时间',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效',
  `play_num` int COMMENT '是否已经批处理(0-未处理1-已处理2-处理失败)'
) COMMENT '文档附件详细信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_med_doc_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_med_doc_content` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文库id（生成id规则：毫秒数）',
  `doc_content` string COMMENT '评论内容',
  `tpl_path` string COMMENT '模板路径',
  `create_time` timestamp COMMENT '创作日期',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效,2-用户删除)'
) COMMENT '文库图文结合信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_med_doc_content';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_med_pdf_pic` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '涉及资源id',
  `resource_type` int COMMENT '资源类型1-视频、2-文库、4-产品、5-品牌',
  `att_id` bigint COMMENT '对应附件id',
  `att_size` string COMMENT '资源大小：KB',
  `att_format` string COMMENT '资源格式：jpg、mp4...',
  `att_spec` string COMMENT '附件规格(1-原始文件、2-压缩文件)',
  `att_height` string COMMENT '资源高度',
  `att_width` string COMMENT '资源宽度',
  `att_url` string COMMENT '资源url',
  `upload_time` timestamp COMMENT '资源上传时间',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `play_num` int COMMENT '是否已经批处理(0-未处理1-已处理2-处理失败)'
) COMMENT 'pdf对应图片信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_med_pdf_pic';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_med_video` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `video_name` string COMMENT '视频标题',
  `video_type` int COMMENT '类型（1-解剖知识、2-诊疗技术 、3-经典病例、4-骨科教程、5-产品详解、6-技术操作、7-手术技巧、8-学术进展、9-经验总结、11-学术会议、12-行业动态）',
  `video_author` string COMMENT '视频作者 冗余存储串',
  `video_translator` string COMMENT '视频译者 冗余存储串',
  `video_source` string COMMENT '视频来源',
  `video_abstract` string COMMENT '视频摘要',
  `video_status` int COMMENT '视频状态',
  `video_url` string COMMENT '视频url',
  `video_logo_url` string COMMENT '缩略图地址',
  `page_storage_path` string COMMENT '播放器存储路径',
  `web_storage_path` string COMMENT '手机版存储路径',
  `tpl_path` string COMMENT '模版路径or模版id',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功,3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `approval_status` int COMMENT '1-提交审核、2-审核通过、4-审核拒绝',
  `approval_reason` string COMMENT '审核说明',
  `is_customer_essential` int COMMENT '是否精华（会员设置）',
  `is_sys_essential` int COMMENT '是否精华（系统设置）',
  `follow_num` bigint COMMENT '关注数',
  `browse_num` bigint COMMENT '浏览数',
  `play_num` bigint COMMENT '播放数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `share_num` bigint COMMENT '分享数',
  `prefer_up_num` bigint COMMENT '赞数',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '顺序号',
  `sort_list_authority` bigint COMMENT '列表排序权重',
  `sort_authority_secondary` bigint COMMENT '次要列表排序权重',
  `create_time` timestamp COMMENT '创作时间',
  `publish_time` timestamp COMMENT '发布时间',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `play_time` string COMMENT '播放时长',
  `site_id` int COMMENT '站点id',
  `is_valid` int COMMENT '是否有效'
) COMMENT '视频'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_med_video';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_med_video_attachment` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `video_att_type` int COMMENT '视频附件类型：1-图片，2-视频，3-七牛图片，4-七牛视频......',
  `video_att_size` string COMMENT '视频附件大小：KB',
  `video_att_format` string COMMENT '视频附件格式：jpg、mp4...',
  `video_att_spec` string COMMENT '视频附件规格：(1-原始文件、2-缩略图源文件、3-315*210、4-650*230)',
  `video_att_height` string COMMENT '视频附件高度',
  `video_att_width` string COMMENT '视频附件宽度',
  `video_att_url` string COMMENT '视频附件url',
  `is_download` int COMMENT '默认值0未下载,1已从七牛下载',
  `upload_time` timestamp COMMENT '视频附件上传时间',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效',
  `play_num` int COMMENT '是否已经批处理(0-未处理1-已处理2-处理失败)'
) COMMENT '视频附件详细信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_med_video_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_merge_table` (
  `id` bigint COMMENT 'id',
  `allin_id` bigint COMMENT '唯医数据表id',
  `allin_customer_id` bigint COMMENT '唯医会员id',
  `med_id` bigint COMMENT '医栈数据表id',
  `med_customer_id` bigint COMMENT '医栈会员id',
  `is_valid` int COMMENT '是否有效'
) COMMENT '合并对照表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_merge_table';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_multicenter_case_attachment` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `clinical_id` bigint COMMENT '基础数据id',
  `group_id` bigint COMMENT '分组号',
  `att_type` int COMMENT '附件类型：1-图片，2-视频',
  `att_size` string COMMENT '附件大小：KB',
  `att_format` string COMMENT '附件格式：jpg、png...',
  `att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、8-480*320、9-1280*720、10-900*600、12-300*200、13-450*300、14-750*500)',
  `att_height` string COMMENT '附件高度',
  `att_width` string COMMENT '附件宽度',
  `att_url` string COMMENT '附件url',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功,3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `play_num` bigint COMMENT '播放次数',
  `play_time` string COMMENT '播放时长',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '多中心平台病例附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_multicenter_case_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_multicenter_case_detail` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `clinical_id` bigint COMMENT '基础数据id',
  `clinical_content` string COMMENT '数据值',
  `group_id` bigint COMMENT '分组号',
  `sort_id` int COMMENT '排序',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '多中心平台病例数据表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_multicenter_case_detail';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_multicenter_case_supplement` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `clinical_id` bigint COMMENT '基础数据id',
  `content` string COMMENT '内容',
  `group_id` bigint COMMENT '分组号',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '多中心平台病例补充数据（长字段）表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_multicenter_case_supplement';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_multicenter_customer_process` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '用户id',
  `major_id` bigint COMMENT '课题id',
  `customer_state` int COMMENT '0-申请加入，1-审核通过,2-审核拒绝,3-移除,4-取消申请',
  `response_info` string COMMENT '申请理由',
  `case_num` bigint COMMENT '病例数',
  `has_follow` int COMMENT '是否有随访系统（1-有，0-无）',
  `op_user` bigint COMMENT '审核人id',
  `apply_time` timestamp COMMENT '创建时间',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `feedback_info` string COMMENT '拒绝理由',
  `email` string COMMENT '邮箱',
  `mobile` string COMMENT '手机号'
) COMMENT '多中心平台用户审核表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_multicenter_customer_process';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_multicenter_major` (
  `id` bigint COMMENT '',
  `major_id` bigint COMMENT '课题id',
  `major_title` string COMMENT '课题名称',
  `subject_id` bigint COMMENT '所属专科id（关节-2、脊柱-7、创伤-9）',
  `major_type` int COMMENT '课题类型（1-回顾性研究）',
  `major_abstract` string COMMENT '简介',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `major_state` int COMMENT '审核状态（0-审核未通过，1-审核通过,2-审核中,3-已结束）',
  `case_num` bigint COMMENT '病例数',
  `page_storage_path` string COMMENT 'pc存储路径',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `publish_time` timestamp COMMENT '发布时间',
  `is_valid` int COMMENT '是否有效',
  `tpl_path` string COMMENT '模版路径or模版id',
  `is_open` int COMMENT '是否开放申请加入(1-允许加入，0-拒绝加入)',
  `op_user` string COMMENT '后台操作人id'
) COMMENT '多中心平台课题表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_multicenter_major';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_multicenter_major_attachment` (
  `id` bigint COMMENT '',
  `major_id` bigint COMMENT '课题id',
  `att_type` int COMMENT '附件类型：1-图片，2-视频',
  `att_size` string COMMENT '附件大小：KB',
  `att_format` string COMMENT '附件格式：jpg、png...',
  `att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、8-480*320、9-1280*720、 10-900*600、12-300*200、13-450*300、14-750*500)',
  `att_height` string COMMENT '附件高度',
  `att_width` string COMMENT '附件宽度',
  `att_url` string COMMENT '附件url',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功,3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `play_num` bigint COMMENT '播放次数',
  `play_time` string COMMENT '播放时长',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '多中心平台课题附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_multicenter_major_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_multicenter_major_case` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `major_id` bigint COMMENT '课题id',
  `customer_id` bigint COMMENT '病例所属人id',
  `enter_id` bigint COMMENT '录入者id',
  `case_type` int COMMENT '病例类型（后期扩展用）：1-课题内病例，2-申请加入课题的病例',
  `sort_id` int COMMENT '顺序号',
  `tpl_path` string COMMENT '模版路径or模版id',
  `page_storage_path` string COMMENT 'pc存储路径',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效 1-有效 0-无效',
  `publish_time` timestamp COMMENT '发布时间',
  `patient_code` string COMMENT '病例编号'
) COMMENT '多中心平台课题病例关联表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_multicenter_major_case';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_multicenter_major_customer` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '用户id',
  `major_id` bigint COMMENT '课题id',
  `customer_type` int COMMENT '用户类型，1-所有者、2-参与者、3-录入者',
  `customer_state` int COMMENT '0-申请加入成员，1-课题组成员，2-审核拒绝成员，3-已移除成员,4-已取消申请成员',
  `case_num` bigint COMMENT '上传病例数',
  `parent_id` bigint COMMENT '录入者隶属人id',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `sort_id` int COMMENT '排序'
) COMMENT '多中心平台课题用户关联表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_multicenter_major_customer';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_multicenter_major_supplement` (
  `id` bigint COMMENT '',
  `supplement_id` bigint COMMENT '补充说明id',
  `major_id` bigint COMMENT '课题id',
  `supplement_type` int COMMENT '补充类型（1-研究目的，2-课题要求，3-纳入标准，4-排除标准）',
  `content` string COMMENT '内容',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '多中心平台课题补充说明（长字段）表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_multicenter_major_supplement';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_multicenter_major_templet` (
  `id` bigint COMMENT '',
  `major_id` bigint COMMENT '课题id',
  `templet_id` bigint COMMENT '模板id',
  `clinical_id` bigint COMMENT '基础数据id',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `full_path` string COMMENT '上级路径（拼串形式存放上级data_id）',
  `parent_id` bigint COMMENT '父节点',
  `group_id` bigint COMMENT '分组号',
  `sort_id` int COMMENT '排序',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '多中心平台模板和基础数据关联表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_multicenter_major_templet';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_multicenter_quantization_detail` (
  `id` bigint COMMENT '',
  `templet_id` bigint COMMENT '病例id',
  `quantization_id` bigint COMMENT '量表基础数据id',
  `quantization_content` string COMMENT '数据值',
  `quantization_score` string COMMENT '得分',
  `sort_id` int COMMENT '排序',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '多中心平台用户量表内容数据表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_multicenter_quantization_detail';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_multicenter_quantization_detail_20180619` (
  `id` bigint COMMENT '',
  `templet_id` bigint COMMENT '病例id',
  `quantization_id` bigint COMMENT '量表基础数据id',
  `quantization_content` string COMMENT '数据值',
  `quantization_score` string COMMENT '得分',
  `sort_id` int COMMENT '排序',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '多中心平台用户量表内容数据表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_multicenter_quantization_detail_20180619';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_multicenter_quantization_templet` (
  `id` bigint COMMENT '',
  `templet_id` bigint COMMENT '模板id',
  `page_storage_path` string COMMENT '存储路径',
  `tpl_path` string COMMENT '模版路径or模版id',
  `case_id` bigint COMMENT '病例id',
  `clinical_id` bigint COMMENT '关联的病例基础数据id',
  `group_id` bigint COMMENT '分组号',
  `quantization_type` int COMMENT '类型(16-DASH评分，17-JOA评分，18-Harris评分，19-ASES评分，20-HSS评分，21-Mayo肘关节功能评分，22-Majeed评分，23-Gibbons骶神经损伤分级，24-Samantha X线评 分，25-SF-36评分，26-QOL评分，27-UCLA评分，28-踝关节Kofoed评分,29-Constant-Murphy评分,30-Neer评分)',
  `sort_id` int COMMENT '排序',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '多中心平台量表模板表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_multicenter_quantization_templet';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_multicenter_quantization_templet_20180619` (
  `id` bigint COMMENT '',
  `templet_id` bigint COMMENT '模板id',
  `page_storage_path` string COMMENT '存储路径',
  `tpl_path` string COMMENT '模版路径or模版id',
  `case_id` bigint COMMENT '病例id',
  `clinical_id` bigint COMMENT '关联的病例基础数据id',
  `group_id` bigint COMMENT '分组号',
  `quantization_type` int COMMENT '类型(16-DASH评分，17-JOA评分，18-Harris评分，19-ASES评分，20-HSS评分，21-Mayo肘关节功能评分，22-Majeed评分，23-Gibbons骶神经损伤分级，24-Samantha X线评 分，25-SF-36评分，26-QOL评分，27-UCLA评分，28-踝关节Kofoed评分,29-Constant-Murphy评分,30-Neer评分)',
  `sort_id` int COMMENT '排序',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '多中心平台量表模板表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_multicenter_quantization_templet_20180619';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_navigation_scheduling` (
  `id` bigint COMMENT '',
  `navigation_id` bigint COMMENT '导航id',
  `navigation_attachment_id` string COMMENT '导航图标id',
  `navigation_status` int COMMENT '导航状态(1-Hot，2-New)',
  `status_attachment_id` bigint COMMENT '导航状态图标id',
  `create_time` timestamp COMMENT '创建时间',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `update_time` timestamp COMMENT '更新时间'
) COMMENT '动态入口排期表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_navigation_scheduling';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_order_inv` (
  `id` bigint COMMENT '',
  `order_id` bigint COMMENT '订单号',
  `inv_title` string COMMENT '发票抬头title',
  `inv_type` int COMMENT '发票类型（1-普通发票、2-增值税）',
  `inv_content` string COMMENT '发票内容（会费。。。）',
  `inv_money` decimal COMMENT '发票金额',
  `province_id` bigint COMMENT '省',
  `city_id` bigint COMMENT '市',
  `district_id` bigint COMMENT '区',
  `receive_address` string COMMENT '邮寄地址',
  `consignee` string COMMENT '收货人',
  `receive_tel` string COMMENT '收货电话',
  `zip_code` string COMMENT '邮政编码',
  `inv_status` int COMMENT '发票状态(1-未开\2-已开\3-已邮寄)',
  `province` string COMMENT '省',
  `city` string COMMENT '市',
  `district` string COMMENT '区/县'
) COMMENT '发票信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_order_inv';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_orderform` (
  `id` bigint COMMENT '',
  `order_id` bigint COMMENT '订单号',
  `customer_id` bigint COMMENT '会员卡号',
  `product_money` decimal COMMENT '商品总金额',
  `affixation` decimal COMMENT '附加费',
  `paid_money` decimal COMMENT '应付总金额',
  `payment_mode` int COMMENT '支付方式(0-货到付款,1-在线支付,2-公司转帐,3-邮局汇款)',
  `is_invoice` int COMMENT '是否需要发票',
  `consignee` string COMMENT '收货人',
  `receive_tel` string COMMENT '收货电话',
  `zip_code` string COMMENT '邮政编码',
  `province_id` bigint COMMENT '省',
  `city_id` bigint COMMENT '市',
  `district_id` bigint COMMENT '区',
  `receive_address` string COMMENT '收货地址',
  `order_status` int COMMENT '订单状态(0:待付款  1:已付款待收货   2:订单完成  3:已取消  4:待确认付款)',
  `remark` string COMMENT '备注',
  `create_time` timestamp COMMENT '创建时间',
  `modify_time` timestamp COMMENT '最近修改时间',
  `valid_time` timestamp COMMENT '有效日期',
  `site_id` int COMMENT '站点信息',
  `is_valid` int COMMENT '是否有效',
  `user_type` int COMMENT '1-caos会员,2-参会人员,3-唯医会员',
  `main_order_id` bigint COMMENT '主订单号',
  `order_type` int COMMENT '订单类型(1-caos会费订单,2-参会订单)',
  `email` string COMMENT '邮箱',
  `mobile` string COMMENT '手机',
  `province` string COMMENT '省',
  `city` string COMMENT '市',
  `district` string COMMENT '区/县',
  `order_name` string COMMENT '订单名称'
) COMMENT '订单主表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_orderform';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_orderform_payment` (
  `id` bigint COMMENT '',
  `order_id` bigint COMMENT '订单号',
  `payment_mode` int COMMENT '支付方式(0-货到付款,1-在线支付,2-银行转帐,3-邮局汇款)',
  `payment_detail` int COMMENT '支付明细（0-现金、1-pos、2-支付宝，3-微信支付，4-银行转账，5-邮局汇款...）',
  `payment_money` decimal COMMENT '实付金额',
  `paid_money` decimal COMMENT '应付金额',
  `pay_time` timestamp COMMENT '付款时间',
  `create_time` timestamp COMMENT '创建时间',
  `state` int COMMENT '状态（0-等待支付、1-支付完成、2－支付错误）',
  `remark` string COMMENT '备注',
  `is_valid` int COMMENT '是否有效'
) COMMENT '付款信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_orderform_payment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_orderform_payment_detail` (
  `id` bigint COMMENT '',
  `order_id` bigint COMMENT '订单id',
  `payment_detail` int COMMENT '支付明细（0-现金、1-pos、2-支付宝，3-微信支付，4-银行转账，5-邮局汇款...）',
  `payment_money` decimal COMMENT '实付金额',
  `trade_no` string COMMENT '交易号(第三方)',
  `is_success` string COMMENT '返回状态',
  `notify_type` string COMMENT '返回类型',
  `buyer_id` string COMMENT '返回账户id',
  `buyer_account` string COMMENT '返回账户',
  `return_msg` string COMMENT '第三方返回信息',
  `notify_time` timestamp COMMENT '返回时间',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '订单付款明细表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_orderform_payment_detail';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_orderform_state` (
  `id` bigint COMMENT '',
  `order_id` bigint COMMENT '订单id',
  `state` int COMMENT '状态id(1-订单录入,2-订单确认,3-发送确认订单邮件,4-订单付款完成,5-订单确认函...)',
  `state_time` timestamp COMMENT '状态变化时间',
  `create_time` timestamp COMMENT '创建时间',
  `remark` string COMMENT '状态备注',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '订单状态表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_orderform_state';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_orderform_sub` (
  `id` bigint COMMENT '',
  `order_id` bigint COMMENT '订单号',
  `product_id` bigint COMMENT '商品id',
  `product_name` string COMMENT '商品名称',
  `product_number` int COMMENT '商品数量',
  `product_price` decimal COMMENT '原商品单价',
  `paid_price` decimal COMMENT '商品应付单价',
  `sum_money` decimal COMMENT '总价',
  `bonus_unit` decimal COMMENT '积分系数',
  `is_valid` int COMMENT '是否有效'
) COMMENT '订单子表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_orderform_sub';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_product_info` (
  `id` bigint COMMENT '',
  `product_id` bigint COMMENT '商品编码7位',
  `product_name` string COMMENT '商品名称',
  `product_type` int COMMENT '商品类型（虚拟商品、实物）',
  `ref_type` int COMMENT '所关联类型（1-主会、2-分会、3-。。。）',
  `ref_id` bigint COMMENT '所关联id',
  `is_stock` int COMMENT '是否有库存(0无库存判断,1有库存判断)',
  `stock` int COMMENT '库存（虚拟库存）',
  `is_on_sale` int COMMENT '是否可销售(0下架，1上架)',
  `start_time` timestamp COMMENT '销售开始时间',
  `end_time` timestamp COMMENT '销售结束时间',
  `sell_price` decimal COMMENT '普通售价',
  `seo_meta_description` string COMMENT '',
  `seo_meta_keyword` string COMMENT '',
  `seo_title` string COMMENT '',
  `create_time` timestamp COMMENT '创建时间',
  `last_on_sale_time` timestamp COMMENT '最近上下架时间',
  `site_id` int COMMENT '站点信息',
  `is_valid` int COMMENT '是否有效',
  `product_desc` string COMMENT '商品描述'
) COMMENT '商品信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_product_info';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_product_price` (
  `id` bigint COMMENT '',
  `product_id` bigint COMMENT '商品编码7位',
  `product_name` string COMMENT '商品名称',
  `user_level_id` int COMMENT '会员级别id',
  `channel_id` int COMMENT '渠道（不同渠道售价不同）',
  `sell_price` decimal COMMENT '售价',
  `is_promotion` int COMMENT '是否促销',
  `promotion_price` decimal COMMENT '促销售价',
  `promotion_start_time` timestamp COMMENT '促销价执行开始时间',
  `promotion_end_time` timestamp COMMENT '促销价执行结束时间',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '商品售价表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_product_price';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_question_answer` (
  `id` bigint COMMENT '',
  `answer_id` bigint COMMENT '答题id',
  `customer_id` bigint COMMENT '会员id',
  `session_id` string COMMENT 'sessionId',
  `total_score` decimal COMMENT '满分分数',
  `get_score` decimal COMMENT '得分',
  `question_num` decimal COMMENT '答题数量',
  `right_num` decimal COMMENT '正确数量',
  `wrong_num` decimal COMMENT '错误数量',
  `start_time` timestamp COMMENT '答题开始时间',
  `end_time` timestamp COMMENT '答题结束时间',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '答题主表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_question_answer';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_question_answer_sub` (
  `id` bigint COMMENT '',
  `answer_id` bigint COMMENT '答题id',
  `question_id` bigint COMMENT '问题id',
  `right_options_id` string COMMENT '正确选项',
  `choice_options_id` string COMMENT '选择选项',
  `is_right` int COMMENT '是否正确',
  `score` decimal COMMENT '得分',
  `start_time` timestamp COMMENT '答题开始时间',
  `end_time` timestamp COMMENT '答题结束时间',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '答题明晰表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_question_answer_sub';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_question_choice` (
  `id` bigint COMMENT '',
  `question_id` bigint COMMENT '题目id',
  `question_header` string COMMENT '题干',
  `question_title` string COMMENT '问题',
  `category_id` int COMMENT '题型(1-A1，2-B1… … )',
  `level_id` int COMMENT '难易度(1-易、2-中、3-难)',
  `type_id` int COMMENT '类型(1-单选、2-多选)',
  `analysis` string COMMENT '解析',
  `answer` string COMMENT '答案-冗余存放',
  `study_group` string COMMENT '学组',
  `score` decimal COMMENT '题目分值',
  `designer` string COMMENT '出题人',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '考题主表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_question_choice';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_question_options` (
  `id` bigint COMMENT '',
  `question_id` bigint COMMENT '题目id',
  `option_id` string COMMENT '选项(A,B,C,D,E)',
  `option_title` string COMMENT '选项内容',
  `is_answer` int COMMENT '是否为正确答案',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '考题选项表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_question_options';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_queue_customer` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `ref_id` bigint COMMENT '相关联id如:会员id等',
  `queue_type` int COMMENT '队列类型（1-注册会员，2-认证会员，3-修改资料，4-头像更改（生成多规格），5-关注、取消关注，6-会员发布）',
  `create_time` timestamp COMMENT '创建时间',
  `op_time` timestamp COMMENT '处理时间',
  `op_usr` string COMMENT '处理人',
  `op_state` int COMMENT '处理状态（0-未处理，1-已处理,2-错误）',
  `op_message` string COMMENT '处理消息'
) COMMENT '会员对列表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_queue_customer';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_recommend_customer_first` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `recommend_position` int COMMENT '应用场景(1-网站个人主页有可能认识的人)',
  `recommend_type` int COMMENT '推荐类型(0-推荐,1-同单位,2-同学校等)',
  `recommend_customer_id` bigint COMMENT '推荐会员id',
  `recommend_logo_spec` string COMMENT '头像原图',
  `recommend_logo_spec1` string COMMENT '头像190*190',
  `recommend_logo_spec2` string COMMENT '头像65*65',
  `recommend_logo_spec3` string COMMENT '头像50*50',
  `recommend_logo_spec4` string COMMENT '头像30*30',
  `recommend_last_name` string COMMENT '姓',
  `recommend_first_name` string COMMENT '名',
  `recommend_nickname` string COMMENT '昵称',
  `recommend_medical_title` string COMMENT '医学职称',
  `recommend_hospital` string COMMENT '医院',
  `relationship` int COMMENT '关系(1-未关注，2-已关注，3-粉丝，4-相互关注)',
  `sort_id` bigint COMMENT '',
  `is_valid` int COMMENT '',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_recommend_customer_first';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_recommend_customer_item` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `recommend_position` int COMMENT '应用场景(1-)',
  `recommend_man` string COMMENT '推荐人',
  `recommend_ref_type` int COMMENT '推荐资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-tag,7-病例,8-回应,9-人)',
  `recommend_ref_id` bigint COMMENT '推荐资源id',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '',
  `sort_id` bigint COMMENT '',
  `is_valid` int COMMENT ''
) COMMENT '会员推荐阅读资源'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_recommend_customer_item';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_recommend_customer_second` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `recommend_position` int COMMENT '应用场景(1-网站个人主页有可能认识的人)',
  `recommend_type` int COMMENT '推荐类型(0-推荐,1-同单位,2-同学校等)',
  `recommend_customer_id` bigint COMMENT '推荐会员id',
  `recommend_logo_spec` string COMMENT '头像原图',
  `recommend_logo_spec1` string COMMENT '头像190*190',
  `recommend_logo_spec2` string COMMENT '头像65*65',
  `recommend_logo_spec3` string COMMENT '头像50*50',
  `recommend_logo_spec4` string COMMENT '头像30*30',
  `recommend_last_name` string COMMENT '姓',
  `recommend_first_name` string COMMENT '名',
  `recommend_nickname` string COMMENT '昵称',
  `recommend_medical_title` string COMMENT '医学职称',
  `recommend_hospital` string COMMENT '医院',
  `relationship` int COMMENT '关系(1-未关注，2-已关注，3-粉丝，4-相互关注)',
  `sort_id` bigint COMMENT '',
  `is_valid` int COMMENT '',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_recommend_customer_second';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_recommend_resource_item_first` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '资源id',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-tag,7-病例,8-回应)',
  `recommend_position` int COMMENT '应用场景(1-内容页)',
  `recommend_id` bigint COMMENT '推荐资源id',
  `recommend_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-tag,7-病例,8-回应)',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '排序'
) COMMENT '资源推荐资源-1'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_recommend_resource_item_first';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_recommend_resource_item_first_history` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '资源id',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-tag,7-病例,8-回应)',
  `recommend_position` int COMMENT '应用场景(1-内容页)',
  `recommend_id` bigint COMMENT '推荐资源id',
  `recommend_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-tag,7-病例,8-回应)',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '排序'
) COMMENT '资源推荐资源-1'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_recommend_resource_item_first_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_recommend_resource_item_second` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '资源id',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-tag,7-病例,8-回应)',
  `recommend_position` int COMMENT '应用场景(1-内容页)',
  `recommend_id` bigint COMMENT '推荐资源id',
  `recommend_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-tag,7-病例,8-回应)',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '排序'
) COMMENT '资源推荐资源-2'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_recommend_resource_item_second';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_recommend_resource_video` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `recommend_position` int COMMENT '应用场景(1-内容页)',
  `recommend_video_id` bigint COMMENT '推荐视频id',
  `recommend_video_name` string COMMENT '推荐视频名称',
  `recommend_video_logo` string COMMENT '缩略原图',
  `recommend_video_logo1` string COMMENT '缩略图225*150',
  `recommend_video_logo2` string COMMENT '缩略图157*109',
  `recommend_video_logo3` string COMMENT '缩略图140*190',
  `recommend_video_logo4` string COMMENT '缩略图110*150',
  `recommend_video_logo5` string COMMENT '缩略图75*52',
  `page_storage_path` string COMMENT '播放器存储路径',
  `web_storage_path` string COMMENT '手机版存储路径',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `create_time` timestamp COMMENT '创作时间',
  `publish_time` timestamp COMMENT '发布时间',
  `note_num` bigint COMMENT '笔记数',
  `topic_num` bigint COMMENT '话题数',
  `follow_num` bigint COMMENT '关注数',
  `play_num` bigint COMMENT '播放数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `share_num` bigint COMMENT '分享数',
  `prefer_up_num` bigint COMMENT '赞数',
  `video_score` double COMMENT '评分',
  `is_customer_essential` int COMMENT '是否精华（会员设置）',
  `is_sys_essential` int COMMENT '是否精华（系统设置）',
  `is_header` int COMMENT '是否置顶',
  `last_update_time` timestamp COMMENT '最近更新时间',
  `sort_id` bigint COMMENT '',
  `is_valid` int COMMENT '',
  `video_author` string COMMENT '作者',
  `play_time` string COMMENT '播放时长'
) COMMENT '资源推荐视频表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_recommend_resource_video';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_search_associate_words` (
  `id` bigint COMMENT '',
  `keyWord` string COMMENT '关键词',
  `reusltWord` string COMMENT '联想词',
  `value` int COMMENT '',
  `masterId` int COMMENT '搜索词ID'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_search_associate_words';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_search_associate_words_20181211` (
  `id` bigint COMMENT '',
  `keyWord` string COMMENT '关键词',
  `reusltWord` string COMMENT '联想词',
  `value` int COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_search_associate_words_20181211';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_search_associate_words_master` (
  `id` int COMMENT '',
  `key_word` string COMMENT '搜索词',
  `update_time` timestamp COMMENT '最后更新时间',
  `is_valid` int COMMENT '是否删除（1:是，0:否）'
) COMMENT '复合搜索词主表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_search_associate_words_master';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_search_brochure_words` (
  `id` bigint COMMENT '',
  `brochureId` bigint COMMENT '',
  `keyWord` string COMMENT '关键词'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_search_brochure_words';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_search_mistake_words` (
  `id` bigint COMMENT '',
  `keyWord` string COMMENT '关键词',
  `reusltWord` string COMMENT '纠错词',
  `updateTime` timestamp COMMENT '更新时间'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_search_mistake_words';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_search_mistake_words_20181211` (
  `id` bigint COMMENT '',
  `keyWord` string COMMENT '关键词',
  `reusltWord` string COMMENT '纠错词'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_search_mistake_words_20181211';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_site_profile` (
  `id` int COMMENT '',
  `site_name` string COMMENT '网站名称',
  `site_url` string COMMENT '网站url',
  `site_keyword` string COMMENT '网站关键字',
  `site_desc` string COMMENT '网站描述',
  `site_icp` string COMMENT '网站icp备案号',
  `privacy_statement` string COMMENT '隐私声明',
  `terms_service` string COMMENT '服务条款',
  `site_about` string COMMENT '关于我们',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '站点配置'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_site_profile';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_site_tpl` (
  `id` bigint COMMENT '',
  `site_id` int COMMENT '',
  `tpl_name` string COMMENT '',
  `tpl_path` string COMMENT '',
  `is_valid` int COMMENT '',
  `html_path` string COMMENT 'html地址',
  `type_id` int COMMENT '分类(1-会议、２－终端内容页模板(文档、视频、病例)、3-系统审核邮件、4-edm邮件模板、5-频道页、6-fellowship会员简介、7-活动模板)',
  `content` string COMMENT '内容',
  `file_path` string COMMENT '文件路径',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_site_tpl';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_stat_qiniu_attachment` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '资源id',
  `resource_type` bigint COMMENT '评论类型（1-视频，2-文库，4-话题 ,7-病例）',
  `resource_name` string COMMENT '资源标题',
  `play_time` string COMMENT '播放时长',
  `resource_att_type` int COMMENT '视频附件类型：1-图片，2-视频，3-七牛图片，4-七牛视频......',
  `resource_att_size` string COMMENT '附件大小：KB',
  `resource_att_format` string COMMENT '附件格式：jpg、mp4...',
  `resource_att_spec` string COMMENT '附件规格：(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52)',
  `resource_att_height` string COMMENT '附件高度',
  `resource_att_width` string COMMENT '附件宽度',
  `resource_att_url` string COMMENT '附件url',
  `qiniu_resource_att_url` string COMMENT '七牛附件url',
  `qiniu_resource_att_format` string COMMENT '七牛附件格式：jpg、mp4...',
  `upload_time` timestamp COMMENT '附件上传时间',
  `is_valid` int COMMENT '是否有效',
  `is_download` int COMMENT '默认值0未下载,1已从七牛下载,2-七牛文件无法访问',
  `op_flag` int COMMENT '0-未处理，1-已处理（是否同步到线上attachment）',
  `download_start_time` timestamp COMMENT '本地备份下载起始时间',
  `download_end_time` timestamp COMMENT '本地备份下载结束时间',
  `up_source` int COMMENT '上传来源 1-七牛 2-本地',
  `create_time` timestamp COMMENT '创建时间',
  `op_time` timestamp COMMENT '操作时间',
  `qiniu_id` string COMMENT '七牛唯一id'
) COMMENT '七牛backup中间表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_stat_qiniu_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_sys_message` (
  `id` bigint COMMENT '',
  `create_time` timestamp COMMENT '创建时间(yyyy-mm-dd  hh:mm:ss)',
  `send_time` string COMMENT '发送时间',
  `state` int COMMENT '审核状态(0-等待审核、1-运营确认、2-审核拒绝)',
  `sys_message_type` bigint COMMENT '1-默认系统通知',
  `sys_message_title` string COMMENT '通知标题',
  `sys_message_content` string COMMENT '运营自定义发送的系统通知内容',
  `page_storage_path` string COMMENT '网站PC存储路径',
  `web_storage_path` string COMMENT '手机版H5存储路径',
  `app_storage_parh` string COMMENT 'app手机端存储路径',
  `send_site_id` int COMMENT '操作来源 （1-pc、2-H5、5-ios、6-android）',
  `op_usr` string COMMENT '操作人员id',
  `is_valid` int COMMENT '是否有效 0-无效、1-有效',
  `is_send` int COMMENT '是否发送 -1已发送完毕 '
) COMMENT '系统消息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_sys_message';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_system_version` (
  `id` bigint COMMENT '',
  `site_id` int COMMENT '站点id',
  `version_no` string COMMENT '版本号',
  `update_time` timestamp COMMENT '更新时间',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `version_desc` string COMMENT '版本描述',
  `guide_logo_url` string COMMENT '引导图片',
  `guide_desc` string COMMENT '引导描述',
  `app_url` string COMMENT 'app地址'
) COMMENT '系统版本信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_system_version';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_system_version_20180730` (
  `id` bigint COMMENT '',
  `site_id` int COMMENT '站点id',
  `version_no` string COMMENT '版本号',
  `update_time` timestamp COMMENT '更新时间',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `version_desc` string COMMENT '版本描述',
  `guide_logo_url` string COMMENT '引导图片',
  `guide_desc` string COMMENT '引导描述',
  `app_url` string COMMENT 'app地址'
) COMMENT '系统版本信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_system_version_20180730';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_cms_ad_content` (
  `ID` bigint COMMENT '',
  `owner_channel_id` bigint COMMENT '所属频道ID',
  `owner_place_id` bigint COMMENT '所属广告位ID',
  `owner_ad_id` bigint COMMENT '所属广告ID',
  `item_text` string COMMENT '广告文案',
  `item_url` string COMMENT '广告链接',
  `item_pic_path` string COMMENT '广告图片地址',
  `sort_order` bigint COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `delivery_customer_id` bigint COMMENT '操作人ID',
  `delivery_customer_name` string COMMENT '操作人姓名',
  `delivery_time` timestamp COMMENT '操作时间'
) COMMENT '广告物料表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_cms_ad_content';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_cms_ad_customer` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '客户ID',
  `owner_customer_type` bigint COMMENT '客户级别'
) COMMENT '广告客户表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_cms_ad_customer';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_cms_ad_place` (
  `ID` bigint COMMENT '',
  `owner_channel_id` bigint COMMENT '所属频道ID',
  `place_name` string COMMENT '广告位名称',
  `place_desc` string COMMENT '广告位描述',
  `place_type` int COMMENT '广告位类型',
  `width` int COMMENT '宽',
  `height` int COMMENT '高',
  `sort_order` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效 0-无效 1-有效'
) COMMENT '广告位表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_cms_ad_place';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_cms_ad_profile` (
  `ID` bigint COMMENT '',
  `owner_channel_id` bigint COMMENT '所属频道ID',
  `owner_place_id` bigint COMMENT '所属广告位ID',
  `ad_name` string COMMENT '广告名称',
  `ad_desc` string COMMENT '广告描述',
  `start_time` timestamp COMMENT '投放开始时间',
  `end_time` timestamp COMMENT '投放结束时间',
  `sort_order` bigint COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效 '
) COMMENT '广告表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_cms_ad_profile';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_cms_ad_release` (
  `ID` bigint COMMENT '',
  `owner_channel_id` bigint COMMENT '所属频道ID',
  `owner_place_id` bigint COMMENT '',
  `owner_ad_id` string COMMENT '所属广告ID',
  `start_time` timestamp COMMENT '广告文案',
  `end_time` timestamp COMMENT '广告链接',
  `sort_order` bigint COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `delivery_customer_id` bigint COMMENT '操作人ID',
  `delivery_customer_name` string COMMENT '操作人姓名',
  `delivery_time` timestamp COMMENT '操作时间'
) COMMENT '广告排期表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_cms_ad_release';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_cms_channel` (
  `ID` bigint COMMENT '',
  `channel_name` string COMMENT '',
  `channel_desc` string COMMENT '',
  `link_url` string COMMENT '',
  `seo_meta_description` string COMMENT '',
  `seo_meta_keyword` string COMMENT '',
  `seo_title` string COMMENT '',
  `sort_order` bigint COMMENT '',
  `is_valid` int COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_cms_channel';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_cms_column` (
  `ID` bigint COMMENT '',
  `owner_channel_id` bigint COMMENT '',
  `column_name` string COMMENT '',
  `column_desc` string COMMENT '',
  `column_type` int COMMENT '',
  `column_url` string COMMENT '',
  `banner_pic_type` string COMMENT '',
  `sort_order` int COMMENT '',
  `is_valid` int COMMENT '',
  `tpl_path` string COMMENT '模板路径'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_cms_column';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_cms_link` (
  `ID` bigint COMMENT '',
  `owner_channel_id` bigint COMMENT '',
  `owner_column_id` bigint COMMENT '',
  `link_title` string COMMENT '链接标题',
  `link_url` string COMMENT '链接url',
  `sort_order` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_cms_link';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_cms_news` (
  `ID` bigint COMMENT '',
  `owner_channel_id` bigint COMMENT '所属频道ID',
  `owner_column_id` bigint COMMENT '',
  `news_title` string COMMENT '新闻标题',
  `news_abstract` string COMMENT '新闻摘要',
  `news_body` string COMMENT '新闻内容',
  `news_status` int COMMENT '新闻状态',
  `sort_order` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `storage_path` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_cms_news';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_cms_notice` (
  `NOTICE_ID` bigint COMMENT '',
  `AUDIT_STATUS` string COMMENT '',
  `BEGIN_TIME` timestamp COMMENT '',
  `CHANNEL_ID` bigint COMMENT '',
  `COLUMN_ID` bigint COMMENT '',
  `CREATE_TIME` timestamp COMMENT '',
  `END_TIME` timestamp COMMENT '',
  `IS_VALID` string COMMENT '',
  `NOTICE_CONTENT` string COMMENT '',
  `NOTICE_TITLE` string COMMENT '',
  `NOTICE_URL` string COMMENT '',
  `SORT_ORDER` bigint COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_cms_notice';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_cms_video` (
  `ID` bigint COMMENT '',
  `video_title` string COMMENT '新闻标题',
  `video_abstract` string COMMENT '新闻摘要',
  `video_url` string COMMENT '新闻内容',
  `video_status` int COMMENT '新闻状态',
  `src_storage_path` string COMMENT '',
  `sort_order` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_cms_video';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_comm_audit_log` (
  `ID` bigint COMMENT '',
  `owner_entity_code` string COMMENT '操作实体',
  `owner_entity_name` string COMMENT '操作实体名称',
  `owner_entity_id` bigint COMMENT '客户人数',
  `operator_id` bigint COMMENT '',
  `operator_type` int COMMENT '客户类型状态 0-初始状态 1-申请 2-申请取消 3-审核通过 4-审核拒绝',
  `operator_time` timestamp COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_comm_audit_log';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_comm_customer` (
  `ID` bigint COMMENT '',
  `email` string COMMENT '客户邮件',
  `customer_password` string COMMENT '客户密码',
  `mobile_phone` string COMMENT '客户手机号码',
  `nick_name` string COMMENT '客户昵称',
  `true_name` string COMMENT '客户真实姓名',
  `sex` string COMMENT '性别',
  `birth_year` string COMMENT '出生年',
  `birth_month` string COMMENT '出生月',
  `birth_date` string COMMENT '出生日',
  `birthday` date COMMENT '客户生日',
  `customer_url` string COMMENT '客户Url',
  `regist_ip` string COMMENT '注册时IP',
  `regist_time` timestamp COMMENT '注册时间',
  `activation_key` string COMMENT '激活码',
  `customer_type` int COMMENT '用户类型(1-求职者 2-招聘企业 3-猎头)',
  `id_number` string COMMENT '',
  `qq` string COMMENT '',
  `msn` string COMMENT '',
  `province_id` bigint COMMENT '',
  `city_id` bigint COMMENT '',
  `is_valid` int COMMENT '客户状态 0-无效 1-有效'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_comm_customer';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_comm_customer_attention` (
  `ID` bigint COMMENT '',
  `type_name` string COMMENT '客户类型名称',
  `type_desc` string COMMENT '客户类型描述',
  `customer_number` bigint COMMENT '客户人数',
  `sort_order` int COMMENT '',
  `is_valid` int COMMENT '客户类型状态 0-无效 1-有效'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_comm_customer_attention';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_comm_customer_auth` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '操作实体',
  `owner_customer_type` int COMMENT '操作实体名称',
  `apply_auth_time` timestamp COMMENT '客户人数',
  `pass_auth_time` timestamp COMMENT '',
  `auth_status` int COMMENT '',
  `auth_operator_id` bigint COMMENT '审核人',
  `auth_operator_name` string COMMENT '审核人姓名',
  `pass_operator_id` bigint COMMENT '',
  `pass_operator_name` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_comm_customer_auth';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_comm_customer_integral` (
  `ID` bigint COMMENT '',
  `type_name` string COMMENT '客户类型名称',
  `type_desc` string COMMENT '客户类型描述',
  `customer_number` bigint COMMENT '客户人数',
  `sort_order` int COMMENT '',
  `is_valid` int COMMENT '客户类型状态 0-无效 1-有效'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_comm_customer_integral';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_comm_customer_level` (
  `ID` bigint COMMENT '',
  `level_name` string COMMENT '客户级别名称',
  `level_desc` string COMMENT '客户级别描述',
  `customer_number` bigint COMMENT '客户人数',
  `start_integration` bigint COMMENT '最小积分',
  `end_integration` bigint COMMENT '最大积分',
  `sort_order` int COMMENT '',
  `is_valid` int COMMENT '客户级别状态 0-无效 1-有效'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_comm_customer_level';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_comm_customer_login` (
  `ID` bigint COMMENT '',
  `user_login` string COMMENT '',
  `user_pass` string COMMENT '',
  `user_nicename` string COMMENT '',
  `user_email` string COMMENT '',
  `user_url` string COMMENT '',
  `user_registered` timestamp COMMENT '',
  `user_activation_key` string COMMENT '',
  `user_status` int COMMENT '',
  `display_name` string COMMENT '',
  `user_type` string COMMENT '用户类型(1-求职者 2-招聘企业 3-猎头)'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_comm_customer_login';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_comm_customer_microblog` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `create_time` timestamp COMMENT '创建时间',
  `create_ip` string COMMENT '创建时IP',
  `microblog_desc` string COMMENT '简介',
  `article_number` int COMMENT '微博数',
  `attention_number` int COMMENT '评论数',
  `fans_number` int COMMENT '粉丝数',
  `is_active` int COMMENT '是否启用'
) COMMENT 'SNS微博'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_comm_customer_microblog';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_comm_customer_sns` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '操作实体',
  `attention_number` int COMMENT '关注数',
  `fans_number` timestamp COMMENT '',
  `pass_auth_time` timestamp COMMENT '',
  `auth_status` int COMMENT '',
  `auth_operator_id` bigint COMMENT '审核人',
  `auth_operator_name` string COMMENT '审核人姓名'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_comm_customer_sns';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_comm_customer_type` (
  `ID` bigint COMMENT '',
  `type_name` string COMMENT '客户类型名称',
  `type_desc` string COMMENT '客户类型描述',
  `customer_number` bigint COMMENT '客户人数',
  `sort_order` int COMMENT '',
  `is_valid` int COMMENT '客户类型状态 0-无效 1-有效'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_comm_customer_type';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_comm_data_industry` (
  `ID` bigint COMMENT '',
  `name` string COMMENT '',
  `parent_id` bigint COMMENT '',
  `id_path` string COMMENT '',
  `tree_level` bigint COMMENT '',
  `sort_order` bigint COMMENT '',
  `is_leaf` string COMMENT '',
  `is_valid` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_comm_data_industry';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_comm_data_news_category` (
  `ID` bigint COMMENT '',
  `name` string COMMENT '',
  `parent_id` bigint COMMENT '',
  `id_path` string COMMENT '',
  `tree_level` bigint COMMENT '',
  `sort_order` bigint COMMENT '',
  `is_leaf` string COMMENT '',
  `is_valid` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_comm_data_news_category';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_comm_data_position_category` (
  `ID` bigint COMMENT '',
  `name` string COMMENT '',
  `parent_id` bigint COMMENT '',
  `id_path` string COMMENT '',
  `tree_level` bigint COMMENT '',
  `sort_order` bigint COMMENT '',
  `is_leaf` string COMMENT '',
  `is_valid` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_comm_data_position_category';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_comm_data_region` (
  `ID` bigint COMMENT '',
  `name` string COMMENT '',
  `parent_id` bigint COMMENT '',
  `id_path` string COMMENT '',
  `tree_level` bigint COMMENT '',
  `sort_order` bigint COMMENT '',
  `is_leaf` string COMMENT '',
  `is_valid` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_comm_data_region';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_comm_rule_integral` (
  `ID` bigint COMMENT '',
  `rule_name` string COMMENT '客户类型名称',
  `rule_code` string COMMENT '客户类型描述',
  `caifu` bigint COMMENT '',
  `jingyan` bigint COMMENT '客户人数',
  `sort_order` int COMMENT '',
  `is_valid` int COMMENT '客户类型状态 0-无效 1-有效'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_comm_rule_integral';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_customer` (
  `CUSTOMER_ID` bigint COMMENT '',
  `CUSTOMER_NO` string COMMENT '',
  `CUSTOMER_PASSWORD` string COMMENT '',
  `EMAIL_ADDRESS` string COMMENT '',
  `MOBILE_NUMBER` string COMMENT '',
  `NICK_NAME` string COMMENT '',
  `REGIST_IP` string COMMENT '',
  `REGIST_TIME` timestamp COMMENT '',
  `SEX` string COMMENT '',
  `TRUE_NAME` string COMMENT '',
  `USER_TYPE` string COMMENT '用户类型 0：普通用户，1：内部用户',
  `IS_VALID` string COMMENT '',
  `IS_BLACK` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_customer';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_customer_basic` (
  `ID` bigint COMMENT '',
  `customer_id` string COMMENT '客户ID',
  `sex` string COMMENT '性别',
  `birthday` string COMMENT '',
  `province_id` string COMMENT '',
  `province_name` string COMMENT '',
  `city_id` string COMMENT '',
  `city_name` string COMMENT '',
  `regist_ip` string COMMENT '',
  `regist_time` timestamp COMMENT '',
  `true_name` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_customer_basic';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_applicant_picture` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `owner_applicant_id` bigint COMMENT '所属猎头ID',
  `applicant_sculpture_source_path` string COMMENT '经理人头像图片源地址',
  `applicant_sculpture_scale1_path` string COMMENT '经理人头像图片规格1地址',
  `applicant_sculpture_scale2_path` string COMMENT '经理人头像图片规格2地址',
  `applicant_sculpture_scale3_path` string COMMENT '经理人头像图片规格3地址'
) COMMENT '猎头'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_applicant_picture';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_applicant_profile` (
  `ID` bigint COMMENT 'ID.与tb_customer的customer_id一致',
  `owner_customer_id` string COMMENT '昵称',
  `marriage_status` int COMMENT '婚姻状况',
  `year_of_attend` int COMMENT '参加工作年份',
  `high_education` string COMMENT '最高教育程度',
  `is_unify_admission` int COMMENT '是否统招',
  `industry` string COMMENT '行业',
  `last_company` string COMMENT '最近工作的公司',
  `last_position` string COMMENT '最近的工作职位',
  `job_seek_status` int COMMENT '求职状态',
  `is_valid` string COMMENT ''
) COMMENT '求职者'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_applicant_profile';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_application_profile` (
  `ID` bigint COMMENT '',
  `applicant_id` bigint COMMENT '求职者ID',
  `a_name` string COMMENT '求职者姓名',
  `company_id` bigint COMMENT '企业ID',
  `c_name` string COMMENT '企业名称',
  `position_id` bigint COMMENT '职位ID',
  `p_name` string COMMENT '职位名称',
  `apply_time` timestamp COMMENT '申请职位时间'
) COMMENT '职位申请表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_application_profile';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_company_contacts` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '',
  `owner_company_id` bigint COMMENT '所属公司ID',
  `legal_representative_name` string COMMENT '法定代表人姓名',
  `legal_representative_sex` int COMMENT '法定代表人性别',
  `legal_representative_position` string COMMENT '法定代表人职位',
  `legal_representative_email` string COMMENT '法定代表人电邮',
  `legal_representative_mobile` string COMMENT '法定代表人手机号码',
  `legal_representative_area_code` string COMMENT '法定代表人区号',
  `legal_representative_telephone` string COMMENT '法定代表人固定电话号码',
  `legal_representative_ext` string COMMENT '法定代表人分机',
  `recruiter_name` string COMMENT '招聘负责人姓名',
  `recruiter_sex` int COMMENT '招聘负责人性别',
  `recruiter_position` string COMMENT '招聘负责人职位',
  `recruiter_email` string COMMENT '招聘负责人电邮',
  `recruiter_mobile` string COMMENT '招聘负责人手机号码',
  `recruiter_area_code` string COMMENT '招聘负责人区号',
  `recruiter_telephone` string COMMENT '招聘负责人电话号码',
  `recruiter_ext` string COMMENT '招聘负责人分机',
  `is_valid` int COMMENT '是否有效'
) COMMENT '招聘者(企业)用户档案'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_company_contacts';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_company_picture` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `owner_company_id` bigint COMMENT '所属猎头ID',
  `company_logo_source_path` string COMMENT '企业logo图片源地址',
  `company_logo_scale1_path` string COMMENT '企业logo图片规格1地址',
  `company_logo_scale2_path` string COMMENT '企业logo图片规格2地址',
  `company_logo_scale3_path` string COMMENT '企业logo图片规格3地址',
  `business_licence_source_path` string COMMENT '营业执照图片源地址',
  `business_licence_scale1_path` string COMMENT '营业执照图片规格1地址',
  `business_licence_scale2_path` string COMMENT '营业执照图片规格2地址',
  `business_licence_scale3_path` string COMMENT '营业执照图片规格3地址'
) COMMENT '猎头'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_company_picture';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_company_profile` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '',
  `company_c_name` string COMMENT '企业名称(中文)',
  `company_e_name` string COMMENT '企业名称(英文)',
  `industry` string COMMENT '行业',
  `master_contacts_id` string COMMENT '主联系人ID',
  `company_scale` string COMMENT '企业规模',
  `company_address` string COMMENT '',
  `company_logo` string COMMENT '企业logo',
  `company_property` string COMMENT '企业性质',
  `fund` int COMMENT '注册资金',
  `employee_number` int COMMENT '雇员人数',
  `intro` string COMMENT '企业介绍',
  `auth_status` int COMMENT '认证状态'
) COMMENT '招聘者(企业)用户档案'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_company_profile';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_hunter_company` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `serve_company_id` bigint COMMENT '省',
  `serve_company_name` string COMMENT '公司名称',
  `position_number` int COMMENT '推荐职位数',
  `offer_number` string COMMENT '固定电话号码'
) COMMENT '猎头'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_hunter_company';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_hunter_picture` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `owner_hunter_id` bigint COMMENT '所属猎头ID',
  `head_sculpture_source_path` string COMMENT '头像图片源地址',
  `head_sculpture_scale1_path` string COMMENT '头像图片规格1地址',
  `head_sculpture_scale2_path` string COMMENT '头像图片规格2地址',
  `head_sculpture_scale3_path` string COMMENT '头像图片规格3地址'
) COMMENT '猎头'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_hunter_picture';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_hunter_profile` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `company_name` string COMMENT '公司名称',
  `area_code` string COMMENT '区号',
  `telephone_number` string COMMENT '固定电话号码',
  `ext_number` string COMMENT '分机号码',
  `title` string COMMENT '猎头头衔',
  `year_of_attend` int COMMENT '从业年限',
  `self_desc` string COMMENT '个人介绍',
  `auth_status` int COMMENT '通过认证的时间'
) COMMENT '猎头'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_hunter_profile';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_position_application` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '',
  `owner_company_id` bigint COMMENT '所属企业ID',
  `owner_position_id` bigint COMMENT '所属职位ID',
  `apply_customer_id` bigint COMMENT '浏览职位客户ID',
  `apply_time` timestamp COMMENT '生效时间'
) COMMENT '职位'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_position_application';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_position_browse` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '',
  `owner_company_id` bigint COMMENT '所属企业ID',
  `owner_position_id` bigint COMMENT '所属职位ID',
  `browse_customer_id` bigint COMMENT '浏览职位客户ID',
  `browse_customer_type` int COMMENT '浏览职位客户类型(1-经理人 2-猎头）',
  `browse_time` timestamp COMMENT '生效时间'
) COMMENT '职位'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_position_browse';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_position_favorite` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属客户ID',
  `owner_company_id` bigint COMMENT '所属企业ID',
  `owner_position_id` bigint COMMENT '所属职位ID',
  `favorite_customer_id` string COMMENT '收藏职位的客户ID',
  `favorite_customer_type` string COMMENT '收藏职位的客户类型',
  `favorite_time` timestamp COMMENT '申请职位时间'
) COMMENT '职位申请表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_position_favorite';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_position_profile` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `owner_customer_type` int COMMENT '所属用户类型(2-猎头，3-企业）',
  `owner_company_id` bigint COMMENT '所属企业ID',
  `owner_company_name` string COMMENT '所属企业名称',
  `position_name` string COMMENT '职位名称',
  `position_location` string COMMENT '工作地点',
  `position_salary` string COMMENT '职位薪水',
  `report_to` string COMMENT '汇报对象',
  `position_desc` string COMMENT '职位描述',
  `position_require` string COMMENT '职位需求',
  `position_status` int COMMENT '职位状态',
  `on_line_time` timestamp COMMENT '生效时间',
  `off_line_time` timestamp COMMENT '失效时间',
  `delivery_contacts_id` int COMMENT '发布职位的联系人ID',
  `delivery_time` timestamp COMMENT '发布时间'
) COMMENT '职位'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_position_profile';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_resume_browse` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '',
  `owner_applicant_id` bigint COMMENT '所属经理人ID',
  `owner_resume_id` bigint COMMENT '所属简历ID',
  `browse_customer_id` bigint COMMENT '浏览简历的用户ID',
  `browse_customer_type` int COMMENT '浏览简历的用户类别（1-猎头 2-企业）',
  `browse_time` timestamp COMMENT '浏览时间'
) COMMENT '职位'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_resume_browse';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_resume_company` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '',
  `owner_applicant_id` bigint COMMENT '所属经理人ID',
  `owner_resume_id` bigint COMMENT '所属简历ID',
  `company_c_name` string COMMENT '公司中文名称',
  `company_e_name` string COMMENT '公司英文名称',
  `start_date` date COMMENT '开始时间',
  `end_date` date COMMENT '结束时间',
  `position_c_name` string COMMENT '职位中文名称',
  `position_e_name` string COMMENT '职位英文名称',
  `job_c_desc` string COMMENT '工作中文描述',
  `job_e_desc` string COMMENT '',
  `province_id` int COMMENT '省ID',
  `city_id` int COMMENT '市'
) COMMENT '简历'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_resume_company';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_resume_download` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '',
  `owner_applicant_id` bigint COMMENT '所属的经理人ID',
  `owner_resume_id` bigint COMMENT '所属的简历ID',
  `download_customer_id` bigint COMMENT '简历下载用户ID',
  `download_customer_type` int COMMENT '简历下载用户类别（1-猎头 2-企业）',
  `download_time` timestamp COMMENT '简历下载时间'
) COMMENT '职位'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_resume_download';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_resume_education` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '',
  `owner_applicant_id` bigint COMMENT '所属经理人ID',
  `owner_resume_id` bigint COMMENT '所属简历ID',
  `school_c_name` string COMMENT '学校中文名称',
  `school_e_name` string COMMENT '',
  `start_date` date COMMENT '开始时间',
  `end_date` date COMMENT '结束时间',
  `level_id` string COMMENT '教育程度ID',
  `province_id` int COMMENT '省ID',
  `city_id` int COMMENT '市ID'
) COMMENT '简历'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_resume_education';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_resume_favorite` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '',
  `owner_applicant_id` bigint COMMENT '所属的经理人ID',
  `owner_resume_id` bigint COMMENT '所属的简历ID',
  `favorite_customer_id` bigint COMMENT '简历收藏用户ID',
  `favorite_customer_type` int COMMENT '简历收藏用户类别（1-猎头 2-企业）',
  `favorite_time` timestamp COMMENT '简历收藏时间'
) COMMENT '职位'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_resume_favorite';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_resume_profile` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属的用户ID',
  `owner_applicant_id` bigint COMMENT '所属的经理人ID',
  `resume_c_name` string COMMENT '简历中文名称',
  `resume_e_name` string COMMENT '简历英文名称',
  `resume_status` int COMMENT '简历状态',
  `open_status` int COMMENT '简历公开状态',
  `expect_salary` int COMMENT '期望薪水',
  `expect_time_on_duty` int COMMENT '期望的到岗时间',
  `name_show_setting` int COMMENT '姓名显示设置 1-姓名全称 2-X先生/女士',
  `contact_show_setting` int COMMENT '联系方式显示设置  1-显示全部联系电话	 2-只显示手机 3- 只显示邮箱',
  `company_search_setting` int COMMENT '企业搜索设置 1-所有企业都搜到 2-某些企业搜不到',
  `privacy_contact_setting` int COMMENT '私人联系方式设置 1-随时联系  2-私信给我,等我回复'
) COMMENT '简历'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_resume_profile';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_resume_project` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '',
  `owner_applicant_id` bigint COMMENT '所属经理人ID',
  `owner_resume_id` bigint COMMENT '所属简历ID',
  `start_date` date COMMENT '开始时间',
  `end_date` date COMMENT '结束时间',
  `project_c_name` string COMMENT '项目中文名称',
  `project_e_name` string COMMENT '项目英文名称',
  `project_c_desc` string COMMENT '项目中文描述',
  `project_e_desc` string COMMENT '项目英文描述',
  `project_c_duty` string COMMENT '项目职责(中文)',
  `project_e_duty` string COMMENT '项目职责(英文)',
  `software_c` string COMMENT '软件架构(中文)',
  `software_e` string COMMENT '软件架构(英文)',
  `hardware_c` string COMMENT '硬件架构(中文)',
  `hardware_e` string COMMENT '硬件架构(英文)'
) COMMENT '简历'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_resume_project';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_recruit_resume_technique` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '',
  `owner_applicant_id` bigint COMMENT '所属经理人ID',
  `owner_resume_id` bigint COMMENT '所属简历ID',
  `technique_c_name` string COMMENT '技能名称(中文)',
  `technique_e_name` string COMMENT '技能名称(英文)',
  `duration` int COMMENT '掌握时间',
  `level_id` bigint COMMENT '掌握程度'
) COMMENT '简历'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_recruit_resume_technique';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_shop` (
  `SHOP_ID` bigint COMMENT '',
  `SHOP_NO` string COMMENT '',
  `SHOP_NAME` string COMMENT '',
  `AREA` bigint COMMENT '',
  `AUDIT_STATUS` string COMMENT '',
  `CITY` bigint COMMENT '',
  `IS_VALID` string COMMENT '',
  `PERSON_IN_CHARGE` string COMMENT '',
  `POST` string COMMENT '',
  `PROVINCE` bigint COMMENT '',
  `REGIST_DATE` date COMMENT '',
  `SHOP_ADDRESS` string COMMENT '',
  `SHOP_DESC` string COMMENT '',
  `SHOP_TELEPHONE` string COMMENT '',
  `SORT_ORDER` bigint COMMENT '',
  `DISTRICT` bigint COMMENT '',
  `POST_PRICE` float COMMENT '',
  `URL_FILE_NAME` string COMMENT '馆页面文件链接路径'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_shop';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_app` (
  `ID` bigint COMMENT '',
  `app_name` string COMMENT '应用(照片,圈子,转贴)',
  `app_logo` string COMMENT '',
  `sort_order` int COMMENT '',
  `is_valid` int COMMENT '是否有效'
) COMMENT '求职者'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_app';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_app_oper` (
  `ID` bigint COMMENT '',
  `app_id` bigint COMMENT '应用ID',
  `oper_name` string COMMENT '应用操作(如发简历，发微博）',
  `sort_order` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_app_oper';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_app_priv` (
  `ID` bigint COMMENT '',
  `app_id` bigint COMMENT '应用ID',
  `customer_type_id` bigint COMMENT '客户类别ID（1-经理人用户 2-猎头用户 3-企业用户）',
  `customer_level_id` bigint COMMENT '客户级别ID',
  `oper_type_id` int COMMENT '操作类别ID（如发送博文）',
  `number` int COMMENT '数量',
  `priv` int COMMENT '权限',
  `sort_order` int COMMENT '',
  `is_valid` int COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_app_priv';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_attention_category` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `category_name` string COMMENT '关注分组名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_order` int COMMENT '显示顺序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '好友分类表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_attention_category';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_attention_profile` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `attention_customer_id` bigint COMMENT '关注的好友ID(管理tb_comm_customer的customer_id)',
  `attention_category_id` bigint COMMENT '关注分类ID',
  `attention_category_name` string COMMENT '',
  `attention_remark` string COMMENT '关注备注',
  `attention_time` timestamp COMMENT '关注时间',
  `is_valid` int COMMENT '是否关注动态'
) COMMENT '求职者'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_attention_profile';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_blog_article` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `owner_blog_id` bigint COMMENT '所属 blog_id',
  `owner_category_id` bigint COMMENT '所属分类ID',
  `artitle_title` string COMMENT '文章主题',
  `article_body` string COMMENT '文章正文',
  `article_abstract` string COMMENT '文章摘要',
  `visit_type` int COMMENT '访问模式',
  `is_show` int COMMENT '是否显示',
  `is_header` int COMMENT '是否置顶',
  `is_essential` int COMMENT '是否精华',
  `browse_number` int COMMENT '浏览数',
  `comment_number` int COMMENT '评论数',
  `privacy_status` int COMMENT '文章隐私状态',
  `publish_time` timestamp COMMENT '发布时间'
) COMMENT '求职者'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_blog_article';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_blog_category` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `category_name` string COMMENT '好友分类名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_order` int COMMENT '显示顺序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '好友分类表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_blog_category';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_blog_comment` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '被评论文章所属用户ID',
  `owner_blog_id` bigint COMMENT '被评论文章所属博客ID',
  `owner_article_id` bigint COMMENT '被评论文章所属文章ID',
  `comment_customer_id` bigint COMMENT '评论人用户ID',
  `comment_subject` string COMMENT '评论主题(自动生成)',
  `comment_body` string COMMENT '评论内容',
  `comment_time` timestamp COMMENT '评论时间'
) COMMENT '博客文章评论表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_blog_comment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_blog_comment_reply` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '被评论文章所属用户ID',
  `owner_blog_id` bigint COMMENT '被评论文章所属博客ID',
  `owner_article_id` bigint COMMENT '被评论文章所属文章ID',
  `comment_customer_id` bigint COMMENT '评论人用户ID',
  `owner_comment_id` bigint COMMENT '回复所属的评论ID',
  `reply_subject` string COMMENT '回复主题(自动生成)',
  `reply_body` string COMMENT '回复内容',
  `reply_time` timestamp COMMENT '回复时间'
) COMMENT '博客文章评论回复表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_blog_comment_reply';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_blog_profile` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `blog_title` string COMMENT '博客名称',
  `blog_desc` string COMMENT '博客描述',
  `create_time` timestamp COMMENT '开通时间',
  `blog_number` int COMMENT '博文数量'
) COMMENT '博客基础档案'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_blog_profile';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_broad` (
  `ID` bigint COMMENT '',
  `owner_customer_id` int COMMENT '所属用户ID',
  `app_id` int COMMENT '操作的',
  `oper_id` int COMMENT '操作ID(如开通,创建,修改)',
  `oper_date` timestamp COMMENT '操作时间',
  `desc` string COMMENT '操作描述'
) COMMENT 'SNS动态(记录SNS用户在各应用上的操作:如xx在什么时间开通了博客)'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_broad';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_club` (
  `ID` bigint COMMENT '',
  `club_name` string COMMENT '圈子名称',
  `club_desc` string COMMENT '圈子简介',
  `domain_name` string COMMENT '圈子域名',
  `category_id` int COMMENT '类别ID',
  `area_id` int COMMENT '区域ID',
  `is_public` int COMMENT '是否公开',
  `is_member_authorize` int COMMENT '是否成员需要审核',
  `create_time` timestamp COMMENT '创建时间',
  `audit_status` int COMMENT '审核状态',
  `member_count` int COMMENT '圈子成员数'
) COMMENT '求职者'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_club';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_club_member` (
  `ID` bigint COMMENT '',
  `owner_club_id` bigint COMMENT '所属圈子ID',
  `owner_customer_id` bigint COMMENT '所属用户ID(圈子的创建者)',
  `rank` int COMMENT '圈内等级',
  `point` int COMMENT '圈内积分',
  `status` int COMMENT '圈内状态',
  `apply_remark` string COMMENT '申请留言',
  `join_time` timestamp COMMENT '加入时间',
  `invite_customer_id` int COMMENT '邀请人用户ID',
  `invite_customer_name` string COMMENT '邀请人用户名称'
) COMMENT '求职者'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_club_member';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_club_topic` (
  `ID` bigint COMMENT '',
  `topic_name` string COMMENT '',
  `circle_id` bigint COMMENT '',
  `customer_id` bigint COMMENT '',
  `is_header` int COMMENT '是否置顶',
  `is_` int COMMENT '是否精华'
) COMMENT '求职者'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_club_topic';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_fans_profile` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `fans_customer_id` bigint COMMENT '粉丝用户ID',
  `fans_time` timestamp COMMENT '成为粉丝时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '求职者'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_fans_profile';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_friend` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `owner_category_id` bigint COMMENT '所属好友分类ID',
  `friend_id` bigint COMMENT '好友ID(管理tb_comm_customer的customer_id)',
  `friend_remark` string COMMENT '好友备注',
  `apply_message` string COMMENT '申请加好友备注',
  `apply_time` timestamp COMMENT '申请加好友时间',
  `approve_time` timestamp COMMENT '同意加好友时间',
  `is_display` int COMMENT '是否隐藏',
  `is_dynamic` int COMMENT '是否关注动态'
) COMMENT '求职者'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_friend';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_friend_category` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `category_name` string COMMENT '好友分类名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_order` int COMMENT '显示顺序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '好友分类表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_friend_category';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_microblog` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `is_active` int COMMENT '是否启用',
  `create_time` timestamp COMMENT '创建时间',
  `create_ip` string COMMENT '发布IP',
  `last_topic_body` int COMMENT '最后主题发布内容',
  `last_topic_time` timestamp COMMENT '最后主题发布时间',
  `last_topic_id` int COMMENT '最后主题ID',
  `topic_number` int COMMENT '主题数',
  `comment_number` int COMMENT '评论数'
) COMMENT 'SNS微博'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_microblog';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_microblog_article` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `owner_origin_microblog_id` bigint COMMENT '所关联的源微博_id',
  `microblog_type` int COMMENT '微博类型 1-原创 2-转发',
  `artitle_title` string COMMENT '文章主题',
  `article_body` string COMMENT '文章正文',
  `article_abstract` string COMMENT '文章摘要',
  `up_number` int COMMENT '个数（顶）',
  `down_number` int COMMENT '个数（踩）',
  `browse_number` int COMMENT '浏览数',
  `comment_number` int COMMENT '评论数',
  `publish_time` timestamp COMMENT '发布时间'
) COMMENT '求职者'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_microblog_article';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_microblog_comment` (
  `ID` bigint COMMENT '',
  `owner_customer_id` int COMMENT '所属用户ID',
  `owner_microblog_id` bigint COMMENT '所属微博ID',
  `comment_customer_id` bigint COMMENT '评论人ID',
  `comment_subject` string COMMENT '回复的主题(自动生成)',
  `comment_body` string COMMENT '回复的内容',
  `comment_time` timestamp COMMENT '回复时间',
  `comment_type` int COMMENT '评论类型',
  `post_source` int COMMENT '发布来源（网站，手机）',
  `is_valid` int COMMENT '显示状态（0-不显示 1-显示）'
) COMMENT 'SNS微博主题'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_microblog_comment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_microblog_profile` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `is_active` int COMMENT '是否启用',
  `create_time` timestamp COMMENT '创建时间',
  `create_ip` string COMMENT '发布IP',
  `last_topic_body` int COMMENT '最后主题发布内容',
  `last_topic_time` timestamp COMMENT '最后主题发布时间',
  `last_topic_id` int COMMENT '最后主题ID',
  `topic_number` int COMMENT '主题数',
  `comment_number` int COMMENT '评论数'
) COMMENT 'SNS微博'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_microblog_profile';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_microblog_reply` (
  `ID` bigint COMMENT '',
  `owner_customer_id` bigint COMMENT '所属用户ID',
  `is_active` int COMMENT '是否启用',
  `create_time` timestamp COMMENT '创建时间',
  `create_ip` string COMMENT '发布IP',
  `last_topic_body` int COMMENT '最后主题发布内容',
  `last_topic_time` timestamp COMMENT '最后主题发布时间',
  `last_topic_id` int COMMENT '最后主题ID',
  `topic_number` int COMMENT '主题数',
  `comment_number` int COMMENT '评论数'
) COMMENT 'SNS微博'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_microblog_reply';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_owner` (
  `ID` bigint COMMENT '',
  `owner_customer_id` int COMMENT '所属用户ID',
  `author` string COMMENT '文章作者',
  `subject` string COMMENT '回复的主题(自动生成)',
  `body` string COMMENT '回复的内容',
  `audit_status` int COMMENT '审核状态',
  `comment_time` timestamp COMMENT '回复时间'
) COMMENT '求职者'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_owner';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_personal_letter` (
  `ID` bigint COMMENT '',
  `send_customer_id` bigint COMMENT '发信人ID',
  `receive_customer_id` bigint COMMENT '收信人ID',
  `letter_subject` string COMMENT '主题',
  `letter_body` string COMMENT '正文',
  `letter_abstract` string COMMENT '摘要',
  `send_time` timestamp COMMENT '发送时间'
) COMMENT 'SNS私信'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_personal_letter';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_sns_trend` (
  `ID` bigint COMMENT '',
  `owner_customer_id` int COMMENT '所属用户ID',
  `app_id` int COMMENT '应用',
  `oper_id` int COMMENT '操作ID(如开通,创建,修改)',
  `oper_date` timestamp COMMENT '操作时间',
  `desc` string COMMENT '操作描述'
) COMMENT 'SNS动态(记录SNS用户在各应用上的操作:如xx在什么时间开通了博客)'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_sns_trend';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_system_config` (
  `SYSTEM_CONFIG_ID` bigint COMMENT '',
  `CONFIGGROUP_ID` bigint COMMENT '',
  `CONFIG_NAME` string COMMENT '',
  `CONFIG_VALUE` string COMMENT '',
  `SORT_BY` bigint COMMENT '',
  `VISIBLE` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_system_config';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_system_config_group` (
  `CONFIG_GROUP_ID` bigint COMMENT '',
  `CONFIG_GROUP_NAME` string COMMENT '',
  `IS_LEAF` string COMMENT '',
  `IS_VALID` string COMMENT '',
  `PARENT_ID` bigint COMMENT '',
  `SORT_ORDER` bigint COMMENT '',
  `CONFIG_GROUP_CODE` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_system_config_group';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_system_log` (
  `SYSTEM_LOG_ID` bigint COMMENT '',
  `CREATE_DATE` timestamp COMMENT '',
  `OPERATION_ID` bigint COMMENT '',
  `OPERATION_METHOD_NAME` string COMMENT '',
  `OPERATION_NAME` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_system_log';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_data_role` (
  `ROLE_ID` int COMMENT '',
  `ROLE_NAME` string COMMENT '',
  `SORT_ORDER` int COMMENT '',
  `IS_VALID` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_data_role';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_data_role_item` (
  `ITEM_ID` int COMMENT '',
  `ROLE_ID` int COMMENT '角色ID',
  `COMPANY_ID` string COMMENT '公司ID（贡天下山西分公司、霍氏、长思等）',
  `CHANNEL_ID` string COMMENT '渠道ID（淘宝、京东、一号店）',
  `SHOP_ID` string COMMENT '店铺ID(上水井、易门山等)'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_data_role_item';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_data_role_user` (
  `ITEM_ID` int COMMENT '',
  `ROLE_ID` int COMMENT '角色ID',
  `USER_ID` string COMMENT '用户ID'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_data_role_user';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_department` (
  `DEPARTMENT_ID` bigint COMMENT '',
  `DEPARTMENT_CODE` string COMMENT '',
  `DEPARTMENT_DESC` string COMMENT '',
  `DEPARTMENT_NAME` string COMMENT '',
  `IS_LEAF` string COMMENT '',
  `IS_VALID` string COMMENT '',
  `PARENT_ID` bigint COMMENT '',
  `SORT_ORDER` bigint COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_department';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_function` (
  `FUNCTION_ID` bigint COMMENT '',
  `FUNCTION_CODE` string COMMENT '',
  `FUNCTION_DESC` string COMMENT '',
  `FUNCTION_NAME` string COMMENT '',
  `IS_VALID` bit COMMENT '',
  `MODULE_ID` bigint COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_function';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_function_20180124` (
  `FUNCTION_ID` bigint COMMENT '',
  `FUNCTION_CODE` string COMMENT '',
  `FUNCTION_DESC` string COMMENT '',
  `FUNCTION_NAME` string COMMENT '',
  `IS_VALID` bit COMMENT '',
  `MODULE_ID` bigint COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_function_20180124';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_menu` (
  `MENU_ID` bigint COMMENT '',
  `MENU_CODE` string COMMENT '',
  `MENU_NAME` string COMMENT '',
  `MENU_DESC` string COMMENT '',
  `MODULE_ID` bigint COMMENT '',
  `MODULE_URL` string COMMENT '',
  `PARENT_ID` bigint COMMENT '',
  `SORT_ORDER` bigint COMMENT '',
  `SYSTEM_ID` bigint COMMENT '',
  `IS_LEAF` string COMMENT '',
  `IS_VALID` string COMMENT '1-管理后台2-数据后台3-新后台'
) COMMENT '所有开发的主菜单'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_menu';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_menu_20180124` (
  `MENU_ID` bigint COMMENT '',
  `MENU_CODE` string COMMENT '',
  `MENU_NAME` string COMMENT '',
  `MENU_DESC` string COMMENT '',
  `MODULE_ID` bigint COMMENT '',
  `MODULE_URL` string COMMENT '',
  `PARENT_ID` bigint COMMENT '',
  `SORT_ORDER` bigint COMMENT '',
  `SYSTEM_ID` bigint COMMENT '',
  `IS_LEAF` string COMMENT '',
  `IS_VALID` string COMMENT ''
) COMMENT '所有开发的主菜单'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_menu_20180124';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_menu_20180223` (
  `MENU_ID` bigint COMMENT '',
  `MENU_CODE` string COMMENT '',
  `MENU_NAME` string COMMENT '',
  `MENU_DESC` string COMMENT '',
  `MODULE_ID` bigint COMMENT '',
  `MODULE_URL` string COMMENT '',
  `PARENT_ID` bigint COMMENT '',
  `SORT_ORDER` bigint COMMENT '',
  `SYSTEM_ID` bigint COMMENT '',
  `IS_LEAF` string COMMENT '',
  `IS_VALID` string COMMENT ''
) COMMENT '所有开发的主菜单'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_menu_20180223';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_resource_page` (
  `PAGE_ID` bigint COMMENT '',
  `IS_VALID` string COMMENT '',
  `PAGE_CODE` string COMMENT '',
  `PAGE_NAME` string COMMENT '',
  `PAGE_OPERATION` string COMMENT '',
  `PAGE_URL` string COMMENT '',
  `SORT_ORDER` bigint COMMENT '',
  `SYSTEM_ID` bigint COMMENT ''
) COMMENT '所有开发的链接'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_resource_page';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_resource_page_20180124` (
  `PAGE_ID` bigint COMMENT '',
  `IS_VALID` string COMMENT '',
  `PAGE_CODE` string COMMENT '',
  `PAGE_NAME` string COMMENT '',
  `PAGE_OPERATION` string COMMENT '',
  `PAGE_URL` string COMMENT '',
  `SORT_ORDER` bigint COMMENT '',
  `SYSTEM_ID` bigint COMMENT ''
) COMMENT '所有开发的链接'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_resource_page_20180124';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_resource_page_20180223` (
  `PAGE_ID` bigint COMMENT '',
  `IS_VALID` string COMMENT '',
  `PAGE_CODE` string COMMENT '',
  `PAGE_NAME` string COMMENT '',
  `PAGE_OPERATION` string COMMENT '',
  `PAGE_URL` string COMMENT '',
  `SORT_ORDER` bigint COMMENT '',
  `SYSTEM_ID` bigint COMMENT ''
) COMMENT '所有开发的链接'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_resource_page_20180223';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_resource_system` (
  `SYSTEM_ID` bigint COMMENT '',
  `IS_VALID` string COMMENT '',
  `SORT_ORDER` bigint COMMENT '',
  `SYSTEM_CODE` string COMMENT '',
  `SYSTEM_DESC` string COMMENT '',
  `SYSTEM_HOST` string COMMENT '',
  `SYSTEM_NAME` string COMMENT '',
  `SYSTEM_PORT` string COMMENT '',
  `SYSTEM_URL` string COMMENT ''
) COMMENT '所有开发的子系统'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_resource_system';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_resource_system_20180124` (
  `SYSTEM_ID` bigint COMMENT '',
  `IS_VALID` string COMMENT '',
  `SORT_ORDER` bigint COMMENT '',
  `SYSTEM_CODE` string COMMENT '',
  `SYSTEM_DESC` string COMMENT '',
  `SYSTEM_HOST` string COMMENT '',
  `SYSTEM_NAME` string COMMENT '',
  `SYSTEM_PORT` string COMMENT '',
  `SYSTEM_URL` string COMMENT ''
) COMMENT '所有开发的子系统'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_resource_system_20180124';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_role` (
  `ROLE_ID` bigint COMMENT '',
  `IS_VALID` string COMMENT '',
  `ROLE_CODE` string COMMENT '',
  `ROLE_DESC` string COMMENT '',
  `ROLE_NAME` string COMMENT '',
  `SORT_ORDER` bigint COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_role';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_role_20180124` (
  `ROLE_ID` bigint COMMENT '',
  `IS_VALID` string COMMENT '',
  `ROLE_CODE` string COMMENT '',
  `ROLE_DESC` string COMMENT '',
  `ROLE_NAME` string COMMENT '',
  `SORT_ORDER` bigint COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_role_20180124';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_role_20180223` (
  `ROLE_ID` bigint COMMENT '',
  `IS_VALID` string COMMENT '',
  `ROLE_CODE` string COMMENT '',
  `ROLE_DESC` string COMMENT '',
  `ROLE_NAME` string COMMENT '',
  `SORT_ORDER` bigint COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_role_20180223';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_role_menu` (
  `REF_ID` bigint COMMENT '',
  `MENU_ID` bigint COMMENT '',
  `MODULE_URL` string COMMENT '',
  `PAGE_ID` bigint COMMENT '',
  `PAGE_OPERATION` string COMMENT '',
  `ROLE_ID` bigint COMMENT '',
  `SORT_ORDER` bigint COMMENT '',
  `SYSTEM_ID` bigint COMMENT '',
  `MENU_NAME` string COMMENT '',
  `PARENT_ID` bigint COMMENT '',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_role_menu';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_role_menu_20180124` (
  `REF_ID` bigint COMMENT '',
  `MENU_ID` bigint COMMENT '',
  `MODULE_URL` string COMMENT '',
  `PAGE_ID` bigint COMMENT '',
  `PAGE_OPERATION` string COMMENT '',
  `ROLE_ID` bigint COMMENT '',
  `SORT_ORDER` bigint COMMENT '',
  `SYSTEM_ID` bigint COMMENT '',
  `MENU_NAME` string COMMENT '',
  `PARENT_ID` bigint COMMENT '',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_role_menu_20180124';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_role_menu_20180223` (
  `REF_ID` bigint COMMENT '',
  `MENU_ID` bigint COMMENT '',
  `MODULE_URL` string COMMENT '',
  `PAGE_ID` bigint COMMENT '',
  `PAGE_OPERATION` string COMMENT '',
  `ROLE_ID` bigint COMMENT '',
  `SORT_ORDER` bigint COMMENT '',
  `SYSTEM_ID` bigint COMMENT '',
  `MENU_NAME` string COMMENT '',
  `PARENT_ID` bigint COMMENT '',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_role_menu_20180223';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_role_menu_20180324` (
  `REF_ID` bigint COMMENT '',
  `MENU_ID` bigint COMMENT '',
  `MODULE_URL` string COMMENT '',
  `PAGE_ID` bigint COMMENT '',
  `PAGE_OPERATION` string COMMENT '',
  `ROLE_ID` bigint COMMENT '',
  `SORT_ORDER` bigint COMMENT '',
  `SYSTEM_ID` bigint COMMENT '',
  `MENU_NAME` string COMMENT '',
  `PARENT_ID` bigint COMMENT '',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_role_menu_20180324';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_role_menu_20180326` (
  `REF_ID` bigint COMMENT '',
  `MENU_ID` bigint COMMENT '',
  `MODULE_URL` string COMMENT '',
  `PAGE_ID` bigint COMMENT '',
  `PAGE_OPERATION` string COMMENT '',
  `ROLE_ID` bigint COMMENT '',
  `SORT_ORDER` bigint COMMENT '',
  `SYSTEM_ID` bigint COMMENT '',
  `MENU_NAME` string COMMENT '',
  `PARENT_ID` bigint COMMENT '',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_role_menu_20180326';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_role_priv` (
  `REF_ID` bigint COMMENT '',
  `FUNCTION_CODE` string COMMENT '',
  `FUNCTION_ID` bigint COMMENT '',
  `MODULE_ID` bigint COMMENT '',
  `MODULE_URL` string COMMENT '',
  `ROLE_ID` bigint COMMENT '',
  `SORT_ORDER` bigint COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_role_priv';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_role_user` (
  `REF_ID` bigint COMMENT '',
  `ROLE_ID` bigint COMMENT '',
  `USER_ID` bigint COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_role_user';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_role_user_20180223` (
  `REF_ID` bigint COMMENT '',
  `ROLE_ID` bigint COMMENT '',
  `USER_ID` bigint COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_role_user_20180223';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_role_user_20180326` (
  `REF_ID` bigint COMMENT '',
  `ROLE_ID` bigint COMMENT '',
  `USER_ID` bigint COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_role_user_20180326';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_user` (
  `USER_ID` bigint COMMENT '',
  `DEPARTMENT_ID` bigint COMMENT '',
  `EMAIL` string COMMENT '',
  `IS_VALID` string COMMENT '',
  `ROLE_ID_LIST` string COMMENT '',
  `SEX` string COMMENT '',
  `TELEPHONE` string COMMENT '',
  `USER_LOGIN_NAME` string COMMENT '',
  `USER_PASSWORD` string COMMENT '',
  `USER_REAL_NAME` string COMMENT '',
  `SHOP_ID` bigint COMMENT '',
  `SHOP_ID_LIST` string COMMENT '',
  `SHOP_NAME_LIST` string COMMENT '',
  `IS_WORKER` string COMMENT '',
  `WORKER_LEVEL` string COMMENT '',
  `WORKER_NO` string COMMENT '',
  `WORKER_TELEPHONE` string COMMENT '',
  `WORKER_LOGIN_NAME` string COMMENT '',
  `WORKER_PWD` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_user';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_user_20180124` (
  `USER_ID` bigint COMMENT '',
  `DEPARTMENT_ID` bigint COMMENT '',
  `EMAIL` string COMMENT '',
  `IS_VALID` string COMMENT '',
  `ROLE_ID_LIST` string COMMENT '',
  `SEX` string COMMENT '',
  `TELEPHONE` string COMMENT '',
  `USER_LOGIN_NAME` string COMMENT '',
  `USER_PASSWORD` string COMMENT '',
  `USER_REAL_NAME` string COMMENT '',
  `SHOP_ID` bigint COMMENT '',
  `SHOP_ID_LIST` string COMMENT '',
  `SHOP_NAME_LIST` string COMMENT '',
  `IS_WORKER` string COMMENT '',
  `WORKER_LEVEL` string COMMENT '',
  `WORKER_NO` string COMMENT '',
  `WORKER_TELEPHONE` string COMMENT '',
  `WORKER_LOGIN_NAME` string COMMENT '',
  `WORKER_PWD` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_user_20180124';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_user_group` (
  `GROUP_ID` bigint COMMENT '',
  `GROUP_CODE` string COMMENT '',
  `GROUP_DESC` string COMMENT '',
  `GROUP_NAME` string COMMENT '',
  `IS_VALID` string COMMENT '',
  `GROUP_TYPE` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_user_group';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_user_group_role` (
  `group_id` bigint COMMENT '',
  `role_id` bigint COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_user_group_role';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_user_group_user` (
  `group_id` bigint COMMENT '',
  `user_id` bigint COMMENT '',
  `REF_ID` bigint COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_user_group_user';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_user_priv` (
  `id` bigint COMMENT '',
  `user_id` bigint COMMENT '用户id',
  `site_level` string COMMENT '站点List（拼串形式存放用户对应站点权限）',
  `channel_level` string COMMENT '频道List（拼串形式存放用户对应频道权限）',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
) COMMENT '用户权限菜单'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_user_priv';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_tb_web_sys_user_priv_20180124` (
  `id` bigint COMMENT '',
  `user_id` bigint COMMENT '用户id',
  `site_level` string COMMENT '站点List（拼串形式存放用户对应站点权限）',
  `channel_level` string COMMENT '频道List（拼串形式存放用户对应频道权限）',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
) COMMENT '用户权限菜单'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_tb_web_sys_user_priv_20180124';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_train_base` (
  `id` bigint COMMENT '主键',
  `base_id` bigint COMMENT '基地主键id',
  `hospital_id` bigint COMMENT '医院id',
  `customer_id` bigint COMMENT '负责人_id',
  `base_name` string COMMENT '基地名称',
  `base_address` string COMMENT '基地地址',
  `classroom` string COMMENT '教室（间）',
  `base_area` string COMMENT '面积（平方米）',
  `hospital_desc` string COMMENT '医院概况及科室设置',
  `total_bed` int COMMENT '总床位',
  `base_confirm_time` timestamp COMMENT '医院住院医师规范化培训基地确认时间',
  `train_people_num` int COMMENT '规范化培训的住院医师人数平均: ()名/年',
  `pass_rate` string COMMENT '考试通过率',
  `average_patients_num` int COMMENT '平均管理患者数量',
  `total_patients_num` int COMMENT '患者总数',
  `total_train_num` int COMMENT '住培学员总人数',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效 1是 0否',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '培训基地表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_train_base';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_train_base_clinical` (
  `id` bigint COMMENT '主键',
  `clinical_id` bigint COMMENT '主键id',
  `base_id` bigint COMMENT '基地id',
  `year` int COMMENT '年份:1-2014；2-2015；3-2016',
  `production_bed_num` string COMMENT '编制床位',
  `live_hospital_num` string COMMENT '年住院量',
  `bed_use_rate` string COMMENT '床位使用率',
  `average_day_num` string COMMENT '平均住院日',
  `year_chen_num` int COMMENT '年门诊量',
  `year_operation_num` int COMMENT '年手术量',
  `year_leave_num` int COMMENT '年出院病人量',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效 1是 0否',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '临床业务数据'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_train_base_clinical';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_train_base_contact` (
  `id` bigint COMMENT '主键',
  `contact_id` bigint COMMENT '主键id',
  `base_id` bigint COMMENT '基地id',
  `type` int COMMENT '类别：1基地负责人2基地联系人3医院负责人',
  `name` string COMMENT '联系人名字',
  `mobile` string COMMENT '联系人电话',
  `email` string COMMENT '联系人邮箱',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效 1是 0否',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '培训基地联系人'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_train_base_contact';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_train_base_devide` (
  `id` bigint COMMENT '主键',
  `devide_id` bigint COMMENT '主键id',
  `base_id` bigint COMMENT '基地base_id',
  `type` int COMMENT '1-教学设备 2- 大型临床设备',
  `devide_name` string COMMENT '设备名字',
  `devide_model` string COMMENT '设备型号',
  `num` int COMMENT '数量',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效 1是 0否',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '基地设备设施'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_train_base_devide';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_train_base_info` (
  `id` bigint COMMENT '主键',
  `base_info_id` bigint COMMENT '基地附属信息主键id',
  `base_id` bigint COMMENT '基地id',
  `type` int COMMENT '类型：1-各级教师职责；2-教师培训方法；3-理论授课；4-教学查房实践；5-教学管理方法；6-教学考核评价方法；7-教学效果反馈方法；8-培训工作突出优点总结',
  `content` string COMMENT '内容',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效 1是 0否',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '培训基地附属信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_train_base_info';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_train_base_organize` (
  `id` bigint COMMENT '主键',
  `organize_id` bigint COMMENT '主键id',
  `base_id` bigint COMMENT '基地base_id',
  `contact_type` int COMMENT '类型 （1-骨科住培主任、2-骨科住培副主任、3-骨科住培教秘、4-骨科住培责任医师、5-骨科住培其他联络人、6-教学秘书)',
  `contact_name` string COMMENT '联系人姓名',
  `contact_mobile` string COMMENT '联系人电话',
  `contact_email` string COMMENT '联系人邮箱',
  `parent_id` bigint COMMENT '父ID',
  `tree_level` int COMMENT '节点级别',
  `property_desc` string COMMENT '属性描述',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效：1有效 0无效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '培训管理'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_train_base_organize';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_train_base_organize_rule` (
  `id` bigint COMMENT '主键',
  `rule_id` bigint COMMENT '主键id',
  `base_id` bigint COMMENT '基地base_id',
  `name` string COMMENT '姓名',
  `work_content` string COMMENT '分管工作',
  `title_name` string COMMENT '职称',
  `work_age` int COMMENT '教学年限',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效 1是 0否',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '师资培训管理体系'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_train_base_organize_rule';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_train_base_property` (
  `id` bigint COMMENT '主键',
  `property_id` bigint COMMENT '属性主键id',
  `property_name` string COMMENT '属性名字',
  `parent_id` bigint COMMENT '父id',
  `tree_level` int COMMENT '节点级别',
  `property_desc` string COMMENT '属性描述',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效 1是 0否',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '选项数据'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_train_base_property';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_train_base_selected` (
  `id` bigint COMMENT '主键',
  `base_id` bigint COMMENT '基地id',
  `property_id` bigint COMMENT '属性id',
  `selected_id` bigint COMMENT '选项id',
  `is_valid` int COMMENT '是否有效',
  `sort_id` int COMMENT '排序',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_train_base_selected';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_train_leading_official` (
  `id` bigint COMMENT '主键',
  `customer_id` bigint COMMENT '主键id',
  `mobile` string COMMENT '手机号',
  `email` string COMMENT '邮箱',
  `name` string COMMENT '专业基地负责人',
  `hospital_id` string COMMENT '医院id',
  `hospital_name` string COMMENT '培训基地',
  `pro_address` string COMMENT '专业基地',
  `province` string COMMENT '省',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效 1是 2否',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '专业基地负责人--用于培训基地的登录'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_train_leading_official';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_train_person` (
  `id` bigint COMMENT '主键',
  `person_id` bigint COMMENT '主键id',
  `base_id` bigint COMMENT '关联id(comm_data_base的id)',
  `type` int COMMENT '职责类别：1负责人2骨干医师',
  `name` string COMMENT '姓名',
  `age` bigint COMMENT '年龄',
  `education_id` string COMMENT '学历comm_data_education的id',
  `major_name` string COMMENT '专业技术职称',
  `professional_title_name` string COMMENT '教学职称职称',
  `teach_year` bigint COMMENT '教学年限',
  `certificate_code` string COMMENT '执业证书编号',
  `id_number` string COMMENT '身份证号',
  `doctor_number` string COMMENT '医师资格证编号',
  `teach_other_work` string COMMENT '教学相关工作',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '基地人员表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_train_person';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_train_person_course` (
  `id` bigint COMMENT '主键',
  `course_id` bigint COMMENT '课程id',
  `ref_id` bigint COMMENT '关联id',
  `type` int COMMENT '类型：1-关联id(train_base的主键id)2-关联id（train_person的主键id)',
  `type_name` string COMMENT '类别',
  `course_name` string COMMENT '课程名称',
  `start_time` timestamp COMMENT '举办开始时间',
  `end_time` timestamp COMMENT '举办结束时间',
  `hold_address` string COMMENT '举办地点',
  `people_num` int COMMENT '参加人数',
  `course_time` int COMMENT '课时',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效 1是 0 否',
  `create_time` timestamp COMMENT '参加时间'
) COMMENT ' 5年内举办省级以上住院医师师资培训课程'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_train_person_course';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_train_person_office` (
  `id` bigint COMMENT '主键',
  `office_id` bigint COMMENT '任职id',
  `person_id` bigint COMMENT '人员person_id',
  `office_name` string COMMENT '名称',
  `position` string COMMENT '职位',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '学术团体任职'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_train_person_office';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_train_person_prize` (
  `id` bigint COMMENT '主键',
  `prize_id` bigint COMMENT '主键id',
  `person_id` bigint COMMENT '人员person_id',
  `prize_name` string COMMENT '奖项',
  `project_name` string COMMENT '名称',
  `type_name` string COMMENT '级别',
  `ranking` string COMMENT '名次',
  `finish_ranking` string COMMENT '完成人排名',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '奖励表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_train_person_prize';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_train_person_task` (
  `id` bigint COMMENT '主键',
  `topic_id` bigint COMMENT '主键id',
  `person_id` bigint COMMENT '人员person_id',
  `topic_name` string COMMENT '课题名称',
  `type` string COMMENT '类别',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `amount` string COMMENT '金额',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '在研课题'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_train_person_task';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_train_person_thesis` (
  `id` bigint COMMENT '主键',
  `thesis_id` bigint COMMENT '主键id',
  `person_id` bigint COMMENT '人员person_id',
  `author` string COMMENT '作者',
  `title` string COMMENT '篇名',
  `journal_name` string COMMENT '期刊名',
  `page_number` string COMMENT '年;卷(期):页码',
  `reason` string COMMENT '影响因子',
  `property` string COMMENT '负责人属性',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '论文'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_train_person_thesis';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_train_person_thesis_attachment` (
  `id` bigint COMMENT '',
  `thesis_id` bigint COMMENT '论文id',
  `att_type` bigint COMMENT '附件类型(comm_data_certificate.id)',
  `att_code` string COMMENT '附件号码',
  `att_path` string COMMENT '附件地址',
  `att_format` string COMMENT '附件格式：jpg、mp4...',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `send_site_id` int COMMENT '站点',
  `att_position_type` int COMMENT '位置标识',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效,扩展用于图片存储切换',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '论文附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_train_person_thesis_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_video_node_attachment` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `node_id` bigint COMMENT '关联笔记Id',
  `att_type` int COMMENT '附件类型：1-图片,2-视频，4-视频缩略图',
  `att_size` string COMMENT '附件大小：KB',
  `att_format` string COMMENT '附件格式：jpg、png...',
  `att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、8-480*320、9-1280*720、10-900*600、12-300*200、13-450*300、14-750*500)',
  `att_height` string COMMENT '附件高度',
  `att_width` string COMMENT '附件宽度',
  `att_url` string COMMENT '附件url',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '视频锚点截图'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_video_node_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_video_node_attachment_20181115` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `node_id` bigint COMMENT '关联笔记Id',
  `att_type` int COMMENT '附件类型：1-图片,2-视频，4-视频缩略图',
  `att_size` string COMMENT '附件大小：KB',
  `att_format` string COMMENT '附件格式：jpg、png...',
  `att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、8-480*320、9-1280*720、10-900*600、12-300*200、13-450*300、14-750*500)',
  `att_height` string COMMENT '附件高度',
  `att_width` string COMMENT '附件宽度',
  `att_url` string COMMENT '附件url',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '视频锚点截图'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_video_node_attachment_20181115';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_video_play_time` (
  `video_id` string COMMENT '',
  `play_time` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_video_play_time';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_video_temp` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `video_name` string COMMENT '视频标题',
  `video_abstract` string COMMENT '视频摘要',
  `video_att_url` string COMMENT '视频附件url',
  `play_time` string COMMENT '播放时长',
  `create_time` timestamp COMMENT '创作时间',
  `is_valid` int COMMENT '是否有效',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `create_usr` string COMMENT '七牛视频唯一id'
) COMMENT '视频占存(医生确认用)'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_video_temp';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_wp_commentmeta` (
  `meta_id` bigint COMMENT '',
  `comment_id` bigint COMMENT '',
  `meta_key` string COMMENT '',
  `meta_value` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_wp_commentmeta';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_wp_comments` (
  `comment_ID` bigint COMMENT '',
  `comment_post_ID` bigint COMMENT '',
  `comment_author` string COMMENT '',
  `comment_author_email` string COMMENT '',
  `comment_author_url` string COMMENT '',
  `comment_author_IP` string COMMENT '',
  `comment_date` timestamp COMMENT '',
  `comment_date_gmt` timestamp COMMENT '',
  `comment_content` string COMMENT '',
  `comment_karma` int COMMENT '',
  `comment_approved` string COMMENT '',
  `comment_agent` string COMMENT '',
  `comment_type` string COMMENT '',
  `comment_parent` bigint COMMENT '',
  `user_id` bigint COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_wp_comments';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_wp_links` (
  `link_id` bigint COMMENT '',
  `link_url` string COMMENT '',
  `link_name` string COMMENT '',
  `link_image` string COMMENT '',
  `link_target` string COMMENT '',
  `link_description` string COMMENT '',
  `link_visible` string COMMENT '',
  `link_owner` bigint COMMENT '',
  `link_rating` int COMMENT '',
  `link_updated` timestamp COMMENT '',
  `link_rel` string COMMENT '',
  `link_notes` string COMMENT '',
  `link_rss` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_wp_links';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_wp_options` (
  `option_id` bigint COMMENT '',
  `option_name` string COMMENT '',
  `option_value` string COMMENT '',
  `autoload` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_wp_options';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_wp_postmeta` (
  `meta_id` bigint COMMENT '',
  `post_id` bigint COMMENT '',
  `meta_key` string COMMENT '',
  `meta_value` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_wp_postmeta';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_wp_posts` (
  `ID` bigint COMMENT '',
  `post_author` bigint COMMENT '',
  `post_date` timestamp COMMENT '',
  `post_date_gmt` timestamp COMMENT '',
  `post_content` string COMMENT '',
  `post_title` string COMMENT '',
  `post_excerpt` string COMMENT '',
  `post_status` string COMMENT '',
  `comment_status` string COMMENT '',
  `ping_status` string COMMENT '',
  `post_password` string COMMENT '',
  `post_name` string COMMENT '',
  `to_ping` string COMMENT '',
  `pinged` string COMMENT '',
  `post_modified` timestamp COMMENT '',
  `post_modified_gmt` timestamp COMMENT '',
  `post_content_filtered` string COMMENT '',
  `post_parent` bigint COMMENT '',
  `guid` string COMMENT '',
  `menu_order` int COMMENT '',
  `post_type` string COMMENT '',
  `post_mime_type` string COMMENT '',
  `comment_count` bigint COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_wp_posts';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_wp_term_relationships` (
  `object_id` bigint COMMENT '',
  `term_taxonomy_id` bigint COMMENT '',
  `term_order` int COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_wp_term_relationships';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_wp_term_taxonomy` (
  `term_taxonomy_id` bigint COMMENT '',
  `term_id` bigint COMMENT '',
  `taxonomy` string COMMENT '',
  `description` string COMMENT '',
  `parent` bigint COMMENT '',
  `count` bigint COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_wp_term_taxonomy';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_wp_terms` (
  `term_id` bigint COMMENT '',
  `name` string COMMENT '',
  `slug` string COMMENT '',
  `term_group` bigint COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_wp_terms';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_wp_usermeta` (
  `umeta_id` bigint COMMENT '',
  `user_id` bigint COMMENT '',
  `meta_key` string COMMENT '',
  `meta_value` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_wp_usermeta';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_wp_users` (
  `ID` bigint COMMENT '',
  `user_login` string COMMENT '',
  `user_pass` string COMMENT '',
  `user_nicename` string COMMENT '',
  `user_email` string COMMENT '',
  `user_url` string COMMENT '',
  `user_registered` timestamp COMMENT '',
  `user_activation_key` string COMMENT '',
  `user_status` int COMMENT '',
  `display_name` string COMMENT ''
) COMMENT ''
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform/ods_allin_wp_users';
