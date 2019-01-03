CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_activity_doctor` (
  `id` bigint COMMENT '',
  `doctor_id` bigint COMMENT '',
  `doctor_name` string COMMENT '姓名',
  `hospital_id` bigint COMMENT '医院ID',
  `hospital_name` string COMMENT '医院名字',
  `title_name` string COMMENT '职称名称',
  `mobile` string COMMENT '手机号',
  `create_time` timestamp COMMENT '',
  `is_valid` int COMMENT '',
  `send_site_id` int COMMENT ''
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_activity_doctor';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_case_history` (
  `id` bigint COMMENT '',
  `history_id` bigint COMMENT '',
  `history_type` int COMMENT '历史健康类型0-疾病史1-手术史2-药物史3-外伤史4-过敏史5-疫区接触史',
  `history_name` string COMMENT '',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '是否有效'
) COMMENT '既往史配置'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_case_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_major_illness_relation` (
  `id` bigint COMMENT '',
  `major_id` bigint COMMENT '专业id',
  `major_name` string COMMENT '专业名称',
  `illness_id` bigint COMMENT '病例id',
  `illness_name` string COMMENT '病例名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '专业-疾病关联表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_major_illness_relation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_major_operation_relation` (
  `id` bigint COMMENT '',
  `major_id` bigint COMMENT '专业id',
  `major_name` string COMMENT '专业名称',
  `operation_id` bigint COMMENT '手术id',
  `operation_name` string COMMENT '手术名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '专业-手术关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_major_operation_relation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_medicine_property` (
  `id` bigint COMMENT '',
  `medicine_type_id` bigint COMMENT '药品类型id',
  `medicine_id` bigint COMMENT '药物id',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT ''
) COMMENT '药品配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_medicine_property';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_part_illness_relation` (
  `id` bigint COMMENT '',
  `part_id` bigint COMMENT '部位id',
  `part_name` string COMMENT '部位名称',
  `illness_id` bigint COMMENT '病例id',
  `illness_name` string COMMENT '病例名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '部位-疾病关联表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_part_illness_relation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_part_operation_relation` (
  `id` bigint COMMENT '',
  `part_id` bigint COMMENT '部位id',
  `part_name` string COMMENT '部位名称',
  `operation_id` bigint COMMENT '手术id',
  `operation_name` string COMMENT '手术名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '部位-手术关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_part_operation_relation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_part_question_relation` (
  `id` bigint COMMENT '',
  `part_id` bigint COMMENT '部位id',
  `question_id` bigint COMMENT '问题ID',
  `option_id` bigint COMMENT '选项id',
  `ref_question_id` string COMMENT '当前问题的上级的选项的ID',
  `tree_level` int COMMENT '节点级别(1-一级问题；2-二级问题)',
  `application_type` int COMMENT '应用场景：0-在线门诊 1-找医生',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '',
  `create_time` timestamp COMMENT '创建时间',
  `question_sort_id` int COMMENT '问题排序'
) COMMENT '部位问题选项关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_part_question_relation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_part_question_relation_20180131` (
  `id` bigint COMMENT '',
  `part_id` bigint COMMENT '部位id',
  `question_id` bigint COMMENT '问题ID',
  `option_id` bigint COMMENT '选项id',
  `ref_question_id` string COMMENT '当前问题的上级的选项的ID',
  `tree_level` int COMMENT '节点级别(1-一级问题；2-二级问题)',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '',
  `create_time` timestamp COMMENT '创建时间',
  `question_sort_id` int COMMENT '问题排序'
) COMMENT '部位问题选项关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_part_question_relation_20180131';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_part_question_relation_20180613` (
  `id` bigint COMMENT '',
  `part_id` bigint COMMENT '部位id',
  `question_id` bigint COMMENT '问题ID',
  `option_id` bigint COMMENT '选项id',
  `ref_question_id` string COMMENT '当前问题的上级的选项的ID',
  `tree_level` int COMMENT '节点级别(1-一级问题；2-二级问题)',
  `application_type` int COMMENT '应用场景：0-在线门诊 1-找医生',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '',
  `create_time` timestamp COMMENT '创建时间',
  `question_sort_id` int COMMENT '问题排序'
) COMMENT '部位问题选项关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_part_question_relation_20180613';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_part_question_relation_20180621` (
  `id` bigint COMMENT '',
  `part_id` bigint COMMENT '部位id',
  `question_id` bigint COMMENT '问题ID',
  `option_id` bigint COMMENT '选项id',
  `ref_question_id` string COMMENT '当前问题的上级的选项的ID',
  `tree_level` int COMMENT '节点级别(1-一级问题；2-二级问题)',
  `application_type` int COMMENT '应用场景：0-在线门诊 1-找医生',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '',
  `create_time` timestamp COMMENT '创建时间',
  `question_sort_id` int COMMENT '问题排序'
) COMMENT '部位问题选项关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_part_question_relation_20180621';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_part_question_relation_20180705` (
  `id` bigint COMMENT '',
  `part_id` bigint COMMENT '部位id',
  `question_id` bigint COMMENT '问题ID',
  `option_id` bigint COMMENT '选项id',
  `ref_question_id` string COMMENT '当前问题的上级的选项的ID',
  `tree_level` int COMMENT '节点级别(1-一级问题；2-二级问题)',
  `application_type` int COMMENT '应用场景：0-在线门诊 1-找医生',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '',
  `create_time` timestamp COMMENT '创建时间',
  `question_sort_id` int COMMENT '问题排序'
) COMMENT '部位问题选项关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_part_question_relation_20180705';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_part_question_relation_20180731` (
  `id` bigint COMMENT '',
  `part_id` bigint COMMENT '部位id',
  `question_id` bigint COMMENT '问题ID',
  `option_id` bigint COMMENT '选项id',
  `ref_question_id` string COMMENT '当前问题的上级的选项的ID',
  `tree_level` int COMMENT '节点级别(1-一级问题；2-二级问题)',
  `application_type` int COMMENT '应用场景：0-在线门诊 1-找医生',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '',
  `create_time` timestamp COMMENT '创建时间',
  `question_sort_id` int COMMENT '问题排序'
) COMMENT '部位问题选项关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_part_question_relation_20180731';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_part_question_relation_20180831` (
  `id` bigint COMMENT '',
  `part_id` bigint COMMENT '部位id',
  `question_id` bigint COMMENT '问题ID',
  `option_id` bigint COMMENT '选项id',
  `ref_question_id` string COMMENT '当前问题的上级的选项的ID',
  `tree_level` int COMMENT '节点级别(1-一级问题；2-二级问题)',
  `application_type` int COMMENT '应用场景：0-在线门诊 1-找医生',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '',
  `create_time` timestamp COMMENT '创建时间',
  `question_sort_id` int COMMENT '问题排序'
) COMMENT '部位问题选项关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_part_question_relation_20180831';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_pay_order` (
  `id` bigint COMMENT '',
  `order_id` bigint COMMENT '订单id',
  `out_trade_no` string COMMENT '支付订单号',
  `patient_customer_id` bigint COMMENT '患者所属用户id',
  `patient_id` bigint COMMENT '患者id',
  `doctor_id` bigint COMMENT '医生id',
  `case_id` bigint COMMENT '病例id',
  `order_type` int COMMENT '订单类型1-咨询2-手术3-门诊预约',
  `order_source_id` bigint COMMENT '来源id，对应咨询id,手术单id，门诊预约id',
  `order_source_type` int COMMENT '来源类型咨询：0-免费1-普通2-加急3-特需4-医生赠送|手术：1-互联网2-公立|门诊1-普通2-专家',
  `order_amount` decimal COMMENT '订单金额',
  `settlement_amount` decimal COMMENT '结算金额',
  `pay_time` timestamp COMMENT '支付时间',
  `out_refund_no` string COMMENT '退单号',
  `refund_amount` decimal COMMENT '退款金额',
  `refund_time` timestamp COMMENT '退款时间',
  `refused_reason` int COMMENT '拒绝描述1-等不及了2-不需要了3-临时有事4-已找其他医生5-路程远， 已找其他医院6-个人原因7-其他原因',
  `refused_reason_desc` string COMMENT '拒绝原因描述',
  `status` int COMMENT '订单状态1-待支付2-已支付3-已完成4-已取消5-退款中6-支付超时7-退款完成8-退款失败',
  `settlement_status` int COMMENT '结算状态结算单状态0-未结算1-已结算2-待结算3-结算失败4-结算异常',
  `settlement_time` timestamp COMMENT '结算时间',
  `last_update_time` timestamp COMMENT '',
  `create_time` timestamp COMMENT '',
  `is_valid` int COMMENT '',
  `send_site_id` int COMMENT '站点',
  `pay_amount` decimal COMMENT '实际支付金额(单位：元)',
  `promotion_amount` decimal COMMENT '优惠金额(单位：元)'
) COMMENT '支付订单表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_pay_order';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_pay_promotion` (
  `id` bigint COMMENT '',
  `order_id` bigint COMMENT '订单id',
  `promotion_activity_id` bigint COMMENT '促销活动id',
  `promotion_sub_id` bigint COMMENT '优惠劵id',
  `promotion_info_name` string COMMENT '优惠劵名称(冗余)',
  `patient_customer_id` bigint COMMENT '患者用户id',
  `doctor_id` bigint COMMENT '医生id',
  `promotion_amount` decimal COMMENT '优惠金额',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点'
) COMMENT '订单优惠券表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_pay_promotion';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_quick_mark_channel` (
  `id` bigint COMMENT '',
  `channel_id` bigint COMMENT '渠道ID',
  `channel_name` string COMMENT '渠道名称',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效（0-无效 1-有效）',
  `site_id` int COMMENT '操作站点  17-患者微信、18-分诊平台、19-会诊Android、20-会诊IOS'
) COMMENT '获取二维码渠道管理表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_quick_mark_channel';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_quick_mark_info` (
  `id` bigint COMMENT '',
  `channel_id` bigint COMMENT '渠道id',
  `quick_mark_id` bigint COMMENT '临时二维码id',
  `quick_mark_url` string COMMENT '获取二维码地址',
  `purpose` string COMMENT '临时二维码用途',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效（0-无效 1-有效）',
  `site_id` int COMMENT '操作站点  17-患者微信、18-分诊平台、19-会诊Android、20-会诊IOS'
) COMMENT '临时二维码信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_quick_mark_info';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_refund_order` (
  `id` bigint COMMENT '',
  `refund_order_id` bigint COMMENT '退款单id',
  `out_refund_no` string COMMENT '微信退款单号',
  `order_id` bigint COMMENT '订单id',
  `out_trade_no` string COMMENT '支付订单号',
  `doctor_id` bigint COMMENT '医师id',
  `patient_customer_id` bigint COMMENT '患者所属用户id',
  `patient_id` bigint COMMENT '患者id',
  `order_type` int COMMENT '订单类型1-咨询2-手术3-门诊预约',
  `order_source_id` bigint COMMENT '来源id，对应咨询id,手术单id，门诊预约id',
  `order_source_type` int COMMENT '来源类型咨询：1-普通2-加急3-特需|手术：1-互联网2-公立|门诊1-普通2-专家',
  `refund_amount` decimal COMMENT '退款金额',
  `refund_status` int COMMENT '退款状态0-退款中1-退款完成2-退款失败',
  `refund_time` timestamp COMMENT '退款时间',
  `finish_time` timestamp COMMENT '退款完成时间',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '',
  `send_site_id` int COMMENT '站点',
  `refused_reason` int COMMENT '拒绝描述1-等不及了2-不需要了3-临时有事4-已找其他医生5-路程远， 已找其他医院6-个人原因7-其他原因',
  `refused_reason_desc` string COMMENT '拒绝原因描述'
) COMMENT '退款单'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_refund_order';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_schedule` (
  `id` bigint COMMENT '',
  `schedule_id` bigint COMMENT '日程id',
  `customer_id` bigint COMMENT '医生id',
  `schedule_title` string COMMENT '日常标题',
  `schedule_type` int COMMENT '日程类型（1-门诊，2-用户，3-患者入院，4-飞刀）',
  `schedule_priority` int COMMENT '日程优先级（1-日常，2-重要，3-非常重要）',
  `schedule_time` timestamp COMMENT '日程时间',
  `schedule_detail` string COMMENT '日程正文',
  `remind_time` timestamp COMMENT '提醒时间',
  `ref_id` string COMMENT '关联资源id',
  `schedule_status` int COMMENT '日程状态（0-未完成1-已完成）',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '发送渠道',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `position_id` bigint COMMENT '位置id',
  `position_name` string COMMENT '位置名称',
  `position_remark` string COMMENT '位置补充信息',
  `is_read` int COMMENT '是否已读1-已读0-未读'
) COMMENT '会员日程安排'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_schedule';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_schedule_attachment` (
  `id` bigint COMMENT '',
  `schedule_id` bigint COMMENT '日程id',
  `schedule_att_name` string COMMENT '附件说明（图片标题等）',
  `schedule_att_type` int COMMENT '附件类型：1-图片，2-视频,3-语音,4-视频缩略图......',
  `schedule_att_size` string COMMENT '附件大小：KB',
  `schedule_att_format` string COMMENT '附件格式：jpg、mp4...',
  `schedule_att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、8-480*320、9-1280*720、10-900*600、12-300*200、13-450*300、14-750*500)',
  `schedule_att_height` string COMMENT '附件高度',
  `schedule_att_width` string COMMENT '附件宽度',
  `schedule_att_url` string COMMENT '附件url',
  `upload_time` timestamp COMMENT '附件上传时间',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `site_id` int COMMENT '站点',
  `qiniu_id` string COMMENT '七牛音频唯一id',
  `qiniu_status` int COMMENT '七牛音频处理状态0－未上传，1－上传成功，2－转码成功,3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `play_num` bigint COMMENT '播放次数',
  `play_time` string COMMENT '播放时长',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员日程安排附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_schedule_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_cms_uqianme` (
  `id` bigint COMMENT '',
  `nick_name` string COMMENT '关注人昵称',
  `sex` int COMMENT '用户的性别（0-未知 1-男 2-女）',
  `subscribe_time` timestamp COMMENT '关注时间',
  `quick_mark_id` bigint COMMENT '临时二维码id',
  `create_time` timestamp COMMENT '创建时间',
  `channel_id` bigint COMMENT '渠道id',
  `open_id` string COMMENT '普通用户的标识，对当前公众号唯一',
  `union_id` string COMMENT '',
  `is_valid` int COMMENT '是否有效（0-无效 1-有效）',
  `site_id` int COMMENT '操作站点  17-患者微信、18-分诊平台、19-会诊Android、20-会诊IOS'
) COMMENT '临时二维码关注人信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_cms_uqianme';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_consultation_logic` (
  `id` bigint COMMENT '',
  `logic_id` bigint COMMENT '描述id',
  `logic_describe` string COMMENT '描述',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `parent_id` bigint COMMENT '父节点',
  `full_path` string COMMENT '上级路径（拼串形式存放上级Id）',
  `logic_type` int COMMENT '逻辑节点类型0-单选1-多选',
  `operation_type` int COMMENT '操作类型',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效1-有效0-无效'
) COMMENT '问诊逻辑树表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_consultation_logic';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_bank` (
  `id` bigint COMMENT '',
  `bank_id` bigint COMMENT '',
  `bank_name` string COMMENT '',
  `bank_abbreviation` string COMMENT '银行缩写',
  `bank_logo` string COMMENT '银行logo',
  `create_time` timestamp COMMENT '',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT ''
) COMMENT '银行信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_bank';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_check` (
  `id` bigint COMMENT '',
  `check_id` bigint COMMENT '',
  `check_name` string COMMENT '检查建议名称',
  `check_desc` string COMMENT '检查描述',
  `check_nickname` string COMMENT '检查别名',
  `check_icd` string COMMENT '编码',
  `tree_level` int COMMENT '节点级别',
  `is_search` int COMMENT '是否搜索',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `parent_id` bigint COMMENT '父节点',
  `full_path` string COMMENT '上级路径（拼串形式存放上级Id）',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '检查建议表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_check';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_fellowship_institutions` (
  `id` bigint COMMENT '',
  `fellowship_institutions_id` bigint COMMENT '进修机构id',
  `fellowship_institutions` string COMMENT '进修机构名称',
  `fellowship_type` int COMMENT 'fellow项目类别(1-国外进修、2-国内进修，3-培训课程)',
  `major_id` bigint COMMENT '',
  `major` string COMMENT '专业',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `parent_id` bigint COMMENT '父节点',
  `full_path` string COMMENT '上级路径（拼串形式存放上级Id）',
  `create_time` timestamp COMMENT '',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT ''
) COMMENT '进修机构表 '
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_fellowship_institutions';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_hospital` (
  `id` bigint COMMENT '',
  `hospital_name` string COMMENT '医院名称',
  `hospital_othername` string COMMENT '别名',
  `hospital_type_id` int COMMENT '医院类型',
  `hospital_triage_level` int COMMENT '分诊级别1-一级2-二级3-三级4-四级',
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
  `hospital_logo_url` string COMMENT '主图链接',
  `state` int COMMENT '状态',
  `is_internet` int COMMENT '是否唯医互联网骨科医院0-否1-是',
  `is_top` int COMMENT '是否全国骨科top10医院',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `source` int COMMENT '据来源数：0-后台添加，1-用户补充'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_hospital';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_hospital_attachment` (
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_hospital_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_illness` (
  `id` bigint COMMENT '',
  `illness_id` bigint COMMENT '疾病id',
  `illness_name` string COMMENT '疾病名称',
  `mnemonic_code` string COMMENT '助记码',
  `sex_limit` int COMMENT '性别限制',
  `effect_limit` int COMMENT '疗效限制',
  `illness_alias` string COMMENT '疾病别名',
  `illness_code` string COMMENT '病例编码',
  `illness_num` string COMMENT '疾病序号',
  `icd_num` string COMMENT '国际ICD编码',
  `xh` string COMMENT '',
  `fm` string COMMENT '',
  `sm` string COMMENT '',
  `lb` string COMMENT '',
  `flid` string COMMENT '',
  `xybs` string COMMENT '',
  `source` int COMMENT '数据来源0-ICD1-用户2-其他',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_illness';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_inspection` (
  `id` bigint COMMENT '',
  `inspection_id` bigint COMMENT '',
  `inspection_name` string COMMENT '检验建议名称',
  `inspection_name_en` string COMMENT '英文名称',
  `inspection_desc` string COMMENT '',
  `inspection_alias` string COMMENT '别名',
  `inspection_code` string COMMENT '编码',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `parent_id` bigint COMMENT '父节点',
  `full_path` string COMMENT '上级路径（拼串形式存放上级Id）',
  `remark` string COMMENT '备注',
  `compulink_remark` string COMMENT '备注2',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '检验建议表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_inspection';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_knowledge` (
  `id` bigint COMMENT '',
  `knowledge_id` bigint COMMENT '',
  `knowledge_name` string COMMENT '患教知识名称',
  `knowledge_code` string COMMENT '编码',
  `knowledge_desc` string COMMENT '',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `parent_id` bigint COMMENT '父节点',
  `full_path` string COMMENT '上级路径（拼串形式存放上级Id）',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '患教知识'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_knowledge';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_knowledge_attachment` (
  `id` bigint COMMENT '',
  `knowledge_id` bigint COMMENT '患教知识id',
  `knowledge_att_name` string COMMENT '附件说明（图片标题等）',
  `knowledge_att_type` int COMMENT '附件类型：1-图片，2-视频,,4-视频缩略图......',
  `knowledge_att_size` string COMMENT '附件大小：KB',
  `knowledge_att_format` string COMMENT '附件格式：jpg、mp4...',
  `knowledge_att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、8-480*320、9-1280*720、10-900*600、12-300*200、13-450*300、14-750*500)',
  `knowledge_att_height` string COMMENT '附件高度',
  `knowledge_att_width` string COMMENT '附件宽度',
  `knowledge_att_url` string COMMENT '附件url',
  `upload_time` timestamp COMMENT '新闻附件上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功,3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `play_num` bigint COMMENT '播放次数',
  `play_time` string COMMENT '播放时长',
  `case_att_source` int COMMENT '附件来源0-患者上传1-视诊'
) COMMENT '患者病例附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_knowledge_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_knowledge_content` (
  `id` bigint COMMENT '',
  `knowledge_id` bigint COMMENT '',
  `knowledge_content` string COMMENT '正文内容',
  `create_time` timestamp COMMENT '创作日期',
  `tpl_path` string COMMENT '模板路径',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效,2-用户删除)',
  `send_site_id` int COMMENT '站点'
) COMMENT '患教知识详情表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_knowledge_content';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_major` (
  `id` bigint COMMENT '',
  `major_id` bigint COMMENT '专业id',
  `major_name` string COMMENT '专业名称',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `parent_id` bigint COMMENT '父节点',
  `full_path` string COMMENT '上级路径（拼串形式存放上级partId）',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '专业表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_major';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_medicine` (
  `id` bigint COMMENT '',
  `medicine_id` bigint COMMENT '',
  `medicine_name` string COMMENT '药物名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '药物表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_medicine';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_medicine_property` (
  `id` bigint COMMENT '',
  `medicine_property_id` bigint COMMENT '',
  `medicine_property_name` string COMMENT '药物类型',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `parent_id` bigint COMMENT '父节点',
  `full_path` string COMMENT '上级路径（拼串形式存放上级Id）',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '药物属性配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_medicine_property';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_operation` (
  `id` bigint COMMENT '',
  `operation_id` bigint COMMENT '手术id',
  `operation_name` string COMMENT '手术名称',
  `operation_code` string COMMENT '手术编码',
  `operation_alias` string COMMENT '别名',
  `operation_type` int COMMENT '手术类型0-治疗性1-诊断性',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `parent_id` bigint COMMENT '父节点',
  `full_path` string COMMENT '上级路径（拼串形式存放上级partId）',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_operation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_option` (
  `id` bigint COMMENT '',
  `option_id` bigint COMMENT '选项id',
  `option_name` string COMMENT '选项内容',
  `option_desc` string COMMENT '选项描述',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `is_attachment` int COMMENT '是否有附件0-无 1-有 2-其他选项 3-滑块选项'
) COMMENT '症状问题选项表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_option';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_option_20180621` (
  `id` bigint COMMENT '',
  `option_id` bigint COMMENT '选项id',
  `option_name` string COMMENT '选项内容',
  `option_desc` string COMMENT '选项描述',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `is_attachment` int COMMENT '是否有附件0-无 1-有 2-其他选项 3-滑块选项'
) COMMENT '症状问题选项表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_option_20180621';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_option_attachment` (
  `id` bigint COMMENT '',
  `option_id` bigint COMMENT '选项id',
  `option_att_type` int COMMENT '附件类型：1-图片',
  `option_att_size` string COMMENT '附件大小：KB',
  `option_att_format` string COMMENT '附件格式：jpg、mp4...',
  `option_att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、8-480*320、9-1280*720、10-900*600、12-300*200、13-450*300、14-750*500)',
  `option_att_height` string COMMENT '附件高度',
  `option_att_width` string COMMENT '附件宽度',
  `option_att_url` string COMMENT '附件url',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_option_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_option_attachment_20180621` (
  `id` bigint COMMENT '',
  `option_id` bigint COMMENT '选项id',
  `option_att_type` int COMMENT '附件类型：1-图片',
  `option_att_size` string COMMENT '附件大小：KB',
  `option_att_format` string COMMENT '附件格式：jpg、mp4...',
  `option_att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、8-480*320、9-1280*720、10-900*600、12-300*200、13-450*300、14-750*500)',
  `option_att_height` string COMMENT '附件高度',
  `option_att_width` string COMMENT '附件宽度',
  `option_att_url` string COMMENT '附件url',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_option_attachment_20180621';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_part` (
  `id` bigint COMMENT '',
  `part_id` bigint COMMENT '部位id',
  `part_name` string COMMENT '部位名称',
  `part_name_alias` string COMMENT '部位别名',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `parent_id` bigint COMMENT '父节点',
  `full_path` string COMMENT '上级路径（拼串形式存放上级partId）',
  `direction_id` int COMMENT '方向0-正面1-反面',
  `position_id` int COMMENT '位置0-双侧1-左侧2-右侧',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `logic_id_list` string COMMENT ''
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_part';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_part_20171219` (
  `id` bigint COMMENT '',
  `part_id` bigint COMMENT '部位id',
  `part_name` string COMMENT '部位名称',
  `part_name_alias` string COMMENT '部位别名',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `parent_id` bigint COMMENT '父节点',
  `full_path` string COMMENT '上级路径（拼串形式存放上级partId）',
  `direction_id` int COMMENT '方向0-正面1-反面',
  `position_id` int COMMENT '位置0-双侧1-左侧2-右侧',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_part_20171219';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_part_201806221500` (
  `id` bigint COMMENT '',
  `part_id` bigint COMMENT '部位id',
  `part_name` string COMMENT '部位名称',
  `part_name_alias` string COMMENT '部位别名',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `parent_id` bigint COMMENT '父节点',
  `full_path` string COMMENT '上级路径（拼串形式存放上级partId）',
  `direction_id` int COMMENT '方向0-正面1-反面',
  `position_id` int COMMENT '位置0-双侧1-左侧2-右侧',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `logic_id_list` string COMMENT ''
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_part_201806221500';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_question` (
  `id` bigint COMMENT '',
  `question_id` bigint COMMENT '问题id',
  `question_name` string COMMENT '问题name',
  `question_desc` string COMMENT '问题描述',
  `question_type` int COMMENT '问题类型1-单选2-多选3-进度条4-问答题5-多选&描述',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `is_popup` int COMMENT '是否弹窗0-否1-是',
  `popup_prompt` string COMMENT '弹窗提示'
) COMMENT '症状问题表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_question';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_question_20180621` (
  `id` bigint COMMENT '',
  `question_id` bigint COMMENT '问题id',
  `question_name` string COMMENT '问题name',
  `question_desc` string COMMENT '问题描述',
  `question_type` int COMMENT '问题类型1-单选2-多选3-进度条4-问答题',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `is_popup` int COMMENT '是否弹窗0-否1-是',
  `popup_prompt` string COMMENT '弹窗提示'
) COMMENT '症状问题表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_question_20180621';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_refuse` (
  `id` bigint COMMENT '',
  `refuse_content` string COMMENT '拒绝内容',
  `refuse_type` int COMMENT '拒绝类型：1-分诊医生拒绝',
  `is_valid` int COMMENT '是否有效',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点',
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_refuse';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_refuse_20180928` (
  `id` bigint COMMENT '',
  `refuse_content` string COMMENT '拒绝内容',
  `refuse_type` int COMMENT '拒绝类型：1-分诊医生拒绝',
  `is_valid` int COMMENT '是否有效',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点',
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_refuse_20180928';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_share` (
  `id` bigint COMMENT '',
  `scene_type` int COMMENT '场景类型(1-搜索, 2-列表, 3-终端页)',
  `resource_type` int COMMENT '资源类型(0-All,1-人)',
  `share_channel` int COMMENT '分享的渠道类型(1-微信朋友圈, 2-微信朋友, 3-QQ空间, 4-QQ好友, 5-新浪微博, 6-短信, 7-邮件)',
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_share';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_social_security` (
  `id` bigint COMMENT '',
  `social_security` string COMMENT '设备名称',
  `is_valid` int COMMENT '',
  `sort` int COMMENT ''
) COMMENT '社保类型'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_social_security';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_tool` (
  `id` bigint COMMENT '',
  `tool_id` bigint COMMENT '业务id',
  `tool_name` string COMMENT '工具栏内容-名称',
  `tool_type` bigint COMMENT '工具栏内容-类型',
  `icon_url` string COMMENT '原图标地址',
  `state` int COMMENT '状态：0-关 1-开',
  `sort_id` bigint COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `tool_config` string COMMENT '工具栏-撤销按钮功能配置',
  `client_type` string COMMENT '终端类型',
  `site_id` int COMMENT '操作站点  17-患者微信、18-分诊平台、19-会诊Android、20-会诊IOS',
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_tool';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_treatment` (
  `id` bigint COMMENT '',
  `treatment_id` bigint COMMENT '',
  `treatment_name` string COMMENT '治疗建议名称',
  `treatment_alias` string COMMENT '治疗建议别名',
  `treatment_code` string COMMENT '治疗建议编码',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `parent_id` bigint COMMENT '父节点',
  `full_path` string COMMENT '上级路径（拼串形式存放上级Id）',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `is_search` int COMMENT '是否被查询'
) COMMENT '处置建议'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_treatment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_upload_type` (
  `id` bigint COMMENT '',
  `upload_type_id` bigint COMMENT '',
  `upload_type_name` string COMMENT '上传资料类型名称',
  `upload_type_desc` string COMMENT '',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `parent_id` bigint COMMENT '父节点',
  `full_path` string COMMENT '上级路径（拼串形式存放上级Id）',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '上传资料类型'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_upload_type';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_data_wechat_token` (
  `id` bigint COMMENT '',
  `app_id` string COMMENT 'key',
  `type_id` int COMMENT '类型0-access_token；1-jsapi_ticket',
  `token` string COMMENT '口令',
  `is_valid` smallint COMMENT '是否有效',
  `update_time` timestamp COMMENT '更新时间',
  `remark` string COMMENT '备注',
  `create_time` timestamp COMMENT '创建日期'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_data_wechat_token';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_patient_tag` (
  `id` bigint COMMENT '标签id',
  `tag_name` string COMMENT '标签名',
  `tag_type` int COMMENT '标签类型：1-初始化默认标签2-医生自定义标签',
  `is_valid` int COMMENT '是否有效1-是 0-否',
  `sort_id` int COMMENT '排序号',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '基础标签信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_patient_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_send_content` (
  `id` bigint COMMENT '',
  `content` string COMMENT '内容',
  `type_id` int COMMENT '类型1-手机号找回密码 2-账号验证(1.绑定手机、手机号注册) 3-手机验证码快捷登录4-老患者报到5-患者注册',
  `operate_type` int COMMENT '1-绑定手机 2－修改手机号 3-手机号找回p密码 5-手机号注册 8-手机号快捷登录 9-老患者报到10-手术确认通知（医生）11-手术确认通知（患者）12-患者取消通知（医生）13-认证通过通知（医生）14-认证拒绝通知（医生）15-收入通知（医生） 16-患者注册',
  `template_code` string COMMENT '阿里模板id',
  `template_content` string COMMENT '阿里模板',
  `create_time` timestamp COMMENT '',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '',
  `send_site_id` int COMMENT '站点'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_send_content';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_send_content_20180608` (
  `id` bigint COMMENT '',
  `content` string COMMENT '内容',
  `type_id` int COMMENT '类型1-手机号找回密码 2-账号验证(1.绑定手机、手机号注册) 3-手机验证码快捷登录4-老患者报到5-患者注册',
  `operate_type` int COMMENT '1-绑定手机 2－修改手机号 3-手机号找回p密码 5-手机号注册 8-手机号快捷登录 9-老患者报到10-手术确认通知（医生）11-手术确认通知（患者）12-患者取消通知（医生）13-认证通过通知（医生）14-认证拒绝通知（医生）15-收入通知（医生） 16-患者注册',
  `template_code` string COMMENT '阿里模板id',
  `template_content` string COMMENT '阿里模板',
  `create_time` timestamp COMMENT '',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '',
  `send_site_id` int COMMENT '站点'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_send_content_20180608';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_setting_advice` (
  `id` bigint COMMENT 'ID',
  `advice_id` bigint COMMENT '可选服务设置ID(key=2)',
  `config_id` bigint COMMENT 'tocure_comm_setting_config表ID',
  `title_id` bigint COMMENT '职称ID',
  `title_name` string COMMENT '职称名称',
  `advice_type_key` int COMMENT '咨询类别:1-普通咨询;2-特需咨询;3-加急咨询;4-免费咨询',
  `advice_type_value` int COMMENT '配置类别：1-新患者选项配置;2-诊后报道患者专属优惠配置',
  `is_free_three` int COMMENT '是否包含前三次免费：1-是；0-否',
  `price_times` int COMMENT '次数',
  `price` decimal COMMENT '价格',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '医生咨询设置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_setting_advice';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_setting_advice_0927` (
  `id` bigint COMMENT 'ID',
  `advice_id` bigint COMMENT '可选服务设置ID(key=2)',
  `config_id` bigint COMMENT 'tocure_comm_setting_config表ID',
  `title_id` bigint COMMENT '职称ID',
  `title_name` string COMMENT '职称名称',
  `advice_type_key` int COMMENT '咨询类别:1-普通咨询;2-特需咨询;3-加急咨询;4-免费咨询',
  `advice_type_value` int COMMENT '配置类别：1-新患者选项配置;2-诊后报道患者专属优惠配置',
  `is_free_three` int COMMENT '是否包含前三次免费：1-是；0-否',
  `price_times` int COMMENT '次数',
  `price` decimal COMMENT '价格',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '医生咨询设置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_setting_advice_0927';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_setting_advice_20180420` (
  `id` bigint COMMENT 'ID',
  `advice_id` bigint COMMENT '可选服务设置ID(key=2)',
  `config_id` bigint COMMENT 'tocure_comm_setting_config表ID',
  `title_id` bigint COMMENT '职称ID',
  `title_name` string COMMENT '职称名称',
  `advice_type_key` int COMMENT '咨询类别:1-普通咨询;2-特需咨询;3-加急咨询;4-免费咨询',
  `advice_type_value` int COMMENT '配置类别：1-新患者选项配置;2-诊后报道患者专属优惠配置',
  `is_free_three` int COMMENT '是否包含前三次免费：1-是；0-否',
  `price_times` int COMMENT '次数',
  `price` decimal COMMENT '价格',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '医生咨询设置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_setting_advice_20180420';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_setting_clinic` (
  `id` bigint COMMENT 'ID',
  `clinic_id` bigint COMMENT '门诊ID',
  `config_id` bigint COMMENT '服务ID',
  `title_id` bigint COMMENT '职称ID',
  `title_name` string COMMENT '职称名',
  `clinic_type_key` int COMMENT '门诊设置类型1-门诊数量上限选项设置;2-可选门诊类型',
  `clinic_type_value` int COMMENT '可选门诊类型:1-普通门诊；2-专家门诊；3-特需门诊',
  `is_plus_charge` int COMMENT '是否允许加号收费1-是  0-否',
  `clinic_setting_value` decimal COMMENT 'key=1:门诊数量上限选项设置；key=2,value=1,2,3:可选门诊类型价格',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '医生门诊设置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_setting_clinic';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_setting_config` (
  `id` bigint COMMENT '',
  `config_id` bigint COMMENT '服务配置ID',
  `title_id` bigint COMMENT '职称id',
  `title_name` string COMMENT '职称名',
  `config_type` int COMMENT '可选服务设置类别:1-图文咨询;2-线下门诊;3-预约手术',
  `operation_price` decimal COMMENT 'type=3：互联网手术定金金额',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '医生服务设置'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_setting_config';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_setting_operation` (
  `id` bigint COMMENT '',
  `operation_sitting_id` bigint COMMENT '',
  `title_id` bigint COMMENT '职称ID',
  `title_name` string COMMENT '职称名称',
  `operation_type` int COMMENT '类型1-互联网手术定金',
  `price` decimal COMMENT '价格',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_setting_operation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_setting_percent` (
  `id` bigint COMMENT '',
  `percent_id` bigint COMMENT '',
  `title_id` bigint COMMENT '职称id',
  `title_name` string COMMENT '职称名',
  `percent_type_key` int COMMENT '分成类别：1-咨询分成设置 2-门诊分成设置 3-手术分成设置',
  `percent_type_value` int COMMENT '类别值：1-普通咨询；2-特需咨询；3-加急咨询；4-普通门诊；5-特需门诊；6-专家门诊；7-互联网医院手术定金',
  `percent_price` decimal COMMENT '互联网医院手术定金',
  `create_time` timestamp COMMENT '当前时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效1-有效 0-无效'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_setting_percent';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_solr_factor` (
  `id` bigint COMMENT '',
  `business_type` int COMMENT '应用场景(1-疾病 2-人)',
  `factor_id` bigint COMMENT '因子id',
  `factor_name` string COMMENT '权重字段名称',
  `factor_name_en` string COMMENT '权重字段英文名称',
  `factor_score` double COMMENT '评分',
  `factor_weight` double COMMENT '权重',
  `create_time` timestamp COMMENT '创建时间',
  `platform_id` int COMMENT '平台(1-唯医;2-医栈;3-医鼎)',
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_solr_factor';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_wechat_tag` (
  `id` bigint COMMENT '',
  `group_id` bigint COMMENT '标签id',
  `group_name` string COMMENT '标签名',
  `group_count` bigint COMMENT '标签下的用户数',
  `is_valid` int COMMENT '是否有效',
  `sort_id` int COMMENT '排序',
  `creat_time` timestamp COMMENT '创建时间'
) COMMENT '微信分组信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_wechat_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_weixin_push` (
  `id` bigint COMMENT '',
  `push_id` bigint COMMENT '',
  `msg_type` int COMMENT '消息类型0-文本1-模板',
  `push_content` string COMMENT '推送内容',
  `push_type` int COMMENT '推送类型0-微信关注推送1-历史健康推送2-剩余1小时推送3-上传资料提醒4-未回复提示5-拒绝提示6-辅助信息提示7-分诊医生拒绝提示8-医师分享页9-老患者报到页10-联系我们11-联系方式12-医生回复提醒13-超时退款提醒14-医生拒绝15-超时未接诊16-门诊邀约18-默认自动回复19-text1回复20-text2回复21-text3回复22-text4回复23-text5回复24-建议反馈回复通知25-后台手动退款26-服务号粉丝推送（自然增长）27-医生回复提示28-分诊医生回复提示29-服务号粉丝推送（helian）31-患者报到：医生回复通知32-患者报到小程序：补全资料通知33-患者报到提醒34-医生回复提醒（公众号）35-找医生 36-患者评价主诊医生37-邀请开诊38-优惠券图文模板39-患教文章消息41-信息完善提醒42-回复数字43-腰椎颈椎关节专家列表 44-患者群图片 45-找医生搜索列表之医生搜索 46-找医生搜索列表之疾病搜索47-未搜索到提交病情资料 48-搜索列表之推荐医生49-患教文章小程序通知50-关键词自动回复(你好，您好)',
  `type_comment` string COMMENT '',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '微信信息push配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_weixin_push';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_weixin_push_20180131` (
  `id` bigint COMMENT '',
  `push_id` bigint COMMENT '',
  `msg_type` int COMMENT '消息类型0-文本1-模板',
  `push_content` string COMMENT '推送内容',
  `push_type` int COMMENT '推送类型0-微信关注推送1-历史健康推送2-剩余1小时推送3-上传资料提醒4-未回复提示5-拒绝提示6-辅助信息提示7-分诊医生拒绝提示8-医师分享页9-老患者报到页10-联系我们11-联系方式12-医生回复提醒13-超时退款提醒14-医生拒绝15-超时未接诊16-门诊邀约18-默认自动回复19-text1回复20-text2回复21-text3回复22-text4回复23-text5回复24-建议反馈回复通知',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '微信信息push配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_weixin_push_20180131';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_weixin_push_20180913` (
  `id` bigint COMMENT '',
  `push_id` bigint COMMENT '',
  `msg_type` int COMMENT '消息类型0-文本1-模板',
  `push_content` string COMMENT '推送内容',
  `push_type` int COMMENT '推送类型0-微信关注推送1-历史健康推送2-剩余1小时推送3-上传资料提醒4-未回复提示5-拒绝提示6-辅助信息提示7-分诊医生拒绝提示8-医师分享页9-老患者报到页10-联系我们11-联系方式12-医生回复提醒13-超时退款提醒14-医生拒绝15-超时未接诊16-门诊邀约18-默认自动回复19-text1回复20-text2回复21-text3回复22-text4回复23-text5回复24-建议反馈回复通知25-后台手动退款26-服务号粉丝推送（自然增长）27-医生回复提示28-分诊医生回复提示29-服务号粉丝推送（helian）31-患者报到：医生回复通知32-患者报到小程序：补全资料通知33-患者报到提醒34-医生回复提醒（公众号）35-找医生 36-患者评价主诊医生37-邀请开诊38-优惠券图文模板39-患教文章消息41-信息完善提醒42-回复数字43-腰椎颈椎关节专家列表 44-患者群图片 45-找医生搜索列表之医生搜索 46-找医生搜索列表之疾病搜索47-未搜索到提交病情资料 48-搜索列表之推荐医生49-患教文章小程序通知50-关键词自动回复(你好，您好)',
  `type_comment` string COMMENT '',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '微信信息push配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_weixin_push_20180913';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_comm_weixin_push_20181113` (
  `id` bigint COMMENT '',
  `push_id` bigint COMMENT '',
  `msg_type` int COMMENT '消息类型0-文本1-模板',
  `push_content` string COMMENT '推送内容',
  `push_type` int COMMENT '推送类型0-微信关注推送1-历史健康推送2-剩余1小时推送3-上传资料提醒4-未回复提示5-拒绝提示6-辅助信息提示7-分诊医生拒绝提示8-医师分享页9-老患者报到页10-联系我们11-联系方式12-医生回复提醒13-超时退款提醒14-医生拒绝15-超时未接诊16-门诊邀约18-默认自动回复19-text1回复20-text2回复21-text3回复22-text4回复23-text5回复24-建议反馈回复通知25-后台手动退款26-服务号粉丝推送（自然增长）27-医生回复提示28-分诊医生回复提示29-服务号粉丝推送（helian）31-患者报到：医生回复通知32-患者报到小程序：补全资料通知33-患者报到提醒34-医生回复提醒（公众号）35-找医生 36-患者评价主诊医生37-邀请开诊38-优惠券图文模板39-患教文章消息41-信息完善提醒42-回复数字43-腰椎颈椎关节专家列表 44-患者群图片 45-找医生搜索列表之医生搜索 46-找医生搜索列表之疾病搜索47-未搜索到提交病情资料 48-搜索列表之推荐医生49-患教文章小程序通知50-关键词自动回复(你好，您好)',
  `type_comment` string COMMENT '',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '微信信息push配置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_comm_weixin_push_20181113';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_consultation_schedule` (
  `id` bigint COMMENT '',
  `doctor_id` bigint COMMENT '分诊医生或医生id',
  `doctor_name` string COMMENT '医生/分诊医生名称',
  `patient_customer_id` bigint COMMENT '患者所属用户id',
  `patient_id` bigint COMMENT '患者id',
  `patient_name` string COMMENT '患者名称',
  `case_id` bigint COMMENT '病例id',
  `consultation_type` int COMMENT '工单类型0：患者-分诊平台1：患者-医生',
  `state` int COMMENT '状态1-创建账号 2-添加患者 3-创建病例 4-老患者报道病例 5-立即问诊病例 6-建立分诊IM 7-建立医生IM 8-分诊医生接诊9-分诊医生释放 10-推荐医生 11-检查检验 12-分诊沟通结束 13-分诊沟通支付 14-医生IM咨询支付 15-医生接诊16-医生拒诊 17-沟通结束 18-续费咨询 19-发送门诊邀约',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '操作站点  17-患者微信、18-分诊平台、19-会诊Android、20-会诊IOS'
) COMMENT '会诊(沟通)进度表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_consultation_schedule';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_advice_setting` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '医生ID',
  `advice_setting_id` bigint COMMENT '咨询设置ID',
  `state` int COMMENT '开关：0-关，1-开',
  `daily_limit` int COMMENT '每日咨询人数上限10、20、30、40、50、70、100、-1（不限）',
  `general_charge_mode` int COMMENT '普通门诊收费模式1-前3次免费，以后收费;2-收费',
  `general_price` decimal COMMENT '普通问诊价格',
  `general_times` int COMMENT '普通问诊次数',
  `general_discount_price` int COMMENT '复诊患者优惠价格',
  `general_discount_times` int COMMENT '复诊患者优惠次数',
  `vip_price` int COMMENT '特需问诊价格',
  `vip_times` int COMMENT '特需问诊次数',
  `urgent_price` int COMMENT '加急问诊价格',
  `urgent_times` int COMMENT '加急问诊次数',
  `urgent_answertime` int COMMENT '加急应答时间(单位：小时)12小时、8小时、4小时、2小时',
  `illness_idList` string COMMENT '疾病标签集合',
  `illness_nameList` string COMMENT '疾病名称集合',
  `illness_desc` string COMMENT '疾病描述',
  `last_update_time` timestamp COMMENT '',
  `create_time` timestamp COMMENT '',
  `is_valid` int COMMENT '是否有效1-有效，0-无效',
  `site_id` int COMMENT '发送渠道',
  `free_times` int COMMENT '免费问诊次数'
) COMMENT '会员咨询设置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_advice_setting';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_advice_setting_20180103` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '医生ID',
  `advice_setting_id` bigint COMMENT '咨询设置ID',
  `state` int COMMENT '开关：0-关，1-开',
  `daily_limit` int COMMENT '每日咨询人数上限10、20、30、40、50、70、100、-1（不限）',
  `general_charge_mode` int COMMENT '普通门诊收费模式1-前3次免费，以后收费;2-收费',
  `general_price` decimal COMMENT '普通问诊价格',
  `general_times` int COMMENT '普通问诊次数',
  `general_discount_price` int COMMENT '复诊患者优惠价格',
  `general_discount_times` int COMMENT '复诊患者优惠次数',
  `vip_price` int COMMENT '特需问诊价格',
  `vip_times` int COMMENT '特需问诊次数',
  `urgent_price` int COMMENT '加急问诊价格',
  `urgent_times` int COMMENT '加急问诊次数',
  `urgent_answertime` int COMMENT '加急应答时间(单位：小时)12小时、8小时、4小时、2小时',
  `illness_idList` string COMMENT '疾病标签集合',
  `illness_nameList` string COMMENT '疾病名称集合',
  `illness_desc` string COMMENT '疾病描述',
  `create_time` timestamp COMMENT '',
  `is_valid` int COMMENT '是否有效1-有效，0-无效',
  `site_id` int COMMENT '发送渠道',
  `free_times` int COMMENT '免费问诊次数'
) COMMENT '会员咨询设置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_advice_setting_20180103';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_advice_setting_20180201` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '医生ID',
  `advice_setting_id` bigint COMMENT '咨询设置ID',
  `state` int COMMENT '开关：0-关，1-开',
  `daily_limit` int COMMENT '每日咨询人数上限10、20、30、40、50、70、100、-1（不限）',
  `general_charge_mode` int COMMENT '普通门诊收费模式1-前3次免费，以后收费;2-收费',
  `general_price` decimal COMMENT '普通问诊价格',
  `general_times` int COMMENT '普通问诊次数',
  `general_discount_price` int COMMENT '复诊患者优惠价格',
  `general_discount_times` int COMMENT '复诊患者优惠次数',
  `vip_price` int COMMENT '特需问诊价格',
  `vip_times` int COMMENT '特需问诊次数',
  `urgent_price` int COMMENT '加急问诊价格',
  `urgent_times` int COMMENT '加急问诊次数',
  `urgent_answertime` int COMMENT '加急应答时间(单位：小时)12小时、8小时、4小时、2小时',
  `illness_idList` string COMMENT '疾病标签集合',
  `illness_nameList` string COMMENT '疾病名称集合',
  `illness_desc` string COMMENT '疾病描述',
  `create_time` timestamp COMMENT '',
  `is_valid` int COMMENT '是否有效1-有效，0-无效',
  `site_id` int COMMENT '发送渠道',
  `free_times` int COMMENT '免费问诊次数'
) COMMENT '会员咨询设置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_advice_setting_20180201';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_advice_setting_20180420` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '医生ID',
  `advice_setting_id` bigint COMMENT '咨询设置ID',
  `state` int COMMENT '开关：0-关，1-开',
  `daily_limit` int COMMENT '每日咨询人数上限10、20、30、40、50、70、100、-1（不限）',
  `general_charge_mode` int COMMENT '普通门诊收费模式1-前3次免费，以后收费;2-收费',
  `general_price` decimal COMMENT '普通问诊价格',
  `general_times` int COMMENT '普通问诊次数',
  `general_discount_price` int COMMENT '复诊患者优惠价格',
  `general_discount_times` int COMMENT '复诊患者优惠次数',
  `vip_price` int COMMENT '特需问诊价格',
  `vip_times` int COMMENT '特需问诊次数',
  `urgent_price` int COMMENT '加急问诊价格',
  `urgent_times` int COMMENT '加急问诊次数',
  `urgent_answertime` int COMMENT '加急应答时间(单位：小时)12小时、8小时、4小时、2小时',
  `illness_idList` string COMMENT '疾病标签集合',
  `illness_nameList` string COMMENT '疾病名称集合',
  `illness_desc` string COMMENT '疾病描述',
  `create_time` timestamp COMMENT '',
  `is_valid` int COMMENT '是否有效1-有效，0-无效',
  `site_id` int COMMENT '发送渠道',
  `free_times` int COMMENT '免费问诊次数'
) COMMENT '会员咨询设置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_advice_setting_20180420';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_advice_setting_201804241121` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '医生ID',
  `advice_setting_id` bigint COMMENT '咨询设置ID',
  `state` int COMMENT '开关：0-关，1-开',
  `daily_limit` int COMMENT '每日咨询人数上限10、20、30、40、50、70、100、-1（不限）',
  `general_charge_mode` int COMMENT '普通门诊收费模式1-前3次免费，以后收费;2-收费',
  `general_price` decimal COMMENT '普通问诊价格',
  `general_times` int COMMENT '普通问诊次数',
  `general_discount_price` int COMMENT '复诊患者优惠价格',
  `general_discount_times` int COMMENT '复诊患者优惠次数',
  `vip_price` int COMMENT '特需问诊价格',
  `vip_times` int COMMENT '特需问诊次数',
  `urgent_price` int COMMENT '加急问诊价格',
  `urgent_times` int COMMENT '加急问诊次数',
  `urgent_answertime` int COMMENT '加急应答时间(单位：小时)12小时、8小时、4小时、2小时',
  `illness_idList` string COMMENT '疾病标签集合',
  `illness_nameList` string COMMENT '疾病名称集合',
  `illness_desc` string COMMENT '疾病描述',
  `create_time` timestamp COMMENT '',
  `is_valid` int COMMENT '是否有效1-有效，0-无效',
  `site_id` int COMMENT '发送渠道',
  `free_times` int COMMENT '免费问诊次数'
) COMMENT '会员咨询设置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_advice_setting_201804241121';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_advice_setting_20180614` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '医生ID',
  `advice_setting_id` bigint COMMENT '咨询设置ID',
  `state` int COMMENT '开关：0-关，1-开',
  `daily_limit` int COMMENT '每日咨询人数上限10、20、30、40、50、70、100、-1（不限）',
  `general_charge_mode` int COMMENT '普通门诊收费模式1-前3次免费，以后收费;2-收费',
  `general_price` decimal COMMENT '普通问诊价格',
  `general_times` int COMMENT '普通问诊次数',
  `general_discount_price` int COMMENT '复诊患者优惠价格',
  `general_discount_times` int COMMENT '复诊患者优惠次数',
  `vip_price` int COMMENT '特需问诊价格',
  `vip_times` int COMMENT '特需问诊次数',
  `urgent_price` int COMMENT '加急问诊价格',
  `urgent_times` int COMMENT '加急问诊次数',
  `urgent_answertime` int COMMENT '加急应答时间(单位：小时)12小时、8小时、4小时、2小时',
  `illness_idList` string COMMENT '疾病标签集合',
  `illness_nameList` string COMMENT '疾病名称集合',
  `illness_desc` string COMMENT '疾病描述',
  `create_time` timestamp COMMENT '',
  `is_valid` int COMMENT '是否有效1-有效，0-无效',
  `site_id` int COMMENT '发送渠道',
  `free_times` int COMMENT '免费问诊次数'
) COMMENT '会员咨询设置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_advice_setting_20180614';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_advice_setting_20180914` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '医生ID',
  `advice_setting_id` bigint COMMENT '咨询设置ID',
  `state` int COMMENT '开关：0-关，1-开',
  `daily_limit` int COMMENT '每日咨询人数上限10、20、30、40、50、70、100、-1（不限）',
  `general_charge_mode` int COMMENT '普通门诊收费模式1-前3次免费，以后收费;2-收费',
  `general_price` decimal COMMENT '普通问诊价格',
  `general_times` int COMMENT '普通问诊次数',
  `general_discount_price` int COMMENT '复诊患者优惠价格',
  `general_discount_times` int COMMENT '复诊患者优惠次数',
  `vip_price` int COMMENT '特需问诊价格',
  `vip_times` int COMMENT '特需问诊次数',
  `urgent_price` int COMMENT '加急问诊价格',
  `urgent_times` int COMMENT '加急问诊次数',
  `urgent_answertime` int COMMENT '加急应答时间(单位：小时)12小时、8小时、4小时、2小时',
  `illness_idList` string COMMENT '疾病标签集合',
  `illness_nameList` string COMMENT '疾病名称集合',
  `illness_desc` string COMMENT '疾病描述',
  `last_update_time` timestamp COMMENT '',
  `create_time` timestamp COMMENT '',
  `is_valid` int COMMENT '是否有效1-有效，0-无效',
  `site_id` int COMMENT '发送渠道',
  `free_times` int COMMENT '免费问诊次数'
) COMMENT '会员咨询设置表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_advice_setting_20180914';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_auth` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `full_name` string COMMENT '姓名',
  `sex_id` int COMMENT '性别id',
  `sex` string COMMENT '性别',
  `areas_expertise` string COMMENT '专业领域',
  `major_id_list` string COMMENT '',
  `illness_id_list` string COMMENT '疾病idList',
  `operation_id_list` string COMMENT '',
  `company_id` bigint COMMENT '',
  `company` string COMMENT '医院',
  `is_malpractice` int COMMENT '1-是0-否二级以上负主要责任的医疗事故',
  `birthday` string COMMENT '生日',
  `medical_title_id` int COMMENT '职称id',
  `medical_title` string COMMENT '医师职称',
  `yesteryear_operation_num` int COMMENT '去年手术数',
  `preceding_year_operation_num` int COMMENT '去年手术数',
  `state` int COMMENT '认证状态-1-未提交认证0-二次认证1-认证通过2-运营确认3-认证拒绝5-申请认证',
  `multipoint_practice_status` int COMMENT '多点执医0-未开通1-申请中2-已开通3-开通失败',
  `business_card_url` string COMMENT '医生名片链接',
  `create_time` timestamp COMMENT '创建时间',
  `auth_time` timestamp COMMENT '认证时间',
  `score` int COMMENT '评分',
  `send_site_id` int COMMENT '',
  `technical_titles` string COMMENT '技术职称1-中级2-副高3-高级',
  `technical_titles_time` timestamp COMMENT '技术职称获取时间',
  `id_number` string COMMENT '身份证号',
  `qualification_number` string COMMENT '资格证号',
  `qualification_time` timestamp COMMENT '资格证取得时间',
  `practicing_licence_number` string COMMENT '执业证号',
  `practicing_licence_time` timestamp COMMENT '执业证注册时间',
  `practicing_licence_type` string COMMENT '执业证执业类别',
  `practicing_licence_scope` string COMMENT '执业证执业范围',
  `multipoint_practice_company` string COMMENT '申请多机构执业医疗机构全称',
  `multipoint_start_time` timestamp COMMENT '多机构执业开始时间',
  `multipoint_end_time` timestamp COMMENT '多机构执业结束时间',
  `im_token` string COMMENT 'IM账号token',
  `customer_role` int COMMENT '认证角色(0-游客(权限控制使用) 5-普通用户(权限控制使用)11-会诊认证医生)',
  `is_test` int COMMENT '是否测试账号0-否1-是'
) COMMENT '会员认证表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_auth';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_auth612` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `full_name` string COMMENT '姓名',
  `sex_id` int COMMENT '性别id',
  `sex` string COMMENT '性别',
  `areas_expertise` string COMMENT '专业领域',
  `major_id_list` string COMMENT '',
  `illness_id_list` string COMMENT '疾病idList',
  `operation_id_list` string COMMENT '',
  `company_id` bigint COMMENT '',
  `company` string COMMENT '医院',
  `is_malpractice` int COMMENT '是否二级以上负主要责任的医疗事故',
  `birthday` string COMMENT '生日',
  `medical_title_id` int COMMENT '职称id',
  `medical_title` string COMMENT '医师职称',
  `yesteryear_operation_num` int COMMENT '去年手术数',
  `preceding_year_operation_num` int COMMENT '去年手术数',
  `state` int COMMENT '认证状态-1-未提交认证0-二次认证1-认证通过2-运营确认3-认证拒绝5-申请认证',
  `multipoint_practice_status` int COMMENT '多点执医0-未开通1-申请中2-已开通3-开通失败',
  `business_card_url` string COMMENT '医生名片链接',
  `create_time` timestamp COMMENT '创建时间',
  `auth_time` timestamp COMMENT '认证时间',
  `score` int COMMENT '评分',
  `send_site_id` int COMMENT '',
  `technical_titles` int COMMENT '技术职称1-中级2-副高3-高级',
  `technical_titles_time` timestamp COMMENT '技术职称获取时间',
  `id_number` string COMMENT '身份证号',
  `qualification_number` string COMMENT '资格证号',
  `qualification_time` timestamp COMMENT '资格证取得时间',
  `practicing_licence_number` string COMMENT '执业证号',
  `practicing_licence_time` timestamp COMMENT '执业证注册时间',
  `practicing_licence_type` string COMMENT '执业证执业类别',
  `practicing_licence_scope` string COMMENT '执业证执业范围',
  `multipoint_practice_company` string COMMENT '申请多机构执业医疗机构全称',
  `multipoint_start_time` timestamp COMMENT '多机构执业开始时间',
  `multipoint_end_time` timestamp COMMENT '多机构执业结束时间'
) COMMENT '会员认证表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_auth612';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_auth_attachment` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `att_type` bigint COMMENT '附件类型（comm_data_certificate.id）',
  `att_code` string COMMENT '附件号码',
  `att_path` string COMMENT '附件地址',
  `att_format` string COMMENT '附件格式：jpg、mp4...',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `att_position_type` int COMMENT '位置标识'
) COMMENT '会员认证附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_auth_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_auth_major` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员Id',
  `major_id` bigint COMMENT '专业Id',
  `major_name` string COMMENT '专业名称',
  `sub_major_id` bigint COMMENT '亚专业id',
  `sub_major_name` string COMMENT '亚专业名称',
  `illness_id_list` string COMMENT '疾病idList',
  `illness_name_list` string COMMENT '疾病名称List',
  `operation_id_list` string COMMENT '手术IdList',
  `operation_name_list` string COMMENT '手术名称list',
  `create_time` timestamp COMMENT '',
  `is_valid` int COMMENT '',
  `sort_id` int COMMENT ''
) COMMENT '会员认证专业表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_auth_major';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_auth_medical_title` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `medical_title_id` int COMMENT '职称类型id',
  `medical_title` string COMMENT '职称',
  `start_time` string COMMENT '开始时间',
  `end_time` string COMMENT '结束时间',
  `create_time` timestamp COMMENT '',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员认证职称'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_auth_medical_title';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_auth_process` (
  `id` bigint COMMENT '',
  `auth_id` bigint COMMENT '认证信息id',
  `customer_id` bigint COMMENT '会员id',
  `auth_type` int COMMENT '首次次数：1：首次提交；2：二次提交;4：再次提交',
  `auth_date` timestamp COMMENT '认证时间',
  `auth_source` string COMMENT '认证来源（ip）',
  `auth_address` string COMMENT '认证地',
  `auth_way` string COMMENT '认证途径（手机、网站、app）',
  `state` int COMMENT '认证状态(-1-无认证信息、0-二次提交认证、1-认证通过、2-运营确认、3-认证拒绝、4-再次认证)',
  `op_date` timestamp COMMENT '操作状态的时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `reason` string COMMENT '拒绝原因',
  `supplement` string COMMENT '补充资料',
  `is_send_email` bigint COMMENT '是否发送邮件（存放发送邮件的日志id）',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建日期',
  `op_type` int COMMENT '1-认证审核 2-多点执医审核'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_auth_process';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_auth_supplement` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '',
  `multipoint_practice_status` int COMMENT '多点执医0-未开通1-申请中2-已开通3-开通失败',
  `business_card_url` string COMMENT '医生名片链接',
  `score` int COMMENT '评分',
  `im_token` string COMMENT 'IM账号token',
  `create_time` timestamp COMMENT '创建时间',
  `send_site_id` int COMMENT '',
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_auth_supplement';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_auth_supplement_20180612` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '',
  `multipoint_practice_status` int COMMENT '多点执医0-未开通1-申请中2-已开通3-开通失败',
  `business_card_url` string COMMENT '医生名片链接',
  `score` int COMMENT '评分',
  `im_token` string COMMENT 'IM账号token',
  `create_time` timestamp COMMENT '创建时间',
  `send_site_id` int COMMENT '',
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_auth_supplement_20180612';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_auth_supplement_20180622` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '',
  `multipoint_practice_status` int COMMENT '多点执医0-未开通1-申请中2-已开通3-开通失败',
  `business_card_url` string COMMENT '医生名片链接',
  `score` int COMMENT '评分',
  `im_token` string COMMENT 'IM账号token',
  `create_time` timestamp COMMENT '创建时间',
  `send_site_id` int COMMENT '',
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_auth_supplement_20180622';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_auth_supplement_20180626` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '',
  `multipoint_practice_status` int COMMENT '多点执医0-未开通1-申请中2-已开通3-开通失败',
  `business_card_url` string COMMENT '医生名片链接',
  `score` int COMMENT '评分',
  `im_token` string COMMENT 'IM账号token',
  `create_time` timestamp COMMENT '创建时间',
  `send_site_id` int COMMENT '',
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_auth_supplement_20180626';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_auth_supplement_20180711` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '',
  `multipoint_practice_status` int COMMENT '多点执医0-未开通1-申请中2-已开通3-开通失败',
  `business_card_url` string COMMENT '医生名片链接',
  `score` int COMMENT '评分',
  `im_token` string COMMENT 'IM账号token',
  `create_time` timestamp COMMENT '创建时间',
  `send_site_id` int COMMENT '',
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_auth_supplement_20180711';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_auth_supplement_20180717` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '',
  `multipoint_practice_status` int COMMENT '多点执医0-未开通1-申请中2-已开通3-开通失败',
  `business_card_url` string COMMENT '医生名片链接',
  `score` int COMMENT '评分',
  `im_token` string COMMENT 'IM账号token',
  `create_time` timestamp COMMENT '创建时间',
  `send_site_id` int COMMENT '',
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_auth_supplement_20180717';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_bank_card` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `bank_id` bigint COMMENT '银行id',
  `bank_name` string COMMENT '银行名称',
  `bank_card_code` string COMMENT '银行卡号',
  `card_type` int COMMENT '卡片类型0-储蓄卡1-信用卡',
  `branch_info` string COMMENT '支行信息',
  `create_time` timestamp COMMENT '',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点'
) COMMENT '会员银行卡信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_bank_card';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_baseinfo` (
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
  `politics_status` string COMMENT '政治面貌'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_baseinfo';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_bill` (
  `id` bigint COMMENT '',
  `bill_id` bigint COMMENT '账单id',
  `customer_id` bigint COMMENT '',
  `bill_type` int COMMENT '收支类型1-收入2-支出',
  `source_type` int COMMENT '来源类型1-订单2-退款3-结算',
  `source_id` bigint COMMENT '来源id',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_bill';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_bill_20180206` (
  `id` bigint COMMENT '',
  `bill_id` bigint COMMENT '账单id',
  `customer_id` bigint COMMENT '',
  `bill_type` int COMMENT '收支类型1-收入2-支出',
  `source_type` int COMMENT '来源类型1-订单2-退款3-结算',
  `source_id` bigint COMMENT '来源id',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_bill_20180206';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_bill_20180831` (
  `id` bigint COMMENT '',
  `bill_id` bigint COMMENT '账单id',
  `customer_id` bigint COMMENT '',
  `bill_type` int COMMENT '收支类型1-收入2-支出',
  `source_type` int COMMENT '来源类型1-订单2-退款3-结算',
  `source_id` bigint COMMENT '来源id',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_bill_20180831';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_case_consultation` (
  `id` bigint COMMENT '',
  `consultation_id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id(医生id)',
  `patient_customer_id` bigint COMMENT '患者所属用户id',
  `patient_id` bigint COMMENT '患者id',
  `case_id` bigint COMMENT '病例id',
  `consultation_type` int COMMENT '会诊类型0：患者-分诊平台1：患者-医生',
  `consultation_state` int COMMENT '会诊状态-1-待就诊0-沟通中1-已结束2-被退回3-超时接诊退回4-新用户5-释放6-已上传资料7-分诊拒绝8-分诊完成9-待检查10-已推荐11-超时未回复',
  `return_reason_id` int COMMENT '拒绝原因id1-病情不符合2-资料不全3-其他',
  `return_reason` string COMMENT '',
  `consultation_level` int COMMENT '咨询级别0-免费1-普通2-加急3-特需4-医生赠送5-老患者报到(诊后报道)6-立即问诊',
  `case_type` int COMMENT '病历类型0-咨询2-手术直约10-老患者报到(诊后报道)11-立即问诊',
  `consultation_frequency` int COMMENT '咨询次数',
  `last_update_time` timestamp COMMENT '',
  `consultation_time` timestamp COMMENT '会诊时间',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `site_id` int COMMENT '操作站点  17-患者微信、18-分诊平台、19-会诊Android、20-会诊IOS',
  `consultation_source` int COMMENT '真实|测试：0-真实1-测试',
  `state_type` int COMMENT '记录历史状态',
  `triage_type` int COMMENT '分诊类型1-待分诊 2-沟通中 3-重新分诊',
  `suggestion_content` string COMMENT '医生给分诊医生的建议',
  `lock_state` int COMMENT 'IM工单状态0-未领取1-已锁定',
  `op_user_name` string COMMENT 'IM工单后台操作人员'
) COMMENT '会员分诊信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_case_consultation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_case_consultation_20180224` (
  `id` bigint COMMENT '',
  `consultation_id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id(医生id)',
  `patient_customer_id` bigint COMMENT '患者所属用户id',
  `patient_id` bigint COMMENT '患者id',
  `case_id` bigint COMMENT '病例id',
  `consultation_type` int COMMENT '会诊类型0：患者-分诊平台1：患者-医生',
  `consultation_state` int COMMENT '会诊状态-1-待就诊0-沟通中1-已结束2-被退回3-超时接诊退回4-新用户5-释放6-已上传资料7-分诊拒绝8-分诊完成9-待检查10-已推荐11-超时未回复',
  `return_reason_id` int COMMENT '拒绝原因id1-病情不符合2-资料不全3-其他',
  `return_reason` string COMMENT '退回原因',
  `consultation_level` int COMMENT '咨询级别0-免费1-普通2-加急3-特需4-医生赠送5-老患者报到(诊后报道)6-立即问诊',
  `case_type` int COMMENT '病历类型0-咨询2-手术直约10-老患者报到(诊后报道)11-立即问诊',
  `consultation_frequency` int COMMENT '咨询次数',
  `last_update_time` timestamp COMMENT '',
  `consultation_time` timestamp COMMENT '会诊时间',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `site_id` int COMMENT '操作站点  17-患者微信、18-分诊平台、19-会诊Android、20-会诊IOS',
  `consultation_source` int COMMENT '真实|测试：0-真实1-测试',
  `state_type` int COMMENT '记录历史状态',
  `triage_type` int COMMENT '分诊类型1-待分诊 2-沟通中 3-重新分诊'
) COMMENT '会员分诊信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_case_consultation_20180224';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_case_consultation_20180529` (
  `id` bigint COMMENT '',
  `consultation_id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id(医生id)',
  `patient_customer_id` bigint COMMENT '患者所属用户id',
  `patient_id` bigint COMMENT '患者id',
  `case_id` bigint COMMENT '病例id',
  `consultation_type` int COMMENT '会诊类型0：患者-分诊平台1：患者-医生',
  `consultation_state` int COMMENT '会诊状态-1-待就诊0-沟通中1-已结束2-被退回3-超时接诊退回4-新用户5-释放6-已上传资料7-分诊拒绝8-分诊完成9-待检查10-已推荐11-超时未回复',
  `return_reason_id` int COMMENT '拒绝原因id1-病情不符合2-资料不全3-其他',
  `return_reason` string COMMENT '',
  `consultation_level` int COMMENT '咨询级别0-免费1-普通2-加急3-特需4-医生赠送5-老患者报到(诊后报道)6-立即问诊',
  `case_type` int COMMENT '病历类型0-咨询2-手术直约10-老患者报到(诊后报道)11-立即问诊',
  `consultation_frequency` int COMMENT '咨询次数',
  `last_update_time` timestamp COMMENT '',
  `consultation_time` timestamp COMMENT '会诊时间',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `site_id` int COMMENT '操作站点  17-患者微信、18-分诊平台、19-会诊Android、20-会诊IOS',
  `consultation_source` int COMMENT '真实|测试：0-真实1-测试',
  `state_type` int COMMENT '记录历史状态',
  `triage_type` int COMMENT '分诊类型1-待分诊 2-沟通中 3-重新分诊',
  `suggestion_content` string COMMENT '医生给分诊医生的建议'
) COMMENT '会员分诊信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_case_consultation_20180529';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_case_consultation_20180601` (
  `id` bigint COMMENT '',
  `consultation_id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id(医生id)',
  `patient_customer_id` bigint COMMENT '患者所属用户id',
  `patient_id` bigint COMMENT '患者id',
  `case_id` bigint COMMENT '病例id',
  `consultation_type` int COMMENT '会诊类型0：患者-分诊平台1：患者-医生',
  `consultation_state` int COMMENT '会诊状态-1-待就诊0-沟通中1-已结束2-被退回3-超时接诊退回4-新用户5-释放6-已上传资料7-分诊拒绝8-分诊完成9-待检查10-已推荐11-超时未回复',
  `return_reason_id` int COMMENT '拒绝原因id1-病情不符合2-资料不全3-其他',
  `return_reason` string COMMENT '退回原因',
  `consultation_level` int COMMENT '咨询级别0-免费1-普通2-加急3-特需4-医生赠送5-老患者报到(诊后报道)6-立即问诊',
  `case_type` int COMMENT '病历类型0-咨询2-手术直约10-老患者报到(诊后报道)11-立即问诊',
  `consultation_frequency` int COMMENT '咨询次数',
  `last_update_time` timestamp COMMENT '',
  `consultation_time` timestamp COMMENT '会诊时间',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `site_id` int COMMENT '操作站点  17-患者微信、18-分诊平台、19-会诊Android、20-会诊IOS',
  `consultation_source` int COMMENT '真实|测试：0-真实1-测试',
  `state_type` int COMMENT '记录历史状态',
  `triage_type` int COMMENT '分诊类型1-待分诊 2-沟通中 3-重新分诊'
) COMMENT '会员分诊信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_case_consultation_20180601';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_case_consultation_20180628` (
  `id` bigint COMMENT '',
  `consultation_id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id(医生id)',
  `patient_customer_id` bigint COMMENT '患者所属用户id',
  `patient_id` bigint COMMENT '患者id',
  `case_id` bigint COMMENT '病例id',
  `consultation_type` int COMMENT '会诊类型0：患者-分诊平台1：患者-医生',
  `consultation_state` int COMMENT '会诊状态-1-待就诊0-沟通中1-已结束2-被退回3-超时接诊退回4-新用户5-释放6-已上传资料7-分诊拒绝8-分诊完成9-待检查10-已推荐11-超时未回复',
  `return_reason_id` int COMMENT '拒绝原因id1-病情不符合2-资料不全3-其他',
  `return_reason` string COMMENT '',
  `consultation_level` int COMMENT '咨询级别0-免费1-普通2-加急3-特需4-医生赠送5-老患者报到(诊后报道)6-立即问诊',
  `case_type` int COMMENT '病历类型0-咨询2-手术直约10-老患者报到(诊后报道)11-立即问诊',
  `consultation_frequency` int COMMENT '咨询次数',
  `last_update_time` timestamp COMMENT '',
  `consultation_time` timestamp COMMENT '会诊时间',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `site_id` int COMMENT '操作站点  17-患者微信、18-分诊平台、19-会诊Android、20-会诊IOS',
  `consultation_source` int COMMENT '真实|测试：0-真实1-测试',
  `state_type` int COMMENT '记录历史状态',
  `triage_type` int COMMENT '分诊类型1-待分诊 2-沟通中 3-重新分诊',
  `suggestion_content` string COMMENT '医生给分诊医生的建议',
  `lock_state` int COMMENT 'IM工单状态0-未领取1-已锁定',
  `op_user_name` string COMMENT 'IM工单后台操作人员'
) COMMENT '会员分诊信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_case_consultation_20180628';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_case_consultation_20180827` (
  `id` bigint COMMENT '',
  `consultation_id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id(医生id)',
  `patient_customer_id` bigint COMMENT '患者所属用户id',
  `patient_id` bigint COMMENT '患者id',
  `case_id` bigint COMMENT '病例id',
  `consultation_type` int COMMENT '会诊类型0：患者-分诊平台1：患者-医生',
  `consultation_state` int COMMENT '会诊状态-1-待就诊0-沟通中1-已结束2-被退回3-超时接诊退回4-新用户5-释放6-已上传资料7-分诊拒绝8-分诊完成9-待检查10-已推荐11-超时未回复',
  `return_reason_id` int COMMENT '拒绝原因id1-病情不符合2-资料不全3-其他',
  `return_reason` string COMMENT '',
  `consultation_level` int COMMENT '咨询级别0-免费1-普通2-加急3-特需4-医生赠送5-老患者报到(诊后报道)6-立即问诊',
  `case_type` int COMMENT '病历类型0-咨询2-手术直约10-老患者报到(诊后报道)11-立即问诊',
  `consultation_frequency` int COMMENT '咨询次数',
  `last_update_time` timestamp COMMENT '',
  `consultation_time` timestamp COMMENT '会诊时间',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `site_id` int COMMENT '操作站点  17-患者微信、18-分诊平台、19-会诊Android、20-会诊IOS',
  `consultation_source` int COMMENT '真实|测试：0-真实1-测试',
  `state_type` int COMMENT '记录历史状态',
  `triage_type` int COMMENT '分诊类型1-待分诊 2-沟通中 3-重新分诊',
  `suggestion_content` string COMMENT '医生给分诊医生的建议',
  `lock_state` int COMMENT 'IM工单状态0-未领取1-已锁定',
  `op_user_name` string COMMENT 'IM工单后台操作人员'
) COMMENT '会员分诊信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_case_consultation_20180827';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_case_consultation_comment` (
  `id` bigint COMMENT '',
  `process_id` bigint COMMENT '',
  `consultation_id` bigint COMMENT '',
  `chat_id` bigint COMMENT 'tocure_patient_case_chat.id',
  `attitude` int COMMENT '态度：0-差，交流没耐心1-合格，严格按照话术，不灵活2-好，患者满意，为患者考虑周全|3-差4-较差5-还行6-满意7-非常满意',
  `completion_degree` int COMMENT '服务完成度：0-完成分诊，解决了患者问题1-分诊医生回答中断、长时间没响应2-患者回答中断、长时间没响应|3-解决了患者问题4-医生回答中断、长时间没响应5-患者回答中断、长时间没响应',
  `execution_quality` int COMMENT '质量/能力：0-错误1-正确|2-非常专业，诊断准确、治疗有效3-水平一般，诊断准确，治疗效果一般4-水平差，诊断不准确5-很差，推广,发广告、不合规治疗等',
  `state` int COMMENT '审核状态 0-待审核1-审核通过2-审核不通过',
  `comment_type` int COMMENT '类型0-对工单进行评价1-对聊天消息进行评价',
  `remark_content` string COMMENT '备注',
  `is_valid` int COMMENT '',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员分诊信息评价'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_case_consultation_comment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_clinic` (
  `id` bigint COMMENT '',
  `clinic_id` bigint COMMENT '门诊预约id',
  `customer_id` bigint COMMENT '用户id',
  `case_id` bigint COMMENT '病例id',
  `patient_id` bigint COMMENT '患者id',
  `hospital_id` bigint COMMENT '医院id',
  `hospital_name` string COMMENT '医院名称',
  `clinic_time` timestamp COMMENT '门诊时间',
  `refuse_reason` string COMMENT '拒绝原因',
  `status` int COMMENT '状态1-需我批准2-待就诊3-已就诊4-逾期未批5-患者取消6-医生拒绝7-医生取消',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '',
  `send_site_id` int COMMENT '',
  `clinic_code` string COMMENT '门诊预约码',
  `clinic_type` int COMMENT '门诊预约类型1-预约中2-预约失败3-预约成功',
  `time_type` int COMMENT '门诊时段类型1-上午2-下午3-全天'
) COMMENT '门诊预约单'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_clinic';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_clinic_20180521` (
  `id` bigint COMMENT '',
  `clinic_id` bigint COMMENT '门诊预约id',
  `customer_id` bigint COMMENT '用户id',
  `case_id` bigint COMMENT '病例id',
  `patient_id` bigint COMMENT '患者id',
  `hospital_id` bigint COMMENT '医院id',
  `hospital_name` string COMMENT '医院名称',
  `clinic_time` timestamp COMMENT '门诊时间',
  `refuse_reason` string COMMENT '拒绝原因',
  `status` int COMMENT '状态1-需我批准2-待就诊3-已就诊4-逾期未批5-患者取消6-医生拒绝7-医生取消',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '',
  `send_site_id` int COMMENT '',
  `clinic_code` string COMMENT '门诊预约码',
  `clinic_type` int COMMENT '门诊预约类型1-预约中2-预约失败3-预约成功',
  `time_type` int COMMENT '门诊时段类型1-上午2-下午3-全天'
) COMMENT '门诊预约单'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_clinic_20180521';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_clinic_close` (
  `id` bigint COMMENT '',
  `close_id` bigint COMMENT '医生门诊停诊设置id',
  `customer_id` bigint COMMENT '用户id',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `close_reason` string COMMENT '停诊原因',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `site_id` int COMMENT '操作站点  17-患者微信、18-分诊平台、19-会诊Android、20-会诊IOS'
) COMMENT '门诊停诊设置'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_clinic_close';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_clinic_invite` (
  `id` bigint COMMENT '',
  `invite_id` bigint COMMENT '门诊邀约id',
  `customer_id` bigint COMMENT '医生id',
  `patient_id` bigint COMMENT '患者id',
  `case_id` bigint COMMENT '病例id',
  `end_invite_time` timestamp COMMENT '门诊邀约结束时间',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `site_id` int COMMENT '操作站点  17-患者微信、18-分诊平台、19-会诊Android、20-会诊IOS'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_clinic_invite';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_clinic_setting` (
  `id` bigint COMMENT '',
  `setting_id` bigint COMMENT '医生门诊预约设置id',
  `customer_id` bigint COMMENT '用户id',
  `is_receive` int COMMENT '是否接受预约1-接受0-拒绝',
  `illness_id_list` string COMMENT '预约疾病id串',
  `clinic_remark` string COMMENT '预约条件',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `site_id` int COMMENT '操作站点  17-患者微信、18-分诊平台、19-会诊Android、20-会诊IOS'
) COMMENT '门诊预约设置'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_clinic_setting';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_clinic_setting_supplement` (
  `id` bigint COMMENT '',
  `setting_id` bigint COMMENT '医生门诊预约设置id',
  `hospital_id` bigint COMMENT '医院id',
  `hospital` string COMMENT '医院',
  `date_type` int COMMENT '日期类型1-周一、2-周二、3-周三、4-周四、5-周五、6-周六、7-周日',
  `time_type` int COMMENT '时间类型1-上午、2-下午、3-晚上',
  `clinic_type` int COMMENT '门诊类型1-普通、2-专家、3-特需',
  `cost_standard` int COMMENT '收费标准0-免费、1-1元、2-2元...',
  `book_num` int COMMENT '门诊预约上限',
  `remark` string COMMENT '来院指引及备注',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `site_id` int COMMENT '操作站点  17-患者微信、18-分诊平台、19-会诊Android、20-会诊IOS'
) COMMENT '门诊预约设置补充表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_clinic_setting_supplement';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_comm_reply` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `reply_content` string COMMENT '回复内容',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `last_update_time` timestamp COMMENT '最新更新时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '常用回复'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_comm_reply';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_comm_reply_20180110` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `reply_content` string COMMENT '回复内容',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `last_update_time` timestamp COMMENT '最新更新时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '常用回复'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_comm_reply_20180110';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_continuing_education` (
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_continuing_education';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_continuing_education612` (
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_continuing_education612';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_education` (
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_education';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_education612` (
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_education612';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_fellowship` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `fellowship_type` int COMMENT 'fellow项目类别(1-国外进修、2-国内进修，3-培训课程)',
  `fellowship_institutions_id` bigint COMMENT '进修机构id',
  `fellowship_institutions` string COMMENT '进修机构',
  `fellowship_desc` string COMMENT '进修说明',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `create_time` timestamp COMMENT '',
  `sort_id` int COMMENT '',
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_fellowship';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_hospitalization_notify` (
  `id` bigint COMMENT '',
  `hospitalization_id` bigint COMMENT '业务id',
  `customer_id` bigint COMMENT '医生id',
  `case_id` bigint COMMENT '病例id',
  `patient_id` bigint COMMENT '患者id',
  `diagnosis_id` bigint COMMENT '诊断id',
  `operation_order_id` bigint COMMENT '手术单id',
  `hospital_id` bigint COMMENT '',
  `hospital_name` string COMMENT '手术医院',
  `hospitalization_time` timestamp COMMENT '住院时间',
  `operation_time` timestamp COMMENT '手术时间',
  `hospital_bed` string COMMENT '病床',
  `exhort` string COMMENT '术前叮嘱',
  `remark` string COMMENT '备注',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点'
) COMMENT '住院通知'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_hospitalization_notify';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_liquidation` (
  `id` bigint COMMENT '',
  `liquidation_id` bigint COMMENT '',
  `customer_id` bigint COMMENT '用户id',
  `liquidation_amount` decimal COMMENT '清算金额',
  `tax_amount` decimal COMMENT '个税',
  `liquidation_month` string COMMENT '清算月份',
  `liquidation_time` timestamp COMMENT '清算时间',
  `settlement_status` int COMMENT '结算单状态1-已结算2-未结算3-结算失败4-结算异常',
  `settlement_time` timestamp COMMENT '结算时间',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `pay_amount` decimal COMMENT '实际支付金额',
  `promotion_amount` decimal COMMENT '优惠金额'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_liquidation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_liquidation_order` (
  `id` bigint COMMENT '',
  `liquidation_id` bigint COMMENT '清算单id',
  `order_id` string COMMENT '订单',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_liquidation_order';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_logo_url` (
  `id` bigint COMMENT '',
  `ref_customer_id` bigint COMMENT '会员id',
  `logo_type` string COMMENT '1-会员头像,2-会员简历头像',
  `logo_spec` string COMMENT 'logo规格(1-头像原图,2-fastdfs规格)',
  `logo_height` int COMMENT '图片高度',
  `logo_width` int COMMENT '图片宽度',
  `logo_size` string COMMENT '图片大小KB',
  `logo_url` string COMMENT '文档资源url',
  `create_time` timestamp COMMENT '上传时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `logo_format` string COMMENT '附件格式：jpg、mp4...'
) COMMENT 'logo信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_logo_url';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_logo_url612` (
  `id` bigint COMMENT '',
  `ref_customer_id` bigint COMMENT '会员id',
  `logo_type` string COMMENT '1-会员头像,2-会员简历头像',
  `logo_spec` string COMMENT 'logo规格(1-头像原图,2-fastdfs规格)',
  `logo_height` int COMMENT '图片高度',
  `logo_width` int COMMENT '图片宽度',
  `logo_size` string COMMENT '图片大小KB',
  `logo_url` string COMMENT '文档资源url',
  `create_time` timestamp COMMENT '上传时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `logo_format` string COMMENT '附件格式：jpg、mp4...'
) COMMENT 'logo信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_logo_url612';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_message` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `customer_type` int COMMENT '用户的类型(0-患者1-分诊医生2-医生)',
  `send_customer_id` bigint COMMENT '会员id',
  `send_customer_name` string COMMENT '发送者姓名',
  `send_site_id` int COMMENT '消息发送渠道(site)',
  `message_type` int COMMENT '消息类型：1-会员消息,2-系统消息',
  `op_type` int COMMENT '操作类型(1-手术时间确定、2-患者取消手术、3-退款、4-认证通过、5-认证拒绝、6-收入、7-手术预约成功、8-需审批、9-反馈)',
  `ref_type` int COMMENT '消息产生主体的类型(1-病例，2-订单,3-人,4-手术预约单,5-结算单)',
  `ref_id` bigint COMMENT '消息关联资源id',
  `message_name` string COMMENT '消息标题',
  `message_body` string COMMENT '消息内容,截取字符',
  `create_time` timestamp COMMENT '消息时间',
  `read_time` timestamp COMMENT '查看时间',
  `is_read` int COMMENT '是否查看',
  `read_site_id` int COMMENT '阅读渠道(site)',
  `is_remind` int COMMENT '是否提醒看',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `resource_type` int COMMENT '资源类型(1-病例，2-订单,3-人,4-手术预约单,5-结算单)',
  `ios_send_time` timestamp COMMENT 'ios推送时间',
  `android_send_time` timestamp COMMENT '安卓推送时间',
  `wx_send_time` timestamp COMMENT '微信推送时间',
  `notify_config_id` bigint COMMENT '会员消息推送配置表id',
  `message_src_time` timestamp COMMENT '消息源产生时间',
  `is_permit` int COMMENT '是否禁止发送推送(0-不允许,１-允许)',
  `page_storage_path` string COMMENT '网站PC存储路径',
  `web_storage_path` string COMMENT '手机版H5存储路径',
  `app_storage_path` string COMMENT 'app手机端存储路径'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_message';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_message_20180309` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `customer_type` int COMMENT '用户的类型(0-患者1-分诊医生2-医生)',
  `send_customer_id` bigint COMMENT '会员id',
  `send_customer_name` string COMMENT '发送者姓名',
  `send_site_id` int COMMENT '消息发送渠道(site)',
  `message_type` int COMMENT '消息类型：1-会员消息,2-系统消息',
  `op_type` int COMMENT '操作类型(1-手术时间确定、2-患者取消手术、3-退款、4-认证通过、5-认证拒绝、6-收入、7-手术预约成功、8-需审批、9-反馈)',
  `ref_type` int COMMENT '消息产生主体的类型(1-病例，2-订单,3-人,4-手术预约单,5-结算单)',
  `ref_id` bigint COMMENT '消息关联资源id',
  `message_name` string COMMENT '消息标题',
  `message_body` string COMMENT '消息内容,截取字符',
  `create_time` timestamp COMMENT '消息时间',
  `read_time` timestamp COMMENT '查看时间',
  `is_read` int COMMENT '是否查看',
  `read_site_id` int COMMENT '阅读渠道(site)',
  `is_remind` int COMMENT '是否提醒看',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `resource_type` int COMMENT '资源类型(1-病例，2-订单,3-人,4-手术预约单,5-结算单)',
  `ios_send_time` timestamp COMMENT 'ios推送时间',
  `android_send_time` timestamp COMMENT '安卓推送时间',
  `wx_send_time` timestamp COMMENT '微信推送时间',
  `notify_config_id` bigint COMMENT '会员消息推送配置表id',
  `message_src_time` timestamp COMMENT '消息源产生时间',
  `is_permit` int COMMENT '是否禁止发送推送(0-不允许,１-允许)',
  `page_storage_path` string COMMENT '网站PC存储路径',
  `web_storage_path` string COMMENT '手机版H5存储路径',
  `app_storage_path` string COMMENT 'app手机端存储路径'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_message_20180309';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_multipoint_practice` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '',
  `internet_hospital_id_list` string COMMENT '',
  `cooperation_hospital_id_list` string COMMENT '',
  `status` int COMMENT '状态0-关闭1-开启',
  `create_time` timestamp COMMENT '',
  `is_valid` int COMMENT '',
  `send_site_id` int COMMENT ''
) COMMENT '多点执医 '
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_multipoint_practice';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_notify_config` (
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_notify_config';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_operation_aides` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员Id',
  `aides_id` bigint COMMENT '助手id',
  `aides_name` string COMMENT '助手名',
  `aides_type` int COMMENT '助手类型1-手术助手2-输血医师',
  `sort_id` int COMMENT '排序',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '医师助手表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_operation_aides';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_operation_hospital` (
  `id` bigint COMMENT '',
  `operation_order_id` bigint COMMENT '手术单id',
  `hospital_id` bigint COMMENT '医院id',
  `hospital_name` string COMMENT '医院名称',
  `operation_time` timestamp COMMENT '手术时间',
  `status` int COMMENT '状态',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '手术单医院'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_operation_hospital';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_operation_order` (
  `id` bigint COMMENT '',
  `operation_order_id` bigint COMMENT '',
  `customer_id` bigint COMMENT '医生Id',
  `case_id` bigint COMMENT '病例Id',
  `patient_id` bigint COMMENT '患者Id',
  `diagnosis_id` bigint COMMENT '诊断结果id',
  `operation_type` int COMMENT '手术类型1-互联网手术2-公立医院',
  `aides_status` int COMMENT '医师助手1-待定2-选择已有助手',
  `aides_id_list` string COMMENT '医师助手idList',
  `metachysis_status` int COMMENT '输血医师1-待定2-选择已有医师3-不需要',
  `metachysis_id_list` string COMMENT '输血医师idList',
  `is_anaesthesia` int COMMENT '麻醉1-待定2-半麻3-局麻4-全麻',
  `is_quarantine` int COMMENT '隔离0-正常1-隔离',
  `duration` string COMMENT '预计手术持续时间',
  `operation_num` int COMMENT '当天台次',
  `is_emergency` int COMMENT '紧急程度0-不急1-急',
  `remark` string COMMENT '备注',
  `hospital_id` bigint COMMENT '就诊医院id',
  `hospital_name` string COMMENT '就诊医院',
  `operation_time` timestamp COMMENT '手术时间',
  `hospitalization_time` timestamp COMMENT '住院时间',
  `reservation_status` int COMMENT '预约状态1-待患者确认2-互联网医院3-公立医院4-已完成',
  `order_status` int COMMENT '状态1-待选择医院2-已失效3-待手术4-手术时间待定5-患者取消6-未确认就诊7-已确认就诊',
  `last_update_time` timestamp COMMENT '',
  `create_time` timestamp COMMENT '',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点'
) COMMENT '手术预约单'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_operation_order';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_patient_relation` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '用户id',
  `patient_id` bigint COMMENT '患者id',
  `patient_name` string COMMENT '患者名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '发送渠道',
  `patient_relation_id` int COMMENT '患者关系0-本人1-配偶2-子女(有证件)3-父亲(父母)4-母亲5-爷爷6-奶奶7-亲戚8-朋友9-邻居10-其他11-子女(无证件)',
  `patient_source` int COMMENT '患者来源(1-美年体检)'
) COMMENT '会员患者表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_patient_relation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_patient_relation_20180725` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '用户id',
  `patient_id` bigint COMMENT '患者id',
  `patient_name` string COMMENT '患者名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '发送渠道',
  `patient_relation_id` int COMMENT '患者关系0-本人1-配偶2-子女(有证件)3-父亲(父母)4-母亲5-爷爷6-奶奶7-亲戚8-朋友9-邻居10-其他11-子女(无证件)'
) COMMENT '会员患者表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_patient_relation_20180725';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_patient_relation_20180810` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '用户id',
  `patient_id` bigint COMMENT '患者id',
  `patient_name` string COMMENT '患者名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '发送渠道',
  `patient_relation_id` int COMMENT '患者关系0-本人1-配偶2-子女(有证件)3-父亲(父母)4-母亲5-爷爷6-奶奶7-亲戚8-朋友9-邻居10-其他11-子女(无证件)'
) COMMENT '会员患者表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_patient_relation_20180810';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_patient_relation_201808101715` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '用户id',
  `patient_id` bigint COMMENT '患者id',
  `patient_name` string COMMENT '患者名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '发送渠道',
  `patient_relation_id` int COMMENT '患者关系0-本人1-配偶2-子女(有证件)3-父亲(父母)4-母亲5-爷爷6-奶奶7-亲戚8-朋友9-邻居10-其他11-子女(无证件)'
) COMMENT '会员患者表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_patient_relation_201808101715';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_patient_tag` (
  `id` bigint COMMENT '主键id',
  `customer_id` bigint COMMENT '医生id',
  `tag_id` bigint COMMENT '标签id',
  `tag_type` int COMMENT '标签类型：1-初始化默认标签2-医生自定义标签',
  `is_valid` int COMMENT '是否有效（0-无效1-有效）',
  `sort_id` int COMMENT '排序id',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点id'
) COMMENT '患者所属医生标签信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_patient_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_patient_tag_20180612` (
  `id` bigint COMMENT '主键id',
  `customer_id` bigint COMMENT '医生id',
  `tag_id` bigint COMMENT '标签id',
  `tag_type` int COMMENT '标签类型：1-初始化默认标签2-医生自定义标签',
  `is_valid` int COMMENT '是否有效（0-无效1-有效）',
  `sort_id` int COMMENT '排序id',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点id'
) COMMENT '患者所属医生标签信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_patient_tag_20180612';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_prefer` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `useful_type` int COMMENT '赞类型（1-康复日记）',
  `up_down_type` int COMMENT '赞、踩 类型(0踩,1赞,2顶)',
  `ref_id` bigint COMMENT '赞具体信息id（资源id）',
  `publish_time` timestamp COMMENT '发布时间',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地址',
  `if_anonymous` int COMMENT '是否匿名',
  `if_header` int COMMENT '是否置顶',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '发送渠道',
  `create_time` timestamp COMMENT '创建时间',
  `last_update_time` timestamp COMMENT ''
) COMMENT '用户赞踩'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_prefer';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_quick_question` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `question_id` bigint COMMENT '业务id',
  `question_desc` string COMMENT '问题内容',
  `question_type` int COMMENT '快捷提问类型0-通用分组1-系统分组2-用户分组',
  `part_id` bigint COMMENT '关联部位',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `parent_id` bigint COMMENT '父节点',
  `full_path` string COMMENT '',
  `is_upload` int COMMENT '是否上传0-不上传1-上传',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '操作站点1~10、  17-患者微信、18-分诊平台',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '快捷提问表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_quick_question';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_relation` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '唯医-医生id',
  `customer_name` string COMMENT '唯医医生名称',
  `hospital_id` string COMMENT '第三方医院id',
  `doctor_no` string COMMENT '医生编号',
  `doctor_name` string COMMENT '医生姓名',
  `id_card` string COMMENT '身份证号',
  `sort_id` int COMMENT '序号',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '唯医医生和第三方医院，如：银川市第一人民医院医生的关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_relation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_reprint` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `reprint_type` int COMMENT '转载类型（1-视频，2-文库，3-会议，4-话题 ,5-笔记,25-患教）',
  `ref_id` bigint COMMENT '转发具体信息id',
  `ref_customer_id` bigint COMMENT '冗余存放资源关联会员id',
  `ref_name` string COMMENT '转载具体信息名字',
  `ref_url` string COMMENT '转载地址',
  `reprint_time` timestamp COMMENT '转发时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效（0-取消转载；1-添加转载）',
  `send_site_id` int COMMENT '发送渠道',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '会员转载'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_reprint';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_review` (
  `id` bigint COMMENT '',
  `review_id` bigint COMMENT '评论id',
  `resource_id` bigint COMMENT '资源id',
  `customer_id` bigint COMMENT '作者id',
  `ref_customer_id` bigint COMMENT '引用作者id',
  `customer_type` int COMMENT '用户类型(0-患者用户 1-虚拟患者)',
  `review_content` string COMMENT '评论内容',
  `deal_remark` string COMMENT '处理备注',
  `review_time` timestamp COMMENT '评论时间',
  `is_reply` int COMMENT '是否回复(0-未回复1-已回复)',
  `resource_type` int COMMENT '评论类型:1-康复日记',
  `review_type` int COMMENT '评论类型 (0-PGC 1-UGC)',
  `tree_level` int COMMENT '节点级别',
  `parent_id` bigint COMMENT '父节点',
  `full_path` string COMMENT '上级路径（拼串形式存放上级partId）',
  `status` int COMMENT '评论状态(0-审核失败 1-审核通过)',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `send_site_id` int COMMENT '站点id'
) COMMENT '用户评论表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_review';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_review_attachment` (
  `id` bigint COMMENT '',
  `review_id` bigint COMMENT '评论id',
  `att_name` string COMMENT '附件说明（图片标题等）',
  `att_type` int COMMENT '附件类型：1-图片，2-视频,4-视频缩略图,5-语音,6-封面图片',
  `att_size` string COMMENT '附件大小：KB',
  `att_format` string COMMENT '附件格式：jpg、mp4...',
  `att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、8-480*320、9-1280*720、10-900*600、12-300*200、13-450*300、14-750*500)',
  `att_height` string COMMENT '附件高度',
  `att_width` string COMMENT '附件宽度',
  `att_url` string COMMENT '附件url',
  `upload_time` timestamp COMMENT '附件上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功,3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `play_num` bigint COMMENT '播放次数',
  `play_time` string COMMENT '播放时长'
) COMMENT '用户评论附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_review_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_role_priv` (
  `id` bigint COMMENT '',
  `customer_role` int COMMENT '会员id(tocure_customer_unite.customer_role)外键',
  `role_id` int COMMENT '',
  `role_type` int COMMENT '权限类型(0.操作、1.浏览)',
  `role_flag` int COMMENT '权限标示(0-false,1-true)',
  `role_op` string COMMENT '权限操作拼串存储(role_id-role_flag)(1-0)',
  `create_time` timestamp COMMENT '创建日期',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `sort_id` int COMMENT '顺序号'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_role_priv';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_send_code` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `patient_id` bigint COMMENT '患者id',
  `account` string COMMENT '邮箱、手机号',
  `site_id` int COMMENT '操作站点  17-患者微信、18-分诊平台、19-会诊Android、20-会诊IOS',
  `customer_email` string COMMENT '客户邮件地址',
  `email_content` string COMMENT '邮件内容',
  `reset_password_url` string COMMENT '文章url',
  `apply_source` int COMMENT '申请来源:1-网站  2-手机wap',
  `valid_code` string COMMENT '加密链接',
  `type_id` int COMMENT '验证类型(1-修改/重置密码2-账号验证3-手机快捷登录4-老患者报到5-短信通知)',
  `apply_time` timestamp COMMENT '申请时间',
  `send_time` timestamp COMMENT '发送时间',
  `confirm_time` timestamp COMMENT '修改确认时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员发送验证码'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_send_code';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_send_message` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `mobile` string COMMENT '手机号',
  `content` string COMMENT '内容',
  `send_time` timestamp COMMENT '发送时间',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `site_id` int COMMENT '站点'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_send_message';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_settlement` (
  `id` bigint COMMENT '',
  `settlement_id` bigint COMMENT '结算单id',
  `customer_id` bigint COMMENT '医生id',
  `settlement_status` int COMMENT '结算单状态1-已结算2-未结算3-结算过期4-结算异常',
  `settlement_amount` decimal COMMENT '结算金额',
  `settlement_time` timestamp COMMENT '结算时间',
  `settlement_month` string COMMENT '结算月份(2017-07)',
  `settlement_reason` string COMMENT '结算描述',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_settlement';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_settlement_order` (
  `id` bigint COMMENT '',
  `settlement_id` bigint COMMENT '结算单id',
  `order_id` string COMMENT '订单',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_settlement_order';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_share` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `session_id` string COMMENT '用户session_id',
  `share_type` int COMMENT '分享类型（1-人）',
  `share_scene` int COMMENT '分享场景(1-个人主页)',
  `share_content` string COMMENT '分享内容',
  `resource_id` bigint COMMENT '资源id',
  `resource_type` bigint COMMENT '资源类型',
  `resource_url` string COMMENT '分享地址',
  `share_channel` int COMMENT '分享渠道（1-QQ空间，2-QQ好友，3-新浪微博，4-微信好友，5-微信朋友圈 ，6短信，7-邮件）',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '发送渠道',
  `is_valid` int COMMENT '是否有效（0-无效 1-有效）'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_share';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_status` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `status` int COMMENT '0-在线1-离开2-退出',
  `op_date` timestamp COMMENT '操作时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述',
  `site_id` int COMMENT '操作站点  17-患者微信、18-分诊平台、19-会诊Android、20-会诊IOS'
) COMMENT '会员在线状态'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_status';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_suggestion` (
  `id` bigint COMMENT '',
  `suggest_id` bigint COMMENT '意见反馈id',
  `customer_id` bigint COMMENT '会员ID',
  `suggestion_type` string COMMENT '反馈类型：0-产品建议1-纠错2-举报3-服务问题4-使用问题5-其他问题',
  `suggestion_content` string COMMENT '建议内容',
  `answer_content` string COMMENT '回复内容',
  `suggestion_numbers` string COMMENT '微信/QQ号',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效0-无效，1-有效',
  `send_site_id` int COMMENT '站点',
  `sign_state` int COMMENT '标记状态:0没解决 1已解决 2无法联系 3已沟通，后续做优化 4已沟通，暂无法解决 5其他',
  `suggestion_operation` int COMMENT '反馈操作：1在线回复 2已电话联系 3QQ/微信联系',
  `suggestion_log` string COMMENT '反馈记录',
  `suggestion_time` timestamp COMMENT '反馈时间',
  `dispose_remark` string COMMENT '处理备注',
  `system_version` string COMMENT '提交客户端版本信息',
  `equipment_version` string COMMENT '提交客户端设备版本信息',
  `network_environment` string COMMENT '提交客户端网络环境(2G、3G、4G等)',
  `doctor_id` bigint COMMENT '医生id'
) COMMENT '意见反馈'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_suggestion';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_unite` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `customer_role` int COMMENT '认证角色(0-游客(权限控制使用) 5-普通用户(权限控制使用)11-会诊认证医生)',
  `nickname` string COMMENT '昵称',
  `passwd` string COMMENT '密码',
  `init_passwd` string COMMENT '明码密码',
  `mobile` string COMMENT '手机号',
  `unite_time_mobile` timestamp COMMENT '绑定手机时间',
  `email` string COMMENT '邮箱(暂无用)',
  `unite_time_email` timestamp COMMENT '绑定邮箱时间(暂无用)',
  `unite_name_weixin` string COMMENT '微信号',
  `unite_flag_weixin` int COMMENT '状态weixin',
  `unite_time_weixin` timestamp COMMENT '邦定时间',
  `unite_name_allin` string COMMENT '',
  `unite_flag_allin` int COMMENT '状态唯医(1-第一次创建提醒 0-已提醒|不提醒)',
  `unite_time_allin` timestamp COMMENT '邦定时间',
  `unite_id_allin` bigint COMMENT '联合登陆allin_id',
  `unite_flag_caos` int COMMENT '状态CAOS',
  `unite_time_caos` timestamp COMMENT '邦定时间',
  `unite_id_caos` bigint COMMENT '联合登陆CAOS',
  `check_email_time` timestamp COMMENT '验证邮箱时间(暂无用)',
  `check_mobile_time` timestamp COMMENT '验证手机时间',
  `is_check_email` int COMMENT '是否验证邮箱',
  `is_check_mobile` int COMMENT '是否验证手机',
  `regist_time` timestamp COMMENT '注册时间',
  `regist_type` int COMMENT '注册方式(0-正常注册,1-唯医联合登陆注册,2-微信联合登录注册,3-CAOS联合登录注册)',
  `is_test` int COMMENT '是否测试账号0-否1-是',
  `customer_type` int COMMENT '0-患者1-分诊医生2-医生',
  `im_token` string COMMENT 'IM账号token',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员登陆信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_unite';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_unite612` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `customer_role` int COMMENT '认证角色(0-游客(权限控制使用) 5-普通用户(权限控制使用)11-会诊认证医生)',
  `nickname` string COMMENT '昵称',
  `passwd` string COMMENT '密码',
  `init_passwd` string COMMENT '明码密码',
  `mobile` string COMMENT '手机号',
  `unite_time_mobile` timestamp COMMENT '绑定手机时间',
  `email` string COMMENT '邮箱(暂无用)',
  `unite_time_email` timestamp COMMENT '绑定邮箱时间(暂无用)',
  `unite_name_weixin` string COMMENT '微信号',
  `unite_flag_weixin` int COMMENT '状态weixin',
  `unite_time_weixin` timestamp COMMENT '邦定时间',
  `unite_name_allin` string COMMENT '',
  `unite_flag_allin` int COMMENT '状态唯医(1-第一次创建提醒 0-已提醒|不提醒)',
  `unite_time_allin` timestamp COMMENT '邦定时间',
  `unite_id_allin` bigint COMMENT '联合登陆allin_id',
  `unite_flag_caos` int COMMENT '状态CAOS',
  `unite_time_caos` timestamp COMMENT '邦定时间',
  `unite_id_caos` bigint COMMENT '联合登陆CAOS',
  `check_email_time` timestamp COMMENT '验证邮箱时间(暂无用)',
  `check_mobile_time` timestamp COMMENT '验证手机时间',
  `is_check_email` int COMMENT '是否验证邮箱',
  `is_check_mobile` int COMMENT '是否验证手机',
  `regist_time` timestamp COMMENT '注册时间',
  `regist_type` int COMMENT '注册方式(0-正常注册,1-唯医联合登陆注册,2-微信联合登录注册,3-CAOS联合登录注册)',
  `is_test` int COMMENT '是否测试账号0-否1-是',
  `customer_type` int COMMENT '0-患者1-分诊医生2-医生',
  `im_token` string COMMENT 'IM账号token',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员登陆信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_unite612';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_customer_unite_info` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `unite_id` int COMMENT '渠道id(4-微信)',
  `unite_info` string COMMENT '渠道信息',
  `unite_follow_state` int COMMENT '是否关注渠道信息',
  `unite_openid` string COMMENT '渠道唯一id',
  `unite_uuid` string COMMENT '联合id（用来关联其他平台）',
  `unite_nickname` string COMMENT '渠道中昵称',
  `unite_sex` int COMMENT '渠道中性别',
  `unite_language` string COMMENT '渠道中语言',
  `unite_head_logo` string COMMENT '渠道头像链接',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `unite_remark` string COMMENT '备注',
  `unite_follow_time` timestamp COMMENT '关注时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建日期'
) COMMENT '会诊渠道登录拓展信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_customer_unite_info';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_doctor_scheduling` (
  `id` bigint COMMENT '',
  `schedule_id` bigint COMMENT '排班id',
  `outp_type_name` string COMMENT '门诊类别名称',
  `registration_fee` decimal COMMENT '挂号费 Dec(10,2)小数点后保留2 位',
  `clinic_fee` decimal COMMENT '诊疗费  Dec(10,2)小数点后保留2 位',
  `reserve_flag` int COMMENT '预约状态 int1:可挂2:已满3:停号4:可约5:过期6:未开7:分时',
  `outp_date` timestamp COMMENT '时间',
  `time_interval` string COMMENT '时间段  AM：上午 PM：下午AL：全天',
  `hospital_id` string COMMENT '医院编号',
  `hospital_name` string COMMENT '医院名称',
  `dept_code` string COMMENT '科室编号',
  `dept_name` string COMMENT '科室名称',
  `doctor_no` string COMMENT '医生编号',
  `doctor_name` string COMMENT '医生姓名',
  `doctor_title` string COMMENT '职务职称 如：教授、主任等',
  `schedule_list` string COMMENT '坐诊安排  如：周一上午|周二下午|周三下午',
  `specialty` string COMMENT '专家特长 如：风湿，关节疼痛，肌肉萎缩',
  `doctor_desc` string COMMENT '医生信息',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '医生排班信息表（数据来源于第三方，如：银川市第一人民医院）'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_doctor_scheduling';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_education_message` (
  `id` bigint COMMENT '',
  `message_id` bigint COMMENT '消息ID',
  `customer_id` bigint COMMENT '医生ID',
  `education_id` bigint COMMENT '患教ID',
  `message_content` string COMMENT '系统消息正文',
  `site_id` int COMMENT '操作来源',
  `is_valid` int COMMENT '是否有效 0-无效、1-有效',
  `is_send` int COMMENT '是否发送(-1-已发送、0-未发送、1-发送中、2-已取消)',
  `send_type` int COMMENT '发送类型(1-立即发送、2-定时发送)',
  `send_time` timestamp COMMENT '发送时间',
  `last_update_time` timestamp COMMENT '更改时间',
  `create_time` timestamp COMMENT '创建时间(yyyy-mm-dd  hh:mm:ss)'
) COMMENT '患教消息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_education_message';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_education_message_customer` (
  `id` bigint COMMENT '',
  `message_id` bigint COMMENT '系统消息id',
  `patient_customer_id` bigint COMMENT '微信会员id',
  `patient_id` bigint COMMENT '患者id',
  `case_id` bigint COMMENT '病例id',
  `create_time` timestamp COMMENT '创建时间(yyyy-mm-dd  hh:mm:ss)',
  `is_valid` int COMMENT '是否有效 0-无效、1-有效'
) COMMENT '患教消息用户表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_education_message_customer';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_hostipal_relation` (
  `id` bigint COMMENT '',
  `allin_hospital_id` bigint COMMENT '唯医-医院id',
  `hospital_id` string COMMENT '第三方医院id',
  `hospital_name` string COMMENT '第三方医院名称',
  `hospital_addr` string COMMENT '第三方医院地址',
  `hospital_level_name` int COMMENT '医院等级',
  `hospital_bigpic_url` string COMMENT '医院图片',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '唯医医院于第三方医院的关系'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_hostipal_relation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_baseinfo` (
  `id` bigint COMMENT '',
  `patient_id` bigint COMMENT '患者id',
  `patient_name` string COMMENT '患者名称',
  `nation` string COMMENT '民族',
  `is_marriage` int COMMENT '婚姻状况1-未婚2-已婚3-丧偶',
  `fertility` string COMMENT '生育状况',
  `is_smoke` int COMMENT '吸烟史1-从不吸烟2-曾经吸烟3-偶尔吸烟4-经常吸烟',
  `is_drink` int COMMENT '饮酒史1-从不喝酒2-曾经喝酒3-偶尔喝酒4-经常喝酒',
  `is_narcotics` int COMMENT '毒品接触史1-无2-有',
  `workplace` string COMMENT '工作单位',
  `home_address` string COMMENT '家庭住址',
  `mobile` string COMMENT '手机号',
  `parent_status` int COMMENT '父母状况1-父母健在2-父亲已故3-母亲已故4-父母已故',
  `siblings_status` int COMMENT '兄弟姐妹状况1-健康2-患病3-严重患病4-身体残疾',
  `spouse_status` int COMMENT '配偶状况1-健康2-患病3-严重患病4-身体残疾',
  `children_status` int COMMENT '子女状况1-健康2-患病3-严重患病4-身体残疾',
  `marriage_age` int COMMENT '结婚年龄',
  `is_infection` int COMMENT '家中传染病0-无1-肝炎2-结核3-非典4-流脑5-其他',
  `is_heredopathia` int COMMENT '家中遗传病0-无1-血友病2-白化病3-红斑狼疮4-美尼尔综合征5-其他',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `idcard_status` int COMMENT '身份证验证状态：0-待验证1-验证通过2-验证不通过',
  `certificate_id` int COMMENT '证件类型id',
  `certificate_code` string COMMENT '证件号码',
  `remark` string COMMENT '备注',
  `province_id` int COMMENT '所在地省id',
  `province` string COMMENT '所在地省',
  `city_id` int COMMENT '所在地市id',
  `city` string COMMENT '所在地市',
  `district_id` int COMMENT '所在地区/县id',
  `district` string COMMENT '所在地区/县',
  `social_province_id` int COMMENT '社保省id',
  `social_province` string COMMENT '社保省',
  `social_city_id` int COMMENT '社保市id',
  `social_city` string COMMENT '社保市',
  `social_district_id` int COMMENT '社保区/县id',
  `social_district` string COMMENT '社保区/县',
  `social_id` int COMMENT '社保类型id',
  `birthplace_province_id` int COMMENT '出生地省id',
  `birthplace_province` string COMMENT '出生地省',
  `birthplace_city_id` int COMMENT '出生地市id',
  `birthplace_city` string COMMENT '出生地市',
  `birthplace_district_id` int COMMENT '出生地区/县id',
  `birthplace_district` string COMMENT '出生地区/县',
  `patient_age` int COMMENT '患者年纪',
  `patient_sex` int COMMENT '性别1-男2-女',
  `patient_logo_url` string COMMENT '患者头像',
  `native_province_id` int COMMENT '籍贯省id',
  `native_province` string COMMENT '籍贯省',
  `native_city_id` int COMMENT '籍贯市id',
  `native_city` string COMMENT '籍贯市',
  `native_district_id` int COMMENT '籍贯区/县id',
  `native_district` string COMMENT '籍贯区/县',
  `patient_birthday` timestamp COMMENT '患者出生日期'
) COMMENT '患者基本信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_baseinfo';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_baseinfo_20180725` (
  `id` bigint COMMENT '',
  `patient_id` bigint COMMENT '患者id',
  `patient_name` string COMMENT '患者名称',
  `nation` string COMMENT '民族',
  `is_marriage` int COMMENT '婚姻状况1-未婚2-已婚3-丧偶',
  `fertility` string COMMENT '生育状况',
  `is_smoke` int COMMENT '吸烟史1-从不吸烟2-曾经吸烟3-偶尔吸烟4-经常吸烟',
  `is_drink` int COMMENT '饮酒史1-从不喝酒2-曾经喝酒3-偶尔喝酒4-经常喝酒',
  `is_narcotics` int COMMENT '毒品接触史1-无2-有',
  `workplace` string COMMENT '工作单位',
  `home_address` string COMMENT '家庭住址',
  `mobile` string COMMENT '手机号',
  `parent_status` int COMMENT '父母状况1-父母健在2-父亲已故3-母亲已故4-父母已故',
  `siblings_status` int COMMENT '兄弟姐妹状况1-健康2-患病3-严重患病4-身体残疾',
  `spouse_status` int COMMENT '配偶状况1-健康2-患病3-严重患病4-身体残疾',
  `children_status` int COMMENT '子女状况1-健康2-患病3-严重患病4-身体残疾',
  `marriage_age` int COMMENT '结婚年龄',
  `is_infection` int COMMENT '家中传染病0-无1-肝炎2-结核3-非典4-流脑5-其他',
  `is_heredopathia` int COMMENT '家中遗传病0-无1-血友病2-白化病3-红斑狼疮4-美尼尔综合征5-其他',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `idcard_status` int COMMENT '身份证验证状态：0-待验证1-验证通过2-验证不通过',
  `certificate_id` int COMMENT '证件类型id',
  `certificate_code` string COMMENT '证件号码',
  `remark` string COMMENT '备注',
  `province_id` int COMMENT '所在地省id',
  `province` string COMMENT '所在地省',
  `city_id` int COMMENT '所在地市id',
  `city` string COMMENT '所在地市',
  `district_id` int COMMENT '所在地区/县id',
  `district` string COMMENT '所在地区/县',
  `social_province_id` int COMMENT '社保省id',
  `social_province` string COMMENT '社保省',
  `social_city_id` int COMMENT '社保市id',
  `social_city` string COMMENT '社保市',
  `social_district_id` int COMMENT '社保区/县id',
  `social_district` string COMMENT '社保区/县',
  `social_id` int COMMENT '社保类型id',
  `birthplace_province_id` int COMMENT '出生地省id',
  `birthplace_province` string COMMENT '出生地省',
  `birthplace_city_id` int COMMENT '出生地市id',
  `birthplace_city` string COMMENT '出生地市',
  `birthplace_district_id` int COMMENT '出生地区/县id',
  `birthplace_district` string COMMENT '出生地区/县',
  `patient_age` int COMMENT '患者年纪',
  `patient_sex` int COMMENT '性别1-男2-女',
  `patient_logo_url` string COMMENT '患者头像',
  `native_province_id` int COMMENT '籍贯省id',
  `native_province` string COMMENT '籍贯省',
  `native_city_id` int COMMENT '籍贯市id',
  `native_city` string COMMENT '籍贯市',
  `native_district_id` int COMMENT '籍贯区/县id',
  `native_district` string COMMENT '籍贯区/县',
  `patient_birthday` timestamp COMMENT '患者出生日期'
) COMMENT '患者基本信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_baseinfo_20180725';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_baseinfo_20180810` (
  `id` bigint COMMENT '',
  `patient_id` bigint COMMENT '患者id',
  `patient_name` string COMMENT '患者名称',
  `nation` string COMMENT '民族',
  `is_marriage` int COMMENT '婚姻状况1-未婚2-已婚3-丧偶',
  `fertility` string COMMENT '生育状况',
  `is_smoke` int COMMENT '吸烟史1-从不吸烟2-曾经吸烟3-偶尔吸烟4-经常吸烟',
  `is_drink` int COMMENT '饮酒史1-从不喝酒2-曾经喝酒3-偶尔喝酒4-经常喝酒',
  `is_narcotics` int COMMENT '毒品接触史1-无2-有',
  `workplace` string COMMENT '工作单位',
  `home_address` string COMMENT '家庭住址',
  `mobile` string COMMENT '手机号',
  `parent_status` int COMMENT '父母状况1-父母健在2-父亲已故3-母亲已故4-父母已故',
  `siblings_status` int COMMENT '兄弟姐妹状况1-健康2-患病3-严重患病4-身体残疾',
  `spouse_status` int COMMENT '配偶状况1-健康2-患病3-严重患病4-身体残疾',
  `children_status` int COMMENT '子女状况1-健康2-患病3-严重患病4-身体残疾',
  `marriage_age` int COMMENT '结婚年龄',
  `is_infection` int COMMENT '家中传染病0-无1-肝炎2-结核3-非典4-流脑5-其他',
  `is_heredopathia` int COMMENT '家中遗传病0-无1-血友病2-白化病3-红斑狼疮4-美尼尔综合征5-其他',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `idcard_status` int COMMENT '身份证验证状态：0-待验证1-验证通过2-验证不通过',
  `certificate_id` int COMMENT '证件类型id',
  `certificate_code` string COMMENT '证件号码',
  `remark` string COMMENT '备注',
  `province_id` int COMMENT '所在地省id',
  `province` string COMMENT '所在地省',
  `city_id` int COMMENT '所在地市id',
  `city` string COMMENT '所在地市',
  `district_id` int COMMENT '所在地区/县id',
  `district` string COMMENT '所在地区/县',
  `social_province_id` int COMMENT '社保省id',
  `social_province` string COMMENT '社保省',
  `social_city_id` int COMMENT '社保市id',
  `social_city` string COMMENT '社保市',
  `social_district_id` int COMMENT '社保区/县id',
  `social_district` string COMMENT '社保区/县',
  `social_id` int COMMENT '社保类型id',
  `birthplace_province_id` int COMMENT '出生地省id',
  `birthplace_province` string COMMENT '出生地省',
  `birthplace_city_id` int COMMENT '出生地市id',
  `birthplace_city` string COMMENT '出生地市',
  `birthplace_district_id` int COMMENT '出生地区/县id',
  `birthplace_district` string COMMENT '出生地区/县',
  `patient_age` int COMMENT '患者年纪',
  `patient_sex` int COMMENT '性别1-男2-女',
  `patient_logo_url` string COMMENT '患者头像',
  `native_province_id` int COMMENT '籍贯省id',
  `native_province` string COMMENT '籍贯省',
  `native_city_id` int COMMENT '籍贯市id',
  `native_city` string COMMENT '籍贯市',
  `native_district_id` int COMMENT '籍贯区/县id',
  `native_district` string COMMENT '籍贯区/县',
  `patient_birthday` timestamp COMMENT '患者出生日期'
) COMMENT '患者基本信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_baseinfo_20180810';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_baseinfo_201808101715` (
  `id` bigint COMMENT '',
  `patient_id` bigint COMMENT '患者id',
  `patient_name` string COMMENT '患者名称',
  `nation` string COMMENT '民族',
  `is_marriage` int COMMENT '婚姻状况1-未婚2-已婚3-丧偶',
  `fertility` string COMMENT '生育状况',
  `is_smoke` int COMMENT '吸烟史1-从不吸烟2-曾经吸烟3-偶尔吸烟4-经常吸烟',
  `is_drink` int COMMENT '饮酒史1-从不喝酒2-曾经喝酒3-偶尔喝酒4-经常喝酒',
  `is_narcotics` int COMMENT '毒品接触史1-无2-有',
  `workplace` string COMMENT '工作单位',
  `home_address` string COMMENT '家庭住址',
  `mobile` string COMMENT '手机号',
  `parent_status` int COMMENT '父母状况1-父母健在2-父亲已故3-母亲已故4-父母已故',
  `siblings_status` int COMMENT '兄弟姐妹状况1-健康2-患病3-严重患病4-身体残疾',
  `spouse_status` int COMMENT '配偶状况1-健康2-患病3-严重患病4-身体残疾',
  `children_status` int COMMENT '子女状况1-健康2-患病3-严重患病4-身体残疾',
  `marriage_age` int COMMENT '结婚年龄',
  `is_infection` int COMMENT '家中传染病0-无1-肝炎2-结核3-非典4-流脑5-其他',
  `is_heredopathia` int COMMENT '家中遗传病0-无1-血友病2-白化病3-红斑狼疮4-美尼尔综合征5-其他',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `idcard_status` int COMMENT '身份证验证状态：0-待验证1-验证通过2-验证不通过',
  `certificate_id` int COMMENT '证件类型id',
  `certificate_code` string COMMENT '证件号码',
  `remark` string COMMENT '备注',
  `province_id` int COMMENT '所在地省id',
  `province` string COMMENT '所在地省',
  `city_id` int COMMENT '所在地市id',
  `city` string COMMENT '所在地市',
  `district_id` int COMMENT '所在地区/县id',
  `district` string COMMENT '所在地区/县',
  `social_province_id` int COMMENT '社保省id',
  `social_province` string COMMENT '社保省',
  `social_city_id` int COMMENT '社保市id',
  `social_city` string COMMENT '社保市',
  `social_district_id` int COMMENT '社保区/县id',
  `social_district` string COMMENT '社保区/县',
  `social_id` int COMMENT '社保类型id',
  `birthplace_province_id` int COMMENT '出生地省id',
  `birthplace_province` string COMMENT '出生地省',
  `birthplace_city_id` int COMMENT '出生地市id',
  `birthplace_city` string COMMENT '出生地市',
  `birthplace_district_id` int COMMENT '出生地区/县id',
  `birthplace_district` string COMMENT '出生地区/县',
  `patient_age` int COMMENT '患者年纪',
  `patient_sex` int COMMENT '性别1-男2-女',
  `patient_logo_url` string COMMENT '患者头像',
  `native_province_id` int COMMENT '籍贯省id',
  `native_province` string COMMENT '籍贯省',
  `native_city_id` int COMMENT '籍贯市id',
  `native_city` string COMMENT '籍贯市',
  `native_district_id` int COMMENT '籍贯区/县id',
  `native_district` string COMMENT '籍贯区/县',
  `patient_birthday` timestamp COMMENT '患者出生日期'
) COMMENT '患者基本信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_baseinfo_201808101715';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_case` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `customer_id` bigint COMMENT '会员id',
  `patient_id` bigint COMMENT '患者id',
  `case_type` int COMMENT '类型0-咨询1-复诊2-手术直约3-首诊4-手术犹豫5-待通知入院6-已通知入院7-住院中8-已出院9-术后复诊10-老患者报到(诊后报道)11-立即问诊',
  `treatment_hospital_id` bigint COMMENT '曾治疗医院id',
  `treatment_hospital` string COMMENT '曾治疗医院',
  `illness_history_id` bigint COMMENT '曾确诊疾病id',
  `illness_history` string COMMENT '曾确诊疾病名称',
  `create_time` timestamp COMMENT '创建时间',
  `last_update_time` timestamp COMMENT '更改时间',
  `is_valid` int COMMENT '',
  `state` int COMMENT '就诊状态0-未就诊1-已就诊(患者上传完检查检验后)2-需手术3-待检查',
  `triage_state` int COMMENT '分诊状态1-沟通中2-已结束3-被退回',
  `site_id` int COMMENT '发送渠道',
  `occurrence_duration` string COMMENT '症状发生时长',
  `aggravation_duration` string COMMENT '症状加重时长',
  `is_ague` int COMMENT '是否寒战0-无1-有',
  `is_wound_secretion` int COMMENT '伤口分泌物0-无1-有',
  `parent_id` bigint COMMENT '',
  `doctor_id` bigint COMMENT '心仪的医生',
  `doctor_status` string COMMENT '匹配状态:0-默认1-匹配 2-不匹配',
  `doctor_refuse_reason` string COMMENT '拒绝原因',
  `remark` string COMMENT '备注',
  `full_path` string COMMENT '父级路径',
  `main_part` string COMMENT '患者病例主要症状部位',
  `im_token` string COMMENT '云信token，最大长度128',
  `case_time` timestamp COMMENT '病例时间',
  `operator_type` int COMMENT '操作人类型0-患者1-医生',
  `case_category` int COMMENT '病例类别0-咨询1-复诊2-手术直约3-老患者报到(诊后报道)4-医生添加5-立即问诊',
  `take_medicine` string COMMENT '服用药物',
  `complication` string COMMENT '伴随症状',
  `channel_type` int COMMENT '1-普通微信扫码;2-扫描医生二维码',
  `channel_id` bigint COMMENT '关注渠道ID',
  `description_disease` string COMMENT '病情描述',
  `need_help` string COMMENT '想要获得的帮助',
  `physical_no` string COMMENT '美年体检号(唯一编码)'
) COMMENT '患者病例表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_case';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_case_attachment` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `case_att_name` string COMMENT '附件说明（图片标题等）',
  `case_category_id` bigint COMMENT '附件类别：1-X光片2-CT3-超声4-核磁共振5-病理6-检查结果7-其他8-曾就诊病理,医生端(9-专科检查10-化验及特殊检查11-体格检查)12-患处照片',
  `case_att_type` int COMMENT '附件类型：1-图片，2-视频,,4-视频缩略图......',
  `case_att_size` string COMMENT '附件大小：KB',
  `case_att_format` string COMMENT '附件格式：jpg、mp4...',
  `case_att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、8-480*320、9-1280*720、10-900*600、12-300*200、13-450*300、14-750*500、14-100*100)',
  `case_att_height` string COMMENT '附件高度',
  `case_att_width` string COMMENT '附件宽度',
  `case_att_url` string COMMENT '附件url',
  `upload_time` timestamp COMMENT '附件上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功,3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `play_num` bigint COMMENT '播放次数',
  `play_time` string COMMENT '播放时长',
  `case_att_source` int COMMENT '附件来源0-就医辅助(检查资料)1-视诊2-初诊建议3-检查检验4-患处照片5-分诊检查资料6-分诊患病处照片7-患者IM照片8-分诊医生IM图片9-主治医生IM图片10-患者IM视频11-分诊医生IM视频12-主治医生IM视频13-患者IM文件14-分诊医生IM文件15-主治医生IM文件',
  `msgid_server` string COMMENT '服务端消息id',
  `msgid_client` string COMMENT ''
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_case_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_case_chat` (
  `id` bigint COMMENT '',
  `event_type` int COMMENT '消息类型',
  `conv_type` string COMMENT '会话具体类型PERSON（二人会话数据）、TEAM（群聊数据）、CUSTOM_PERSON（个人自定义系统通知）、CUSTOM_TEAM（群组自定义系统通知）',
  `receive_account` string COMMENT '消息接收者的用户账号',
  `from_account` string COMMENT '消息发送者的用户账号',
  `from_client_type` string COMMENT '发送客户端类型： AOS、IOS、PC、WINPHONE、WEB、REST',
  `from_deviceId` string COMMENT '发送端设备id',
  `from_nick` string COMMENT '发送方昵称',
  `msg_timestamp` bigint COMMENT '消息发送时间',
  `msg_type` string COMMENT '会话具体类型TEXT、PICTURE、AUDIO、VIDEO、LOCATION 、NOTIFICATION、FILE...',
  `msgid_client` string COMMENT '客户端生成的消息id，仅在convType为PERSON或TEAM含此字段，字符串类型',
  `msgid_server` string COMMENT '服务端生成的消息id，可转为Long型数据',
  `body` string COMMENT '消息内容',
  `resend_flag` int COMMENT '重发标记：0不是重发, 1是重发。仅在convType为PERSON或TEAM时含此字段',
  `custom_safe_flag` int COMMENT '自定义系统通知消息是否存离线:0：不存，1：存。',
  `antispam` int COMMENT '标识是否被反垃圾0-未被反垃圾1-被反垃圾',
  `att_url` string COMMENT '附件url',
  `att_ext` string COMMENT '附件类型',
  `att_size` bigint COMMENT '附件大小',
  `att_name` string COMMENT '附件名称',
  `att_length` bigint COMMENT '附件时长',
  `att_higth` bigint COMMENT '附件高',
  `att_width` bigint COMMENT '附件宽',
  `att_Md` string COMMENT '附件MD5',
  `is_read` int COMMENT '是否已读1-已读0-未读',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `create_time` timestamp COMMENT '创建时间',
  `session_id` string COMMENT '聊天唯一ID',
  `consultation_type` int COMMENT '会诊类型0：患者-分诊平台1：患者-医生',
  `customer_id` bigint COMMENT '会员id',
  `message_type` int COMMENT '消息类型0-TEXT、1-IMAGE、2-AUDIO、3-VIDEO、4-LOCATION、5-NOTIFICATION、6-FILE、10-TIP、11-ROBOT、20-患者购买问诊（申请免费问诊 notification  actionType :1）、21-诊后报道（notification actionType :6）、22-赠送咨询（notification actionType :2）、23-拒绝咨询（notification actionType :3）、24-问诊结束（notification actionType :5）、25-接受咨询（notification actionType :4）、26-门诊邀约（outpatientInvite）、27-问诊病例（medicalReport）、28-住院通知、29-处方单、30-手术单、31-更新手术单、32-提示分诊台发送消息（new-health）、33-支付回调成功（payFinishTips）、34-视诊pc（videotriage）、35-检查检验 pc（checkSuggestion）、36-初诊建议 pc（previewSuggestion）、37-撤回消息（deleteMsgTips）、38-多图文件（multipleImage）、39-视诊wap（triageSendTips actionType video/image）、40-检查检验 wap（checkSuggestionSendTips）、41-初诊建议 wap（**********）、42-接诊退诊（triagePatientTips）',
  `case_id` bigint COMMENT '病例ID',
  `custom_apns_text` string COMMENT '自定义系统通知消息推送文本。仅在convType为CUSTOM_PERSON或CUSTOM_TEAM时含此字段，字符串类型',
  `ext` string COMMENT '消息扩展字段
'
) COMMENT '聊天记录表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_case_chat';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_case_chat_20171227` (
  `id` bigint COMMENT '',
  `event_type` int COMMENT '消息类型',
  `conv_type` string COMMENT '会话具体类型PERSON（二人会话数据）、TEAM（群聊数据）、CUSTOM_PERSON（个人自定义系统通知）、CUSTOM_TEAM（群组自定义系统通知）',
  `receive_account` string COMMENT '消息接收者的用户账号',
  `from_account` string COMMENT '消息发送者的用户账号',
  `from_client_type` string COMMENT '发送客户端类型： AOS、IOS、PC、WINPHONE、WEB、REST',
  `from_deviceId` string COMMENT '发送端设备id',
  `from_nick` string COMMENT '发送方昵称',
  `msg_timestamp` bigint COMMENT '消息发送时间',
  `msg_type` string COMMENT '会话具体类型TEXT、PICTURE、AUDIO、VIDEO、LOCATION 、NOTIFICATION、FILE...',
  `msgid_client` string COMMENT '客户端生成的消息id，仅在convType为PERSON或TEAM含此字段，字符串类型',
  `msgid_server` string COMMENT '服务端生成的消息id，可转为Long型数据',
  `body` string COMMENT '消息内容',
  `resend_flag` int COMMENT '重发标记：0不是重发, 1是重发。仅在convType为PERSON或TEAM时含此字段',
  `custom_safe_flag` int COMMENT '自定义系统通知消息是否存离线:0：不存，1：存。',
  `antispam` int COMMENT '标识是否被反垃圾0-未被反垃圾1-被反垃圾',
  `att_url` string COMMENT '附件url',
  `att_ext` string COMMENT '附件类型',
  `att_size` bigint COMMENT '附件大小',
  `att_name` string COMMENT '附件名称',
  `att_length` bigint COMMENT '附件时长',
  `att_higth` bigint COMMENT '附件高',
  `att_width` bigint COMMENT '附件宽',
  `is_read` int COMMENT '是否已读1-已读0-未读',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `create_time` timestamp COMMENT '创建时间',
  `session_id` string COMMENT '聊天唯一ID',
  `consultation_type` int COMMENT '会诊类型0：患者-分诊平台1：患者-医生',
  `customer_id` bigint COMMENT '会员id',
  `message_type` int COMMENT '消息类型0-TEXT、1-IMAGE、2-AUDIO、3-VIDEO、4-LOCATION、5-NOTIFICATION、6-FILE、10-TIP、11-ROBOT、20-患者购买问诊（申请免费问诊 notification  actionType :1）、21-诊后报道（notification actionType :6）、22-赠送咨询（notification actionType :2）、23-拒绝咨询（notification actionType :3）、24-问诊结束（notification actionType :5）、25-接受咨询（notification actionType :4）、26-门诊邀约（outpatientInvite）、27-问诊病例（medicalReport）、28-住院通知、29-处方单、30-手术单、31-更新手术单、32-提示分诊台发送消息（new-health）、33-支付回调成功（payFinishTips）、34-视诊pc（videotriage）、35-检查检验 pc（checkSuggestion）、36-初诊建议 pc（previewSuggestion）、37-撤回消息（deleteMsgTips）、38-多图文件（multipleImage）、39-视诊wap（triageSendTips actionType video/image）、40-检查检验 wap（checkSuggestionSendTips）、41-初诊建议 wap（**********）、42-接诊退诊（triagePatientTips）',
  `case_id` bigint COMMENT '病例ID',
  `custom_apns_text` string COMMENT '自定义系统通知消息推送文本。仅在convType为CUSTOM_PERSON或CUSTOM_TEAM时含此字段，字符串类型',
  `ext` string COMMENT '消息扩展字段
'
) COMMENT '聊天记录表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_case_chat_20171227';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_case_chat_20180109` (
  `id` bigint COMMENT '',
  `event_type` int COMMENT '消息类型',
  `conv_type` string COMMENT '会话具体类型PERSON（二人会话数据）、TEAM（群聊数据）、CUSTOM_PERSON（个人自定义系统通知）、CUSTOM_TEAM（群组自定义系统通知）',
  `receive_account` string COMMENT '消息接收者的用户账号',
  `from_account` string COMMENT '消息发送者的用户账号',
  `from_client_type` string COMMENT '发送客户端类型： AOS、IOS、PC、WINPHONE、WEB、REST',
  `from_deviceId` string COMMENT '发送端设备id',
  `from_nick` string COMMENT '发送方昵称',
  `msg_timestamp` bigint COMMENT '消息发送时间',
  `msg_type` string COMMENT '会话具体类型TEXT、PICTURE、AUDIO、VIDEO、LOCATION 、NOTIFICATION、FILE...',
  `msgid_client` string COMMENT '客户端生成的消息id，仅在convType为PERSON或TEAM含此字段，字符串类型',
  `msgid_server` string COMMENT '服务端生成的消息id，可转为Long型数据',
  `body` string COMMENT '消息内容',
  `resend_flag` int COMMENT '重发标记：0不是重发, 1是重发。仅在convType为PERSON或TEAM时含此字段',
  `custom_safe_flag` int COMMENT '自定义系统通知消息是否存离线:0：不存，1：存。',
  `antispam` int COMMENT '标识是否被反垃圾0-未被反垃圾1-被反垃圾',
  `att_url` string COMMENT '附件url',
  `att_ext` string COMMENT '附件类型',
  `att_size` bigint COMMENT '附件大小',
  `att_name` string COMMENT '附件名称',
  `att_length` bigint COMMENT '附件时长',
  `att_higth` bigint COMMENT '附件高',
  `att_width` bigint COMMENT '附件宽',
  `att_Md` string COMMENT '附件MD5',
  `is_read` int COMMENT '是否已读1-已读0-未读',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `create_time` timestamp COMMENT '创建时间',
  `session_id` string COMMENT '聊天唯一ID',
  `consultation_type` int COMMENT '会诊类型0：患者-分诊平台1：患者-医生',
  `customer_id` bigint COMMENT '会员id',
  `message_type` int COMMENT '消息类型0-TEXT、1-IMAGE、2-AUDIO、3-VIDEO、4-LOCATION、5-NOTIFICATION、6-FILE、10-TIP、11-ROBOT、20-患者购买问诊（申请免费问诊 notification  actionType :1）、21-诊后报道（notification actionType :6）、22-赠送咨询（notification actionType :2）、23-拒绝咨询（notification actionType :3）、24-问诊结束（notification actionType :5）、25-接受咨询（notification actionType :4）、26-门诊邀约（outpatientInvite）、27-问诊病例（medicalReport）、28-住院通知、29-处方单、30-手术单、31-更新手术单、32-提示分诊台发送消息（new-health）、33-支付回调成功（payFinishTips）、34-视诊pc（videotriage）、35-检查检验 pc（checkSuggestion）、36-初诊建议 pc（previewSuggestion）、37-撤回消息（deleteMsgTips）、38-多图文件（multipleImage）、39-视诊wap（triageSendTips actionType video/image）、40-检查检验 wap（checkSuggestionSendTips）、41-初诊建议 wap（**********）、42-接诊退诊（triagePatientTips）',
  `case_id` bigint COMMENT '病例ID',
  `custom_apns_text` string COMMENT '自定义系统通知消息推送文本。仅在convType为CUSTOM_PERSON或CUSTOM_TEAM时含此字段，字符串类型',
  `ext` string COMMENT '消息扩展字段
'
) COMMENT '聊天记录表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_case_chat_20180109';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_case_chat_20180718` (
  `id` bigint COMMENT '',
  `event_type` int COMMENT '消息类型',
  `conv_type` string COMMENT '会话具体类型PERSON（二人会话数据）、TEAM（群聊数据）、CUSTOM_PERSON（个人自定义系统通知）、CUSTOM_TEAM（群组自定义系统通知）',
  `receive_account` string COMMENT '消息接收者的用户账号',
  `from_account` string COMMENT '消息发送者的用户账号',
  `from_client_type` string COMMENT '发送客户端类型： AOS、IOS、PC、WINPHONE、WEB、REST',
  `from_deviceId` string COMMENT '发送端设备id',
  `from_nick` string COMMENT '发送方昵称',
  `msg_timestamp` bigint COMMENT '消息发送时间',
  `msg_type` string COMMENT '会话具体类型TEXT、PICTURE、AUDIO、VIDEO、LOCATION 、NOTIFICATION、FILE...',
  `msgid_client` string COMMENT '客户端生成的消息id，仅在convType为PERSON或TEAM含此字段，字符串类型',
  `msgid_server` string COMMENT '服务端生成的消息id，可转为Long型数据',
  `body` string COMMENT '消息内容',
  `resend_flag` int COMMENT '重发标记：0不是重发, 1是重发。仅在convType为PERSON或TEAM时含此字段',
  `custom_safe_flag` int COMMENT '自定义系统通知消息是否存离线:0：不存，1：存。',
  `antispam` int COMMENT '标识是否被反垃圾0-未被反垃圾1-被反垃圾',
  `att_url` string COMMENT '附件url',
  `att_ext` string COMMENT '附件类型',
  `att_size` bigint COMMENT '附件大小',
  `att_name` string COMMENT '附件名称',
  `att_length` bigint COMMENT '附件时长',
  `att_higth` bigint COMMENT '附件高',
  `att_width` bigint COMMENT '附件宽',
  `att_Md` string COMMENT '附件MD5',
  `is_read` int COMMENT '是否已读1-已读0-未读',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `create_time` timestamp COMMENT '创建时间',
  `session_id` string COMMENT '聊天唯一ID',
  `consultation_type` int COMMENT '会诊类型0：患者-分诊平台1：患者-医生',
  `customer_id` bigint COMMENT '会员id',
  `message_type` int COMMENT '消息类型0-TEXT、1-IMAGE、2-AUDIO、3-VIDEO、4-LOCATION、5-NOTIFICATION、6-FILE、10-TIP、11-ROBOT、20-患者购买问诊（申请免费问诊 notification  actionType :1）、21-诊后报道（notification actionType :6）、22-赠送咨询（notification actionType :2）、23-拒绝咨询（notification actionType :3）、24-问诊结束（notification actionType :5）、25-接受咨询（notification actionType :4）、26-门诊邀约（outpatientInvite）、27-问诊病例（medicalReport）、28-住院通知、29-处方单、30-手术单、31-更新手术单、32-提示分诊台发送消息（new-health）、33-支付回调成功（payFinishTips）、34-视诊pc（videotriage）、35-检查检验 pc（checkSuggestion）、36-初诊建议 pc（previewSuggestion）、37-撤回消息（deleteMsgTips）、38-多图文件（multipleImage）、39-视诊wap（triageSendTips actionType video/image）、40-检查检验 wap（checkSuggestionSendTips）、41-初诊建议 wap（**********）、42-接诊退诊（triagePatientTips）',
  `case_id` bigint COMMENT '病例ID',
  `custom_apns_text` string COMMENT '自定义系统通知消息推送文本。仅在convType为CUSTOM_PERSON或CUSTOM_TEAM时含此字段，字符串类型',
  `ext` string COMMENT '消息扩展字段
'
) COMMENT '聊天记录表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_case_chat_20180718';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_case_diagnosis` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '医生id',
  `patient_id` bigint COMMENT '患者id',
  `case_id` bigint COMMENT '病例id',
  `diagnosis_type` int COMMENT '诊断类型1-分诊初诊2-诊断3-手术',
  `major_id` bigint COMMENT '专业Id',
  `major_name` string COMMENT '专业名称',
  `illness_id` bigint COMMENT '病例id',
  `illness_name` string COMMENT '病例名称',
  `degree_type` bigint COMMENT '疼痛类型（1-暂不确定，2-一级，3-二级，4-三级，5-四级，6-五级）',
  `operation_id` bigint COMMENT '手术id',
  `operation_name` string COMMENT '手术名称',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `diagnosis_id` bigint COMMENT '初诊ID',
  `position_id` bigint COMMENT '位置ID'
) COMMENT '患者初诊建议信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_case_diagnosis';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_case_history` (
  `id` bigint COMMENT '',
  `patient_id` bigint COMMENT '患者id',
  `case_id` bigint COMMENT '病例id',
  `operator_id` bigint COMMENT '操作人',
  `operator_type` int COMMENT '操作人类型0-患者1-医生',
  `case_history_type` int COMMENT '既往史类型0-疾病史1-手术史2-药物史3-外伤史4-过敏史5-疫区接触史',
  `case_history_id_list` string COMMENT '既往史idList',
  `case_history_name` string COMMENT '既往史名称串',
  `case_history_desc` string COMMENT '既往史描述',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `site_id` int COMMENT '发送渠道'
) COMMENT '患者历史健康信息(既往史)'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_case_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_case_hpi` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `patient_id` bigint COMMENT '患者id',
  `produce_reason` string COMMENT '产生诱因',
  `produce_symptoms_id` bigint COMMENT '症状Id',
  `produce_symptoms_name` string COMMENT '症状名称',
  `produce_level_id` bigint COMMENT '程度Id',
  `produce_level_name` string COMMENT '程度名称',
  `produce_sharpen_id` bigint COMMENT '何时加重Id',
  `produce_sharpen_name` string COMMENT '何时加重名称',
  `produce_remit_id` bigint COMMENT '何时缓解Id',
  `produce_remit_name` string COMMENT '何时缓解名称',
  `produce_treatment` string COMMENT '治疗情况',
  `aggravate_reason` string COMMENT '加重诱因',
  `aggravate_symptoms_id` bigint COMMENT '症状Id',
  `aggravate_symptoms_name` string COMMENT '症状名称',
  `aggravate_level_id` bigint COMMENT '程度Id',
  `aggravate_level_name` string COMMENT '程度名称',
  `aggravate_sharpen_id` bigint COMMENT '何时加重Id',
  `aggravate_sharpen_name` string COMMENT '何时加重名称',
  `aggravate_remit_id` bigint COMMENT '何时缓解Id',
  `aggravate_remit_name` string COMMENT '何时缓解名称',
  `aggravate_treatment` string COMMENT '治疗情况',
  `sleep_id` bigint COMMENT '睡眠状况Id',
  `sleep_name` string COMMENT '睡眠状况名称',
  `spirit_id` bigint COMMENT '精神状况Id',
  `spirit_name` string COMMENT '精神状况名称',
  `appetite_id` bigint COMMENT '食欲状况Id',
  `appetite_name` string COMMENT '食欲状况名称',
  `weight_id` bigint COMMENT '体重状况Id',
  `weight_name` string COMMENT '体重状况名称',
  `excretion_id` bigint COMMENT '排泄状况Id',
  `excretion_name` string COMMENT '排泄状况名称',
  `visual_inspection` string COMMENT '视诊',
  `activity_state` string COMMENT '活动状态',
  `muscle_strength` string COMMENT '肌力',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `remark` string COMMENT '备注'
) COMMENT '患者现病史表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_case_hpi';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_case_lable` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `patient_customer_id` bigint COMMENT '患者用户id',
  `patient_id` bigint COMMENT '患者id',
  `major_lable` bigint COMMENT '专业方向标签',
  `illness_lable` bigint COMMENT '疾病标签',
  `part_id_list` string COMMENT '部位标签',
  `is_consultation` int COMMENT '是否就诊过1-是2-否',
  `is_threat_life` int COMMENT '是否危及生命 1-是2-否',
  `is_complication` int COMMENT '是否有合并症并发症1-是2-否',
  `is_operation` int COMMENT '就诊时医生是否告知过需手术1-是2-否',
  `is_treatment` int COMMENT '是否使用药物/进行过保守治疗1-是2-否',
  `is_improve` int COMMENT '治疗后是否有改善1-是2-否',
  `is_adl` int COMMENT '是否影响ADL1-是2-否',
  `att_complete` int COMMENT '资料是否合格1-是2-否',
  `severity` string COMMENT '严重程度1-轻度2-中度3-重度',
  `case_level` int COMMENT '病历级别',
  `score` int COMMENT '分值',
  `op_uesr` string COMMENT '操作人',
  `create_time` timestamp COMMENT '创建时间',
  `last_update_time` timestamp COMMENT '最后修改时间',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `lable_state` int COMMENT '标签状态0-未打过标签1-已打过标签2-分诊医生已推荐'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_case_lable';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_case_lable_20181227` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `patient_customer_id` bigint COMMENT '患者用户id',
  `patient_id` bigint COMMENT '患者id',
  `major_lable` bigint COMMENT '专业方向标签',
  `illness_lable` bigint COMMENT '疾病标签',
  `part_id_list` string COMMENT '部位标签',
  `is_consultation` int COMMENT '是否就诊过1-是2-否',
  `is_threat_life` int COMMENT '是否危及生命 1-是2-否',
  `is_complication` int COMMENT '是否有合并症并发症1-是2-否',
  `is_operation` int COMMENT '就诊时医生是否告知过需手术1-是2-否',
  `is_treatment` int COMMENT '是否使用药物/进行过保守治疗1-是2-否',
  `is_improve` int COMMENT '治疗后是否有改善1-是2-否',
  `is_adl` int COMMENT '是否影响ADL1-是2-否',
  `att_complete` int COMMENT '资料是否合格1-是2-否',
  `severity` string COMMENT '严重程度1-轻度2-中度3-重度',
  `case_level` int COMMENT '病历级别',
  `score` int COMMENT '分值',
  `op_uesr` string COMMENT '操作人',
  `create_time` timestamp COMMENT '创建时间',
  `last_update_time` timestamp COMMENT '最后修改时间',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `lable_state` int COMMENT '标签状态0-未打过标签1-已打过标签2-分诊医生已推荐'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_case_lable_20181227';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_case_option` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `patient_id` bigint COMMENT '患者id',
  `part_id` bigint COMMENT '部位id',
  `question_id` bigint COMMENT '问题id',
  `option_id_list` string COMMENT '选项id用户的选择(ID,ID)',
  `main_option_id` string COMMENT '',
  `option_desc` string COMMENT '选项描述',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '',
  `site_id` int COMMENT '发送渠道',
  `create_time` timestamp COMMENT '创建时间',
  `ref_option_id` bigint COMMENT '父级选项id',
  `option_remark` string COMMENT '病例选项备注'
) COMMENT '患者症状描述信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_case_option';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_case_physical` (
  `id` bigint COMMENT '',
  `patient_id` bigint COMMENT '患者id',
  `case_id` bigint COMMENT '病例id',
  `height` string COMMENT '身高',
  `weight` string COMMENT '体重',
  `blood_pressure_high` string COMMENT '血压高',
  `blood_pressure_low` string COMMENT '血压低',
  `breathing` string COMMENT '呼吸',
  `pulse` string COMMENT '脉搏',
  `temperature` string COMMENT '体温',
  `body_surface_area` string COMMENT '体表面积',
  `bmi` string COMMENT 'bmi',
  `other` string COMMENT '其他',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效1-有效0-无效'
) COMMENT '患者病例体格检查表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_case_physical';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_case_remark` (
  `id` bigint COMMENT '',
  `patient_id` bigint COMMENT '患者id',
  `case_id` bigint COMMENT '病例id',
  `operator_id` bigint COMMENT '操作人',
  `operator_type` int COMMENT '操作人类型0-患者1-医生',
  `remark_content` string COMMENT '备注正文',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `site_id` int COMMENT '发送渠道'
) COMMENT '患者病例备注信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_case_remark';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_case_supplement` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `customer_id` bigint COMMENT '会员id',
  `main_narrate` string COMMENT '主诉',
  `present_history` string COMMENT '现病史',
  `past_history` string COMMENT '既往史',
  `personal_history` string COMMENT '个人史',
  `family_history` string COMMENT '家族史',
  `allergic_history` string COMMENT '过敏史',
  `site_id` int COMMENT '发送渠道',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '',
  `diagnosis` string COMMENT '诊断',
  `operation` string COMMENT '手术',
  `inspection` string COMMENT '检查检验',
  `special` string COMMENT '特殊检查',
  `physique` string COMMENT '体格检查',
  `inspection_att_id` string COMMENT '检查检验附件',
  `special_att_id` string COMMENT '特殊检查附件',
  `physique_att_id` string COMMENT '体格检查附件',
  `number_type` int COMMENT '编号类型：1-门诊号、2-住院号、3-床位号、4-病案号、5-其他编号',
  `numbers` string COMMENT '编号'
) COMMENT '患者病例信息补充表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_case_supplement';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_customer_follow` (
  `id` bigint COMMENT '',
  `unite_openid` string COMMENT '渠道唯一id',
  `unite_uuid` string COMMENT '联合id（用来关联其他平台）',
  `unite_follow_time` timestamp COMMENT '关注时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建日期',
  `unite_nickname` string COMMENT '',
  `last_update_time` timestamp COMMENT '',
  `tagid_list` string COMMENT ''
) COMMENT '用户关注表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_customer_follow';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_customer_follow_20180307` (
  `id` bigint COMMENT '',
  `unite_openid` string COMMENT '渠道唯一id',
  `unite_uuid` string COMMENT '联合id（用来关联其他平台）',
  `unite_follow_time` timestamp COMMENT '关注时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建日期'
) COMMENT '用户关注表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_customer_follow_20180307';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_customer_follow_20180316` (
  `id` bigint COMMENT '',
  `unite_openid` string COMMENT '渠道唯一id',
  `unite_uuid` string COMMENT '联合id（用来关联其他平台）',
  `unite_follow_time` timestamp COMMENT '关注时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建日期',
  `unite_nickname` string COMMENT '',
  `last_update_time` timestamp COMMENT '',
  `tagid_list` string COMMENT ''
) COMMENT '用户关注表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_customer_follow_20180316';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_customer_follow_20180601` (
  `id` bigint COMMENT '',
  `unite_openid` string COMMENT '渠道唯一id',
  `unite_uuid` string COMMENT '联合id（用来关联其他平台）',
  `unite_follow_time` timestamp COMMENT '关注时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建日期',
  `unite_nickname` string COMMENT '',
  `last_update_time` timestamp COMMENT '',
  `tagid_list` string COMMENT ''
) COMMENT '用户关注表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_customer_follow_20180601';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_customer_follow_20180716` (
  `id` bigint COMMENT '',
  `unite_openid` string COMMENT '渠道唯一id',
  `unite_uuid` string COMMENT '联合id（用来关联其他平台）',
  `unite_follow_time` timestamp COMMENT '关注时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建日期',
  `unite_nickname` string COMMENT '',
  `last_update_time` timestamp COMMENT '',
  `tagid_list` string COMMENT ''
) COMMENT '用户关注表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_customer_follow_20180716';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_customer_unite` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `nickname` string COMMENT '昵称',
  `passwd` string COMMENT '密码',
  `init_passwd` string COMMENT '明码密码',
  `mobile` string COMMENT '手机号',
  `unite_time_mobile` timestamp COMMENT '绑定手机时间',
  `email` string COMMENT '邮箱(暂无用)',
  `unite_time_email` timestamp COMMENT '绑定邮箱时间(暂无用)',
  `unite_name_weixin` string COMMENT '微信号',
  `unite_flag_weixin` int COMMENT '状态weixin',
  `unite_time_weixin` timestamp COMMENT '邦定时间',
  `check_email_time` timestamp COMMENT '验证邮箱时间(暂无用)',
  `check_mobile_time` timestamp COMMENT '验证手机时间',
  `is_check_email` int COMMENT '是否验证邮箱',
  `is_check_mobile` int COMMENT '是否验证手机',
  `regist_channel` int COMMENT '',
  `regist_time` timestamp COMMENT '注册时间',
  `is_test` int COMMENT '是否测试账号0-否1-是',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '患者用户信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_customer_unite';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_customer_unite_20171122` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `nickname` string COMMENT '昵称',
  `passwd` string COMMENT '密码',
  `init_passwd` string COMMENT '明码密码',
  `mobile` string COMMENT '手机号',
  `unite_time_mobile` timestamp COMMENT '绑定手机时间',
  `email` string COMMENT '邮箱(暂无用)',
  `unite_time_email` timestamp COMMENT '绑定邮箱时间(暂无用)',
  `unite_name_weixin` string COMMENT '微信号',
  `unite_flag_weixin` int COMMENT '状态weixin',
  `unite_time_weixin` timestamp COMMENT '邦定时间',
  `check_email_time` timestamp COMMENT '验证邮箱时间(暂无用)',
  `check_mobile_time` timestamp COMMENT '验证手机时间',
  `is_check_email` int COMMENT '是否验证邮箱',
  `is_check_mobile` int COMMENT '是否验证手机',
  `regist_time` timestamp COMMENT '注册时间',
  `is_test` int COMMENT '是否测试账号0-否1-是',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '患者用户信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_customer_unite_20171122';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_customer_unite_20180521` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `nickname` string COMMENT '昵称',
  `passwd` string COMMENT '密码',
  `init_passwd` string COMMENT '明码密码',
  `mobile` string COMMENT '手机号',
  `unite_time_mobile` timestamp COMMENT '绑定手机时间',
  `email` string COMMENT '邮箱(暂无用)',
  `unite_time_email` timestamp COMMENT '绑定邮箱时间(暂无用)',
  `unite_name_weixin` string COMMENT '微信号',
  `unite_flag_weixin` int COMMENT '状态weixin',
  `unite_time_weixin` timestamp COMMENT '邦定时间',
  `check_email_time` timestamp COMMENT '验证邮箱时间(暂无用)',
  `check_mobile_time` timestamp COMMENT '验证手机时间',
  `is_check_email` int COMMENT '是否验证邮箱',
  `is_check_mobile` int COMMENT '是否验证手机',
  `regist_time` timestamp COMMENT '注册时间',
  `is_test` int COMMENT '是否测试账号0-否1-是',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '患者用户信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_customer_unite_20180521';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_customer_unite_20180523` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `nickname` string COMMENT '昵称',
  `passwd` string COMMENT '密码',
  `init_passwd` string COMMENT '明码密码',
  `mobile` string COMMENT '手机号',
  `unite_time_mobile` timestamp COMMENT '绑定手机时间',
  `email` string COMMENT '邮箱(暂无用)',
  `unite_time_email` timestamp COMMENT '绑定邮箱时间(暂无用)',
  `unite_name_weixin` string COMMENT '微信号',
  `unite_flag_weixin` int COMMENT '状态weixin',
  `unite_time_weixin` timestamp COMMENT '邦定时间',
  `check_email_time` timestamp COMMENT '验证邮箱时间(暂无用)',
  `check_mobile_time` timestamp COMMENT '验证手机时间',
  `is_check_email` int COMMENT '是否验证邮箱',
  `is_check_mobile` int COMMENT '是否验证手机',
  `regist_time` timestamp COMMENT '注册时间',
  `is_test` int COMMENT '是否测试账号0-否1-是',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '患者用户信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_customer_unite_20180523';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_customer_unite_20180601` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `nickname` string COMMENT '昵称',
  `passwd` string COMMENT '密码',
  `init_passwd` string COMMENT '明码密码',
  `mobile` string COMMENT '手机号',
  `unite_time_mobile` timestamp COMMENT '绑定手机时间',
  `email` string COMMENT '邮箱(暂无用)',
  `unite_time_email` timestamp COMMENT '绑定邮箱时间(暂无用)',
  `unite_name_weixin` string COMMENT '微信号',
  `unite_flag_weixin` int COMMENT '状态weixin',
  `unite_time_weixin` timestamp COMMENT '邦定时间',
  `check_email_time` timestamp COMMENT '验证邮箱时间(暂无用)',
  `check_mobile_time` timestamp COMMENT '验证手机时间',
  `is_check_email` int COMMENT '是否验证邮箱',
  `is_check_mobile` int COMMENT '是否验证手机',
  `regist_time` timestamp COMMENT '注册时间',
  `is_test` int COMMENT '是否测试账号0-否1-是',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '患者用户信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_customer_unite_20180601';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_customer_unite_20180821` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `nickname` string COMMENT '昵称',
  `passwd` string COMMENT '密码',
  `init_passwd` string COMMENT '明码密码',
  `mobile` string COMMENT '手机号',
  `unite_time_mobile` timestamp COMMENT '绑定手机时间',
  `email` string COMMENT '邮箱(暂无用)',
  `unite_time_email` timestamp COMMENT '绑定邮箱时间(暂无用)',
  `unite_name_weixin` string COMMENT '微信号',
  `unite_flag_weixin` int COMMENT '状态weixin',
  `unite_time_weixin` timestamp COMMENT '邦定时间',
  `check_email_time` timestamp COMMENT '验证邮箱时间(暂无用)',
  `check_mobile_time` timestamp COMMENT '验证手机时间',
  `is_check_email` int COMMENT '是否验证邮箱',
  `is_check_mobile` int COMMENT '是否验证手机',
  `regist_time` timestamp COMMENT '注册时间',
  `is_test` int COMMENT '是否测试账号0-否1-是',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '患者用户信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_customer_unite_20180821';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_customer_unite_info` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `unite_id` int COMMENT '渠道id(4-微信)',
  `unite_info` string COMMENT '渠道信息',
  `unite_follow_state` int COMMENT '是否关注渠道信息',
  `unite_openid` string COMMENT '渠道唯一id',
  `unite_uuid` string COMMENT '联合id（用来关联其他平台）',
  `unite_nickname` string COMMENT '渠道中昵称',
  `unite_sex` int COMMENT '渠道中性别',
  `unite_language` string COMMENT '渠道中语言',
  `unite_head_logo` string COMMENT '渠道头像链接',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `unite_remark` string COMMENT '备注',
  `unite_follow_time` timestamp COMMENT '关注时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建日期'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_customer_unite_info';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_customer_unite_info_20171122` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `unite_id` int COMMENT '渠道id(4-微信)',
  `unite_info` string COMMENT '渠道信息',
  `unite_follow_state` int COMMENT '是否关注渠道信息',
  `unite_openid` string COMMENT '渠道唯一id',
  `unite_uuid` string COMMENT '联合id（用来关联其他平台）',
  `unite_nickname` string COMMENT '渠道中昵称',
  `unite_sex` int COMMENT '渠道中性别',
  `unite_language` string COMMENT '渠道中语言',
  `unite_head_logo` string COMMENT '渠道头像链接',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `unite_remark` string COMMENT '备注',
  `unite_follow_time` timestamp COMMENT '关注时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建日期'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_customer_unite_info_20171122';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_customer_unite_info_20180521` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `unite_id` int COMMENT '渠道id(4-微信)',
  `unite_info` string COMMENT '渠道信息',
  `unite_follow_state` int COMMENT '是否关注渠道信息',
  `unite_openid` string COMMENT '渠道唯一id',
  `unite_uuid` string COMMENT '联合id（用来关联其他平台）',
  `unite_nickname` string COMMENT '渠道中昵称',
  `unite_sex` int COMMENT '渠道中性别',
  `unite_language` string COMMENT '渠道中语言',
  `unite_head_logo` string COMMENT '渠道头像链接',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `unite_remark` string COMMENT '备注',
  `unite_follow_time` timestamp COMMENT '关注时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建日期'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_customer_unite_info_20180521';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_customer_unite_info_20180523` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `unite_id` int COMMENT '渠道id(4-微信)',
  `unite_info` string COMMENT '渠道信息',
  `unite_follow_state` int COMMENT '是否关注渠道信息',
  `unite_openid` string COMMENT '渠道唯一id',
  `unite_uuid` string COMMENT '联合id（用来关联其他平台）',
  `unite_nickname` string COMMENT '渠道中昵称',
  `unite_sex` int COMMENT '渠道中性别',
  `unite_language` string COMMENT '渠道中语言',
  `unite_head_logo` string COMMENT '渠道头像链接',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `unite_remark` string COMMENT '备注',
  `unite_follow_time` timestamp COMMENT '关注时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建日期'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_customer_unite_info_20180523';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_customer_unite_info_20180601` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `unite_id` int COMMENT '渠道id(4-微信)',
  `unite_info` string COMMENT '渠道信息',
  `unite_follow_state` int COMMENT '是否关注渠道信息',
  `unite_openid` string COMMENT '渠道唯一id',
  `unite_uuid` string COMMENT '联合id（用来关联其他平台）',
  `unite_nickname` string COMMENT '渠道中昵称',
  `unite_sex` int COMMENT '渠道中性别',
  `unite_language` string COMMENT '渠道中语言',
  `unite_head_logo` string COMMENT '渠道头像链接',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `unite_remark` string COMMENT '备注',
  `unite_follow_time` timestamp COMMENT '关注时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建日期'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_customer_unite_info_20180601';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_customer_unite_info_20180716` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `unite_id` int COMMENT '渠道id(4-微信)',
  `unite_info` string COMMENT '渠道信息',
  `unite_follow_state` int COMMENT '是否关注渠道信息',
  `unite_openid` string COMMENT '渠道唯一id',
  `unite_uuid` string COMMENT '联合id（用来关联其他平台）',
  `unite_nickname` string COMMENT '渠道中昵称',
  `unite_sex` int COMMENT '渠道中性别',
  `unite_language` string COMMENT '渠道中语言',
  `unite_head_logo` string COMMENT '渠道头像链接',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `unite_remark` string COMMENT '备注',
  `unite_follow_time` timestamp COMMENT '关注时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建日期'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_customer_unite_info_20180716';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_customer_unite_info_20180821` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `unite_id` int COMMENT '渠道id(4-微信)',
  `unite_info` string COMMENT '渠道信息',
  `unite_follow_state` int COMMENT '是否关注渠道信息',
  `unite_openid` string COMMENT '渠道唯一id',
  `unite_uuid` string COMMENT '联合id（用来关联其他平台）',
  `unite_nickname` string COMMENT '渠道中昵称',
  `unite_sex` int COMMENT '渠道中性别',
  `unite_language` string COMMENT '渠道中语言',
  `unite_head_logo` string COMMENT '渠道头像链接',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `unite_remark` string COMMENT '备注',
  `unite_follow_time` timestamp COMMENT '关注时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建日期'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_customer_unite_info_20180821';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_evaluate` (
  `id` bigint COMMENT '',
  `patient_customer_id` bigint COMMENT '患者账号id',
  `patient_id` bigint COMMENT '患者id',
  `doctor_type` int COMMENT '医生类型：1主诊医生 2分诊医生',
  `doctor_id` bigint COMMENT '医生id',
  `consultation_id` bigint COMMENT '工单id',
  `tag_ids` string COMMENT '标签id list',
  `service_star` int COMMENT '服务星级：1星，差，2星，较差3星，不错4星，满意，5星，非常满意',
  `thoughts` string COMMENT '体验感受',
  `experience_star` int COMMENT '体验星级：1星，差，一点没用2星，较差，没解决问题3星，不错，给了一些建议4星，满意，解决了问题5星，非常满意，完美解决了问题',
  `recommend_grasp` int COMMENT '推荐把握分值',
  `recommend_reason` string COMMENT '推荐或不推荐的原因',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '患者评价表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_evaluate';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_evaluate_tag` (
  `id` bigint COMMENT '',
  `patient_customer_id` bigint COMMENT '患者账号id',
  `patient_id` bigint COMMENT '患者id',
  `application_type` int COMMENT '应用场景:0-默认系统标签 1-患者评价主诊医师',
  `service_star` int COMMENT '服务星级：1星，差，2星，较差3星，不错4星，满意，5星，非常满意',
  `tag` string COMMENT '标签',
  `tag_type` int COMMENT '标签类型：0-系统标签 1-患者添加的标签',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '患者评价标签表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_evaluate_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_invite_clinic` (
  `id` bigint COMMENT '',
  `patient_customer_id` bigint COMMENT '患者所属用户id',
  `patient_id` bigint COMMENT '患者id',
  `customer_id` bigint COMMENT '医生id',
  `openid` string COMMENT '渠道唯一id',
  `uuid` string COMMENT '联合id（用来关联其他平台）',
  `state` int COMMENT '邀请状态(0-未通知 1-已通知）',
  `source_type` int COMMENT '邀请来源路径（1-找医生问诊2-轻症问诊）',
  `need_help` string COMMENT '想要获得的帮助',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点id'
) COMMENT '邀请医生开诊表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_invite_clinic';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_recommend` (
  `id` bigint COMMENT '',
  `diagnosis_id` bigint COMMENT '初诊建议id',
  `patient_id` bigint COMMENT '患者id',
  `customer_id` bigint COMMENT '分诊医生id',
  `case_id` bigint COMMENT '病例id',
  `recommend_type` int COMMENT '推荐类型1-医生',
  `recommend_id` bigint COMMENT '推荐资源id',
  `recommend_cause` string COMMENT '推荐原因0-距离近1-top10 2-距离近、top10',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '是否有效1-有效0-无效',
  `refuse_recommend_id` bigint COMMENT '无效推荐医生操作人id（分诊医生id）',
  `refuse_reason` string COMMENT '无效推荐医生原因',
  `refuse_time` timestamp COMMENT '无效推荐医生时间'
) COMMENT '患者推荐医生表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_recommend';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_recovery_advice` (
  `id` bigint COMMENT '',
  `diagnosis_id` bigint COMMENT '初诊建议id',
  `patient_id` bigint COMMENT '患者id',
  `customer_id` bigint COMMENT '分诊医生id',
  `case_id` bigint COMMENT '病例id',
  `type` int COMMENT '0-检查检验1-初诊建议',
  `advice_type` int COMMENT '类型0-处置建议1-检查建议2-检验建议3-患教知识',
  `advice_id` bigint COMMENT '治疗建议id',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间',
  `sort_id` int COMMENT '',
  `is_valid` int COMMENT '是否有效1-有效0-无效'
) COMMENT '康复建议'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_recovery_advice';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_report` (
  `id` bigint COMMENT '',
  `report_id` bigint COMMENT '老患者报道ID',
  `customer_id` bigint COMMENT '患者用户id',
  `part_id` bigint COMMENT '部位ID',
  `part_name` string COMMENT '部位名称(冗余)',
  `illness_id` bigint COMMENT '疾病ID',
  `illness_name` string COMMENT '疾病名称(冗余)',
  `state` int COMMENT '当前状态：默认0，1-门诊后，2-住院中，3-已出院，4-术后复诊',
  `doctor_suggest` string COMMENT '医生建议',
  `visit_time` timestamp COMMENT '就诊时间',
  `enter_time` timestamp COMMENT '入院时间',
  `leave_time` timestamp COMMENT '出院时间',
  `treat_method` string COMMENT '治疗方式',
  `revisit_suggest_id` string COMMENT '复诊建议可多选：默认0，1-出院后三天复查，2-出院后一周复查，3-出院后两周复查，4-出院后一月复查，5-出院后三月复查，6-出院后半年复查，7-出院后一年复查，8-其他，9-无需复诊',
  `revisit_suggest_desc` string COMMENT '其他选项时的复诊建议',
  `operation_time` timestamp COMMENT '手术时间',
  `revisit_type` int COMMENT '复诊阶段：1-首次复诊、2-第二次复诊、3-第三次复诊、4-三次以上',
  `create_time` timestamp COMMENT '当前时间',
  `is_valid` int COMMENT '',
  `site_id` int COMMENT '发送渠道',
  `operation_id` bigint COMMENT '手术ID',
  `operation_name` string COMMENT '手术名称(冗余)',
  `revisit_time` timestamp COMMENT '本次复诊时间',
  `doctor_id` bigint COMMENT '心仪医生ID',
  `patient_id` bigint COMMENT '患者ID',
  `case_id` bigint COMMENT '病例ID'
) COMMENT '老患者报到表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_report';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_report_improvement` (
  `id` bigint COMMENT '',
  `report_id` bigint COMMENT '患者报道ID',
  `customer_id` bigint COMMENT '患者用户id',
  `patient_id` bigint COMMENT '患者ID',
  `doctor_id` bigint COMMENT '医生ID',
  `case_id` bigint COMMENT '病例ID',
  `report_type` int COMMENT '就诊类型：默认0，1-门诊患者，2-住院患者，3-未就诊',
  `visit_date` timestamp COMMENT '就诊/住院时间',
  `date_type` int COMMENT '时间类型：默认0，1-上午，2-下午，3-晚上',
  `doctor_diagnosis` string COMMENT '医生诊断',
  `doctor_suggest` string COMMENT '治疗建议',
  `report_purpose` string COMMENT '报道目的',
  `whether_operation` int COMMENT '是否手术：-1-默认0-否，1-是',
  `operation_name` string COMMENT '手术名称',
  `operation_date` timestamp COMMENT '手术时间',
  `report_channel` string COMMENT '报道通过途径',
  `report_assist` string COMMENT '报道获取帮助',
  `report_person_condition` string COMMENT '报道个人病情',
  `patient_tag_list` string COMMENT '患者标签',
  `tag_remark` string COMMENT '患者标签备注',
  `deal_state` int COMMENT '医生打标签状态(1-忽略，2-完成)',
  `finish_time` timestamp COMMENT '报道完成时间',
  `create_time` timestamp COMMENT '当前时间',
  `last_update_time` timestamp COMMENT '最后更新时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '发送渠道'
) COMMENT '患者报到表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_report_improvement';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_report_improvement_20180810` (
  `id` bigint COMMENT '',
  `report_id` bigint COMMENT '患者报道ID',
  `customer_id` bigint COMMENT '患者用户id',
  `patient_id` bigint COMMENT '患者ID',
  `doctor_id` bigint COMMENT '医生ID',
  `case_id` bigint COMMENT '病例ID',
  `report_type` int COMMENT '就诊类型：默认0，1-门诊患者，2-住院患者，3-未就诊',
  `visit_date` timestamp COMMENT '就诊/住院时间',
  `date_type` int COMMENT '时间类型：默认0，1-上午，2-下午，3-晚上',
  `doctor_diagnosis` string COMMENT '医生诊断',
  `doctor_suggest` string COMMENT '治疗建议',
  `report_purpose` string COMMENT '报道目的',
  `whether_operation` int COMMENT '是否手术：-1-默认0-否，1-是',
  `operation_name` string COMMENT '手术名称',
  `operation_date` timestamp COMMENT '手术时间',
  `report_channel` string COMMENT '报道通过途径',
  `report_assist` string COMMENT '报道获取帮助',
  `report_person_condition` string COMMENT '报道个人病情',
  `patient_tag_list` string COMMENT '患者标签',
  `tag_remark` string COMMENT '患者标签备注',
  `deal_state` int COMMENT '医生打标签状态(1-忽略，2-完成)',
  `finish_time` timestamp COMMENT '报道完成时间',
  `create_time` timestamp COMMENT '当前时间',
  `last_update_time` timestamp COMMENT '最后更新时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '发送渠道'
) COMMENT '患者报到表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_report_improvement_20180810';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_report_improvement_20180904` (
  `id` bigint COMMENT '',
  `report_id` bigint COMMENT '患者报道ID',
  `customer_id` bigint COMMENT '患者用户id',
  `patient_id` bigint COMMENT '患者ID',
  `doctor_id` bigint COMMENT '医生ID',
  `case_id` bigint COMMENT '病例ID',
  `report_type` int COMMENT '就诊类型：默认0，1-门诊患者，2-住院患者，3-未就诊',
  `visit_date` timestamp COMMENT '就诊/住院时间',
  `date_type` int COMMENT '时间类型：默认0，1-上午，2-下午，3-晚上',
  `doctor_diagnosis` string COMMENT '医生诊断',
  `doctor_suggest` string COMMENT '治疗建议',
  `report_purpose` string COMMENT '报道目的',
  `whether_operation` int COMMENT '是否手术：-1-默认0-否，1-是',
  `operation_name` string COMMENT '手术名称',
  `operation_date` timestamp COMMENT '手术时间',
  `report_channel` string COMMENT '报道通过途径',
  `report_assist` string COMMENT '报道获取帮助',
  `report_person_condition` string COMMENT '报道个人病情',
  `patient_tag_list` string COMMENT '患者标签',
  `tag_remark` string COMMENT '患者标签备注',
  `deal_state` int COMMENT '医生打标签状态(1-忽略，2-完成)',
  `finish_time` timestamp COMMENT '报道完成时间',
  `create_time` timestamp COMMENT '当前时间',
  `last_update_time` timestamp COMMENT '最后更新时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '发送渠道'
) COMMENT '患者报到表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_report_improvement_20180904';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_reservation` (
  `id` bigint COMMENT '',
  `patient_id` bigint COMMENT '患者id',
  `case_id` bigint COMMENT '病例id',
  `operation_id` bigint COMMENT '手术id',
  `operation_name` string COMMENT '手术名称',
  `expected_time` int COMMENT '期望手术时间0-尽快1-一周内2-一月内3-一年内4-一年以上',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '发送渠道',
  `hospital_id` bigint COMMENT '期望手术医院',
  `hospital` string COMMENT '',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '患者预约手术表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_reservation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_supplement` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `patient_id` bigint COMMENT '患者id',
  `case_id` bigint COMMENT '病例id',
  `supplement_type` int COMMENT '类型1-医院2-疾病',
  `supplement_content` string COMMENT '补充正文',
  `site_id` int COMMENT '发送渠道',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '患者补充信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_supplement';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_unite_info_supplement` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `unite_id` int COMMENT '渠道id(4-微信服务号5-唯医骨科小程序)',
  `unite_info` string COMMENT '渠道信息',
  `unite_follow_state` int COMMENT '是否关注渠道信息',
  `unite_openid` string COMMENT '渠道唯一id',
  `unite_uuid` string COMMENT '联合id（用来关联其他平台）',
  `unite_remark` string COMMENT '备注',
  `unite_follow_time` timestamp COMMENT '关注时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建日期'
) COMMENT '会诊患者用户渠道登录拓展补充信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_unite_info_supplement';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_patient_unite_info_supplement_20180821` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `unite_id` int COMMENT '渠道id(4-微信服务号5-唯医骨科小程序)',
  `unite_info` string COMMENT '渠道信息',
  `unite_follow_state` int COMMENT '是否关注渠道信息',
  `unite_openid` string COMMENT '渠道唯一id',
  `unite_uuid` string COMMENT '联合id（用来关联其他平台）',
  `unite_remark` string COMMENT '备注',
  `unite_follow_time` timestamp COMMENT '关注时间',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建日期'
) COMMENT '会诊患者用户渠道登录拓展补充信息'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_patient_unite_info_supplement_20180821';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_recommend_region` (
  `id` bigint COMMENT '',
  `province_id` bigint COMMENT '患者所在省',
  `province` string COMMENT '患者所在省',
  `provincial_capital_id` bigint COMMENT '推荐省会id',
  `provincial_capital` string COMMENT '推荐省会',
  `area_id` bigint COMMENT '推荐片区id',
  `area` string COMMENT '推荐片区',
  `create_time` timestamp COMMENT '',
  `is_valid` int COMMENT ''
) COMMENT '推荐使用的省市片区'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_recommend_region';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_rehabilitative_diary` (
  `id` bigint COMMENT '',
  `diary_id` bigint COMMENT '日记id',
  `diary_name` string COMMENT '日记名称',
  `diary_desc` string COMMENT '日记描述',
  `diary_content_type` int COMMENT '日记内容类型0-文章1-视频2-语音3-图片4-综合',
  `patient_id` bigint COMMENT '患者id',
  `patient_age` int COMMENT '患者年龄',
  `patient_sex` int COMMENT '患者性别(1-男2-女)',
  `medical_expense` decimal COMMENT '治疗花费',
  `treatment_time` timestamp COMMENT '入院时间',
  `author_id` bigint COMMENT '作者id',
  `attend_customer_id` bigint COMMENT '主治医生id',
  `page_storage_path` string COMMENT '终端页路径',
  `web_storage_path` string COMMENT '终端页路径',
  `app_storage_path` string COMMENT '终端页路径',
  `tpl_path` string COMMENT '模板路径',
  `source_type` int COMMENT '来源类型 (0-PGC 1-UGC)',
  `browse_num` bigint COMMENT '浏览数',
  `review_num` bigint COMMENT '用户评论数',
  `virtual_review_num` bigint COMMENT '作者评论数',
  `share_num` bigint COMMENT '分享数',
  `status` int COMMENT '日记状态',
  `release_time` timestamp COMMENT '发布时间',
  `collection_num` bigint COMMENT '收藏数',
  `reprint_num` bigint COMMENT '转发数',
  `prefer_up_num` bigint COMMENT '赞数',
  `operation_id_list` string COMMENT '手术id串',
  `illness_name` string COMMENT '疾病名称',
  `creater` string COMMENT '日记创建人',
  `last_update_time` timestamp COMMENT '最后更新时间',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序id',
  `is_valid` int COMMENT '是否有效（0-无效1-有效）',
  `send_site_id` int COMMENT '操作站点(17-患者微信、18-分诊平台、19-医生端会诊Android、20-医生端会诊IOS、21-患者M站、22-ios患者app端、23-Android患者端app)',
  `share_guide` string COMMENT '分享引导语'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_rehabilitative_diary';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_rehabilitative_diary_20181227` (
  `id` bigint COMMENT '',
  `diary_id` bigint COMMENT '日记id',
  `diary_name` string COMMENT '日记名称',
  `diary_desc` string COMMENT '日记描述',
  `diary_content_type` int COMMENT '日记内容类型0-文章1-视频2-语音3-图片4-综合',
  `patient_id` bigint COMMENT '患者id',
  `patient_age` int COMMENT '患者年龄',
  `patient_sex` int COMMENT '患者性别(1-男2-女)',
  `medical_expense` decimal COMMENT '治疗花费',
  `treatment_time` timestamp COMMENT '入院时间',
  `author_id` bigint COMMENT '作者id',
  `attend_customer_id` bigint COMMENT '主治医生id',
  `page_storage_path` string COMMENT '终端页路径',
  `web_storage_path` string COMMENT '终端页路径',
  `app_storage_path` string COMMENT '终端页路径',
  `tpl_path` string COMMENT '模板路径',
  `source_type` int COMMENT '来源类型 (0-PGC 1-UGC)',
  `browse_num` bigint COMMENT '浏览数',
  `review_num` bigint COMMENT '用户评论数',
  `virtual_review_num` bigint COMMENT '作者评论数',
  `share_num` bigint COMMENT '分享数',
  `status` int COMMENT '日记状态',
  `release_time` timestamp COMMENT '发布时间',
  `collection_num` bigint COMMENT '收藏数',
  `reprint_num` bigint COMMENT '转发数',
  `prefer_up_num` bigint COMMENT '赞数',
  `operation_id_list` string COMMENT '手术id串',
  `illness_name` string COMMENT '疾病名称',
  `creater` string COMMENT '日记创建人',
  `last_update_time` timestamp COMMENT '最后更新时间',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序id',
  `is_valid` int COMMENT '是否有效（0-无效1-有效）',
  `send_site_id` int COMMENT '操作站点(17-患者微信、18-分诊平台、19-医生端会诊Android、20-医生端会诊IOS、21-患者M站、22-ios患者app端、23-Android患者端app)',
  `share_guide` string COMMENT '分享引导语'
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
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_rehabilitative_diary_20181227';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_rehabilitative_diary_attachment` (
  `id` bigint COMMENT '',
  `diary_id` bigint COMMENT '日记id',
  `att_name` string COMMENT '附件说明（图片标题等）',
  `att_type` int COMMENT '附件类型：1-图片，2-视频,4-视频缩略图,5-语音,6-封面图片',
  `att_size` string COMMENT '附件大小：KB',
  `att_format` string COMMENT '附件格式：jpg、mp4...',
  `att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、8-480*320、9-1280*720、10-900*600、12-300*200、13-450*300、14-750*500)',
  `att_height` string COMMENT '附件高度',
  `att_width` string COMMENT '附件宽度',
  `att_url` string COMMENT '附件url',
  `upload_time` timestamp COMMENT '附件上传时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功,3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `play_num` bigint COMMENT '播放次数',
  `play_time` string COMMENT '播放时长'
) COMMENT '康复日记附件信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_rehabilitative_diary_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_rehabilitative_diary_author` (
  `id` bigint COMMENT '',
  `author_id` bigint COMMENT '作者id',
  `author_name` string COMMENT '作者名称',
  `author_mobile` bigint COMMENT '作者手机号',
  `author_logo_url` string COMMENT '作者头像',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '站点id'
) COMMENT '康复日记虚拟作者表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_rehabilitative_diary_author';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_rehabilitative_diary_content` (
  `id` bigint COMMENT '',
  `diary_id` bigint COMMENT '日记id',
  `diary_content` string COMMENT '正文内容',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效,2-用户删除)',
  `send_site_id` int COMMENT '站点'
) COMMENT '康复日记详情表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_rehabilitative_diary_content';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_tocure_rehabilitative_diary_content_20180919` (
  `id` bigint COMMENT '',
  `diary_id` bigint COMMENT '日记id',
  `diary_content` string COMMENT '正文内容',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效,2-用户删除)',
  `send_site_id` int COMMENT '站点'
) COMMENT '康复日记详情表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/tocure_platform/ods_tocure_rehabilitative_diary_content_20180919';

