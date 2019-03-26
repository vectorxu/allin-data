CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_conference` (
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
  `ad_position_id` bigint COMMENT '所关联广告位id'
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
  'hdfs://allincluster/user/hive/data/ods/med_platform_log/ods_conference';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_conference_agenda` (
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
  `play_back_id` string COMMENT '回播id'
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
  'hdfs://allincluster/user/hive/data/ods/med_platform_log/ods_conference_agenda';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_conference_sub` (
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
  `back_long_link` string COMMENT '回播长链接'
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
  'hdfs://allincluster/user/hive/data/ods/med_platform_log/ods_conference_sub';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_med_customer_browse` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `browse_type` int COMMENT '浏览类型（1-主页精选，2-主页活动，3-主页最新，4-视频列表页，5-视频终端页，6-文库列表页，7-文库终端页，8-品牌列表页，9-品牌终端页，10-产品列表页，11-产品终端页，12-活动列表页，13-活动直播页，14-活动回播页，15-活动日程列表页，16-手机登录，17-邮箱登陆，18-唯医联合登陆，19-找回密码，20-搜索页面，21-标签详情页，22-个人主页，23-个人中心，24-个人资料页，25-UGC直播列表页，26-首页UGC直播，27-我的UGC直播，28-我的UGC直播预约，29-UGC直播横屏终端页，30-UGC直播竖屏终端页，31-UGC直播详情页，32-UGC直播横屏终端页(主播端)，33-UGC直播竖屏终端页（主播端），34-论坛终端页，35-论坛列表页，36-论坛发布页，37-专题汇总页，38-专题资源页)',
  `browse_url` string COMMENT '浏览url',
  `open_time` timestamp COMMENT '打开时间',
  `leave_time` timestamp COMMENT '离开时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '发送渠道',
  `device_token` string COMMENT '设备针对应用token',
  `resource_id` bigint COMMENT '资源id',
  `remarkInfo` string COMMENT 'iOS、Android的应用版本号、系统版本号等信息，用“&”拼接',
  `op_advice` string COMMENT '设备信息及版本',
  `session_id` string COMMENT '会话id',
  `app_version` string COMMENT '版本号'
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
  'hdfs://allincluster/user/hive/data/ods/med_platform_log/ods_log_med_customer_browse';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_med_customer_browse_copy` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `browse_type` int COMMENT '浏览类型（1-主页精选，2-主页活动，3-主页最新，4-视频列表页，5-视频终端页，6-文库列表页，7-文库终端页，8-品牌列表页，9-品牌终端页，10-产品列表页，11-产品终端页，12-活动列表页，13-活动直播页，14-活动回播页，15-活动日程列表页，16-手机登录，17-邮箱登陆，18-唯医联合登陆，19-找回密码，20-搜索页面，21-标签详情页，22-个人主页，23-个人中心，24-个人资料页，25-UGC直播列表页，26-首页UGC直播，27-我的UGC直播，28-我的UGC直播预约，29-UGC直播横屏终端页，30-UGC直播竖屏终端页，31-UGC直播详情页，32-UGC直播横屏终端页(主播端)，33-UGC直播竖屏终端页（主播端），34-论坛终端页，35-论坛列表页，36-论坛发布页，37-专题汇总页，38-专题资源页)',
  `browse_url` string COMMENT '浏览url',
  `open_time` timestamp COMMENT '打开时间',
  `leave_time` timestamp COMMENT '离开时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '发送渠道',
  `device_token` string COMMENT '设备针对应用token',
  `resource_id` bigint COMMENT '资源id'
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
  'hdfs://allincluster/user/hive/data/ods/med_platform_log/ods_log_med_customer_browse_copy';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_med_customer_browse_history` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `browse_type` int COMMENT '浏览类型（1-主页精选，2-主页活动，3-主页最新，4-视频列表页，5-视频终端页，6-文库列表页，7-文库终端页，8-品牌列表页，9-品牌终端页，10-产品列表页，11-产品终端页，12-活动列表页，13-活动直播页，14-活动回播页，15-活动日程列表页，16-手机登录，17-邮箱登陆，18-唯医联合登陆，19-找回密码，20-搜索页面，21-标签详情页，22-个人主页，23-个人中心，24-个人资料页)',
  `browse_url` string COMMENT '浏览url',
  `open_time` timestamp COMMENT '打开时间',
  `leave_time` timestamp COMMENT '离开时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述',
  `is_valid` int COMMENT '是否有效',
  `send_site_id` int COMMENT '发送渠道',
  `device_token` string COMMENT '设备针对应用token',
  `resource_id` bigint COMMENT '资源id',
  `remarkInfo` string COMMENT 'iOS、Android的应用版本号、系统版本号等信息，用“&”拼接',
  `op_advice` string COMMENT '设备信息及版本',
  `session_id` string COMMENT '会话id',
  `app_version` string COMMENT '版本号'
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
  'hdfs://allincluster/user/hive/data/ods/med_platform_log/ods_log_med_customer_browse_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_med_customer_download` (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform_log/ods_log_med_customer_download';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_med_customer_keyword` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `session_id` string COMMENT 'sessionId',
  `search_type` int COMMENT 'keyword场景类型（预留）',
  `search_url` string COMMENT '所搜索地址url',
  `key_word` string COMMENT 'keyword',
  `create_time` timestamp COMMENT '创建时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `site_id` int COMMENT '渠道',
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
  'hdfs://allincluster/user/hive/data/ods/med_platform_log/ods_log_med_customer_keyword';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_med_customer_login` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `login_type` int COMMENT '1-登陆;2-退出;3-错误',
  `op_date` timestamp COMMENT '操作时间',
  `op_ip` string COMMENT '操作来源（ip）',
  `op_address` string COMMENT '操作地',
  `op_source` string COMMENT '操作途径（手机、网站、app）',
  `op_desc` string COMMENT '操作描述',
  `op_advice` string COMMENT '浏览器版本，设备，系统版本号',
  `latitude` string COMMENT '纬度',
  `longitude` string COMMENT '经度',
  `net_version` int COMMENT '网络状态1-wifi   2-2G  3-3G、4-4G',
  `telecom` int COMMENT '运营商（1-移动、2-联通、3-电信）',
  `time_zone` string COMMENT '时区',
  `region` string COMMENT '区域',
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
  'hdfs://allincluster/user/hive/data/ods/med_platform_log/ods_log_med_customer_login';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_med_email` (
  `id` bigint COMMENT '',
  `send_type` int COMMENT '发送类型(1-重置密码,2-验证邮箱,3-文档审核,4-会员认证,5-用户fellowship审核))',
  `email` string COMMENT '收件人email',
  `send_subject` string COMMENT '发送主题',
  `send_content` string COMMENT '发送内容',
  `send_time` timestamp COMMENT '发送时间',
  `send_channel_id` int COMMENT '发送渠道(1-自荐服务器,2-某某供应商)',
  `site_id` int COMMENT '发送站点(8-ios,9-android，10-wap-H5)',
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
  'hdfs://allincluster/user/hive/data/ods/med_platform_log/ods_log_med_email';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_med_notify_message` (
  `id` bigint COMMENT '',
  `send_site_id` int COMMENT '发送渠道',
  `device_token` string COMMENT '设备id',
  `content` string COMMENT '发送内容',
  `source_id` bigint COMMENT '资源id',
  `source_type` int COMMENT '资源类型(1-视频，2-文库，4-产品,5-品牌)',
  `message_first_result` bigint COMMENT '定位',
  `badge` int COMMENT '提示圈内数字',
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
  'hdfs://allincluster/user/hive/data/ods/med_platform_log/ods_log_med_notify_message';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_med_sms` (
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
  'hdfs://allincluster/user/hive/data/ods/med_platform_log/ods_log_med_sms';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_med_track` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `session` string COMMENT '用户session',
  `location_id` bigint COMMENT '区块id',
  `channel_id` bigint COMMENT '频道id',
  `column_id` bigint COMMENT '栏目id',
  `recommend_id` bigint COMMENT '推荐资源位id',
  `ad_id` bigint COMMENT '广告位id',
  `ad_position` string COMMENT '广告图片位置（宽高坐标，以字符分割）',
  `trigger_type` int COMMENT '触发方式（1-左键点击、2-右键点击、3-上滑、4-下滑、5-左滑、6-右滑、7-列表上拉、8-列表下拉、9-页面打开、10-页面关闭、11-双击、12-双指外滑、13-双指内滑、14-拖动、15-跳转页面）',
  `trigger_name` string COMMENT '触发对象的名称or内容（按钮文字、图片地址、文字内容...）',
  `action_id` string COMMENT '动作：action   （prefer、search、reprint、review）',
  `param` string COMMENT '携带的参数字符串',
  `ref_id` bigint COMMENT '关联id',
  `ref_type` bigint COMMENT '关联类型（1-视频，2-文库，3-会议，4-产品，5-品牌 ,6-标签，8-评论）',
  `src_location` string COMMENT '外部来源url｜落地url    ：  来源的H5页面链接',
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
  'hdfs://allincluster/user/hive/data/ods/med_platform_log/ods_log_med_track';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_log_med_track_history` (
  `id` bigint COMMENT '',
  `customer_id` bigint COMMENT '会员id',
  `session` string COMMENT '用户session',
  `location_id` bigint COMMENT '区块id',
  `channel_id` bigint COMMENT '频道id',
  `column_id` bigint COMMENT '栏目id',
  `recommend_id` bigint COMMENT '推荐资源位id',
  `ad_id` bigint COMMENT '广告位id',
  `ad_position` string COMMENT '广告图片位置（宽高坐标，以字符分割）',
  `trigger_type` int COMMENT '触发方式（1-左键点击、2-右键点击、3-上滑、4-下滑、5-左滑、6-右滑、7-列表上拉、8-列表下拉、9-页面打开、10-页面关闭、11-双击、12-双指外滑、13-双指内滑、14-拖动、15-跳转页面）',
  `trigger_name` string COMMENT '触发对象的名称or内容（按钮文字、图片地址、文字内容...）',
  `action_id` string COMMENT '动作：action   （prefer、search、reprint、review）',
  `param` string COMMENT '携带的参数字符串',
  `ref_id` bigint COMMENT '关联id',
  `ref_type` bigint COMMENT '关联类型（1-视频，2-文库，3-会议，4-产品，5-品牌 ,6-标签，8-评论）',
  `src_location` string COMMENT '外部来源url｜落地url    ：  来源的H5页面链接',
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
) COMMENT '页面跟踪历史'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/med_platform_log/ods_log_med_track_history';

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
  'hdfs://allincluster/user/hive/data/ods/med_platform_log/ods_merge_table';

