CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_patienteducation_cms_manual` (
  `id` bigint COMMENT '',
  `manual_id` bigint COMMENT '手册id',
  `manual_name` string COMMENT '手册名字',
  `adapt_crowd` string COMMENT '适应人群',
  `experts_say` string COMMENT '专家说',
  `recommender` string COMMENT '推荐专家（id用逗号分隔）',
  `author_id` bigint COMMENT '创建者id',
  `author_name` string COMMENT '创建者姓名',
  `open_state` int COMMENT '属性：1公开2私密（不允许被搜索）',
  `state` int COMMENT '状态：1上架2下架',
  `browse_num` bigint COMMENT '浏览数',
  `collection_num` bigint COMMENT '收藏数',
  `share_num` bigint COMMENT '分享数',
  `reprint_num` bigint COMMENT '转载数',
  `is_valid` int COMMENT '是否有效',
  `sort_id` int COMMENT '顺序号',
  `last_update_time` timestamp COMMENT '更新时间',
  `create_time` timestamp COMMENT '创建时间',
  `is_view_flag` int COMMENT '是否可见（0-患者端医生主页不可见1-患者端医生主页可见）',
  `source_type` int COMMENT '用户来源类型（0-PGC1-UGC）',
  `is_classify` int COMMENT '是否分类（-1不分类0分类）',
  `site_id` int COMMENT '站点id',
  `operator_id` string COMMENT '操作者id',
  `operator_name` string COMMENT '操作者姓名',
  `operator_time` timestamp COMMENT '操作时间'
) COMMENT '患教手册'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/patienteducation_platform/ods_patienteducation_cms_manual';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_patienteducation_cms_manual_attachment` (
  `id` bigint COMMENT '',
  `manual_id` bigint COMMENT '患教知识id',
  `manual_type` int COMMENT '所属类型',
  `att_name` string COMMENT '附件说明（图片标题等）',
  `att_type` int COMMENT '附件类型：1-图片，2-视频,4-视频缩略图,5-语音,6-封面图片7-普通二维码8-小程序二维码',
  `att_size` string COMMENT '附件大小：KB',
  `att_format` string COMMENT '附件格式：jpg、mp4...',
  `att_spec` string COMMENT '附件规格(1-原始文件、2-缩略图源文件、3-225*150、4-157*109、5-140*190、6-110*150、7-75*52、8-480*320、9-1280*720、10-900*600、12-300*200、13-450*300、14-750*500、15-204*186)',
  `att_height` string COMMENT '附件高度',
  `att_width` string COMMENT '附件宽度',
  `att_url` string COMMENT '附件url',
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
  `att_source` int COMMENT '附件来源（0-默认1-医生端编辑患教内容）',
  `ref_customer_id` bigint COMMENT '分享医生id',
  `qr_content` string COMMENT '二维码内容'
) COMMENT '手册附件表'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/patienteducation_platform/ods_patienteducation_cms_manual_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_patienteducation_cms_manual_education_realtion` (
  `id` bigint COMMENT '',
  `manual_id` bigint COMMENT '手册id',
  `parent_id` bigint COMMENT '父级id 子集没有父级时为：-1',
  `parent_name` string COMMENT '父级名称',
  `education_id` bigint COMMENT '患教id',
  `is_valid` int COMMENT '是否有效',
  `sort_id` int COMMENT '顺序号',
  `tips_content` string COMMENT '提示内容',
  `update_time` timestamp COMMENT '更新时间',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '患教手册关系库'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/patienteducation_platform/ods_patienteducation_cms_manual_education_realtion';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_patienteducation_cms_manual_label_relation` (
  `id` bigint COMMENT '',
  `manual_id` bigint COMMENT '患教手册id',
  `label_id` bigint COMMENT '标签id',
  `label_type` int COMMENT '标签类型：1专业2疾病',
  `label_name` string COMMENT '标签名',
  `is_valid` int COMMENT '是否有效',
  `sort_id` int COMMENT '顺序号',
  `update_time` timestamp COMMENT '更新时间',
  `create_time` timestamp COMMENT '创建时间'
) COMMENT '患教手册标签关系表'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/patienteducation_platform/ods_patienteducation_cms_manual_label_relation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_patienteducation_cms_patient_education` (
  `id` bigint COMMENT '',
  `education_id` bigint COMMENT '',
  `education_name` string COMMENT '患教知识名称',
  `education_type` int COMMENT '类型',
  `education_desc` string COMMENT '',
  `ref_customer_id` bigint COMMENT '作者id',
  `browse_num` bigint COMMENT '浏览数',
  `review_num` bigint COMMENT '评论数',
  `share_num` bigint COMMENT '分享数',
  `status` int COMMENT '患教状态0-待审核1-审核通过2-审核拒绝',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `create_time` timestamp COMMENT '创建时间',
  `source_id` int COMMENT '来源0-自产出',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `collection_num` bigint COMMENT '收藏数',
  `reprint_num` bigint COMMENT '转发数',
  `prefer_up_num` bigint COMMENT '赞数',
  `education_content_type` int COMMENT '患教内容类型0-文章1-视频2-语音3-图片4-综合',
  `page_storage_path` string COMMENT '',
  `web_storage_path` string COMMENT '',
  `app_storage_path` string COMMENT '',
  `tpl_path` string COMMENT '',
  `part_id_list` string COMMENT '部位id串',
  `major_id_list` string COMMENT '专业id串',
  `illness_id_list` string COMMENT '疾病id串',
  `operation_id_list` string COMMENT '手术方式id串',
  `illness_state_id_list` string COMMENT '疾病发展阶段（1-疾病科普2-疾病自查3-保守治疗4-手术前5-手术中6-手术后7-疾病康复）',
  `illness_state` int COMMENT '疾病发展阶段（1-疾病科普2-疾病自查3-保守治疗4-手术前5-手术中6-手术后7-疾病康复）',
  `is_recommend` int COMMENT '能否推荐(0-不能推荐1-能推荐)',
  `is_reprint` int COMMENT '能否转载(0-不能转载1-能转载)',
  `ill_id_list` string COMMENT '',
  `illness_unite_id_list` string COMMENT '',
  `band_customer_time` timestamp COMMENT '绑定作者时间',
  `source_type` int COMMENT '用户来源类型（0-PGC1-UGC）',
  `ref_customer_id_list` string COMMENT '作者id串',
  `ref_customer_name_list` string COMMENT '患教多作者姓名list',
  `send_site_id` int COMMENT '站点'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/patienteducation_platform/ods_patienteducation_cms_patient_education';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_patienteducation_cms_patient_education_20181227` (
  `id` bigint COMMENT '',
  `education_id` bigint COMMENT '',
  `education_name` string COMMENT '患教知识名称',
  `education_type` int COMMENT '类型',
  `education_desc` string COMMENT '',
  `ref_customer_id` bigint COMMENT '作者id',
  `browse_num` bigint COMMENT '浏览数',
  `review_num` bigint COMMENT '评论数',
  `share_num` bigint COMMENT '分享数',
  `status` int COMMENT '患教状态0-待审核1-审核通过2-审核拒绝',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `create_time` timestamp COMMENT '创建时间',
  `source_id` int COMMENT '来源0-自产出',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `collection_num` bigint COMMENT '收藏数',
  `reprint_num` bigint COMMENT '转发数',
  `prefer_up_num` bigint COMMENT '赞数',
  `education_content_type` int COMMENT '患教内容类型0-文章1-视频2-语音3-图片4-综合',
  `page_storage_path` string COMMENT '',
  `web_storage_path` string COMMENT '',
  `app_storage_path` string COMMENT '',
  `tpl_path` string COMMENT '',
  `part_id_list` string COMMENT '部位id串',
  `major_id_list` string COMMENT '专业id串',
  `illness_id_list` string COMMENT '疾病id串',
  `operation_id_list` string COMMENT '手术方式id串',
  `illness_state_id_list` string COMMENT '疾病发展阶段（1-疾病科普2-疾病自查3-保守治疗4-手术前5-手术中6-手术后7-疾病康复）',
  `illness_state` int COMMENT '疾病发展阶段（1-疾病科普2-疾病自查3-保守治疗4-手术前5-手术中6-手术后7-疾病康复）',
  `is_recommend` int COMMENT '能否推荐(0-不能推荐1-能推荐)',
  `is_reprint` int COMMENT '能否转载(0-不能转载1-能转载)',
  `ill_id_list` string COMMENT '',
  `illness_unite_id_list` string COMMENT '',
  `band_customer_time` timestamp COMMENT '绑定作者时间'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/patienteducation_platform/ods_patienteducation_cms_patient_education_20181227';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_patienteducation_cms_patient_education_20190108` (
  `id` bigint COMMENT '',
  `education_id` bigint COMMENT '',
  `education_name` string COMMENT '患教知识名称',
  `education_type` int COMMENT '类型',
  `education_desc` string COMMENT '',
  `ref_customer_id` bigint COMMENT '作者id',
  `browse_num` bigint COMMENT '浏览数',
  `review_num` bigint COMMENT '评论数',
  `share_num` bigint COMMENT '分享数',
  `status` int COMMENT '患教状态0-待审核1-审核通过2-审核拒绝',
  `last_update_time` timestamp COMMENT '最近一次修改时间',
  `create_time` timestamp COMMENT '创建时间',
  `source_id` int COMMENT '来源0-自产出',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `collection_num` bigint COMMENT '收藏数',
  `reprint_num` bigint COMMENT '转发数',
  `prefer_up_num` bigint COMMENT '赞数',
  `education_content_type` int COMMENT '患教内容类型0-文章1-视频2-语音3-图片4-综合',
  `page_storage_path` string COMMENT '',
  `web_storage_path` string COMMENT '',
  `app_storage_path` string COMMENT '',
  `tpl_path` string COMMENT '',
  `part_id_list` string COMMENT '部位id串',
  `major_id_list` string COMMENT '专业id串',
  `illness_id_list` string COMMENT '疾病id串',
  `operation_id_list` string COMMENT '手术方式id串',
  `illness_state_id_list` string COMMENT '疾病发展阶段（1-疾病科普2-疾病自查3-保守治疗4-手术前5-手术中6-手术后7-疾病康复）',
  `illness_state` int COMMENT '疾病发展阶段（1-疾病科普2-疾病自查3-保守治疗4-手术前5-手术中6-手术后7-疾病康复）',
  `is_recommend` int COMMENT '能否推荐(0-不能推荐1-能推荐)',
  `is_reprint` int COMMENT '能否转载(0-不能转载1-能转载)',
  `ill_id_list` string COMMENT '',
  `illness_unite_id_list` string COMMENT '',
  `band_customer_time` timestamp COMMENT '绑定作者时间',
  `source_type` int COMMENT '用户来源类型（0-PGC1-UGC）',
  `ref_customer_id_list` string COMMENT '作者id串',
  `ref_customer_name_list` string COMMENT '患教多作者姓名list',
  `send_site_id` int COMMENT '站点'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/patienteducation_platform/ods_patienteducation_cms_patient_education_20190108';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_patienteducation_cms_patient_education_attachment` (
  `id` bigint COMMENT '',
  `education_id` bigint COMMENT '患教知识id',
  `education_type` int COMMENT '所属类型',
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
  `create_time` timestamp COMMENT '创建时间',
  `qiniu_id` string COMMENT '七牛视频唯一id',
  `qiniu_status` int COMMENT '七牛视频处理状态0－未上传，1－上传成功，2－转码成功,3-转码中',
  `is_qiniu` int COMMENT '是否七牛砖码,默认值0-不是，1-是七牛',
  `play_num` bigint COMMENT '播放次数',
  `play_time` string COMMENT '播放时长',
  `att_source` int COMMENT '附件来源'
) COMMENT '患教附件表'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/patienteducation_platform/ods_patienteducation_cms_patient_education_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_patienteducation_cms_patient_education_content` (
  `id` bigint COMMENT '',
  `education_id` bigint COMMENT '',
  `education_content` string COMMENT '正文内容',
  `create_time` timestamp COMMENT '创建时间',
  `tpl_path` string COMMENT '模板路径',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效,2-用户删除)',
  `send_site_id` int COMMENT '站点',
  `content_type` int COMMENT '内容类型 1-文本，2-图片，3-视频',
  `content_font_type` int COMMENT '内容字体类型（1-大标题2-小标题3-正文）',
  `content_att_name` string COMMENT '内容附件名称',
  `content_item_symbol` int COMMENT '内容项目符号类型(1-小黑点)',
  `content_att_id` bigint COMMENT '内容附件主键id'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/patienteducation_platform/ods_patienteducation_cms_patient_education_content';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_patienteducation_cms_patient_education_content_20190108` (
  `id` bigint COMMENT '',
  `education_id` bigint COMMENT '',
  `education_content` string COMMENT '正文内容',
  `create_time` timestamp COMMENT '创建时间',
  `tpl_path` string COMMENT '模板路径',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效(0-无效,1-有效,2-用户删除)',
  `send_site_id` int COMMENT '站点',
  `content_type` int COMMENT '内容类型 1-文本，2-图片，3-视频',
  `content_font_type` int COMMENT '内容字体类型（1-大标题2-小标题3-正文）',
  `content_att_name` string COMMENT '内容附件名称',
  `content_item_symbol` int COMMENT '内容项目符号类型(1-小黑点)',
  `content_att_id` bigint COMMENT '内容附件主键id'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/patienteducation_platform/ods_patienteducation_cms_patient_education_content_20190108';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_patienteducation_cms_resource_qr_code` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '资源id',
  `qr_type` int COMMENT '二维码类型1-小程序2-普通二维码',
  `scene_type` int COMMENT '场景类型:1-手册详情2-患教多作者',
  `qr_code_url` string COMMENT '二维码地址',
  `qr_content` string COMMENT '二维码内容',
  `ref_customer_type` int COMMENT '分享用户类型1医生2患者',
  `ref_customer_id` bigint COMMENT '分享用户账号id',
  `resource_type` int COMMENT '来源类型（1-手册 2患教）',
  `is_valid` int COMMENT '',
  `site_id` int COMMENT '',
  `create_time` timestamp COMMENT ''
) COMMENT '记录资源分享二维码'
PARTITIONED BY (
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
  'hdfs://allincluster/user/hive/data/ods/patienteducation_platform/ods_patienteducation_cms_resource_qr_code';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_patienteducation_customer_auth` (
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/patienteducation_platform/ods_patienteducation_customer_auth';

