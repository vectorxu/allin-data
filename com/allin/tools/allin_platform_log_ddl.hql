CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_coa_customer_detail` (
  `id` bigint COMMENT '',
  `customer_name` string COMMENT '姓名',
  `first_name` string COMMENT '名',
  `last_name` string COMMENT '姓',
  `email` string COMMENT '邮箱',
  `company` string COMMENT '单位名称',
  `department` string COMMENT '科室／部门',
  `detail_address` string COMMENT '详细地址',
  `zip_code` string COMMENT '邮政编码',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `telephone` string COMMENT '电话',
  `mobile` string COMMENT '手机',
  `fax` string COMMENT '手机',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT 'CAO会员信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_coa_customer_detail';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_comm_data_clinical` (
  `id` bigint COMMENT '',
  `clinical_id` bigint COMMENT '基础数据id',
  `clinical_name` string COMMENT '属性名称',
  `clinical_abstract` string COMMENT '属性描述',
  `clinical_type` int COMMENT '类型(1-input,2-radio,3-checkbox,4-select,5-text,6-图片,7-视频,8-年月日控件，9-年月日时分控件，10-月周天控件,11-年月日下拉控件,12-文本值,13-图片采集时间类型，14-选项值)',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_comm_data_clinical';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_comm_data_property_v1.0` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_comm_data_property_v1.0';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_comm_data_property_v3` (
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
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_comm_data_property_v3';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_customer_con_online` (
  `id` string COMMENT '',
  `customer_id` string COMMENT ''
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_customer_con_online';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_caos_kele` (
  `id` bigint COMMENT '',
  `out_trade_no` string COMMENT '我方订单号',
  `buyer_email` string COMMENT '买家支付宝帐号',
  `buyer_id` string COMMENT '买家支付宝帐户号'
) COMMENT 'CAOS订单支付日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_caos_kele';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_caos_kele_order` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '我方订单号',
  `buyer_email` string COMMENT '买家支付宝帐号',
  `buyer_id` string COMMENT '买家支付宝帐户号'
) COMMENT 'CAOS订单支付日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_caos_kele_order';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_caos_payment` (
  `id` bigint COMMENT '',
  `out_trade_no` string COMMENT '我方订单号',
  `trade_no` string COMMENT '对方订单号',
  `trade_status` string COMMENT '订单状态',
  `notify_time` timestamp COMMENT '返回时间接口中写成now()',
  `notify_type` string COMMENT '返回类型',
  `seller_email` string COMMENT '卖家支付宝帐号',
  `buyer_email` string COMMENT '买家支付宝帐号',
  `seller_id` string COMMENT '卖家支付宝帐户号',
  `buyer_id` string COMMENT '买家支付宝帐户号',
  `price` decimal COMMENT '商品单价',
  `total_fee` decimal COMMENT '交易金额',
  `quantity` int COMMENT '购买数量',
  `gmt_create` timestamp COMMENT '交易创建时间',
  `gmt_payment` timestamp COMMENT '交易付款时间',
  `gmt_close` timestamp COMMENT '交易关闭时间',
  `verify_status` int COMMENT '验证状态',
  `create_time` timestamp COMMENT '插入到数据库时间',
  `remark` string COMMENT '备注'
) COMMENT 'CAOS订单支付日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_caos_payment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_case_additional` (
  `id` bigint COMMENT '',
  `additional_id` bigint COMMENT '附加信息id',
  `case_id` bigint COMMENT '病例id',
  `additional_name` string COMMENT '附加信息名称',
  `additional_type` int COMMENT '附加信息类型（1-随访记录，2-手术记录，3-诊断依据，4-鉴别诊断,5-康复计划,6-临床转归）',
  `additional_option` string COMMENT '附加信息选项（随访记录：年_月，临床转归：1-治愈，2-好转，3-未愈，4-死亡，5-无效，6-其他）',
  `additional_place` string COMMENT '附加信息地点',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述'
) COMMENT '病例附加信息日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_case_additional';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_case_additional_attachment` (
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
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述'
) COMMENT '病例附加信息附件日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_case_additional_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_case_additional_supplement` (
  `id` bigint COMMENT '',
  `additional_id` bigint COMMENT '附加信息id',
  `case_id` bigint COMMENT '病例id',
  `additional_type` int COMMENT '附加信息类型（1-随访记录，2-手术记录，3-诊断依据，4-鉴别诊断,5-康复计划,6-临床转归）',
  `content` string COMMENT '附加信息内容',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述'
) COMMENT '病例附加信息字段内容日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_case_additional_supplement';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_case_attachment` (
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
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '病例附件表日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_case_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_case_baseinfo` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `case_name` string COMMENT '病例名称',
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
  `create_time` string COMMENT '创建时间',
  `moidfy_time` string COMMENT '最近一次修改时间',
  `publish_time` string COMMENT '发布时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `case_status` int COMMENT '1-提交审核、2-审核通过、3-审核拒绝',
  `reason` string COMMENT '审核拒绝原因',
  `is_customer_essential` int COMMENT '是否精华（会员设置）',
  `is_header` int COMMENT '是否置顶',
  `last_update_time` string COMMENT '最近一次修改时间',
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
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `is_draft` int COMMENT '是否草稿',
  `activity_id` bigint COMMENT '活动id',
  `activity_status` int COMMENT '活动状态',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `score` double COMMENT '评分数',
  `score_num` double COMMENT '评分人数'
) COMMENT '病例基础信息日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_case_baseinfo';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_case_baseinfo_history` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `case_name` string COMMENT '病例名称',
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
  `create_time` string COMMENT '创建时间',
  `moidfy_time` string COMMENT '最近一次修改时间',
  `publish_time` string COMMENT '发布时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `case_status` int COMMENT '1-提交审核、2-审核通过、3-审核拒绝',
  `reason` string COMMENT '审核拒绝原因',
  `is_customer_essential` int COMMENT '是否精华（会员设置）',
  `is_header` int COMMENT '是否置顶',
  `last_update_time` string COMMENT '最近一次修改时间',
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
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `is_draft` int COMMENT '是否草稿',
  `activity_id` bigint COMMENT '活动id',
  `activity_status` int COMMENT '活动状态',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `score` double COMMENT '评分数',
  `score_num` double COMMENT '评分人数'
) COMMENT '病例基础信息日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_case_baseinfo_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_case_supplement` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `treatment_record` string COMMENT '诊疗记录',
  `operation_name` string COMMENT '手术名称',
  `intraoperative_info` string COMMENT '术中信息',
  `product_info` string COMMENT '产品信息',
  `auxiliary_info` string COMMENT '辅助检查',
  `diagnosis_info` string COMMENT '诊断',
  `past_history` string COMMENT '既往史',
  `personal_history` string COMMENT '个人史',
  `family_history` string COMMENT '家族史',
  `create_time` string COMMENT '创建时间',
  `modify_time` string COMMENT '修改时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述'
) COMMENT '病例补充信息表日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_case_supplement';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_case_tag` (
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
  `create_time` timestamp COMMENT '创作日期',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述'
) COMMENT '病例-tag-mapping日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_case_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_cms_doc` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文库id（生成id规则：毫秒数）',
  `doc_name` string COMMENT '名称',
  `doc_type` int COMMENT '类型（1-教材、2-指南 、3-期刊、4-讲义）',
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
  `create_time` string COMMENT '创作日期',
  `publish_time` string COMMENT '发布日期',
  `last_note_time` string COMMENT '最新笔记日期 ',
  `last_discuss_time` string COMMENT '最近讨论日期',
  `last_review_time` string COMMENT '最近评论日期',
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
  `is_valid` int COMMENT '是否有效(0-无效,1-有效,2-用户删除)',
  `doc_status` int COMMENT '1-提交审核、2-审核通过、3-审核拒绝、4-该文档附件不合格',
  `reason` string COMMENT '审核拒绝原因',
  `tpl_path` string COMMENT '模版路径or模版id',
  `last_update_time` string COMMENT '最近一次修改时间',
  `web_storage_path` string COMMENT '手机版存储路径',
  `send_site_id` int COMMENT '',
  `sort_list_authority` bigint COMMENT '列表排序权重',
  `follow_num` bigint COMMENT '关注数',
  `sort_authority_secondary` bigint COMMENT '次要列表排序权重',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `external_url` string COMMENT '外部url',
  `is_draft` int COMMENT '是否草稿',
  `app_storage_path` string COMMENT 'app存储路径',
  `qiniu_id` string COMMENT '七牛文库唯一id',
  `qiniu_status` int COMMENT '七牛文库处理状态0－未上传，1－上传成功，2－转码成功',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `score` double COMMENT '评分数',
  `score_num` double COMMENT '评分人数'
) COMMENT '文库信息日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_cms_doc';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_cms_doc_attachment` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文库id',
  `doc_att_type` int COMMENT '文库资源类型：1-图片，2-视频,3-文档',
  `doc_att_size` string COMMENT '文库资源大小：KB',
  `doc_att_format` string COMMENT '文库资源格式：jpg、mp4...',
  `doc_att_spec` string COMMENT '文库附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52)',
  `doc_att_height` string COMMENT '文库资源高度',
  `doc_att_width` string COMMENT '文库资源宽度',
  `doc_att_url` string COMMENT '文库资源url',
  `upload_time` string COMMENT '文库资源上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `is_download` int COMMENT '默认值0未下载,1已从七牛下载',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '文库附件日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_cms_doc_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_cms_doc_author` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文库编号',
  `doc_name` string COMMENT '文库名称',
  `author_type` int COMMENT '类型（1-第一作者，2-第一译者，3-联名作者，4-联名译者，5-转载）',
  `author_id` bigint COMMENT '作者、译者编号',
  `author_name` string COMMENT '作者、译者名称',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `create_time` string COMMENT '创建时间',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述'
) COMMENT '文库作者译者对应关系日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_cms_doc_author';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_cms_doc_content` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文库id（生成id规则：毫秒数）',
  `doc_content` string COMMENT '评论内容',
  `create_time` string COMMENT '创作日期',
  `tpl_path` string COMMENT '模板路径',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效,2-用户删除)',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述',
  `send_site_id` int COMMENT '站点'
) COMMENT '文库图文结合信息日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_cms_doc_content';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_cms_doc_history` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文库id（生成id规则：毫秒数）',
  `doc_name` string COMMENT '名称',
  `doc_type` int COMMENT '类型（1-教材、2-指南 、3-期刊、4-讲义）',
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
  `create_time` string COMMENT '创作日期',
  `publish_time` string COMMENT '发布日期',
  `last_note_time` string COMMENT '最新笔记日期 ',
  `last_discuss_time` string COMMENT '最近讨论日期',
  `last_review_time` string COMMENT '最近评论日期',
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
  `is_valid` int COMMENT '是否有效(0-无效,1-有效,2-用户删除)',
  `doc_status` int COMMENT '1-提交审核、2-审核通过、3-审核拒绝、4-该文档附件不合格',
  `reason` string COMMENT '审核拒绝原因',
  `tpl_path` string COMMENT '模版路径or模版id',
  `last_update_time` string COMMENT '最近一次修改时间',
  `web_storage_path` string COMMENT '手机版存储路径',
  `send_site_id` int COMMENT '',
  `sort_list_authority` bigint COMMENT '列表排序权重',
  `follow_num` bigint COMMENT '关注数',
  `sort_authority_secondary` bigint COMMENT '次要列表排序权重',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `external_url` string COMMENT '外部url',
  `is_draft` int COMMENT '是否草稿',
  `app_storage_path` string COMMENT 'app存储路径',
  `qiniu_id` string COMMENT '七牛文库唯一id',
  `qiniu_status` int COMMENT '七牛文库处理状态0－未上传，1－上传成功，2－转码成功',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `score` double COMMENT '评分数',
  `score_num` double COMMENT '评分人数'
) COMMENT '文库信息日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_cms_doc_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_cms_doc_tag` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文库id',
  `doc_name` string COMMENT '文库标题',
  `tag_id` bigint COMMENT 'tag_id',
  `tag_name` string COMMENT 'tag名称',
  `tag_parent_id` bigint COMMENT 'tag父节点',
  `tag_full_path` string COMMENT 'tag完全路径',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` string COMMENT '创建日期',
  `send_site_id` int COMMENT '站点',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述'
) COMMENT '文库-tag-mapping日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_cms_doc_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_cms_news` (
  `id` bigint COMMENT '',
  `ref_news_id` bigint COMMENT '关联生产库id',
  `owner_channel_id` bigint COMMENT '所属频道id',
  `owner_column_id` bigint COMMENT '',
  `news_title` string COMMENT '新闻标题',
  `news_abstract` string COMMENT '新闻摘要',
  `news_body` string COMMENT '新闻内容',
  `news_status` int COMMENT '新闻状态',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `storage_path` string COMMENT '',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作工号id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '新闻表日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_cms_news';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_cms_topic` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `topic_id` bigint COMMENT '话题id',
  `topic_name` string COMMENT '话题title',
  `topic_type` int COMMENT '话题类型',
  `topic_discuss` string COMMENT '话题讨论',
  `topic_url` string COMMENT '话题页url',
  `tpl_path` string COMMENT '模版路径or模版id',
  `page_storage_path` string COMMENT 'pc版地址',
  `web_storage_path` string COMMENT '手机版地址',
  `create_time` string COMMENT '创建时间',
  `publish_time` string COMMENT '发布时间',
  `last_reply_time` string COMMENT '最后回复时间',
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
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `is_draft` int COMMENT '是否草稿',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)'
) COMMENT '话题日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_cms_topic';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_cms_topic_attachment` (
  `id` bigint COMMENT '',
  `topic_id` bigint COMMENT '话题id',
  `topic_att_type` int COMMENT '资源类型：1-图片，2-视频,3-文档',
  `topic_att_size` string COMMENT '资源大小：KB',
  `topic_att_format` string COMMENT '资源格式：jpg、mp4...',
  `topic_att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52)',
  `topic_att_height` string COMMENT '资源高度',
  `topic_att_width` string COMMENT '资源宽度',
  `topic_att_url` string COMMENT '资源url',
  `upload_time` string COMMENT '资源上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `send_site_id` int COMMENT '站点',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '话题附件日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_cms_topic_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_cms_topic_history` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `topic_id` bigint COMMENT '话题id',
  `topic_name` string COMMENT '话题title',
  `topic_type` int COMMENT '话题类型',
  `topic_discuss` string COMMENT '话题讨论',
  `topic_url` string COMMENT '话题页url',
  `tpl_path` string COMMENT '模版路径or模版id',
  `page_storage_path` string COMMENT 'pc版地址',
  `web_storage_path` string COMMENT '手机版地址',
  `create_time` string COMMENT '创建时间',
  `publish_time` string COMMENT '发布时间',
  `last_reply_time` string COMMENT '最后回复时间',
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
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `is_draft` int COMMENT '是否草稿',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)'
) COMMENT '话题日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_cms_topic_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_cms_topic_tag` (
  `id` bigint COMMENT '',
  `topic_id` bigint COMMENT '话题id',
  `topic_name` string COMMENT '话题标题',
  `tag_id` bigint COMMENT 'tag_id',
  `tag_name` string COMMENT 'tag名称',
  `tag_parent_id` bigint COMMENT 'tag父节点',
  `tag_full_path` string COMMENT 'tag完全路径',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `create_time` string COMMENT '创建日期',
  `send_site_id` int COMMENT '站点',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述'
) COMMENT '话题tag日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_cms_topic_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_cms_video` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `video_name` string COMMENT '视频标题',
  `video_type` int COMMENT '视频类型(1-手术视频，2-课程视频，3-会议视频，4-专家访谈视频)',
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
  `create_time` string COMMENT '创作时间',
  `publish_time` string COMMENT '发布时间',
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
  `last_update_time` string COMMENT '最近一次修改时间',
  `play_time` string COMMENT '播放时长',
  `tpl_path` string COMMENT '模版路径or模版id',
  `send_site_id` int COMMENT '',
  `sort_list_authority` bigint COMMENT '列表排序权重',
  `sort_authority_secondary` bigint COMMENT '次要列表排序权重',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `activity_id` bigint COMMENT '活动id',
  `activity_status` int COMMENT '活动状态',
  `approval_status` int COMMENT '1-提交审核、2-审核通过、3-审核拒绝、4-该视频不合格',
  `approval_reason` string COMMENT '审核说明',
  `qrcode_url` string COMMENT '二维码保存地址',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `score` double COMMENT '评分数',
  `score_num` double COMMENT '评分人数'
) COMMENT '视频日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_cms_video';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_cms_video_attachment` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `video_att_type` int COMMENT '视频附件类型：1-图片，2-视频......',
  `video_att_size` string COMMENT '视频附件大小：KB',
  `video_att_format` string COMMENT '视频附件格式：jpg、mp4...',
  `video_att_spec` string COMMENT '视频附件规格：(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52)',
  `video_att_height` string COMMENT '视频附件高度',
  `video_att_width` string COMMENT '视频附件宽度',
  `video_att_url` string COMMENT '视频附件url',
  `upload_time` timestamp COMMENT '视频附件上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `is_download` int COMMENT '默认值0未下载,1已从七牛下载',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '视频附件详细信息日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_cms_video_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_cms_video_author` (
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
  `create_time` timestamp COMMENT '创作日期',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述'
) COMMENT '视频作者译者对应关系日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_cms_video_author';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_cms_video_detail` (
  `id` bigint COMMENT '',
  `ref_video_detail_id` bigint COMMENT '关联生产库id',
  `video_id` bigint COMMENT '视频id',
  `video_type` int COMMENT '视频类型：1-flv，2-mp4......',
  `video_size` string COMMENT '视频大小：KB',
  `video_spec` string COMMENT '视频规格：高清、标清',
  `video_url` string COMMENT '视频url',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作工号id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '视频文件详细信息日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_cms_video_detail';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_cms_video_history` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `video_name` string COMMENT '视频标题',
  `video_type` int COMMENT '视频类型(1-手术视频，2-课程视频，3-会议视频，4-专家访谈视频)',
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
  `create_time` string COMMENT '创作时间',
  `publish_time` string COMMENT '发布时间',
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
  `last_update_time` string COMMENT '最近一次修改时间',
  `play_time` string COMMENT '播放时长',
  `tpl_path` string COMMENT '模版路径or模版id',
  `send_site_id` int COMMENT '',
  `sort_list_authority` bigint COMMENT '列表排序权重',
  `sort_authority_secondary` bigint COMMENT '次要列表排序权重',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `activity_id` bigint COMMENT '活动id',
  `activity_status` int COMMENT '活动状态',
  `approval_status` int COMMENT '1-提交审核、2-审核通过、3-审核拒绝、4-该视频不合格',
  `approval_reason` string COMMENT '审核说明',
  `qrcode_url` string COMMENT '二维码保存地址',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `score` double COMMENT '评分数',
  `score_num` double COMMENT '评分人数'
) COMMENT '视频日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_cms_video_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_cms_video_tag` (
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
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `send_site_id` int COMMENT '站点'
) COMMENT '视频-tag-mapping日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_cms_video_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_comm_data_logo_url` (
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
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述',
  `send_site_id` int COMMENT '站点',
  `cite_id` bigint COMMENT '所属资源主键id'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_comm_data_logo_url';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_comm_state_config` (
  `id` bigint COMMENT '主键',
  `config_id` bigint COMMENT '邮件模板id',
  `state_type` int COMMENT '场景id',
  `state_type_name` string COMMENT '场景描述（state_type）',
  `state` int COMMENT '场景类别id',
  `state_name` string COMMENT '类别名称',
  `email_title` string COMMENT '邮件标题',
  `email_content` string COMMENT '邮件内容',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `op_date` timestamp COMMENT '操作时间',
  `op_user` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_adress` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述'
) COMMENT '邮件模板日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_comm_state_config';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_conference` (
  `id` bigint COMMENT '',
  `ref_con_id` bigint COMMENT '关联生产库id',
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
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作工号id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述',
  `create_time` timestamp COMMENT '创建时间',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)'
) COMMENT '会议信息日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_conference';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_conference_customer_live` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '主会议id',
  `con_sub_id` bigint COMMENT '分会议id',
  `customer_id` bigint COMMENT '会员id',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `create_time` timestamp COMMENT '创建记录时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）'
) COMMENT '会员观看会议直播日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_conference_customer_live';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_cooperation_resource` (
  `id` bigint COMMENT '',
  `ref_customer_id` bigint COMMENT '对应会员id(oe等合作组织会员id)',
  `type_id` int COMMENT '1原文、2译文、3校对',
  `tpl_path` string COMMENT '模版路径',
  `title_id` string COMMENT '文章id',
  `title` string COMMENT '文章标题',
  `resource_abstract` string COMMENT '摘要',
  `resource_body` string COMMENT '正文',
  `create_time` timestamp COMMENT '创建时间',
  `resource_status` int COMMENT '状态',
  `is_valid` int COMMENT '是否有效'
) COMMENT '第三方资源日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_cooperation_resource';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_audit` (
  `id` bigint COMMENT '主键',
  `customer_id` bigint COMMENT '会员id',
  `audit_remark` string COMMENT '审核备注',
  `auditor` string COMMENT '审核人',
  `resource_id` bigint COMMENT '来源id（如认证变更id）',
  `audit_type` int COMMENT '审核类型(1-首次提交2-变更提交3-补全信息4-重新提交)',
  `audit_time` timestamp COMMENT '审核时间(处理时间)',
  `state` int COMMENT '认证状态(-1-无认证信息、0-二次提交认证、1-认证通过、2-运营确认、3-认证拒绝7-执业医师申请 8-执业医师确认 9-执业医师拒绝)',
  `audit_state` int COMMENT '审核状态(1-待审核2-审核通过3-审核失败)',
  `send_site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效',
  `sort_id` int COMMENT '排序',
  `last_update_time` timestamp COMMENT '最后修改时间',
  `create_time` timestamp COMMENT '创建时间',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作站点id',
  `op_desc` string COMMENT '操作描述',
  `audit_change_state` int COMMENT '认证状态(1-未处理2-变更通过3-变更拒绝)',
  `refuse_reason` string COMMENT '审核拒绝原因'
) COMMENT '会员审核日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_audit';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_auth` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `auth_date` string COMMENT '认证时间',
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
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `first_name_en` string COMMENT '名en',
  `last_name_en` string COMMENT '姓en',
  `medical_title_en` string COMMENT '医师职称en',
  `company_en` string COMMENT '工作单位en',
  `cite_id` bigint COMMENT '所属资源主键id',
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
) COMMENT '会员认证信息日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_auth';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_auth_20171107` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `auth_date` string COMMENT '认证时间',
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
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `first_name_en` string COMMENT '名en',
  `last_name_en` string COMMENT '姓en',
  `medical_title_en` string COMMENT '医师职称en',
  `company_en` string COMMENT '工作单位en',
  `cite_id` bigint COMMENT '所属资源主键id',
  `full_name` string COMMENT '姓名',
  `platform_id` string COMMENT '所属平台(1-骨科、2-手外科)',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员认证信息日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_auth_20171107';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_auth_history` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `auth_date` string COMMENT '认证时间',
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
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `first_name_en` string COMMENT '名en',
  `last_name_en` string COMMENT '姓en',
  `medical_title_en` string COMMENT '医师职称en',
  `company_en` string COMMENT '工作单位en',
  `cite_id` bigint COMMENT '所属资源主键id',
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
  `practice_auth_time` timestamp COMMENT '申请执业医生认证时间'
) COMMENT '会员认证信息日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_auth_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_baseinfo` (
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
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `summary_en` string COMMENT '摘要en',
  `cite_id` bigint COMMENT '所属资源主键id',
  `regist_address_en` string COMMENT '英文地址',
  `create_time` timestamp COMMENT '创建时间',
  `native_place_id` bigint COMMENT '籍贯id',
  `native_place` string COMMENT '籍贯',
  `nationality_id` bigint COMMENT '民族id',
  `nationality` string COMMENT '民族',
  `politics_status_id` bigint COMMENT '政治面貌id',
  `politics_status` string COMMENT '政治面貌'
) COMMENT '会员基础信息日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_baseinfo';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_browse` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `browse_type` int COMMENT '浏览类型（1-主页,2-视频应用页,3-文库应用页,4-视频内容页,5-文库内容页,6-个人主页,7-个人首页,8-个人资料页,9-话题内容页,10-病例内容页,11-会场页面,12-评论内容页,13-病例应用页,14-话题应用页,15-fellowship应用页面,16-医师定考应用页面,17-视频列表页面,18-文库列表页面,19-话题列表页面,20-病例列表页面,21-年会内容页面,22-组织应用页面,23-厂商应用页面,24-会议直播页面-多会场,25-直播列表页面,26-会议回放页面,27-登录,28-注册,29-找回密码,30-医师频道页,31-医师列表页,32-搜索页面,33-视频pk页面,34-专题页面,35-热门列表,36-朋友圈,37-标签专题,38-每日最新,39-每周最新,40-每日最热,41-每周最热,42-会议列表,43-发现首页,44-按专业,45-按疾病,46-按术士,47-按标签,48-按类型,49-按专题,50-权威专家,51-热门活动,52-活动内容页,53-消息列表,54-关注提醒,55-评论我的,56-提醒我看,57-赞了我的,58-搜索视频,59-搜索文库,60-搜索话题,61-搜索病例,62-搜索医师,63-搜索会议,64-我的贡献,65-我的动态,66-他人动态,67-他人贡献,68-他人简介,69-认证第一步,70-认证第二步',
  `browse_url` string COMMENT '浏览url',
  `open_time` timestamp COMMENT '打开时间',
  `leave_time` timestamp COMMENT '离开时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '发送渠道',
  `device_token` string COMMENT 'token'
) COMMENT '会员浏览日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_browse';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_browse_history` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `browse_type` int COMMENT '浏览类型（1-主页,2-视频应用页,3-文库应用页,4-视频内容页,5-文库内容页,6-个人主页,7-个人首页,8-个人资料页,9-话题内容页,10-病例内容页,11-会场页面,12-评论内容页,13-病例应用页,14-话题应用页,15-fellowship应用页面,16-医师定考应用页面,17-视频列表页面,18-文库列表页面,19-话题列表页面,20-病例列表页面,21-年会内容页面,22-组织应用页面,23-厂商应用页面,24-会议直播页面-多会场,25-直播列表页面,26-会议回放页面,27-登录,28-注册,29-找回密码,30-医师频道页,31-医师列表页,32-搜索页面,33-视频pk页面,34-专题页面,35-热门列表,36-朋友圈,37-标签专题,38-每日最新,39-每周最新,40-每日最热,41-每周最热,42-会议列表,43-发现首页,44-按专业,45-按疾病,46-按术士,47-按标签,48-按类型,49-按专题,50-权威专家,51-热门活动,52-活动内容页,53-消息列表,54-关注提醒,55-评论我的,56-提醒我看,57-赞了我的,58-搜索视频,59-搜索文库,60-搜索话题,61-搜索病例,62-搜索医师,63-搜索会议,64-我的贡献,65-我的动态,66-他人动态,67-他人贡献,68-他人简介,69-认证第一步,70-认证第二步)',
  `browse_url` string COMMENT '浏览url',
  `open_time` timestamp COMMENT '打开时间',
  `leave_time` timestamp COMMENT '离开时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '发送渠道',
  `device_token` string COMMENT 'token'
) COMMENT '会员浏览日志历史表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_browse_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_browse_vc` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `browse_type` int COMMENT '浏览类型（1-主页，2-视频应用页,3-文库应用页,4-视频内容页,5-文库内容页,6-个人主页,7-个人首页,8个人资料页）',
  `browse_url` string COMMENT '浏览url',
  `open_time` timestamp COMMENT '打开时间',
  `leave_time` timestamp COMMENT '离开时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '会员浏览日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_browse_vc';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_collection` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `collection_type` int COMMENT '收藏类型（1-视频，2-文库，3-会议，4-话题 ,5-笔记）',
  `ref_id` bigint COMMENT '收藏具体信息id',
  `ref_customer_id` bigint COMMENT '冗余存放资源相关会员id',
  `ref_name` string COMMENT '收藏具体信息名字',
  `ref_url` string COMMENT '收藏地址',
  `collection_category_id` bigint COMMENT '收藏分类',
  `collection_time` timestamp COMMENT '收藏时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效（0-取消收藏；1-添加收藏）',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述',
  `send_site_id` int COMMENT '站点'
) COMMENT '会员收藏日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_collection';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_continuing_education` (
  `id` bigint COMMENT 'ID',
  `customer_id` bigint COMMENT '会员id',
  `site_ref_id` bigint COMMENT '网内关联继续教育id',
  `education_name` string COMMENT '继续教育title',
  `organization` string COMMENT '所属机构',
  `adress` string COMMENT '地点',
  `certificate` string COMMENT '获得证书',
  `cme_desc` string COMMENT '描述',
  `start_time` string COMMENT '开始',
  `end_time` string COMMENT '结束',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述',
  `send_site_id` int COMMENT '站点',
  `language_flag` int COMMENT '0-中文、1-英文',
  `cite_id` bigint COMMENT '所属资源主键id',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员继续教育信息日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_continuing_education';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_discuss` (
  `id` bigint COMMENT '',
  `ref_discuss_id` bigint COMMENT '关联生产库id',
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
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作工号id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '会员讨论日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_discuss';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_download` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `download_type` int COMMENT '下载类型',
  `resource_id` bigint COMMENT '资源id',
  `download_desc` string COMMENT '下载描述',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员下载日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_download';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_education` (
  `id` bigint COMMENT 'id',
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
  `major` string COMMENT '专业id',
  `education_id` bigint COMMENT '学历id',
  `education` string COMMENT '学历',
  `is_degree` int COMMENT '是否获得学位',
  `academic_degree_id` bigint COMMENT '学位id',
  `academic_degree` string COMMENT '学位',
  `total` int COMMENT '是否统招',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述',
  `send_site_id` int COMMENT '站点',
  `cite_id` bigint COMMENT '所属资源主键id',
  `language_flag` int COMMENT '0-中文、1-英文',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '教育背景日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_education';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_fellowship` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `fellowship_id` bigint COMMENT '项目id',
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
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述',
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
) COMMENT '会员fellowship日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_fellowship';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_fellowship_attachment` (
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
  `create_time` string COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '会员fellowship资料表日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_fellowship_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_fellowship_major` (
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
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '会员专业进修管理日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_fellowship_major';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_fellowship_state` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `fellowship_id` bigint COMMENT '项目id',
  `fellowship_name` string COMMENT 'fellow项目名称',
  `state` int COMMENT '状态',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '会员fellowship状态表日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_fellowship_state';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_fellowship_sub` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `fellowship_id` bigint COMMENT 'fellowship项目编号',
  `fellowship_name` string COMMENT 'fellow项目名称',
  `fellowship_sub_id` bigint COMMENT 'fellowship子项目编号',
  `fellowship_sub_name` string COMMENT 'fellow子项目名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '会员子fellowship日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_fellowship_sub';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_follow_fans` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `fans_customer_id` bigint COMMENT '关注具体信息id',
  `fans_customer_name` string COMMENT '关注具体信息名称',
  `follow_time` string COMMENT '关注时间',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地址',
  `is_valid` int COMMENT '是否有效',
  `relationship` int COMMENT '关系(1-未关注，2-已关注，3-粉丝，4-相互关注)',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作工号id',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `follow_type` int COMMENT '关注类型：1:人员关注，2:组织关注'
) COMMENT '会议粉丝日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_follow_fans';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_follow_people` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `ref_id` bigint COMMENT '关注具体信息id',
  `ref_name` string COMMENT '关注具体信息title',
  `follow_category` bigint COMMENT '关注人分类',
  `follow_time` string COMMENT '关注时间',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地点',
  `is_valid` int COMMENT '是否有效',
  `relationship` int COMMENT '关系(1-未关注，2-已关注，3-粉丝，4-相互关注)',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述',
  `is_permit` int COMMENT '是否禁止(0-不允许,１-允许)',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `follow_type` int COMMENT '关注类型：1:人员关注，2:组织关注'
) COMMENT '会员关注日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_follow_people';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_follow_resource` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `follow_type` int COMMENT '（1-视频，2-文库，3-会议，4-话题 ,5-笔记，6-tag）',
  `ref_id` bigint COMMENT '关注具体信息id',
  `ref_name` string COMMENT '关注具体信息title',
  `follow_category` bigint COMMENT '关注分类',
  `follow_time` string COMMENT '关注时间',
  `follow_url` string COMMENT '关注url',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地点',
  `is_valid` int COMMENT '是否有效',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '排序',
  `sort_ref_name` string COMMENT '关注资源名称首字母排序',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述',
  `is_permit` int COMMENT '是否禁止(0-不允许,１-允许)',
  `send_site_id` int COMMENT '站点'
) COMMENT '会员关注－资源日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_follow_resource';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_fund` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `fund_code` string COMMENT '基金项目编号',
  `fund_name` string COMMENT '基金名称',
  `approval_time` string COMMENT '批准时间',
  `start_time` string COMMENT '开始时间',
  `end_time` string COMMENT '结束时间',
  `up_now` int COMMENT '至今',
  `create_time` string COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述',
  `send_site_id` int COMMENT '站点',
  `language_flag` int COMMENT '0-中文、1-英文',
  `cite_id` bigint COMMENT '所属资源主键id'
) COMMENT '科研基金日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_fund';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_honor` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `honor_name` string COMMENT '荣誉名称',
  `award_department` string COMMENT '颁发机构',
  `award_year` string COMMENT '颁发年',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述',
  `send_site_id` int COMMENT '站点',
  `language_flag` int COMMENT '0-中文、1-英文',
  `cite_id` bigint COMMENT '所属资源主键id',
  `create_time` timestamp COMMENT '创建时间',
  `honor_type` int COMMENT '荣誉类型 默认：0-医生可见;1-患者可见'
) COMMENT '会员荣誉日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_honor';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_log_customer_keyword` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `session_id` string COMMENT 'sessionId',
  `search_type` int COMMENT 'keyword场景类型（预留）',
  `search_url` string COMMENT '所搜索地址url',
  `key_word` string COMMENT 'keyword',
  `create_time` timestamp COMMENT '创建时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `send_site_id` int COMMENT '渠道',
  `is_valid` int COMMENT '状态'
) COMMENT '会员关键词日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_allin_log_customer_keyword';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_keyword_20180702` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `session_id` string COMMENT 'sessionId',
  `search_type` int COMMENT 'keyword场景类型（预留）',
  `search_url` string COMMENT '所搜索地址url',
  `key_word` string COMMENT 'keyword',
  `create_time` timestamp COMMENT '创建时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `send_site_id` int COMMENT '渠道',
  `is_valid` int COMMENT '状态'
) COMMENT '会员关键词日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_keyword_20180702';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_keyword_history` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `session_id` string COMMENT 'sessionId',
  `search_type` int COMMENT 'keyword场景类型（预留）',
  `search_url` string COMMENT '所搜索地址url',
  `key_word` string COMMENT 'keyword',
  `create_time` timestamp COMMENT '创建时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `send_site_id` int COMMENT '渠道',
  `is_valid` int COMMENT '状态'
) COMMENT '会员关键词日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_keyword_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_language` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `language_id` bigint COMMENT '语言能力id',
  `language_name` string COMMENT '语言能力',
  `award_year` string COMMENT '获得年',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `language_flag` int COMMENT '0-中文、1-英文',
  `create_time` timestamp COMMENT '创建时间',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述',
  `cite_id` bigint COMMENT '所属资源主键id'
) COMMENT '会员语言能力日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_language';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_login` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `login_type` int COMMENT '1-登陆;2-退出;3-错误',
  `op_date` timestamp COMMENT '操作时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述',
  `site_id` int COMMENT ''
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_login';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_login_20170807` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `login_type` int COMMENT '1-登陆;2-退出;3-错误',
  `op_date` timestamp COMMENT '操作时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述',
  `site_id` int COMMENT ''
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_login_20170807';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_merge` (
  `id` bigint COMMENT '',
  `main_customer_id` bigint COMMENT '保留会员id',
  `merge_customer_id` bigint COMMENT '合并会员id（被删除的会员id）',
  `create_time` timestamp COMMENT '日志操作时间',
  `op_user` string COMMENT '处理人',
  `deal_time` timestamp COMMENT '处理时间',
  `merge_state` int COMMENT '合并状态(1-待合并2-已合并3-v1通过4-v1拒绝5-v2通过6-v2拒绝)',
  `merge_type` int COMMENT '合并类型(1-用户发起2-运营发起)',
  `merge_remark` string COMMENT '合并备注',
  `send_site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效',
  `sort_id` int COMMENT '排序',
  `op_date` timestamp COMMENT '操作时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '会员合并日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_merge';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_movement` (
  `id` bigint COMMENT '',
  `movement_id` bigint COMMENT '云云id',
  `customer_id` bigint COMMENT '会员id',
  `movement_type` int COMMENT '云云类型(22-个人云云)',
  `movement_content` string COMMENT '云云内容',
  `ref_item_id` bigint COMMENT '关联id数组',
  `ref_item_type` bigint COMMENT '71-手术标签  72-疾病标签',
  `ref_item_name` string COMMENT '关联id名称',
  `create_time` timestamp COMMENT '操作时间',
  `prefer_num` bigint COMMENT '赞数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `share_num` bigint COMMENT '分享数',
  `reprint_num` bigint COMMENT '转发数',
  `update_time` timestamp COMMENT '最近一次修改时间',
  `is_valid` int COMMENT '是否有效（0-无效;1-有效；2-系统屏蔽；3-用户删除)',
  `send_site_id` int COMMENT '站点',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述'
) COMMENT '会员云云日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_movement';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_note` (
  `id` bigint COMMENT '',
  `ref_note_id` bigint COMMENT '关联生产库id',
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
  `discuss_num` bigint COMMENT '评论数',
  `browse_num` bigint COMMENT '浏览数',
  `share_num` bigint COMMENT '分享数',
  `up_num` bigint COMMENT '点赞数',
  `down_num` bigint COMMENT '踩数',
  `is_header` int COMMENT '是否置顶',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作工号id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '会员笔记日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_note';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_occupation` (
  `id` bigint COMMENT 'ID',
  `customer_id` bigint COMMENT '会员id',
  `unit` string COMMENT '工作单位',
  `department` string COMMENT '科室/部门',
  `occupation` string COMMENT '行政职务',
  `medical_title` string COMMENT '职位/职称名称',
  `address` string COMMENT '工作地点',
  `start_time` string COMMENT '开始时间',
  `end_time` string COMMENT '结束时间',
  `up_now` int COMMENT '至今',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `is_default` int COMMENT '是否默认显示',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述',
  `send_site_id` int COMMENT '站点',
  `language_flag` int COMMENT '0-中文、1-英文',
  `cite_id` bigint COMMENT '所属资源主键id',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '职业信息日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_occupation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_opus` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `opus_name` string COMMENT '专著名称',
  `author_type` int COMMENT '1-第一作者，2-第一译者，3-联合作者、4-联合译者',
  `publisher` string COMMENT '出版机构',
  `publication_time` string COMMENT '出版时间',
  `information` string COMMENT '引用信息',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述',
  `send_site_id` int COMMENT '站点',
  `language_flag` int COMMENT '0-中文、1-英文',
  `cite_id` bigint COMMENT '所属资源主键id'
) COMMENT '学术专著日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_opus';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_patent` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `patent_name` string COMMENT '专利名称',
  `patent_code` string COMMENT '专利编号',
  `patent_time` string COMMENT '认证时间',
  `country` string COMMENT '国别',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述',
  `send_site_id` int COMMENT '站点',
  `language_flag` int COMMENT '0-中文、1-英文',
  `cite_id` bigint COMMENT '所属资源主键id'
) COMMENT '发明专利日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_patent';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_prefer` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `useful_type` int COMMENT '赞类型（1-视频，2-文库，3-会议，4-话题 ,5-笔记 ， 6-人）',
  `up_down_type` int COMMENT '赞、踩 类型(0踩,1赞)',
  `ref_id` bigint COMMENT '赞具体信息id',
  `publish_time` string COMMENT '发布时间',
  `if_anonymous` int COMMENT '是否匿名',
  `if_header` int COMMENT '是否置顶',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源(ip)',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site(手机、网站、app\99-后台)',
  `op_desc` string COMMENT '操作描述',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员赞踩日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_prefer';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_push_recall` (
  `id` int COMMENT '',
  `customer_id` bigint COMMENT 'customer_id',
  `event_type_id` int COMMENT '事件类型ID',
  `days_type` int COMMENT '事件周期类型',
  `push_type` int COMMENT '推送类型。1:push,2:sms.4:email',
  `create_time` timestamp COMMENT '',
  `create_date` timestamp COMMENT ''
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_push_recall';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_quote` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '引用会员id',
  `quote_id` bigint COMMENT '引用id',
  `quote_type` int COMMENT '引用类型：1-视频，2-文库，3-会议，4-话题 ,5-笔记，6-tag,7-病例,8-回复,9-人',
  `resource_id` bigint COMMENT 'quote_id的父节点',
  `resource_type` int COMMENT 'quote_id的父节点的类型：1-视频，2-文库，4-话题 ,7-病例',
  `ref_quote_id` bigint COMMENT '被引用资源id',
  `ref_quote_type` int COMMENT '被引用资源类型：1-视频，2-文库，4-话题 ,7-病例',
  `ref_quote_name` string COMMENT '被引用资源名称',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '操作来源(1-pc、2-H5、5-ios、6-android)',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地址'
) COMMENT '会员资源引用表日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_quote';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_ref_education` (
  `id` bigint COMMENT 'id',
  `ref_ref_education_id` bigint COMMENT '关联生产库id',
  `ref_id` bigint COMMENT '关联继续教育id',
  `ref_name` string COMMENT '继续教育title',
  `organization` string COMMENT '所属机构',
  `address` string COMMENT '地点',
  `education_desc` string COMMENT '描述',
  `start_time` timestamp COMMENT '开始',
  `end_time` timestamp COMMENT '结束',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作工号id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '站内关联继续教育日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_ref_education';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_reprint` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `reprint_type` int COMMENT '转发类型（1-视频，2-文库，3-会议，4-话题 ,5-笔记）',
  `ref_id` bigint COMMENT '转发具体信息id',
  `ref_customer_id` bigint COMMENT '冗余存放资源关联会员id',
  `ref_name` string COMMENT '转发具体信息名字',
  `ref_url` string COMMENT '转发地址',
  `reprint_time` string COMMENT '转发时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效（0-取消转发；1-添加转发）',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作工号id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员转发日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_reprint';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_reset_password` (
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
  `op_type` int COMMENT '用户验证类型(1-邮箱验证连接、2-手机验证、3-邮箱验证码)',
  `op_site` int COMMENT '操作站点 1-pc、2-h5、5-ios、6-android',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员找回密码日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_reset_password';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_review` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `parent_id` bigint COMMENT '父节点',
  `review_type` bigint COMMENT '评论类型（1-视频，2-文库，4-话题 ,7-病例）',
  `review_status` int COMMENT '评论状态（1-发布；2-系统屏蔽；3-用户删除；４－草稿）',
  `ref_id` bigint COMMENT '关联信息id',
  `ref_customer_id` bigint COMMENT '冗余存放资源关联会员id',
  `ref_url` string COMMENT '关联信息url',
  `review_content` string COMMENT '评论内容',
  `create_time` timestamp COMMENT '记录时间(yyyy-mm-dd  hh:mm:ss)',
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
  `op_date` timestamp COMMENT '操作时间',
  `op_desc` string COMMENT '操作描述',
  `op_usr` string COMMENT '操作人员id',
  `cite_id` bigint COMMENT '所属资源主键id',
  `publish_time` timestamp COMMENT '发布时间(yyyy-mm-dd  hh:mm:ss)'
) COMMENT '会员评论日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_review';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_social` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `organization` string COMMENT '机构名称',
  `social_title` string COMMENT '职位名称',
  `start_time` string COMMENT '开始时间',
  `end_time` string COMMENT '结束时间',
  `up_now` int COMMENT '至今',
  `is_default` int COMMENT '是否默认显示',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述',
  `send_site_id` int COMMENT '站点',
  `language_flag` int COMMENT '0-中文、1-英文',
  `cite_id` bigint COMMENT '所属资源主键id',
  `social_type` int COMMENT '社会任职类型：默认:0-医生可见;1-患者可见'
) COMMENT '社会任职日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_social';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_suggestion` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `customer_name` string COMMENT '会员名称（冗余）',
  `site_id` bigint COMMENT '1-唯医官网pc、2-唯医手机H5、3-CAOS、4-CAOS手机、5-ios、6-android、7-CAOS-EN、8-MED-IOS、9-MED-Android、10-后台、11-MED-H5',
  `suggestion` string COMMENT '建议内容',
  `system_version` string COMMENT '提交客户端版本信息',
  `equipment_version` string COMMENT '提交客户端设备版本信息',
  `network_environment` string COMMENT '提交客户端网络环境(2G、3G、4G等)',
  `create_time` timestamp COMMENT '创建记录时间',
  `suggestion_status` int COMMENT '状态(0-提交1-回复等)',
  `suggestion_type` int COMMENT '1-系统意见反馈;2-专题反馈',
  `op_date` timestamp COMMENT '处理时间',
  `op_usr` string COMMENT '处理人id',
  `op_name` string COMMENT '处理人名称（冗余）',
  `op_desc` string COMMENT '处理意见',
  `remark` string COMMENT '备注',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `state` int COMMENT '专题反馈处理状态（1-等待，2-处理中，3-已处理）',
  `suggestion_id` bigint COMMENT 'customer_suggestion的系统ID',
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
102-简介编辑页,103-认证信息编辑页, 104-设置页面,105-账号安全,106-绑定微信,107-绑定手机,1'
) COMMENT '会员反馈日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_suggestion';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_topic` (
  `id` bigint COMMENT '',
  `ref_topic_id` bigint COMMENT '关联生产库id',
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
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作工号id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '会员话题日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_topic';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_unite` (
  `id` bigint COMMENT '',
  `ref_unite_id` bigint COMMENT '关联生产库id',
  `customer_id` bigint COMMENT '会员id',
  `nickname` string COMMENT '昵称',
  `m_tele` string COMMENT '手机号',
  `e_mail` string COMMENT '邮箱',
  `unite_id_qq` int COMMENT '联合登录qq_id',
  `unite_name_qq` string COMMENT '联合登录qq',
  `unite_flag_qq` int COMMENT '状态qq',
  `unite_id_sina` int COMMENT '联合登录sina_id',
  `unite_name_sina` string COMMENT '联合登录sina',
  `unite_flag_sina` int COMMENT '状态sina',
  `unite_id_baidu` int COMMENT '联合登录baidu_id',
  `unite_name_baidu` string COMMENT '联合登录baidu',
  `unite_flag_baidu` int COMMENT '状态baidu',
  `passwd` string COMMENT '密码',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作工号id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述',
  `is_valid` int COMMENT '是否有效',
  `is_check_email` int COMMENT '是否验证邮箱',
  `is_check_mobile` int COMMENT '是否验证手机',
  `customer_role` int COMMENT '1-系统、2-组织、3-厂商、4-患者、5-普通医生、6-认证医生',
  `mobile` string COMMENT '手机号',
  `unite_time_mobile` string COMMENT '绑定手机时间',
  `email` string COMMENT '邮箱',
  `unite_time_email` string COMMENT '绑定邮箱时间',
  `unite_time_qq` string COMMENT '绑定qq时间',
  `unite_time_sina` string COMMENT '绑定sina时间',
  `unite_time_baidu` string COMMENT '绑定baidu时间',
  `unite_id_weixin` int COMMENT '',
  `unite_name_weixin` string COMMENT '微信号',
  `unite_flag_weixin` int COMMENT '状态weixin',
  `unite_time_weixin` string COMMENT '邦定时间',
  `unite_id_caos` int COMMENT '联合登录caos',
  `unite_name_caos` string COMMENT 'caos账号',
  `unite_flag_caos` int COMMENT 'caos状态',
  `unite_time_caos` string COMMENT '邦定时间',
  `check_email_time` string COMMENT '验证邮箱时间',
  `check_mobile_time` string COMMENT '验证手机时间',
  `unite_name_zhgk` string COMMENT '中华骨科网帐号',
  `unite_time_zhgk` string COMMENT '中华骨科网注册时间',
  `init_passwd` string COMMENT '明码密码',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '联合登陆日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_unite';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_customer_unite_info` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `unite_id` int COMMENT '渠道id',
  `unite_info` string COMMENT '渠道信息',
  `unite_follow_state` int COMMENT '是否关注渠道信息',
  `unite_follow_time` string COMMENT '关注时间',
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
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述'
) COMMENT '渠道登陆扩展信息日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_customer_unite_info';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_email` (
  `id` bigint COMMENT '',
  `send_type` int COMMENT '发送类型(1-重置密码,2-验证邮箱,3-文档审核,4-会员认证,5-用户fellowship审核))',
  `email` string COMMENT '收件人email',
  `send_subject` string COMMENT '发送主题',
  `send_content` string COMMENT '发送内容',
  `send_time` timestamp COMMENT '发送时间',
  `send_channel_id` int COMMENT '发送渠道(1-自荐服务器,2-某某供应商)',
  `send_site_id` int COMMENT '发送站点(1-allin,2-wap-allin，3-caos)',
  `send_status` string COMMENT '发送状态',
  `callback_time` timestamp COMMENT '返回时间',
  `callback_mtstat` string COMMENT '返回状态'
) COMMENT '邮件日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_email';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_email_history` (
  `id` bigint COMMENT '',
  `send_type` int COMMENT '发送类型(1-重置密码,2-验证邮箱,3-文档审核,4-会员认证,5-用户fellowship审核))',
  `email` string COMMENT '收件人email',
  `send_subject` string COMMENT '发送主题',
  `send_content` string COMMENT '发送内容',
  `send_time` timestamp COMMENT '发送时间',
  `send_channel_id` int COMMENT '发送渠道(1-自荐服务器,2-某某供应商)',
  `send_site_id` int COMMENT '发送站点(1-allin,2-wap-allin，3-caos)',
  `send_status` string COMMENT '发送状态',
  `callback_time` timestamp COMMENT '返回时间',
  `callback_mtstat` string COMMENT '返回状态'
) COMMENT '邮件日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_email_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_fellowship` (
  `id` bigint COMMENT '',
  `fellowship_id` bigint COMMENT '会员id',
  `fellowship_name` string COMMENT ' fellow项目名称',
  `fellowship_summary` string COMMENT 'fellow简介',
  `start_time` string COMMENT '开始时间',
  `end_time` string COMMENT '结束时间',
  `state` int COMMENT '状态',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述'
) COMMENT 'fellowship日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_fellowship';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_fellowship_attachment` (
  `id` bigint COMMENT '',
  `fellowship_id` bigint COMMENT '会员id',
  `fellowship_name` string COMMENT 'fellow项目名称',
  `fellowship_sub_id` bigint COMMENT 'fellow子项目',
  `fellowship_sub_name` string COMMENT 'fellow子项目',
  `fellowship_att_type` int COMMENT '附件类型：1-图片，2-视频',
  `fellowship_att_format` string COMMENT '附件格式：jpg、mp4',
  `fellowship_att_spec` string COMMENT '附件规格：(。。。',
  `fellowship_att_url` string COMMENT '附件url',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述'
) COMMENT 'fellowship附件表日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_fellowship_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_fellowship_major` (
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
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '进修专业管理日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_fellowship_major';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_fellowship_rule` (
  `id` bigint COMMENT '',
  `fellowship_id` bigint COMMENT '会员id',
  `fellowship_name` string COMMENT 'fellow项目名称',
  `rule_name` string COMMENT '规则名称',
  `rule_url` string COMMENT '规则链接',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述'
) COMMENT 'fellowship项目规则日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_fellowship_rule';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_fellowship_sub` (
  `id` bigint COMMENT '',
  `fellowship_id` bigint COMMENT '会员id',
  `fellowship_name` string COMMENT 'fellow项目名称',
  `fellowship_sub_id` bigint COMMENT 'fellow子项目',
  `fellowship_sub_name` string COMMENT 'fellow子项目',
  `fellowship_sub_summary` string COMMENT 'fellow_sub简介',
  `start_time` string COMMENT '开始时间',
  `end_time` string COMMENT '结束时间',
  `create_time` timestamp COMMENT '上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_site_id` int COMMENT '操作site（手机、网站、app\99-后台）',
  `op_desc` string COMMENT '操作描述',
  `fellowship_sub_time` string COMMENT '进修时间'
) COMMENT 'fellowship_sub日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_fellowship_sub';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_notify_message` (
  `id` bigint COMMENT '',
  `send_site_id` int COMMENT '发送渠道',
  `device_token` string COMMENT '设备id',
  `content` string COMMENT '发送内容',
  `source_id` bigint COMMENT '资源id',
  `source_type` int COMMENT '资源类型(1-视频，2-文库，4-话题,7-病例)',
  `message_first_result` bigint COMMENT '定位',
  `badge` int COMMENT '',
  `send_map` string COMMENT '提交map',
  `create_time` timestamp COMMENT '创作日期'
) COMMENT '系统消息通知日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_notify_message';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_op_location` (
  `id` bigint COMMENT '',
  `op_table` string COMMENT '访问数据库表名',
  `op_table_id` bigint COMMENT '访问数据库表名对应数据库id',
  `op_time` timestamp COMMENT '操作时间',
  `op_desc` string COMMENT '操作(c,u,d)',
  `op_ip` string COMMENT '操作来源（ip）',
  `area_code` string COMMENT '',
  `city` string COMMENT '城市',
  `country_code` string COMMENT '国家编码',
  `country_name` string COMMENT '国家',
  `dma_code` string COMMENT '',
  `latitude` string COMMENT '纬度',
  `longitude` string COMMENT '经度',
  `metro_code` string COMMENT '',
  `postal_code` string COMMENT '邮编',
  `region` string COMMENT '',
  `ip_org` string COMMENT '',
  `time_zone` string COMMENT '时区',
  `create_time` timestamp COMMENT '插入到数据库时间',
  `send_site_id` int COMMENT '访问渠道',
  `op_advice` string COMMENT '浏览器版本、设备等'
) COMMENT '根据ip操作日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_op_location';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_operation` (
  `id` bigint COMMENT '',
  `user_id` string COMMENT '后台用户id',
  `user_name` string COMMENT '后台用户名',
  `page_id` int COMMENT 'pageId',
  `system_id` int COMMENT 'systemId',
  `menu_name` string COMMENT '菜单名称',
  `op_ip` string COMMENT '操作ip',
  `op_class` string COMMENT '操作类',
  `op_method` string COMMENT '操作方法',
  `op_advice` string COMMENT '浏览器版本，设备，系统版本号',
  `create_time` timestamp COMMENT '操作时间',
  `log_map` string COMMENT '操作内容（即传递的json或map拼值）'
) COMMENT '后台操作日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_operation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_reset_password` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `first_name` string COMMENT '名',
  `last_name` string COMMENT '姓',
  `full_name` string COMMENT '姓名',
  `customer_email` string COMMENT '客户邮件地址',
  `customer_mobile` string COMMENT '客户手机号',
  `init_passwd` string COMMENT '修改前密码',
  `user_id` bigint COMMENT '后台操作用户id',
  `user_name` string COMMENT '后台操作用户名称',
  `create_time` timestamp COMMENT '修改确认时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `send_site_id` int COMMENT '关联站点 10-后台'
) COMMENT '后台重置密码日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_reset_password';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_search_word` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员卡号',
  `session_id` string COMMENT 'sessionid',
  `site_id` int COMMENT '站点',
  `site_source` int COMMENT '来源(pc、H5)',
  `search_page` string COMMENT '搜索所在页面url',
  `search_word` string COMMENT '搜索词',
  `search_time` timestamp COMMENT '搜索时间'
) COMMENT '搜索词日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_search_word';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_send_coa` (
  `id` bigint COMMENT '',
  `email` string COMMENT '邮箱',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT 'CAO-email'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_send_coa';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_send_edm` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `send_scene_id` int COMMENT '1、邮件引导认证，按业务可扩展',
  `send_level_id` int COMMENT '1、第一个七日；2、第二个七日；3、第三个七日，根据场景不同的级别，便于查询',
  `send_vm_name` string COMMENT 'vm_name',
  `send_account` string COMMENT '发送账号（手机号、邮箱都可以）',
  `send_content` string COMMENT '发送内容,job插数据的时候判断具体内容',
  `send_subject` string COMMENT '主题(邮件用)',
  `valid_code` string COMMENT '加密链接',
  `send_time` timestamp COMMENT '发送时间',
  `create_time` timestamp COMMENT '创建时间',
  `send_status` int COMMENT '0-未发送1-已发送',
  `callback_time` timestamp COMMENT '返回时间',
  `callback_mtstat` string COMMENT '返回状态',
  `send_channel_id` int COMMENT '供应商id',
  `is_valid` int COMMENT '是否有效'
) COMMENT '发送EDM'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_send_edm';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_send_orthonline` (
  `id` bigint COMMENT '',
  `email` string COMMENT '邮箱',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '骨科在线-email'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_send_orthonline';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_send_user` (
  `id` bigint COMMENT '',
  `email` string COMMENT '邮箱',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '中华骨科网-email'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_send_user';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_share` (
  `id` bigint COMMENT '',
  `scene_type` int COMMENT '场景类型(1-搜索, 2-列表, 3-终端, 4-个人中心发布, 5-个人中心回复)',
  `resource_type` int COMMENT '冗余保存资源类型(0-All, 1-视频, 2-文库, 3-会议, 4-话题, 7-病例)',
  `share_long_url` string COMMENT '取固定网址加上参数拼接的长链接',
  `share_short_url` string COMMENT '转换的短链接',
  `customer_id` bigint COMMENT '发出分享的会员ID',
  `send_site_id` int COMMENT '发出分享渠道(5-IOS, 6-Android, 11-H5)',
  `create_time` timestamp COMMENT '记录创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT 'APP分享日志记录'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_share';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_share_url` (
  `id` bigint COMMENT '',
  `share_url` string COMMENT '分享链接',
  `customer_id` bigint COMMENT '会员id',
  `session_id` string COMMENT 'sessionId',
  `op_date` timestamp COMMENT '操作状态的时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `site_id` int COMMENT '操作途径（手机、网站、app）'
) COMMENT '分享链接日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_share_url';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_short_url` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT 'id',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-话题 ,7-病例)',
  `page_storage_path` string COMMENT '播放器存储路径',
  `web_storage_path` string COMMENT '手机版存储路径',
  `share_page_short_url` string COMMENT '电脑版存储路径转换的短链接',
  `share_web_short_url` string COMMENT '手机版存储路径转换的短链接',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效（0-无效 1-有效）',
  `scene_type` int COMMENT '场景类型(1-视频管理，2-文库管理，3-会议管理，4-话题管理 ,7-病例管理,10-频道管理,11-列表页,12-搜索页,13-会议终端，14-个人中心发布，15个人中心回复)'
) COMMENT '长链接－短链接对应关系的日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_short_url';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_short_url_history` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT 'id',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-话题 ,7-病例)',
  `page_storage_path` string COMMENT '播放器存储路径',
  `web_storage_path` string COMMENT '手机版存储路径',
  `share_page_short_url` string COMMENT '电脑版存储路径转换的短链接',
  `share_web_short_url` string COMMENT '手机版存储路径转换的短链接',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效（0-无效 1-有效）',
  `scene_type` int COMMENT '场景类型(1-视频管理，2-文库管理，3-会议管理，4-话题管理 ,7-病例管理,10-频道管理,11-列表页,12-搜索页,13-会议终端，14-个人中心发布，15个人中心回复)'
) COMMENT '长链接－短链接对应关系的日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_short_url_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_site_tpl` (
  `id` bigint COMMENT '',
  `site_id` int COMMENT '',
  `tpl_name` string COMMENT '',
  `tpl_path` string COMMENT '',
  `is_valid` int COMMENT '',
  `html_path` string COMMENT 'html地址',
  `type_id` int COMMENT '分类',
  `content` string COMMENT '内容',
  `file_path` string COMMENT '文件路径',
  `ref_id` bigint COMMENT '生产库id',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_site_tpl';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_sms` (
  `id` bigint COMMENT '',
  `cell_phone` string COMMENT '',
  `sms_content` string COMMENT '',
  `mtmsgid` string COMMENT '',
  `send_time` timestamp COMMENT '',
  `send_mtstat` string COMMENT '',
  `send_mterrcode` string COMMENT '',
  `callback_time` timestamp COMMENT '',
  `callback_mtstat` string COMMENT '',
  `callback_mterrcode` string COMMENT '',
  `sms_desc` string COMMENT '描述'
) COMMENT '短信日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_sms';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_sms_history` (
  `id` bigint COMMENT '',
  `cell_phone` string COMMENT '',
  `sms_content` string COMMENT '',
  `mtmsgid` string COMMENT '',
  `send_time` timestamp COMMENT '',
  `send_mtstat` string COMMENT '',
  `send_mterrcode` string COMMENT '',
  `callback_time` timestamp COMMENT '',
  `callback_mtstat` string COMMENT '',
  `callback_mterrcode` string COMMENT '',
  `sms_desc` string COMMENT '描述'
) COMMENT '短信日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_sms_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_tb_web_sys_resource_page` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_tb_web_sys_resource_page';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_tb_web_sys_resource_system` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_tb_web_sys_resource_system';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_track` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `session` string COMMENT '用户session',
  `location_id` bigint COMMENT '区块id',
  `channel_id` bigint COMMENT '频道id',
  `column_id` bigint COMMENT '栏目id',
  `recommend_id` bigint COMMENT '推荐资源位id',
  `ad_id` bigint COMMENT '广告位id',
  `ad_position` string COMMENT '广告图片位置（宽高坐标，以字符分割）',
  `trigger_type` int COMMENT '触发方式（1-左键点击、2-右键点击、3-上滑、4-下滑、5-左滑、6-右滑、7-列表上拉、8-列表下拉、9-页面打开、10-页面关闭、11-双击、12-双指外滑、13-双指内滑、14-拖动、15-跳转页面、16-大图缩放）',
  `trigger_name` string COMMENT '触发对象的名称or内容（按钮文字、图片地址、文字内容...）',
  `action_id` string COMMENT '动作：action   （prefer、search、reprint、review）',
  `param` string COMMENT '携带的参数字符串',
  `ref_id` bigint COMMENT '关联id',
  `ref_type` bigint COMMENT '关联类型（1-视频，2-文库，3-会议，4-话题 ,6-标签，7-病例，8-评论）',
  `src_location` string COMMENT '外部来源url｜落地url:来源的H5页面链接',
  `to_location` string COMMENT '跳转链接',
  `op_ip` string COMMENT '操作来源（ip）',
  `ip_org` string COMMENT '',
  `area_code` string COMMENT '',
  `city` string COMMENT '城市',
  `country_code` string COMMENT '国家编码',
  `country_name` string COMMENT '国家',
  `latitude` string COMMENT '纬度',
  `longitude` string COMMENT '经度',
  `postal_code` string COMMENT '邮编',
  `region` string COMMENT '',
  `time_zone` string COMMENT '时区',
  `pro_version` string COMMENT 'app、项目版本号',
  `os_version` string COMMENT '操作系统版本',
  `t_version` string COMMENT '浏览器型号',
  `net_version` int COMMENT '网络状态1-wifi   2-2G  3-3G、4-4G',
  `telecom` int COMMENT '运营商（1-移动、2-联通、3-电信）',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '发送渠道'
) COMMENT '页面跟踪'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_track';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_track_history` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `session` string COMMENT '用户session',
  `location_id` bigint COMMENT '区块id',
  `channel_id` bigint COMMENT '频道id',
  `column_id` bigint COMMENT '栏目id',
  `recommend_id` bigint COMMENT '推荐资源位id',
  `ad_id` bigint COMMENT '广告位id',
  `ad_position` string COMMENT '广告图片位置（宽高坐标，以字符分割）',
  `trigger_type` int COMMENT '触发方式（1-左键点击、2-右键点击、3-上滑、4-下滑、5-左滑、6-右滑、7-列表上拉、8-列表下拉、9-页面打开、10-页面关闭、11-双击、12-双指外滑、13-双指内滑、14-拖动、15-跳转页面、16-大图缩放）',
  `trigger_name` string COMMENT '触发对象的名称or内容（按钮文字、图片地址、文字内容...）',
  `action_id` string COMMENT '动作：action   （prefer、search、reprint、review）',
  `param` string COMMENT '携带的参数字符串',
  `ref_id` bigint COMMENT '关联id',
  `ref_type` bigint COMMENT '关联类型（1-视频，2-文库，3-会议，4-话题 ,6-标签，7-病例，8-评论）',
  `src_location` string COMMENT '外部来源url｜落地url:来源的H5页面链接',
  `to_location` string COMMENT '跳转链接',
  `op_ip` string COMMENT '操作来源（ip）',
  `ip_org` string COMMENT '',
  `area_code` string COMMENT '',
  `city` string COMMENT '城市',
  `country_code` string COMMENT '国家编码',
  `country_name` string COMMENT '国家',
  `latitude` string COMMENT '纬度',
  `longitude` string COMMENT '经度',
  `postal_code` string COMMENT '邮编',
  `region` string COMMENT '',
  `time_zone` string COMMENT '时区',
  `pro_version` string COMMENT 'app、项目版本号',
  `os_version` string COMMENT '操作系统版本',
  `t_version` string COMMENT '浏览器型号',
  `net_version` int COMMENT '网络状态1-wifi   2-2G  3-3G、4-4G',
  `telecom` int COMMENT '运营商（1-移动、2-联通、3-电信）',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '发送渠道'
) COMMENT '页面跟踪'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_track_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_track_location` (
  `id` bigint COMMENT '',
  `location_id` bigint COMMENT '区块id',
  `location_name` string COMMENT '区块名称',
  `create_time` timestamp COMMENT '创建时间',
  `version` string COMMENT '版本信息',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点'
) COMMENT '区块基础表格'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_track_location';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_track_page` (
  `id` bigint COMMENT '',
  `page_id` bigint COMMENT '页面id',
  `page_name` string COMMENT '页面名称',
  `page_detail` string COMMENT '页面详情(pch5的url,iosandroid的类等)',
  `create_time` timestamp COMMENT '创建时间',
  `version` string COMMENT '版本信息',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点'
) COMMENT '埋点页面基础表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_track_page';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_track_page_location` (
  `id` bigint COMMENT '',
  `page_id` bigint COMMENT '页面id',
  `page_name` string COMMENT '页面名称',
  `location_id` bigint COMMENT '区块id',
  `location_name` string COMMENT '区块名称',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '埋点页面&区块映射关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_track_page_location';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_user` (
  `id` bigint COMMENT '',
  `user_real_name` string COMMENT '用户',
  `page_id` int COMMENT 'pageId',
  `system_id` int COMMENT 'systemId',
  `op_name` string COMMENT '操作项',
  `op_ip` string COMMENT '操作ip',
  `create_time` timestamp COMMENT '创建时间',
  `log_map` string COMMENT '操作内容'
) COMMENT '后台用户日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_user';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_wx_message` (
  `id` bigint COMMENT '',
  `message_type` int COMMENT '消息类型(1-系统消息 2-模板消息))',
  `customer_id` bigint COMMENT '会员id',
  `send_content` string COMMENT '发送内容',
  `send_time` timestamp COMMENT '发送时间',
  `templateId` string COMMENT '模板ID',
  `notify_type` int COMMENT '通知类型(1-绑定操作 2-提交认证资料 3-注册未认证 4-认证未通过 5-发布资源被评论 6-关注资源有新评论 7-运营消息)',
  `openid` string COMMENT '微信号',
  `unite_info` string COMMENT '渠道信息'
) COMMENT '微信消息推送日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_log_wx_message';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_orthonline_customer_detail` (
  `customer_id` bigint COMMENT '序号',
  `customer_name` string COMMENT '姓名',
  `sex` string COMMENT '性别',
  `nation` string COMMENT '民族',
  `certificates` string COMMENT '有效证件',
  `certificates_no` string COMMENT '证件号',
  `birth` string COMMENT '出生日期',
  `medical_title` string COMMENT '技术职称',
  `I` string COMMENT '',
  `J` string COMMENT '',
  `social_title` string COMMENT '行政职称',
  `L` string COMMENT '',
  `province` string COMMENT '省',
  `city` string COMMENT '市',
  `company` string COMMENT '工作单位',
  `P` string COMMENT '',
  `company2` string COMMENT '单位2',
  `level` string COMMENT '级别',
  `nature` string COMMENT '性质',
  `department` string COMMENT '科室',
  `detail_address` string COMMENT '地址',
  `zip_code` string COMMENT '邮编',
  `company_tele` string COMMENT '单位电话',
  `mobile` string COMMENT '手机',
  `email` string COMMENT '邮箱',
  `areas_expertise` string COMMENT '专业方向',
  `AA` string COMMENT '',
  `AB` string COMMENT '',
  `qualification_code` string COMMENT '医师资格证',
  `qualification_time` string COMMENT '资格证获取时间',
  `practicing_certificate` string COMMENT '医师执业证',
  `practicing_time` string COMMENT '获取时间',
  `graduation_school` string COMMENT '毕业院校',
  `graduation_time` string COMMENT '毕业时间',
  `degree_name` string COMMENT '国内最高学位',
  `education` string COMMENT '国内最高学历',
  `graduation_school_2` string COMMENT '毕业院校2',
  `graduation_time_2` string COMMENT '毕业时间2',
  `degree_name_2` string COMMENT '最高学位',
  `education_2` string COMMENT '最高学位2',
  `summary` string COMMENT '个人简历',
  `part_time_job` string COMMENT '兼职情况',
  `level_id` int COMMENT '0-普通,1-领导级别',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_orthonline_customer_detail';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tb_web_sys_menu` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_tb_web_sys_menu';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_train_base_log` (
  `id` bigint COMMENT '',
  `base_id` bigint COMMENT '基地id',
  `table_name` string COMMENT '表名',
  `table_id` bigint COMMENT 'table_id',
  `create_time` timestamp COMMENT '创作日期',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `table_content` string COMMENT '操作内容'
) COMMENT '培训基地日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_train_base_log';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_user` (
  `userID` int COMMENT '',
  `customer_id` bigint COMMENT '',
  `userName` string COMMENT '',
  `userPassWord` string COMMENT '',
  `userClass` string COMMENT '',
  `materialClass` string COMMENT '',
  `userRegisterDate` timestamp COMMENT '',
  `name` string COMMENT '',
  `userSex` string COMMENT '',
  `specialty` string COMMENT '',
  `userAffiliation` string COMMENT '',
  `address` string COMMENT '',
  `country` string COMMENT '',
  `zipCode` string COMMENT '',
  `userTelephone` string COMMENT '',
  `userMobile` string COMMENT '',
  `userOicq` string COMMENT '',
  `userPublish` int COMMENT '',
  `userLoginNUM` int COMMENT '',
  `lastLogin` timestamp COMMENT '',
  `description` string COMMENT '',
  `import_batch` int COMMENT '导入批次',
  `registerIP` string COMMENT '',
  `userMail` string COMMENT '',
  `Host` string COMMENT '',
  `User` string COMMENT '',
  `Password` string COMMENT '',
  `Select_priv` string COMMENT '',
  `Insert_priv` string COMMENT '',
  `Update_priv` string COMMENT '',
  `Delete_priv` string COMMENT '',
  `Create_priv` string COMMENT '',
  `Drop_priv` string COMMENT '',
  `Reload_priv` string COMMENT '',
  `Shutdown_priv` string COMMENT '',
  `Process_priv` string COMMENT '',
  `File_priv` string COMMENT '',
  `Grant_priv` string COMMENT '',
  `References_priv` string COMMENT '',
  `Index_priv` string COMMENT '',
  `Alter_priv` string COMMENT '',
  `Show_db_priv` string COMMENT '',
  `Super_priv` string COMMENT '',
  `Create_tmp_table_priv` string COMMENT '',
  `Lock_tables_priv` string COMMENT '',
  `Execute_priv` string COMMENT '',
  `Repl_slave_priv` string COMMENT '',
  `Repl_client_priv` string COMMENT '',
  `Create_view_priv` string COMMENT '',
  `Show_view_priv` string COMMENT '',
  `Create_routine_priv` string COMMENT '',
  `Alter_routine_priv` string COMMENT '',
  `Create_user_priv` string COMMENT '',
  `Event_priv` string COMMENT '',
  `Trigger_priv` string COMMENT '',
  `Create_tablespace_priv` string COMMENT '',
  `ssl_type` string COMMENT '',
  `ssl_cipher` blob COMMENT '',
  `x509_issuer` blob COMMENT '',
  `x509_subject` blob COMMENT '',
  `max_questions` int COMMENT '',
  `max_updates` int COMMENT '',
  `max_connections` int COMMENT '',
  `max_user_connections` int COMMENT '',
  `plugin` string COMMENT '',
  `authentication_string` string COMMENT '',
  `password_expired` string COMMENT ''
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_user';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_user_all` (
  `userID` int COMMENT '',
  `customer_id` bigint COMMENT '',
  `userName` string COMMENT '',
  `userPassWord` string COMMENT '',
  `userClass` string COMMENT '',
  `materialClass` string COMMENT '',
  `userRegisterDate` timestamp COMMENT '',
  `name` string COMMENT '',
  `userSex` string COMMENT '',
  `specialty` string COMMENT '',
  `userAffiliation` string COMMENT '',
  `address` string COMMENT '',
  `country` string COMMENT '',
  `zipCode` string COMMENT '',
  `userTelephone` string COMMENT '',
  `userMobile` string COMMENT '',
  `userOicq` string COMMENT '',
  `userPublish` int COMMENT '',
  `userLoginNUM` int COMMENT '',
  `lastLogin` timestamp COMMENT '',
  `description` string COMMENT '',
  `registerIP` string COMMENT '',
  `userMail` string COMMENT ''
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_user_all';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_user_old` (
  `userID` int COMMENT '',
  `userName` string COMMENT '',
  `userPassWord` string COMMENT '',
  `userClass` string COMMENT '',
  `materialClass` string COMMENT '',
  `userRegisterDate` timestamp COMMENT '',
  `name` string COMMENT '',
  `userSex` string COMMENT '',
  `specialty` string COMMENT '',
  `userAffiliation` string COMMENT '',
  `address` string COMMENT '',
  `country` string COMMENT '',
  `zipCode` string COMMENT '',
  `userTelephone` string COMMENT '',
  `userMobile` string COMMENT '',
  `userOicq` string COMMENT '',
  `userPublish` int COMMENT '',
  `userLoginNUM` int COMMENT '',
  `lastLogin` timestamp COMMENT '',
  `description` string COMMENT '',
  `registerIP` string COMMENT '',
  `userMail` string COMMENT '',
  `unite_allin_email` string COMMENT '唯医网email',
  `unite_allin_mobile` string COMMENT '唯医mobile',
  `unite_caos_email` string COMMENT 'caos-email',
  `unite_caos_mobile` string COMMENT 'caos-mobile'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_user_old';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_waibu_customer` (
  `id` bigint COMMENT '',
  `提交答卷时间` string COMMENT '',
  `所用时间` string COMMENT '',
  `来自IP` string COMMENT '',
  `来源渠道` string COMMENT '',
  `1` string COMMENT '',
  `2` string COMMENT '',
  `3` string COMMENT '',
  `4` string COMMENT '',
  `5` string COMMENT '',
  `K` string COMMENT '',
  `2、您的年手术量是多少？` string COMMENT '',
  `3、您目前主要做的是？` string COMMENT '',
  `4、您目前最想得到的学习资源是？` string COMMENT '',
  `5、您平时每周花在阅读文献的时间大概有多少？` string COMMENT '',
  `6、您愿意使用以下何种方式阅读医学杂志？` string COMMENT '',
  `7、阅读文献的时候， 您希望能够看到中英文两个版本么？` string COMMENT '',
  `8、截至目前为止， 您（或所在的单位/科室）一共收到几期JOA中文版 ？` string COMMENT '',
  `9、您认为JOA对您的工作是否有帮助？` string COMMENT '',
  `10、对于JOA或唯医网，您还有其他建议吗？` string COMMENT '',
  `11、你愿意加入joa中文版电子版读者群吗（如果“愿意”，请在下一题填写您的邮箱）？` string COMMENT '',
  `12、如果您愿意加入joa中文版电子版读者群，请填写您的邮箱：` string COMMENT ''
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_platform_log/ods_waibu_customer';

