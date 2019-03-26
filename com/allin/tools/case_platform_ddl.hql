CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_folder_attachment` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `detail_id` bigint COMMENT '详情id（关联病例详情表）',
  `structure_id` bigint COMMENT '节点id',
  `casefolder_video_id` bigint COMMENT '病历夹视频id（用以区分一个节点下多个视频）',
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
  `update_time` timestamp COMMENT '每次更新时间',
  `is_valid` int COMMENT '是否有效',
  `remarks` string COMMENT '备注'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_folder_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_folder_attachment_copy` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `detail_id` bigint COMMENT '详情id（关联病例详情表）',
  `structure_id` bigint COMMENT '节点id',
  `casefolder_video_id` bigint COMMENT '病历夹视频id（用以区分一个节点下多个视频）',
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
  `update_time` timestamp COMMENT '每次更新时间',
  `is_valid` int COMMENT '是否有效',
  `remarks` string COMMENT '备注'
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
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_folder_attachment_copy';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_folder_baseinfo` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `template_id` bigint COMMENT '模板id',
  `belong_type` int COMMENT '所属类型 0-个人，1-团队',
  `team_id` bigint COMMENT '所属团队id',
  `customer_id` bigint COMMENT '所属个人id',
  `patient_id` bigint COMMENT '患者id',
  `patient_name` string COMMENT '患者姓名',
  `patient_age` string COMMENT '患者年龄',
  `patient_sex` int COMMENT '性别0-女1-男',
  `patient_mobile` string COMMENT '电话',
  `number_type` int COMMENT '编号类别1-住院号2-床位号3-病历号4-身份证号5-军官号',
  `number_content` string COMMENT '编号内容',
  `sort_id` int COMMENT '顺序号',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效 1-有效 0-无效',
  `version` string COMMENT '病历版本号'
) COMMENT '病例主表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_folder_baseinfo';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_folder_detail` (
  `id` bigint COMMENT '',
  `detail_id` bigint COMMENT '详情id',
  `case_id` bigint COMMENT '病例id',
  `structure_id` bigint COMMENT '基础数据id',
  `structure_type` int COMMENT '节点数据类型',
  `content` string COMMENT '数据值',
  `other_content` string COMMENT '其他内容',
  `group_id` bigint COMMENT '分组号',
  `tree_level` int COMMENT '等级',
  `parent_id` bigint COMMENT '父节点',
  `site_id` int COMMENT '站点',
  `sort_id` int COMMENT '排序',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `is_valid` int COMMENT '是否有效',
  `side_type` int COMMENT '侧别类型1-左侧2-右侧'
) COMMENT '病例详情表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_folder_detail';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_folder_detail_20190114` (
  `id` bigint COMMENT '',
  `detail_id` bigint COMMENT '详情id',
  `case_id` bigint COMMENT '病例id',
  `structure_id` bigint COMMENT '基础数据id',
  `structure_type` int COMMENT '节点数据类型',
  `content` string COMMENT '数据值',
  `other_content` string COMMENT '其他内容',
  `group_id` bigint COMMENT '分组号',
  `tree_level` int COMMENT '等级',
  `parent_id` bigint COMMENT '父节点',
  `site_id` int COMMENT '站点',
  `sort_id` int COMMENT '排序',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `is_valid` int COMMENT '是否有效',
  `side_type` int COMMENT '侧别类型1-左侧2-右侧'
) COMMENT '病例详情表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_folder_detail_20190114';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_folder_process` (
  `id` bigint COMMENT '',
  `resource_id` bigint COMMENT '资源id',
  `resource_type` int COMMENT '资源类型1-字典管理2-字段管理3-模板管理4-团队管理',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_desc` string COMMENT '操作描述',
  `op_param` string COMMENT '操作参数',
  `op_date` timestamp COMMENT '操作时间',
  `site_id` int COMMENT '',
  `create_time` timestamp COMMENT '创建时间',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '病历夹模板操作日志记录表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_folder_process';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_folder_tag` (
  `id` bigint COMMENT '主键id',
  `case_id` bigint COMMENT '病例id',
  `customer_id` bigint COMMENT '医生id',
  `tag_id` bigint COMMENT '标签id',
  `is_valid` int COMMENT '是否有效（0-无效1-有效）',
  `sort_id` int COMMENT '排序id',
  `create_time` timestamp COMMENT '创建时间',
  `site_id` int COMMENT '站点'
) COMMENT '病历标签信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_folder_tag';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_folder_team_relation` (
  `id` bigint COMMENT '',
  `template_id` bigint COMMENT '模板id',
  `relation_type` int COMMENT '使用群体类型(1-医生用户2-团体用户)',
  `team_id` bigint COMMENT '团队id',
  `customer_id` bigint COMMENT '用户id',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '病历夹模板使用人群表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_folder_team_relation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_folder_template` (
  `id` bigint COMMENT '',
  `template_id` bigint COMMENT '模板id',
  `template_title` string COMMENT '模板标题',
  `template_type` int COMMENT '分类1-骨科通用，2-关节，3-脊柱，4-创伤，99-其他',
  `used_type` int COMMENT '使用范围(1-所有用户 2-限定用户)',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '病历夹模板基础表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_folder_template';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_folder_template_scope` (
  `id` bigint COMMENT '',
  `template_id` bigint COMMENT '模板id',
  `structure_id` bigint COMMENT '节点id',
  `field_id` bigint COMMENT '字段id',
  `dictionary_id` bigint COMMENT '数据项id',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `field_type` int COMMENT '字段类型：1-单选-下拉列表 2-单选-下拉列表-其他3-多选-下拉列表4-多选-下拉列表-其他 5-时间控件（岁月天）6-时间控件（年月日）7-时间控件（月周天）8-文本9-数值10-视频/图片'
) COMMENT '病历夹模板字段取值范围表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_folder_template_scope';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_folder_template_structure` (
  `id` bigint COMMENT '',
  `structure_id` bigint COMMENT '节点id',
  `template_id` bigint COMMENT '模板id',
  `field_id` bigint COMMENT '字段id(一级节点不能关联字段)',
  `structure_name` string COMMENT '节点名称',
  `is_copy` int COMMENT '是否允许复用0-不可以1-可以',
  `parent_id` bigint COMMENT '父节点',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `full_path` string COMMENT '上级路径（拼串形式存放上级propertyId）',
  `default_value` string COMMENT '默认填充值',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '站点',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效0-无效1-有效2-用户删除',
  `is_both_sides` int COMMENT '是否是左右侧都记类型0-不是1-是',
  `field_type` int COMMENT '字段类型：1-单选-下拉列表 2-单选-下拉列表-其他3-多选-下拉列表4-多选-下拉列表-其他 5-时间控件（岁月天）6-时间控件（年月日）7-时间控件（月周天）8-文本9-数值10-视频/图片'
) COMMENT '病历夹模板结构表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_folder_template_structure';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_folder_template_structure_relation` (
  `id` bigint COMMENT '',
  `template_id` bigint COMMENT '模板id',
  `structure_id` bigint COMMENT '节点id',
  `dictionary_id` bigint COMMENT '数据项id',
  `is_relation` int COMMENT '是否有关系0-没有1-有',
  `relation_id_list` string COMMENT '关系idlist',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '病历夹模板节点跳转关系'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_folder_template_structure_relation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_note` (
  `id` bigint COMMENT '',
  `note_id` bigint COMMENT '',
  `note_name` string COMMENT '云资料文件名',
  `customer_id` bigint COMMENT '用户id',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间'
) COMMENT '云资料库'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_note';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_note_attachment` (
  `id` bigint COMMENT '',
  `note_id` bigint COMMENT '云资料库ID',
  `note_video_id` bigint COMMENT '视频的唯一标识',
  `att_name` string COMMENT '附件描述',
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
  `is_valid` int COMMENT '是否有效',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '每次更新时间'
) COMMENT '云资料库附件表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_note_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_comm_data_dictionary` (
  `id` bigint COMMENT '',
  `dictionary_id` bigint COMMENT '字典id',
  `dictionary_type` int COMMENT '字典类型(1-病历夹)',
  `dictionary_name` string COMMENT '字典名称、数据项名称',
  `dictionary_name_en` string COMMENT '字典英文名称',
  `normal_name` string COMMENT '标准名称',
  `normal_code` string COMMENT '标准编码',
  `group_name` string COMMENT '分组标签',
  `parent_id` bigint COMMENT '父节点',
  `dictionary_desc` string COMMENT '字典描述',
  `tree_level` int COMMENT '节点级别',
  `is_leaf` int COMMENT '是否子节点(0-否；1-是)',
  `dictionary_full_path` string COMMENT '上级路径（拼串形式存放上级propertyId)',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '数据字典表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_comm_data_dictionary';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_comm_data_field` (
  `id` bigint COMMENT '',
  `field_id` bigint COMMENT '字段id',
  `dictionary_id` bigint COMMENT '关联字典id',
  `field_name` string COMMENT '字段名称',
  `field_type` int COMMENT '字段类型：1-单选-下拉列表 2-单选-下拉列表-其他3-多选-下拉列表4-多选-下拉列表-其他 5-时间控件（岁月天）6-时间控件（年月日）7-时间控件（月周天）8-文本9-数值10-视频/图片',
  `group_label` string COMMENT '分组标签(仅后台使用)',
  `field_desc` string COMMENT '字段描述',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '站点',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '数据字段表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_comm_data_field';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_comm_data_threshold` (
  `id` bigint COMMENT '',
  `threshold_id` bigint COMMENT '阈值id',
  `field_id` bigint COMMENT '字段id',
  `dictionary_id` bigint COMMENT '字典id',
  `threshold_type` int COMMENT '阈值类型1-单选-下拉列表 2-单选-下拉列表-其他3-多选-下拉列表4-多选-下拉列表-其他 5-时间控件（岁月天）6-时间控件（年月日）7-时间控件（月周天）8-文本9-数值10-视频/图片',
  `threshold_value` string COMMENT '阈值',
  `threshold_unit` string COMMENT '阈值单位',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '站点',
  `sort_id` int COMMENT '排序',
  `is_valid` int COMMENT '是否有效'
) COMMENT '数据阈值表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_comm_data_threshold';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_case_customer_operation` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `customer_name` string COMMENT '会员名称',
  `case_id` bigint COMMENT '病例id',
  `structure_id` string COMMENT '节点idList',
  `structure_name` string COMMENT '节点名称List',
  `create_time` timestamp COMMENT '创建时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_type` int COMMENT '1-新建，2-新增，3-修改',
  `is_valid` int COMMENT '是否有效',
  `site_id` int COMMENT '发送渠道'
) COMMENT '会员病例操作日志'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_log_case_customer_operation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_case_folder_attachment` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `detail_id` bigint COMMENT '详情id（关联病例详情表）',
  `structure_id` bigint COMMENT '节点id',
  `casefolder_video_id` bigint COMMENT '病历夹视频id（用以区分一个节点下多个视频）',
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
  `update_time` timestamp COMMENT '每次更新时间',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '病例附件表日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_log_case_folder_attachment';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_case_folder_baseinfo` (
  `id` bigint COMMENT '',
  `case_id` bigint COMMENT '病例id',
  `template_id` bigint COMMENT '模板id',
  `belong_type` int COMMENT '所属类型 0-个人，1-团队',
  `team_id` bigint COMMENT '所属团队id',
  `customer_id` bigint COMMENT '所属个人id',
  `patient_id` bigint COMMENT '患者id',
  `patient_name` string COMMENT '患者姓名',
  `patient_age` string COMMENT '患者年龄',
  `patient_sex` int COMMENT '性别0-女1-男',
  `patient_mobile` string COMMENT '电话',
  `number_type` int COMMENT '编号类别1-住院号2-床位号3-病历号4-身份证号5-军官号',
  `number_content` string COMMENT '编号内容',
  `sort_id` int COMMENT '顺序号',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效 1-有效 0-无效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '病例主表日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_log_case_folder_baseinfo';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_case_folder_detail` (
  `id` bigint COMMENT '',
  `detail_id` bigint COMMENT '详情id',
  `case_id` bigint COMMENT '病例id',
  `structure_id` bigint COMMENT '基础数据id',
  `structure_type` int COMMENT '节点数据类型',
  `content` string COMMENT '数据值',
  `other_content` string COMMENT '其他内容',
  `group_id` bigint COMMENT '分组号',
  `tree_level` int COMMENT '等级',
  `parent_id` bigint COMMENT '父节点',
  `site_id` int COMMENT '站点',
  `sort_id` int COMMENT '排序',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '病例详情表日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_log_case_folder_detail';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_log_team_baseinfo` (
  `id` bigint COMMENT '',
  `team_id` bigint COMMENT '团队id',
  `team_name` string COMMENT '团队名称',
  `creator_id` bigint COMMENT '创建人customer_id',
  `customer_id` bigint COMMENT '所有者id',
  `qr_code_url` string COMMENT '二维码存储地址',
  `is_apply` int COMMENT '是否接受申请(0-否，1-是)',
  `is_transfer` int COMMENT '是否转让(0-否，1-是)',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '团队基础信息表日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_log_team_baseinfo';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_log_team_member` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '成员id',
  `team_id` bigint COMMENT '团队id',
  `customer_state` int COMMENT '成员状态 0-待审核  1-审核通过 2-待用户确认 3-审核拒绝',
  `customer_role` int COMMENT '成员角色1-通过成员 2-所有者',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '申请时间',
  `update_time` timestamp COMMENT '审核时间',
  `is_valid` int COMMENT '是否有效',
  `op_date` timestamp COMMENT '操作时间',
  `op_usr` string COMMENT '操作人员id',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_desc` string COMMENT '操作描述'
) COMMENT '团队成员表日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_log_team_member';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_patient_number` (
  `id` bigint COMMENT '',
  `number_id` bigint COMMENT '编号id',
  `case_id` bigint COMMENT '病例id',
  `number_type` int COMMENT '编号类别1-住院号2-床位号3-病历号4-身份证号5-军官号',
  `number_content` string COMMENT '编号内容',
  `sort_id` int COMMENT '顺序号',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `site_id` int COMMENT '站点',
  `is_valid` int COMMENT '是否有效'
) COMMENT '患者编号信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_patient_number';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_team_baseinfo` (
  `id` bigint COMMENT '',
  `team_id` bigint COMMENT '团队id',
  `team_name` string COMMENT '团队名称',
  `creator_id` bigint COMMENT '创建人customer_id',
  `customer_id` bigint COMMENT '所有者id',
  `qr_code_url` string COMMENT '二维码存储地址',
  `is_apply` int COMMENT '是否接受申请(0-否，1-是)',
  `is_transfer` int COMMENT '是否转让(0-否，1-是)',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '团队基础信息表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_team_baseinfo';



CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_case_team_member` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '成员id',
  `team_id` bigint COMMENT '团队id',
  `customer_state` int COMMENT '成员状态 0-待审核  1-审核通过 2-待用户确认 3-审核拒绝',
  `customer_role` int COMMENT '成员角色1-成员 2-所有者',
  `sort_id` int COMMENT '排序',
  `site_id` int COMMENT '站点',
  `create_time` timestamp COMMENT '申请时间',
  `update_time` timestamp COMMENT '审核时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '团队成员表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/case_platform/ods_case_team_member';

