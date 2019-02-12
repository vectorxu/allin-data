CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_album` (
  `id` bigint COMMENT '',
  `album_id` bigint COMMENT '专辑id',
  `album_name` string COMMENT '专辑名称',
  `album_desc` string COMMENT '专辑描述',
  `album_type` int COMMENT '专辑类型(1-系列，2-播览群术)',
  `ref_customer_id` bigint COMMENT '相关会员id',
  `video_num` bigint COMMENT '视频数',
  `doc_num` bigint COMMENT '文库数',
  `con_num` bigint COMMENT '会议数',
  `product_num` bigint COMMENT '产品数',
  `brand_num` bigint COMMENT '品牌数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `share_num` bigint COMMENT '分享数',
  `up_num` bigint COMMENT '被别人赞数',
  `create_time` timestamp COMMENT '创建时间',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `is_valid` int COMMENT '是否有效',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_album';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_album_resource` (
  `id` bigint COMMENT '',
  `album_id` bigint COMMENT '专辑id',
  `album_name` string COMMENT '专辑名称',
  `album_type` int COMMENT '专辑类型(1-系列，2-播览群术)',
  `ref_id` bigint COMMENT '关联资源id',
  `ref_type` int COMMENT '关联类型(1-视频，2-文库，3-会议，4-产品，5-品牌)',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_album_resource';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_brand` (
  `id` bigint COMMENT '',
  `brand_id` bigint COMMENT '品牌id',
  `brand_name` string COMMENT '品牌名称',
  `brand_name_en` string COMMENT '品牌英文名',
  `company_name` string COMMENT '品牌公司中文全称',
  `ref_customer_id` bigint COMMENT '会员id',
  `brand_state` int COMMENT '厂商入驻状态：0-未入驻，1-已入驻',
  `follow_num` bigint COMMENT '关注数',
  `browse_num` bigint COMMENT '浏览数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `share_num` bigint COMMENT '分享数',
  `prefer_num` bigint COMMENT '赞数',
  `tpl_path` string COMMENT '模版路径or模版id',
  `web_storage_path` string COMMENT '手机版页面生成URL',
  `create_time` timestamp COMMENT '创建时间',
  `last_update_time` timestamp COMMENT '最近一次更新时间',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `sort_ref_name` string COMMENT '品牌名称首字母排序',
  `brand_desc` string COMMENT '品牌描述',
  `brand_phone` string COMMENT '品牌电话'
) COMMENT '品牌信息表'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_brand';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_brand_attachment` (
  `id` bigint COMMENT '',
  `brand_id` bigint COMMENT '品牌id',
  `att_type` int COMMENT '附件类型：1-图片（logo），2-品牌介绍PDF，3-轮播',
  `att_format` string COMMENT '附件格式：jpg、mp4...',
  `att_spec` string COMMENT '附件规格：(1-原始文件，2-PDF图片集)',
  `att_path` string COMMENT '附件地址',
  `att_size` string COMMENT '附件大小：KB',
  `att_height` string COMMENT '附件高度',
  `att_width` string COMMENT '附件宽度',
  `att_name` string COMMENT '附件名称',
  `att_desc` string COMMENT '附件描述',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `play_num` int COMMENT '是否已经批处理(0-未处理1-已处理2-处理失败)'
) COMMENT '品牌附件'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_brand_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_brand_message` (
  `id` bigint COMMENT '',
  `brand_id` bigint COMMENT '品牌id',
  `customer_id` bigint COMMENT '发送者会员id',
  `parent_id` bigint COMMENT '父节点',
  `message_type` int COMMENT '消息类型：1-留言，2-反馈',
  `message_body` string COMMENT '消息内容',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '发送渠道',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '品牌留言'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_brand_message';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_comm_assortment` (
  `id` bigint COMMENT '',
  `resource_type` int COMMENT '资源类别(1-话题分类，2-需求发布分类)',
  `sort_id` int COMMENT '排序',
  `assortment_name` string COMMENT '类型名称',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
) COMMENT '话题类型表'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_comm_assortment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_comm_brand` (
  `id` bigint COMMENT '',
  `brand_id` bigint COMMENT '品牌id',
  `brand_name` string COMMENT '品牌名称',
  `ref_customer_id` bigint COMMENT '会员id',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
) COMMENT '会员曾服务品牌'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_comm_brand';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_comm_certificate` (
  `id` bigint COMMENT '',
  `certificate_id` bigint COMMENT '证件类型id',
  `certificate_name` string COMMENT '证件类型名称',
  `customer_role` int COMMENT '会员类型：0-普通用户，1-医务人员，2-生产厂家，3-渠道/经销商，4-医学组织',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_comm_certificate';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_comm_profession_title` (
  `id` bigint COMMENT '',
  `title_id` bigint COMMENT '职称id',
  `title_name` string COMMENT '职称名称',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
) COMMENT '会员职称'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_comm_profession_title';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_comm_property` (
  `id` bigint COMMENT '',
  `property_id` bigint COMMENT '属性id',
  `property_name` string COMMENT '名称',
  `property_name_en` string COMMENT '英文名称',
  `property_type` int COMMENT '属性类型(4-专业,5-解剖,6-产品大类)',
  `property_desc` string COMMENT '属性描述',
  `parent_id` bigint COMMENT '父节点',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `property_full_path` string COMMENT '上级路径（拼串形式存放上级属性Id）',
  `video_num` bigint COMMENT '视频数',
  `doc_num` bigint COMMENT '文库数',
  `brand_num` bigint COMMENT '品牌数',
  `product_num` bigint COMMENT '产品数',
  `follow_num` bigint COMMENT '关注人订阅人数',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效（0-无效，1-有效）',
  `property_logo_url` string COMMENT '属性logo',
  `property_logo_format` string COMMENT '属性logo格式：jpg、mp4...',
  `property_logo_size` string COMMENT '属性logo大小：KB',
  `property_logo_height` string COMMENT '属性logo高度',
  `property_logo_width` string COMMENT '属性logo宽度',
  `play_num` int COMMENT '是否已经批处理(0-未处理1-已处理2-处理失败)'
) COMMENT '属性'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_comm_property';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_comm_property_20170123` (
  `id` bigint COMMENT '',
  `property_id` bigint COMMENT '属性id',
  `property_name` string COMMENT '名称',
  `property_name_en` string COMMENT '英文名称',
  `property_type` int COMMENT '属性类型(4-专业,5-解剖,6-产品大类)',
  `property_desc` string COMMENT '属性描述',
  `parent_id` bigint COMMENT '父节点',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `property_full_path` string COMMENT '上级路径（拼串形式存放上级属性Id）',
  `video_num` bigint COMMENT '视频数',
  `doc_num` bigint COMMENT '文库数',
  `brand_num` bigint COMMENT '品牌数',
  `product_num` bigint COMMENT '产品数',
  `follow_num` bigint COMMENT '关注人订阅人数',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效（0-无效，1-有效）',
  `property_logo_url` string COMMENT '属性logo',
  `property_logo_format` string COMMENT '属性logo格式：jpg、mp4...',
  `property_logo_size` string COMMENT '属性logo大小：KB',
  `property_logo_height` string COMMENT '属性logo高度',
  `property_logo_width` string COMMENT '属性logo宽度'
) COMMENT '属性'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_comm_property_20170123';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_comm_property_20170125` (
  `id` bigint COMMENT '',
  `property_id` bigint COMMENT '属性id',
  `property_name` string COMMENT '名称',
  `property_name_en` string COMMENT '英文名称',
  `property_type` int COMMENT '属性类型(4-专业,5-解剖,6-产品大类)',
  `property_desc` string COMMENT '属性描述',
  `parent_id` bigint COMMENT '父节点',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `property_full_path` string COMMENT '上级路径（拼串形式存放上级属性Id）',
  `video_num` bigint COMMENT '视频数',
  `doc_num` bigint COMMENT '文库数',
  `brand_num` bigint COMMENT '品牌数',
  `product_num` bigint COMMENT '产品数',
  `follow_num` bigint COMMENT '关注人订阅人数',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效（0-无效，1-有效）',
  `property_logo_url` string COMMENT '属性logo',
  `property_logo_format` string COMMENT '属性logo格式：jpg、mp4...',
  `property_logo_size` string COMMENT '属性logo大小：KB',
  `property_logo_height` string COMMENT '属性logo高度',
  `property_logo_width` string COMMENT '属性logo宽度'
) COMMENT '属性'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_comm_property_20170125';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_comm_property_20170205` (
  `id` bigint COMMENT '',
  `property_id` bigint COMMENT '属性id',
  `property_name` string COMMENT '名称',
  `property_name_en` string COMMENT '英文名称',
  `property_type` int COMMENT '属性类型(4-专业,5-解剖,6-产品大类)',
  `property_desc` string COMMENT '属性描述',
  `parent_id` bigint COMMENT '父节点',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `property_full_path` string COMMENT '上级路径（拼串形式存放上级属性Id）',
  `video_num` bigint COMMENT '视频数',
  `doc_num` bigint COMMENT '文库数',
  `brand_num` bigint COMMENT '品牌数',
  `product_num` bigint COMMENT '产品数',
  `follow_num` bigint COMMENT '关注人订阅人数',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效（0-无效，1-有效）',
  `property_logo_url` string COMMENT '属性logo',
  `property_logo_format` string COMMENT '属性logo格式：jpg、mp4...',
  `property_logo_size` string COMMENT '属性logo大小：KB',
  `property_logo_height` string COMMENT '属性logo高度',
  `property_logo_width` string COMMENT '属性logo宽度'
) COMMENT '属性'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_comm_property_20170205';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_comm_property_20170213` (
  `id` bigint COMMENT '',
  `property_id` bigint COMMENT '属性id',
  `property_name` string COMMENT '名称',
  `property_name_en` string COMMENT '英文名称',
  `property_type` int COMMENT '属性类型(4-专业,5-解剖,6-产品大类)',
  `property_desc` string COMMENT '属性描述',
  `parent_id` bigint COMMENT '父节点',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `property_full_path` string COMMENT '上级路径（拼串形式存放上级属性Id）',
  `video_num` bigint COMMENT '视频数',
  `doc_num` bigint COMMENT '文库数',
  `brand_num` bigint COMMENT '品牌数',
  `product_num` bigint COMMENT '产品数',
  `follow_num` bigint COMMENT '关注人订阅人数',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效（0-无效，1-有效）',
  `property_logo_url` string COMMENT '属性logo',
  `property_logo_format` string COMMENT '属性logo格式：jpg、mp4...',
  `property_logo_size` string COMMENT '属性logo大小：KB',
  `property_logo_height` string COMMENT '属性logo高度',
  `property_logo_width` string COMMENT '属性logo宽度'
) COMMENT '属性'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_comm_property_20170213';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_comm_solr_factor` (
  `id` bigint COMMENT '',
  `solr_﻿scene` int COMMENT '应用场景(1-视频 2-文库 3-会议 4-产品 5-品牌 50-论坛 51-UGC直播)',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_comm_solr_factor';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_comm_wechat_token` (
  `id` bigint COMMENT '',
  `app_id` string COMMENT 'key',
  `token` string COMMENT '口令',
  `is_valid` smallint COMMENT '是否有效',
  `update_time` timestamp COMMENT '更新时间',
  `create_time` timestamp COMMENT '创建时间',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_comm_wechat_token';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_conference` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '会议id',
  `con_name` string COMMENT '会议名称',
  `con_url` string COMMENT '会议url',
  `con_main_pic_url` string COMMENT '会议主图地址',
  `con_logo_url` string COMMENT '',
  `con_place` string COMMENT '会议地点',
  `country_id` int COMMENT '国家id',
  `country` string COMMENT '国家',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `con_intro` string COMMENT '会议简介',
  `con_host` string COMMENT '主办方',
  `con_scale` string COMMENT '会议规模',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_conference';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_conference_agenda` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '所属主会议id',
  `con_sub_id` bigint COMMENT '分会id',
  `con_type` int COMMENT '日程类型（1-开幕式、2-闭幕，3-分会，4-茶歇）',
  `con_name` string COMMENT '会议名称',
  `con_content` string COMMENT '主讲内容',
  `con_place` string COMMENT '会议地点',
  `moderator` string COMMENT '会议主持人',
  `reach_date` timestamp COMMENT '到会时间（日期）',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `create_time` timestamp COMMENT '创建时间',
  `lecturer` string COMMENT '讲师',
  `topic` string COMMENT '专题',
  `ref_video_id` bigint COMMENT '相关视频id',
  `is_online` int COMMENT '是否在线直播',
  `prefer_num` bigint COMMENT '赞数',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_conference_agenda';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_conference_event` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '会议id',
  `con_event` string COMMENT '事件名称',
  `event_url` string COMMENT '事件链接',
  `start_time` timestamp COMMENT '事件开始时间',
  `end_time` timestamp COMMENT '事件结束时间',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_conference_event';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_conference_menu` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '会议id',
  `con_menu` string COMMENT '会议菜单项',
  `menu_url_allin` string COMMENT '网站版菜单项url地址',
  `page_storage_path` string COMMENT '网站版菜单项存储路径',
  `web_storage_path` string COMMENT '手机版菜单项存储路径',
  `tpl_path` string COMMENT 'tpl路径',
  `tree_level` int COMMENT '节点级别',
  `parent_id` bigint COMMENT '父节点',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_conference_menu';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_conference_recommend` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '会议id',
  `menu_id` bigint COMMENT '菜单id',
  `type_id` int COMMENT '关联类型id(1-栏目,2-广告位)',
  `recommend_id` bigint COMMENT '关联id',
  `recommend_type` int COMMENT '1-栏目,2-广告位',
  `recommend_num` int COMMENT '推荐显示条数',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点id',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_conference_recommend';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_conference_sub` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '会议id',
  `con_sub_name` string COMMENT '会议名称',
  `con_sub_place` string COMMENT '会议地点',
  `con_sub_intro` string COMMENT '会议简介',
  `con_host` string COMMENT '主办方',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `create_time` timestamp COMMENT '创建时间',
  `live_id` string COMMENT '直播id',
  `play_back_id` string COMMENT '回播id',
  `is_online` int COMMENT '是否在线直播(0-不直播、1-展视互动-直播、2-厂商-直播、3-展视互动-回播；)',
  `authority` int COMMENT '观看权限(1所有、2登录、3认证、4caos缴费)',
  `authcode` string COMMENT '普通参加者口令',
  `con_sub_type` int COMMENT '1-分会,2-卫星会',
  `con_sub_pic_url` string COMMENT '分会直播主图地址',
  `con_sub_web_url` string COMMENT '分会web直播主图地址',
  `con_sub_room` string COMMENT '安卓,ios直播房间号',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `online_short_link` string COMMENT '直播短链接',
  `back_short_link` string COMMENT '回播短链接',
  `allin_sub_id` bigint COMMENT '关联唯医分会ID'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_conference_sub';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_conference_sub_20160520` (
  `id` bigint COMMENT '',
  `con_id` bigint COMMENT '会议id',
  `con_sub_name` string COMMENT '会议名称',
  `con_sub_place` string COMMENT '会议地点',
  `con_sub_intro` string COMMENT '会议简介',
  `con_host` string COMMENT '主办方',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `live_id` string COMMENT '直播id',
  `play_back_id` string COMMENT '回播id',
  `is_online` int COMMENT '是否在线直播(0-不直播、1-展视互动-直播、2-厂商-直播、3-展视互动-回播；)',
  `authority` int COMMENT '观看权限(1所有、2登录、3认证、4caos缴费)',
  `authcode` string COMMENT '普通参加者口令',
  `con_sub_type` int COMMENT '1-分会,2-卫星会',
  `con_sub_pic_url` string COMMENT '分会直播主图地址',
  `con_sub_web_url` string COMMENT '分会web直播主图地址',
  `con_sub_room` string COMMENT '安卓,ios直播房间号',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `online_short_link` string COMMENT '直播短链接',
  `back_short_link` string COMMENT '回播短链接'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_conference_sub_20160520';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_custom_category` (
  `id` bigint COMMENT '',
  `category_id` bigint COMMENT '类目id',
  `category_name` string COMMENT '名称',
  `category_type` int COMMENT '类目类型(4-产品)',
  `category_desc` string COMMENT '类目描述',
  `parent_id` bigint COMMENT '父节点',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `product_num` bigint COMMENT '产品数',
  `category_full_path` string COMMENT '上级路径（拼串形式存放上级属性Id）',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效（0-无效，1-有效）'
) COMMENT '自定义类目表'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_custom_category';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_auth` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `sex` int COMMENT '性别(1-男，2－女，3－保密)',
  `birthday` string COMMENT '生日',
  `business_address` string COMMENT '工作地点',
  `title_id` bigint COMMENT '职称id',
  `title_name` string COMMENT '职称名称',
  `education_id` bigint COMMENT '学历id',
  `education_name` string COMMENT '学历名称',
  `hospital_id` bigint COMMENT '医院id',
  `hospital_name` string COMMENT '医院名称',
  `department_id` bigint COMMENT '科室id',
  `department_name` string COMMENT '科室名称',
  `organization_name` string COMMENT '组织名称',
  `major` string COMMENT '专业',
  `state` int COMMENT '认证状态(-1-无认证信息、0-二次提交认证、1-认证通过、2-运营确认、3-认证拒绝)',
  `create_time` timestamp COMMENT '认证时间',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `first_name` string COMMENT '名',
  `last_name` string COMMENT '姓',
  `full_name` string COMMENT '姓名',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `position` string COMMENT '职位',
  `company` string COMMENT '工作单位'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_auth';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_auth_20170724` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `sex` int COMMENT '性别(1-男，2－女，3－保密)',
  `birthday` string COMMENT '生日',
  `business_address` string COMMENT '工作地点',
  `title_id` bigint COMMENT '职称id',
  `title_name` string COMMENT '职称名称',
  `education_id` bigint COMMENT '学历id',
  `education_name` string COMMENT '学历名称',
  `hospital_id` bigint COMMENT '医院id',
  `hospital_name` string COMMENT '医院名称',
  `department_id` bigint COMMENT '科室id',
  `department_name` string COMMENT '科室名称',
  `organization_name` string COMMENT '组织名称',
  `major` string COMMENT '专业',
  `state` int COMMENT '认证状态(-1-无认证信息、0-二次提交认证、1-认证通过、2-运营确认、3-认证拒绝)',
  `create_time` timestamp COMMENT '认证时间',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `first_name` string COMMENT '名',
  `last_name` string COMMENT '姓',
  `full_name` string COMMENT '姓名',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `position` string COMMENT '职位',
  `company` string COMMENT '工作单位'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_auth_20170724';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_auth_20170917` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `sex` int COMMENT '性别(1-男，2－女，3－保密)',
  `birthday` string COMMENT '生日',
  `business_address` string COMMENT '工作地点',
  `title_id` bigint COMMENT '职称id',
  `title_name` string COMMENT '职称名称',
  `education_id` bigint COMMENT '学历id',
  `education_name` string COMMENT '学历名称',
  `hospital_id` bigint COMMENT '医院id',
  `hospital_name` string COMMENT '医院名称',
  `department_id` bigint COMMENT '科室id',
  `department_name` string COMMENT '科室名称',
  `organization_name` string COMMENT '组织名称',
  `major` string COMMENT '专业',
  `state` int COMMENT '认证状态(-1-无认证信息、0-二次提交认证、1-认证通过、2-运营确认、3-认证拒绝)',
  `create_time` timestamp COMMENT '认证时间',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `first_name` string COMMENT '名',
  `last_name` string COMMENT '姓',
  `full_name` string COMMENT '姓名',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `district` string COMMENT '区/县',
  `position` string COMMENT '职位',
  `company` string COMMENT '工作单位'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_auth_20170917';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_auth_attachment` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `att_format` string COMMENT '附件格式：jpg、mp4...',
  `att_type` bigint COMMENT '附件类型(med_comm_certificate.certificate_id)',
  `att_code` string COMMENT '附件号码',
  `att_path` string COMMENT '附件地址',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效,扩展用于图片存储切换',
  `att_size` string COMMENT '附件大小：KB',
  `att_height` string COMMENT '附件高度',
  `att_width` string COMMENT '附件宽度'
) COMMENT '会员认证上传资料'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_auth_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_auth_attachment_20170724` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `att_format` string COMMENT '附件格式：jpg、mp4...',
  `att_type` bigint COMMENT '附件类型(med_comm_certificate.certificate_id)',
  `att_code` string COMMENT '附件号码',
  `att_path` string COMMENT '附件地址',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效,扩展用于图片存储切换',
  `att_size` string COMMENT '附件大小：KB',
  `att_height` string COMMENT '附件高度',
  `att_width` string COMMENT '附件宽度'
) COMMENT '会员认证上传资料'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_auth_attachment_20170724';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_auth_process` (
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
  `before_full_name` string COMMENT '修改前姓名',
  `after_full_name` string COMMENT '修改后姓名',
  `before_title_name` string COMMENT '修改前职称名称',
  `after_title_name` string COMMENT '修改后职称名称',
  `before_hospital_name` string COMMENT '修改前医院名称',
  `after_hospital_name` string COMMENT '修改后医院名称',
  `before_department_name` string COMMENT '修改前科室名称',
  `after_department_name` string COMMENT '修改后科室名称',
  `before_organization_name` string COMMENT '修改前组织名称',
  `after_organization_name` string COMMENT '修改后组织名称',
  `before_company` string COMMENT '修改前工作单位',
  `after_company` string COMMENT '修改后工作单位',
  `before_brand_name` string COMMENT '修改前服务品牌',
  `after_brand_name` string COMMENT '修改后服务品牌',
  `create_time` timestamp COMMENT '创建时间'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_auth_process';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_blacklist` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `mobile` string COMMENT '手机号',
  `email` string COMMENT '邮箱',
  `customer_role` int COMMENT '0-普通用户，1-医务人员，2-生产厂家，3-渠道/经销商，4-医学组织',
  `full_name` string COMMENT '姓名',
  `hospital_id` bigint COMMENT '医院id',
  `hospital_name` string COMMENT '医院名称',
  `company` string COMMENT '工作单位',
  `department_id` bigint COMMENT '科室id',
  `department_name` string COMMENT '科室',
  `title_id` bigint COMMENT '职称id',
  `title_name` string COMMENT '职称名称',
  `major_name` string COMMENT '专业',
  `education_id` int COMMENT '学历id',
  `education_name` string COMMENT '学历名称',
  `organization_name` string COMMENT '组织名称',
  `blacklist_type` int COMMENT '类型(0-黑名单)',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_blacklist';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_brand` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `brand_id` bigint COMMENT '产品id',
  `brand_name` string COMMENT '产品名称',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效（0-无效，1-有效）'
) COMMENT '会员-品牌mapping'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_brand';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_collection` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `collection_type` int COMMENT '收藏类型（1-视频，2-文库，3-会议，4-产品，5-品牌，6-标签，50-话题，52-需求发布）',
  `ref_id` bigint COMMENT '收藏具体信息id',
  `ref_customer_id` bigint COMMENT '冗余存放资源相关会员id',
  `ref_name` string COMMENT '收藏具体信息名字',
  `ref_url` string COMMENT '收藏地址',
  `ref_content` string COMMENT '资源对应摘要',
  `collection_category_id` bigint COMMENT '收藏分类',
  `create_time` timestamp COMMENT '收藏创建时间',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '发送渠道',
  `is_valid` int COMMENT '是否有效（0-取消收藏；1-添加收藏）'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_collection';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_collection_20170317` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `collection_type` int COMMENT '收藏类型（1-视频，2-文库，3-会议，4-产品，5-品牌，6-标签，50-话题，52-需求发布）',
  `ref_id` bigint COMMENT '收藏具体信息id',
  `ref_customer_id` bigint COMMENT '冗余存放资源相关会员id',
  `ref_name` string COMMENT '收藏具体信息名字',
  `ref_url` string COMMENT '收藏地址',
  `ref_content` string COMMENT '资源对应摘要',
  `collection_category_id` bigint COMMENT '收藏分类',
  `create_time` timestamp COMMENT '收藏创建时间',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '发送渠道',
  `is_valid` int COMMENT '是否有效（0-取消收藏；1-添加收藏）'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_collection_20170317';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_draft` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `ref_type` int COMMENT '草稿资源类型(1-视频，2-文库，3-会议，4-产品，5-品牌，8-评论，50-话题，52-需求发布)',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_draft';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_follow_fans` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `fans_customer_id` bigint COMMENT '关注具体信息id',
  `fans_customer_name` string COMMENT '关注具体信息名称',
  `relationship` int COMMENT '关系(1-未关注，2-已关注，3-粉丝，4-相互关注)',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地址',
  `create_time` timestamp COMMENT '关注fans创建时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_follow_fans';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_follow_people` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `ref_id` bigint COMMENT '关注具体信息id',
  `ref_name` string COMMENT '关注具体信息title',
  `relationship` int COMMENT '关系(1-未关注，2-已关注，3-粉丝，4-相互关注)',
  `follow_category` bigint COMMENT '关注人分类',
  `is_permit` int COMMENT '是否禁止(0-不允许,１-允许)',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地点',
  `create_time` timestamp COMMENT '关注人创建时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_follow_people';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_follow_resource` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `follow_type` int COMMENT '（1-视频，2-文库，3-会议，4-产品，5-品牌，6-标签）',
  `ref_id` bigint COMMENT '关注具体信息id',
  `ref_name` string COMMENT '关注具体信息title',
  `follow_category` bigint COMMENT '关注分类',
  `follow_url` string COMMENT '关注url',
  `is_permit` int COMMENT '是否禁止(0-不允许,１-允许)',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地点',
  `create_time` timestamp COMMENT '关注资源创建时间',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '排序',
  `sort_ref_name` string COMMENT '关注资源名称首字母排序',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_follow_resource';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_logo` (
  `id` bigint COMMENT '',
  `ref_customer_id` bigint COMMENT '会员id',
  `logo_type` string COMMENT '1-会员头像,2-会员简历头像',
  `logo_spec` string COMMENT 'logo规格(1-头像原图,2-fastdfs规格)',
  `logo_height` string COMMENT '图片高度',
  `logo_width` string COMMENT '图片宽度',
  `logo_size` string COMMENT '图片大小KB',
  `logo_url` string COMMENT '文档资源url',
  `create_time` timestamp COMMENT '上传时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `logo_format` string COMMENT '附件格式：jpg、mp4...',
  `play_num` int COMMENT '是否已经批处理(0-未处理1-已处理2-处理失败)'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_logo';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_logo_20170724` (
  `id` bigint COMMENT '',
  `ref_customer_id` bigint COMMENT '会员id',
  `logo_type` string COMMENT '1-会员头像,2-会员简历头像',
  `logo_spec` string COMMENT 'logo规格(1-头像原图,2-fastdfs规格)',
  `logo_height` string COMMENT '图片高度',
  `logo_width` string COMMENT '图片宽度',
  `logo_size` string COMMENT '图片大小KB',
  `logo_url` string COMMENT '文档资源url',
  `create_time` timestamp COMMENT '上传时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `logo_format` string COMMENT '附件格式：jpg、mp4...',
  `play_num` int COMMENT '是否已经批处理(0-未处理1-已处理2-处理失败)'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_logo_20170724';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_message` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `send_customer_id` bigint COMMENT '会员id',
  `send_customer_name` string COMMENT '发送者姓名',
  `send_site_id` int COMMENT '消息发送渠道(site)',
  `message_type` int COMMENT '消息类型：1-会员消息,2-系统消息',
  `op_type` int COMMENT '操作类型(0-发布、1-评论、2-转发、3-收藏、4-分享、5-赞 、6-资源修改、51-文档审核通过 52-文档审核拒绝、53-审核通过、54-审核拒绝、60-管理自定义通知、61-产品屏蔽通知、62-视频屏蔽通知、63-品牌屏蔽通知、64-文章屏蔽通知、65-评论屏蔽通知、66-引用通知)',
  `ref_type` int COMMENT '消息产生主体的类型(1-视频，2-文库，3-会议，4-产品 ,5-品牌 ,6-tag,8-评论,9-人)',
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
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-产品 ,5-品牌 ， 6-tag)',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_message';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_message_history` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `send_customer_id` bigint COMMENT '会员id',
  `send_customer_name` string COMMENT '发送者姓名',
  `send_site_id` int COMMENT '消息发送渠道(site)',
  `message_type` int COMMENT '消息类型：1-会员消息,2-系统消息',
  `op_type` int COMMENT '操作类型(0-发布、1-评论、2-转发、3-收藏、4-分享、5-赞 、6-资源修改、51-文档审核通过 52-文档审核拒绝、53-审核通过、54-审核拒绝、60-管理自定义通知、61-产品屏蔽通知、62-视频屏蔽通知、63-品牌屏蔽通知、64-文章屏蔽通知、65-评论屏蔽通知、66-引用通知)',
  `ref_type` int COMMENT '消息产生主体的类型(1-视频，2-文库，3-会议，4-产品 ,5-品牌 ,6-tag,8-评论,9-人)',
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
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-产品 ,5-品牌 ， 6-tag)',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_message_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_notify_config` (
  `id` bigint COMMENT '',
  `site_id` int COMMENT '站点id',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_notify_config';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_prefer` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `useful_type` int COMMENT '赞类型（1-视频，2-文库，3-会议，4-产品，5-品牌，6-标签，7-人, 8-评论,50-话题，52-需求发布）',
  `up_down_type` int COMMENT '赞 类型(0赞)',
  `ref_id` bigint COMMENT '赞具体信息id',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地址',
  `create_time` timestamp COMMENT '赞创建时间',
  `if_anonymous` int COMMENT '是否匿名',
  `if_header` int COMMENT '是否置顶',
  `site_id` int COMMENT '发送渠道',
  `is_valid` int COMMENT '是否有效'
) COMMENT '会员赞'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_prefer';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_quote` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '引用会员id',
  `quote_id` bigint COMMENT '引用id',
  `quote_type` int COMMENT '引用类型：1-视频，2-文库，3-会议，4-产品 ,5-品牌，6-tag,8-回复,9-人',
  `resource_id` bigint COMMENT 'quote_id的父节点',
  `resource_type` int COMMENT 'quote_id的父节点的类型：1-视频，2-文库，4-产品 ,5-品牌',
  `ref_quote_id` bigint COMMENT '被引用资源id',
  `ref_quote_type` int COMMENT '被引用资源类型：1-视频，2-文库，4-产品 ，5-品牌，6-标签',
  `ref_quote_name` string COMMENT '被引用资源名称',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '操作来源(8-iOS，9-Android，11-H5)',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_quote';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_reprint` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `ref_id` bigint COMMENT '转发具体信息id',
  `ref_customer_id` bigint COMMENT '冗余存放资源关联会员id',
  `ref_name` string COMMENT '转发具体信息名字',
  `ref_url` string COMMENT '转发地址',
  `reprint_type` int COMMENT '转发类型（1-视频，2-文库，3-会议，4-产品，5-品牌，6-标签）',
  `create_time` timestamp COMMENT '转发创建时间',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '发送渠道',
  `is_valid` int COMMENT '是否有效（0-取消转发；1-添加转发）'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_reprint';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_reset_password` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `reset_site` int COMMENT '关联站点 8-IOS，9-Android',
  `customer_email` string COMMENT '客户邮件地址',
  `email_content` string COMMENT '邮件内容',
  `reset_password_url` string COMMENT '文章url',
  `apply_source` int COMMENT '申请来源:1-网站  2-手机wap',
  `valid_code` string COMMENT '加密链接',
  `type_id` int COMMENT '验证类型(1-邮箱验证、2-手机验证)',
  `apply_time` timestamp COMMENT '申请时间',
  `send_mail_time` timestamp COMMENT '邮件发送时间',
  `confirm_time` timestamp COMMENT '修改确认时间',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效(过期跑定时任务置成无效,如24小时内有效)'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_reset_password';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_review` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `parent_id` bigint COMMENT '父节点',
  `review_type` bigint COMMENT '评论类型（1-视频，2-文库，50-话题，52-需求发布）',
  `review_status` int COMMENT '评论状态（1-发布；2-系统屏蔽；3-用户删除；４－草稿）',
  `ref_id` bigint COMMENT '关联信息id',
  `ref_customer_id` bigint COMMENT '冗余存放资源关联会员id',
  `ref_url` string COMMENT '关联信息url',
  `review_content` string COMMENT '评论内容',
  `recommend_num` bigint COMMENT '推荐数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `up_num` bigint COMMENT '点赞数',
  `down_num` bigint COMMENT '踩数',
  `op_ip` string COMMENT '操作ip',
  `op_address` string COMMENT '操作地址',
  `create_time` timestamp COMMENT '评论发布创建时间',
  `is_read` int COMMENT '是否已读（0-未读,1-已读）',
  `if_anonymous` int COMMENT '是否匿名',
  `is_draft` int COMMENT '是否草稿',
  `if_header` int COMMENT '是否置顶',
  `site_id` int COMMENT '发送渠道',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_review';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_review_attachment` (
  `id` bigint COMMENT '',
  `review_id` bigint COMMENT '评论id',
  `review_att_type` int COMMENT '资源类型：1-图片，2-视频,3-文档',
  `review_att_size` string COMMENT '资源大小：KB',
  `review_att_format` string COMMENT '资源格式：jpg、mp4...',
  `review_att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52)',
  `review_att_height` string COMMENT '资源高度',
  `review_att_width` string COMMENT '资源宽度',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `review_att_url` string COMMENT '资源url',
  `upload_time` timestamp COMMENT '附件上传时间',
  `create_time` timestamp COMMENT '创建时间',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传, 1－上传成功, 2－转码成功, 3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是, 1-是七牛',
  `play_time` string COMMENT '播放时长',
  `play_num` bigint COMMENT '播放次数',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_review_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_review_attachment_20181102` (
  `id` bigint COMMENT '',
  `review_id` bigint COMMENT '评论id',
  `review_att_type` int COMMENT '资源类型：1-图片，2-视频,3-文档',
  `review_att_size` string COMMENT '资源大小：KB',
  `review_att_format` string COMMENT '资源格式：jpg、mp4...',
  `review_att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52)',
  `review_att_height` string COMMENT '资源高度',
  `review_att_width` string COMMENT '资源宽度',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `review_att_url` string COMMENT '资源url',
  `upload_time` timestamp COMMENT '附件上传时间',
  `create_time` timestamp COMMENT '创建时间',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传, 1－上传成功, 2－转码成功, 3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是, 1-是七牛',
  `play_time` string COMMENT '播放时长',
  `play_num` bigint COMMENT '播放次数',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_review_attachment_20181102';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_role_priv` (
  `id` bigint COMMENT '',
  `customer_role` int COMMENT '会员id(med_customer_unite.customerRole)外键',
  `role_id` int COMMENT '权限id(1-收藏操作、2-订阅操作、3-文章终端页、4-视频终端页、5-下载操作、6-分享操作、7-评论操作、8-直播、回播终端页、9-直播中互动、10-会议日程、11-我的标签、12-我的评论评论我的、13-个人资料、14-更换头像、15-账号与安全、16-我的下载、17-我的收藏、18-设置、19-视频播放、20-点赞操作、21-浏览记录、22-UGC直播创建、23-UGC直播观众预约、24-UGC直播观众进入直播间、25-UGC直播观众观看、26-UGC直播我的预约、27-UGC直播我的直播)',
  `role_type` int COMMENT '权限类型(0.操作、1.浏览)',
  `role_flag` int COMMENT '权限标示(0-false,1-true)',
  `role_op` string COMMENT '权限操作拼串存储(1,2,3)(1-c,2-u,3-r,4-d)',
  `play_time` int COMMENT '视频、直播播放时长（单位：秒）',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_role_priv';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_role_priv_20170925` (
  `id` bigint COMMENT '',
  `customer_role` int COMMENT '会员id(med_customer_unite.customerRole)外键',
  `role_id` int COMMENT '权限id(1-收藏操作、2-订阅操作、3-文章终端页、4-视频终端页、5-下载操作、6-分享操作、7-评论操作、8-直播、回播终端页、9-直播中互动、10-会议日程、11-我的标签、12-我的评论评论我的、13-个人资料、14-更换头像、15-账号与安全、16-我的下载、17-我的收藏、18-设置、19-视频播放、20-点赞操作、21-浏览记录、22-UGC直播创建、23-UGC直播观众预约、24-UGC直播观众进入直播间、25-UGC直播观众观看、26-UGC直播我的预约、27-UGC直播我的直播)',
  `role_type` int COMMENT '权限类型(0.操作、1.浏览)',
  `role_flag` int COMMENT '权限标示(0-false,1-true)',
  `role_op` string COMMENT '权限操作拼串存储(1,2,3)(1-c,2-u,3-r,4-d)',
  `play_time` int COMMENT '视频、直播播放时长（单位：秒）',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_role_priv_20170925';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_share` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `session_id` string COMMENT '用户session_id',
  `share_type` int COMMENT '分享类型（1-视频，2-文库，4-产品，5-品牌，6-标签，13-直播，14-回播，99-专题）',
  `share_sence` int COMMENT '分享场景',
  `share_content` string COMMENT '分享内容',
  `resource_id` bigint COMMENT '资源id',
  `resource_type` bigint COMMENT '资源类型（1-视频，2-文库，3-会议，4-产品 ,5－品牌，6-标签，99-专题）',
  `ref_id` bigint COMMENT '分享具体信息id',
  `ref_customer_id` bigint COMMENT '冗余存放资源关联会员id',
  `ref_url` string COMMENT '分享地址',
  `share_channel` int COMMENT '分享渠道（1-微信好友，2-微信朋友圈，3-新浪微博，4-QQ好友，5-QQ空间）',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_share';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_statistics` (
  `id` bigint COMMENT 'id',
  `customer_id` bigint COMMENT '会员id',
  `video_num` bigint COMMENT '视频数',
  `doc_num` bigint COMMENT '文库数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `share_num` bigint COMMENT '分享数',
  `fans_num` bigint COMMENT '粉丝数',
  `follow_people_num` bigint COMMENT '关注人数',
  `respond_review_num` bigint COMMENT '回应我的评论数',
  `subscribe_num` bigint COMMENT '订阅数量',
  `person_up_num` bigint COMMENT '对人的赞数',
  `others_up_num` bigint COMMENT '被别人赞数',
  `follow_video_num` bigint COMMENT '关注视频数量',
  `follow_doc_num` bigint COMMENT '关注文库数量',
  `follow_tag_num` bigint COMMENT '关注标签数量',
  `create_time` timestamp COMMENT '创建时间'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_statistics';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_suggestion` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `reset_site` int COMMENT '关联站点 8-IOS，9-android',
  `suggestion` string COMMENT '建议内容',
  `system_version` string COMMENT '提交客户端版本信息',
  `equipment_version` string COMMENT '提交客户端设备版本信息',
  `network_environment` string COMMENT '提交客户端网络环境(2G、3G、4G等)',
  `suggestion_status` int COMMENT '状态(0-提交1-回复等)',
  `suggestion_type` int COMMENT '反馈类型（1-系统意见反馈，2-品牌反馈）',
  `state` int COMMENT '反馈处理状态（1-等待，2-处理中，3-已处理）',
  `create_time` timestamp COMMENT '创建记录时间',
  `site_id` int COMMENT '站点id',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_suggestion';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_unite` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `nickname` string COMMENT '昵称',
  `passwd` string COMMENT '密码',
  `init_passwd` string COMMENT '明码密码',
  `mobile` string COMMENT '手机号',
  `unite_time_mobile` timestamp COMMENT '绑定手机时间',
  `email` string COMMENT '邮箱',
  `unite_time_email` timestamp COMMENT '绑定邮箱时间',
  `unite_name_weixin` string COMMENT '微信号',
  `unite_flag_weixin` int COMMENT '状态weixin',
  `unite_time_weixin` timestamp COMMENT '邦定时间',
  `unite_name_allin` string COMMENT '',
  `unite_flag_allin` int COMMENT '状态weixin',
  `unite_time_allin` timestamp COMMENT '邦定时间',
  `unite_id_allin` bigint COMMENT '联合登陆allin_id',
  `customer_role` int COMMENT '0-普通用户，1-医务人员，2-生产厂家，3-渠道/经销商，4-医学组织',
  `check_email_time` timestamp COMMENT '验证邮箱时间',
  `check_mobile_time` timestamp COMMENT '验证手机时间',
  `is_check_email` int COMMENT '是否验证邮箱',
  `is_check_mobile` int COMMENT '是否验证手机',
  `regist_time` timestamp COMMENT '注册时间',
  `create_time` timestamp COMMENT '创建时间',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_unite';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_unite_20170724` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `nickname` string COMMENT '昵称',
  `passwd` string COMMENT '密码',
  `init_passwd` string COMMENT '明码密码',
  `mobile` string COMMENT '手机号',
  `unite_time_mobile` timestamp COMMENT '绑定手机时间',
  `email` string COMMENT '邮箱',
  `unite_time_email` timestamp COMMENT '绑定邮箱时间',
  `unite_name_weixin` string COMMENT '微信号',
  `unite_flag_weixin` int COMMENT '状态weixin',
  `unite_time_weixin` timestamp COMMENT '邦定时间',
  `unite_name_allin` string COMMENT '',
  `unite_flag_allin` int COMMENT '状态weixin',
  `unite_time_allin` timestamp COMMENT '邦定时间',
  `unite_id_allin` bigint COMMENT '联合登陆allin_id',
  `customer_role` int COMMENT '0-普通用户，1-医务人员，2-生产厂家，3-渠道/经销商，4-医学组织',
  `check_email_time` timestamp COMMENT '验证邮箱时间',
  `check_mobile_time` timestamp COMMENT '验证手机时间',
  `is_check_email` int COMMENT '是否验证邮箱',
  `is_check_mobile` int COMMENT '是否验证手机',
  `regist_time` timestamp COMMENT '注册时间',
  `create_time` timestamp COMMENT '创建时间',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_unite_20170724';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_unite_20170917` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `nickname` string COMMENT '昵称',
  `passwd` string COMMENT '密码',
  `init_passwd` string COMMENT '明码密码',
  `mobile` string COMMENT '手机号',
  `unite_time_mobile` timestamp COMMENT '绑定手机时间',
  `email` string COMMENT '邮箱',
  `unite_time_email` timestamp COMMENT '绑定邮箱时间',
  `unite_name_weixin` string COMMENT '微信号',
  `unite_flag_weixin` int COMMENT '状态weixin',
  `unite_time_weixin` timestamp COMMENT '邦定时间',
  `unite_name_allin` string COMMENT '',
  `unite_flag_allin` int COMMENT '状态weixin',
  `unite_time_allin` timestamp COMMENT '邦定时间',
  `unite_id_allin` bigint COMMENT '联合登陆allin_id',
  `customer_role` int COMMENT '0-普通用户，1-医务人员，2-生产厂家，3-渠道/经销商，4-医学组织',
  `check_email_time` timestamp COMMENT '验证邮箱时间',
  `check_mobile_time` timestamp COMMENT '验证手机时间',
  `is_check_email` int COMMENT '是否验证邮箱',
  `is_check_mobile` int COMMENT '是否验证手机',
  `regist_time` timestamp COMMENT '注册时间',
  `create_time` timestamp COMMENT '创建时间',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_unite_20170917';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_unite_info` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `unite_id` int COMMENT '渠道id',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_unite_info';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_verification` (
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
  `create_time` timestamp COMMENT '创建时间',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_verification';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_customer_video_play` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `video_id` bigint COMMENT '视频id',
  `type_id` int COMMENT '1-播放、2-下载',
  `play_time` string COMMENT '关闭或暂停时播放时间点',
  `create_time` timestamp COMMENT '创建记录时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_customer_video_play';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_demand` (
  `id` bigint COMMENT '',
  `demand_id` bigint COMMENT '需求id',
  `customer_id` bigint COMMENT '会员id',
  `demand_type` bigint COMMENT '需求发布分类的id（1-招商发布，2-药械求助，3-药械需求。可参考med_comm_assortment表的resource_type列值为2的数据）',
  `demand_type_name` string COMMENT '需求发布分类的名称',
  `demand_name` string COMMENT '需求标题',
  `brand_id` bigint COMMENT '品牌id',
  `brand_name` string COMMENT '品牌名称',
  `product_id` bigint COMMENT '产品id',
  `product_name` string COMMENT '产品名称',
  `product_type` bigint COMMENT '产品类型的id',
  `product_type_name` string COMMENT '产品类型的名称',
  `product_specification` string COMMENT '规格型号',
  `province_id` int COMMENT '省id',
  `province` string COMMENT '省',
  `city_id` int COMMENT '市id',
  `city` string COMMENT '市',
  `district_id` int COMMENT '区/县id',
  `expire_date` timestamp COMMENT '需求有效截止日期',
  `phone` string COMMENT '联系方式',
  `demand_abstract` string COMMENT '备注',
  `is_draft` int COMMENT '状态（0-正式稿、1-草稿）',
  `is_header` int COMMENT '是否置顶',
  `site_id` int COMMENT '站点',
  `tpl_path` string COMMENT '模版id',
  `web_storage_path` string COMMENT 'H5存储路径',
  `app_storage_path` string COMMENT 'app存储路径',
  `create_time` timestamp COMMENT '创建时间',
  `publish_time` timestamp COMMENT '发布日期',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `up_num` bigint COMMENT '赞数',
  `browse_num` bigint COMMENT '浏览数',
  `review_num` bigint COMMENT '评论数',
  `collection_num` bigint COMMENT '收藏数',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
) COMMENT '需求发布'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_demand';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_demand_attachment` (
  `id` bigint COMMENT '',
  `demand_id` bigint COMMENT '需求id',
  `att_name` string COMMENT '附件说明（图片标题等）',
  `att_type` int COMMENT '资源类型：1-图片',
  `att_size` string COMMENT '资源大小：KB',
  `att_format` string COMMENT '资源格式：jpg、mp4...',
  `att_spec` string COMMENT '附件规格(1-原始文件)',
  `att_height` string COMMENT '资源高度',
  `att_width` string COMMENT '资源宽度',
  `att_url` string COMMENT '资源url',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `upload_time` timestamp COMMENT '资源上传时间',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效',
  `play_num` int COMMENT '是否已经批处理(0-未处理1-已处理2-处理失败)'
) COMMENT '需求发布的附件'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_demand_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_demand_content` (
  `id` bigint COMMENT '',
  `demand_id` bigint COMMENT '需求id',
  `content_type` int COMMENT '文本类型 0-文本，1-图片，2-视频',
  `content` string COMMENT '',
  `att_id` bigint COMMENT '附件表中的id',
  `att_name` string COMMENT '附件描述',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
) COMMENT '需求发布内容表'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_demand_content';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_doc` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_doc';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_doc_attachment` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_doc_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_doc_attachment_20160420` (
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
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_doc_attachment_20160420';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_doc_attachment_20160512` (
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
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_doc_attachment_20160512';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_doc_attachment_20170317` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_doc_attachment_20170317';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_doc_attachment_20170321` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_doc_attachment_20170321';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_doc_author` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文档编号',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `doc_name` string COMMENT '文档名称',
  `author_type` int COMMENT '类型（1-第一作者，2-第一译者，3-联名作者，4-联名译者，5-转载）',
  `author_id` bigint COMMENT '作者、译者编号',
  `author_name` string COMMENT '作者、译者名称',
  `create_time` timestamp COMMENT '创作日期',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '文档作者译者对应关系'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_doc_author';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_doc_content` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_doc_content';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_doc_content_20160510` (
  `id` bigint COMMENT '',
  `doc_id` bigint COMMENT '文库id（生成id规则：毫秒数）',
  `doc_content` string COMMENT '评论内容',
  `tpl_path` string COMMENT '模板路径',
  `create_time` timestamp COMMENT '创作日期',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效,2-用户删除)'
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_doc_content_20160510';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_navigation` (
  `id` bigint COMMENT '',
  `navigation_id` bigint COMMENT '导航id',
  `navigation_name` string COMMENT '导航名称',
  `navigation_type` int COMMENT '导航类型(1.品牌活动、2.专题汇聚、3.手术操作、4.我的订阅、5.行业动态、6.学术会议、7.个人直播、8.论坛互动)',
  `channel_type` int COMMENT '频道类型(1-首页)',
  `app_storage_param` string COMMENT 'app存储参数',
  `page_storage_path` string COMMENT '网站版菜单项存储路径',
  `web_storage_path` string COMMENT '手机版菜单项存储路径',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_navigation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_navigation_attachment` (
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
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_navigation_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_navigation_scheduling` (
  `id` bigint COMMENT '',
  `navigation_id` bigint COMMENT '导航id',
  `navigation_attachment_id` string COMMENT '导航图标id',
  `navigation_status` int COMMENT '导航状态(1-Hot，2-New)',
  `status_attachment_id` bigint COMMENT '导航状态图标id',
  `start_time` timestamp COMMENT '开始时间',
  `end_time` timestamp COMMENT '结束时间',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_navigation_scheduling';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_pdf_pic` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_pdf_pic';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_pdf_pic_20170110` (
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
  `site_id` int COMMENT '站点'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_pdf_pic_20170110';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_pdf_pic_20170405` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_pdf_pic_20170405';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_pdf_pic_copy` (
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
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_pdf_pic_copy';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_product` (
  `id` bigint COMMENT '',
  `product_id` bigint COMMENT '产品id',
  `product_name` string COMMENT '产品名称',
  `brand_id` bigint COMMENT '品牌id',
  `brand_name` string COMMENT '品牌名称',
  `product_abstract` string COMMENT '产品简介',
  `product_source` int COMMENT '所有渠道：1-国产,2-进口,3-国外销售',
  `follow_num` bigint COMMENT '关注数',
  `browse_num` bigint COMMENT '浏览数',
  `collection_num` bigint COMMENT '收藏数',
  `review_num` bigint COMMENT '评论数',
  `reprint_num` bigint COMMENT '转发数',
  `share_num` bigint COMMENT '分享数',
  `prefer_num` bigint COMMENT '赞数',
  `tpl_path` string COMMENT '模版路径or模版id',
  `web_storage_path` string COMMENT '手机版页面生成URL',
  `create_time` timestamp COMMENT '创建时间',
  `last_update_time` timestamp COMMENT '最近一次更新时间',
  `sort_id` int COMMENT '顺序号',
  `sort_ref_name` string COMMENT '产品名称首字母排序',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
) COMMENT '产品信息'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_product';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_product_attachment` (
  `id` bigint COMMENT '',
  `product_id` bigint COMMENT '产品id',
  `att_type` int COMMENT '1-图片（logo），2-产品介绍PDF，3-轮播，4-全景图压缩包，5-全景图缩略图，6-图集',
  `att_format` string COMMENT '附件格式：jpg、mp4...',
  `att_spec` string COMMENT '附件规格：(1-原始文件，2-PDF图片集)',
  `att_path` string COMMENT '附件地址',
  `att_size` string COMMENT '附件大小：KB',
  `att_height` string COMMENT '附件高度',
  `att_width` string COMMENT '附件宽度',
  `att_name` string COMMENT '附件名称',
  `att_desc` string COMMENT '附件描述',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)',
  `play_num` int COMMENT '是否已经批处理(0-未处理1-已处理2-处理失败)',
  `ref_id` bigint COMMENT '全景图id',
  `customer_id` bigint COMMENT '用户id',
  `state` int COMMENT '是否审核(0-提交审核，1审核通过，2-审核不通过)'
) COMMENT '产品附件'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_product_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_product_parameter` (
  `id` bigint COMMENT '',
  `parameter_id` bigint COMMENT '参数项id',
  `parameter_name` string COMMENT '名称',
  `product_category_id` bigint COMMENT '产品目录id',
  `is_selectable` int COMMENT '是否可选择(0-否,1-是)',
  `parameter_value` string COMMENT '参数值(只有当is_selectable为1时，parameter_value才有值)',
  `sort_id` int COMMENT '排序',
  `parent_id` bigint COMMENT '父节点',
  `is_common` int COMMENT '是否通用',
  `update_time` timestamp COMMENT '更新时间',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点id',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
) COMMENT '产品参数项'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_product_parameter';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_product_parameter_value` (
  `id` bigint COMMENT '',
  `product_value_id` bigint COMMENT '产品参数项值ID',
  `product_id` bigint COMMENT '产品id',
  `parameter_id` bigint COMMENT '参数项id',
  `parameter_name` string COMMENT '参数项名称',
  `parameter_value` string COMMENT '参数值',
  `sort_id` int COMMENT '排序',
  `parent_parameter_id` bigint COMMENT '父参数项id',
  `parent_parameter_name` string COMMENT '父参数项名称',
  `parent_sort_id` int COMMENT '父参数项排序',
  `update_time` timestamp COMMENT '更新时间',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
) COMMENT '产品参数项的值'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_product_parameter_value';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_queue_customer` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_queue_customer';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_recommend_customer` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `recommend_position` int COMMENT '应用场景(1-网站个人主页有可能认识的人)',
  `recommend_type` int COMMENT '推荐类型(0-推荐,1-同单位,2-同学校等)',
  `recommend_customer_id` bigint COMMENT '推荐会员id',
  `recommend_logo_spec` string COMMENT '头像原图',
  `recommend_last_name` string COMMENT '姓',
  `recommend_first_name` string COMMENT '名',
  `recommend_nickname` string COMMENT '昵称',
  `recommend_medical_title` string COMMENT '医学职称',
  `recommend_hospital` string COMMENT '医院',
  `relationship` int COMMENT '关系(1-未关注，2-已关注，3-粉丝，4-相互关注)',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` bigint COMMENT '排序id',
  `is_valid` int COMMENT '删除标记'
) COMMENT '推荐-人'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_recommend_customer';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_recommend_customer_resource` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `recommend_position` int COMMENT '应用场景(1-默认、2-首页精选、3-首页最新)',
  `recommend_man` string COMMENT '推荐人',
  `recommend_ref_type` int COMMENT '推荐资源类型(1-视频，2-文库，3-会议，4-产品，5-品牌)',
  `recommend_ref_id` bigint COMMENT '推荐资源id',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` bigint COMMENT '排序id',
  `site_id` int COMMENT '站点id',
  `is_valid` int COMMENT ''
) COMMENT '会员推荐资源'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_recommend_customer_resource';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_recommend_customer_resource_20170606` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `recommend_position` int COMMENT '应用场景(1-默认、2-首页精选、3-首页最新)',
  `recommend_man` string COMMENT '推荐人',
  `recommend_ref_type` int COMMENT '推荐资源类型(1-视频，2-文库，3-会议，4-产品，5-品牌)',
  `recommend_ref_id` bigint COMMENT '推荐资源id',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` bigint COMMENT '排序id',
  `site_id` int COMMENT '站点id',
  `is_valid` int COMMENT ''
) COMMENT '会员推荐资源'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_recommend_customer_resource_20170606';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_recommend_resource_item` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '资源id',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-产品，5-品牌)',
  `recommend_position` int COMMENT '应用场景(1-内容页)',
  `recommend_id` bigint COMMENT '推荐资源id',
  `recommend_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-产品，5-品牌，15-分会)',
  `create_time` timestamp COMMENT '创建时间',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '删除标记'
) COMMENT '资源推荐资源'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_recommend_resource_item';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_recommend_resource_item_20160413` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '资源id',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-产品，5-品牌)',
  `recommend_position` int COMMENT '应用场景(1-内容页)',
  `recommend_id` bigint COMMENT '推荐资源id',
  `recommend_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-产品，5-品牌)',
  `create_time` timestamp COMMENT '创建时间',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '删除标记'
) COMMENT '资源推荐资源'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_recommend_resource_item_20160413';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_recommend_resource_item_20170316` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '资源id',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-产品，5-品牌)',
  `recommend_position` int COMMENT '应用场景(1-内容页)',
  `recommend_id` bigint COMMENT '推荐资源id',
  `recommend_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-产品，5-品牌，15-分会)',
  `create_time` timestamp COMMENT '创建时间',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '删除标记'
) COMMENT '资源推荐资源'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_recommend_resource_item_20170316';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_recommend_resource_item_copy` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '资源id',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-产品，5-品牌)',
  `recommend_position` int COMMENT '应用场景(1-内容页)',
  `recommend_id` bigint COMMENT '推荐资源id',
  `recommend_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-产品，5-品牌，15-分会)',
  `create_time` timestamp COMMENT '创建时间',
  `is_header` int COMMENT '是否置顶',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '删除标记'
) COMMENT '资源推荐资源'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_recommend_resource_item_copy';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_resource_category` (
  `id` bigint COMMENT '',
  `resource_type` int COMMENT '资源类型(4-产品)',
  `resource_id` bigint COMMENT '资源id',
  `category_id` bigint COMMENT '类目id',
  `create_time` timestamp COMMENT '创建日期',
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '自定义类目-资源-对照表'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_resource_category';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_resource_property` (
  `id` bigint COMMENT '',
  `resource_type` int COMMENT '资源类型(1-视频,2-文库，3-会议，4-产品，5-品牌)',
  `resource_id` bigint COMMENT '资源id',
  `resource_name` string COMMENT '资源标题',
  `property_id` bigint COMMENT '属性id',
  `property_name` string COMMENT '属性名称',
  `tree_level` int COMMENT '节点级别',
  `property_parent_id` bigint COMMENT 'tag父节点',
  `property_full_path` string COMMENT 'tag完全路径',
  `property_path_name` string COMMENT 'tag完全路径名称',
  `create_time` timestamp COMMENT '创建日期',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_resource_property';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_resource_property_20170410` (
  `id` bigint COMMENT '',
  `resource_type` int COMMENT '资源类型(1-视频,2-文库，3-会议，4-产品，5-品牌)',
  `resource_id` bigint COMMENT '资源id',
  `resource_name` string COMMENT '资源标题',
  `property_id` bigint COMMENT '属性id',
  `property_name` string COMMENT '属性名称',
  `tree_level` int COMMENT '节点级别',
  `property_parent_id` bigint COMMENT 'tag父节点',
  `property_full_path` string COMMENT 'tag完全路径',
  `property_path_name` string COMMENT 'tag完全路径名称',
  `create_time` timestamp COMMENT '创建日期',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_resource_property_20170410';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_resource_sign` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '资源id',
  `resource_type` int COMMENT '资源类型(1-视频，2-文库，4-产品, 5-品牌)',
  `resource_sign` int COMMENT '资源标签(1-最新、2-最热、4-精华、8-?、16-?)',
  `create_time` timestamp COMMENT '创建时间',
  `user_id` bigint COMMENT '操作用户id',
  `is_valid` int COMMENT '是否有效'
) COMMENT '资源徽标表'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_resource_sign';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_sys_message` (
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
  `send_site_id` int COMMENT '操作来源 （11-H5、8-ios、9-android）',
  `op_usr` string COMMENT '操作人员id',
  `is_valid` int COMMENT '是否有效 0-无效、1-有效',
  `is_send` int COMMENT '是否发送  -1已发送完毕 '
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_sys_message';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_theme` (
  `id` bigint COMMENT '',
  `theme_id` bigint COMMENT '业务id',
  `theme_name` string COMMENT '专题名称',
  `theme_intro` string COMMENT '专题简介',
  `theme_type` int COMMENT '专题类型(0-专题、1-专题汇总)',
  `theme_ref_style` int COMMENT '0-左图片右文字  1-左文字右图片 2-上图片下文字（2列） 3-上图片下文字（1列） 4-上文字下图片（1列）',
  `web_menu_style` int COMMENT '手机菜单风格(0-切换、1-定位)',
  `page_menu_style` int COMMENT 'pc菜单风格(0-顶部导航、1-侧面导航)',
  `share_title` string COMMENT '分享标题',
  `share_content` string COMMENT '分享话术',
  `seo_name` string COMMENT 'seo名称',
  `seo_desc` string COMMENT 'seo描述',
  `seo_key_word` string COMMENT 'seo关键词',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `is_header` int COMMENT '是否置顶'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_theme';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_theme_ad` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_theme_ad';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_theme_attachment` (
  `id` bigint COMMENT '',
  `ref_id` bigint COMMENT '主表id',
  `ref_type` int COMMENT '主表类型(0-专题、1-菜单、2-分享图片、3-列表缩略图)',
  `bg_color_style` string COMMENT '背景色#2b29...',
  `att_scene` int COMMENT '场景(专题:0-区域一、1-区域二、2-区域三;菜单:0-标题(图片形式存储)、1-选中、2-未选中)',
  `att_height` int COMMENT '附件高',
  `att_width` int COMMENT '附件宽',
  `att_link_url` string COMMENT '附件链接路径',
  `att_pic_url` string COMMENT '附件图片地址',
  `site_id` int COMMENT '站点配置(1-医栈PC、2-医栈H5...)',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_theme_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_theme_menu` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_theme_menu';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_theme_resource` (
  `id` bigint COMMENT '',
  `theme_resource_id` bigint COMMENT '业务id',
  `theme_id` bigint COMMENT '专题id(冗余存储)',
  `menu_id` bigint COMMENT '菜单id',
  `ref_id` bigint COMMENT '推荐资源id',
  `ref_type` int COMMENT '资源类型(1-视频，2-文库，3-会议，4-产品，5-品牌，99-专题)',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_theme_resource';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_theme_resource_attachment` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_theme_resource_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_theme_resource_attachment_20161230` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_theme_resource_attachment_20161230';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_theme_tpl` (
  `id` bigint COMMENT '',
  `theme_id` bigint COMMENT '专题id',
  `theme_storage_path` string COMMENT '专题访问路径',
  `app_storage_path` string COMMENT '专题访问手机路径',
  `site_id` int COMMENT '站点配置(1-医栈PC、2-医栈H5...)',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_theme_tpl';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_topic` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `topic_id` bigint COMMENT '话题id',
  `topic_name` string COMMENT '话题标题',
  `topic_type` int COMMENT '话题类型(1-器械讨论，2-手术技巧，3-病例讨论)',
  `topic_discuss` string COMMENT '话题描述',
  `topic_url` string COMMENT '话题页url',
  `tpl_path` string COMMENT '模版路径or模版id',
  `page_storage_path` string COMMENT 'pc版地址',
  `web_storage_path` string COMMENT '手机版地址',
  `create_time` timestamp COMMENT '创作日期',
  `publish_time` timestamp COMMENT '发布日期',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
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
  `app_storage_path` string COMMENT 'app存储路径'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_topic';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_topic_attachment` (
  `id` bigint COMMENT '',
  `topic_id` bigint COMMENT '话题id',
  `topic_att_type` int COMMENT '资源类型：1-图片',
  `topic_att_size` string COMMENT '资源大小：KB',
  `topic_att_format` string COMMENT '资源格式：jpg、mp4...',
  `topic_att_spec` string COMMENT '附件规格(1-原始文件)',
  `topic_att_height` string COMMENT '资源高度',
  `topic_att_width` string COMMENT '资源宽度',
  `topic_att_url` string COMMENT '资源url',
  `upload_time` timestamp COMMENT '资源上传时间',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '顺序号',
  `is_valid` int COMMENT '是否有效',
  `dyna_height` string COMMENT '动态图片高度',
  `dyna_width` string COMMENT '动态图片宽度',
  `send_site_id` int COMMENT '站点',
  `topic_att_name` string COMMENT '附件说明（图片标题等）',
  `play_num` int COMMENT '是否已经批处理(0-未处理1-已处理2-处理失败)'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_topic_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_topic_content` (
  `id` bigint COMMENT '',
  `topic_id` bigint COMMENT '话题id',
  `content_type` int COMMENT '文本类型 0-文本，1-图片，2-视频',
  `content` string COMMENT '',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_topic_content';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_video` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_video';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_video_20160405` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `video_name` string COMMENT '视频标题',
  `video_type` int COMMENT '视频类型(1-手术视频，2-课程视频，3-会议视频，4-专家访谈视频)',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_video_20160405';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_video_20160407` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `video_name` string COMMENT '视频标题',
  `video_type` int COMMENT '视频类型(1-手术视频，2-课程视频，3-会议视频，4-专家访谈视频)',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_video_20160407';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_video_20160812` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频id',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `video_name` string COMMENT '视频标题',
  `video_type` int COMMENT '视频类型(1-手术视频，2-课程视频，3-会议视频，4-专家访谈视频)',
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_video_20160812';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_video_20170517` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_video_20170517';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_video_attachment` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_video_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_video_attachment_20160407` (
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
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_video_attachment_20160407';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_video_attachment_20160504` (
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
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_video_attachment_20160504';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_video_attachment_20160512` (
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
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_video_attachment_20160512';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_video_attachment_20160816` (
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
  `sort_id` int COMMENT '顺序号',
  `site_id` int COMMENT '站点',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_video_attachment_20160816';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_video_attachment_20170323` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_video_attachment_20170323';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_video_attachment_20181102` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_video_attachment_20181102';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_video_author` (
  `id` bigint COMMENT '',
  `video_id` bigint COMMENT '视频编号',
  `video_name` string COMMENT '视频名称',
  `author_type` int COMMENT '类型（1-作者，2-译者，3-来源）',
  `author_id` bigint COMMENT '作者、译者、来源编号',
  `author_name` string COMMENT '作者、译者、来源名称',
  `ref_customer_id` bigint COMMENT '关联会员id',
  `create_time` timestamp COMMENT '创作日期',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_video_author';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_med_video_node` (
  `id` bigint COMMENT '',
  `node_id` bigint COMMENT '业务主键',
  `node_name` string COMMENT '节点名称',
  `node_desc` string COMMENT '节点描述(备用)',
  `node_time` int COMMENT '节点时间（单位：秒）',
  `node_type` int COMMENT '节点类型()',
  `ref_id` string COMMENT '引用资源id',
  `ref_type` int COMMENT '引用资源类型(1-视频，3-会议)',
  `sort_id` int COMMENT '顺序号',
  `create_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效)'
) COMMENT '视频锚点表'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_med_video_node';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_merge_table` (
  `id` bigint COMMENT 'id',
  `allin_id` bigint COMMENT '唯医数据表id',
  `allin_customer_id` bigint COMMENT '唯医会员id',
  `med_id` bigint COMMENT '医栈数据表id',
  `med_customer_id` bigint COMMENT '医栈会员id',
  `is_valid` int COMMENT '是否有效',
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform/ods_merge_table';

