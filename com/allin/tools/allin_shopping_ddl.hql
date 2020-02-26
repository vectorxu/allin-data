CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_coupon` (
  `id` bigint COMMENT '',
  `coupon_type` tinyint COMMENT '优惠卷类型；0->通用优惠券；1->商品优惠券',
  `coupon_name` string COMMENT '优惠卷名称',
  `display_name` string COMMENT '展示名称',
  `coupon_denomination` int COMMENT '金额/面额(单位：分)',
  `per_limit` int COMMENT '每人限领张数',
  `use_condition` int COMMENT '使用条件(门槛)；0表示无门槛(单位：分)',
  `start_time` timestamp COMMENT '有效时间-开始',
  `end_time` timestamp COMMENT '有效时间-结束',
  `batch_state` tinyint COMMENT '批次状态 0->正常,1->已废弃,2->已过期',
  `publish_state` tinyint COMMENT '发放状态 0->未发放,1->已发放',
  `publish_count` int COMMENT '发行数量',
  `use_count` int COMMENT '已使用数量',
  `receive_count` int COMMENT '领取数量',
  `coupon_batch_code` string COMMENT '批次号',
  `apply_department` tinyint COMMENT '申请部门 0->市场运营部,1->商务部,2->协会事业部,3->测试部,4->产品部',
  `apply_purpose` tinyint COMMENT '申请用途 0->渠道合作,1->营销推广,2->内部测试',
  `apply_user` string COMMENT '申请人',
  `apply_note` string COMMENT '备注',
  `op_user` string COMMENT '创建人姓名',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间'
) COMMENT '优惠卷批次表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_coupon';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_coupon_detail` (
  `id` bigint COMMENT '',
  `coupon_id` bigint COMMENT '优惠券批次主键',
  `customer_id` bigint COMMENT '领取人ID',
  `coupon_detail_code` string COMMENT '优惠券券号',
  `use_state` tinyint COMMENT '使用状态：0->未使用；1->已使用；2->已过期；3->无效',
  `use_time` timestamp COMMENT '使用时间',
  `apply_time` timestamp COMMENT '领取时间',
  `order_id` bigint COMMENT '订单编号',
  `order_number` bigint COMMENT '订单号码',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间'
) COMMENT '优惠券明细表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_coupon_detail';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_coupon_product_relation` (
  `id` bigint COMMENT '',
  `coupon_id` bigint COMMENT '优惠券批次ID',
  `product_id` bigint COMMENT '商品ID',
  `product_price` int COMMENT '商品单价(单位：分)',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间'
) COMMENT '优惠券和付费课程的关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_coupon_product_relation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_mole_task` (
  `id` bigint COMMENT '主键自增',
  `exe_type` int COMMENT '执行类型',
  `exe_biz_type` int COMMENT '执行业务类型',
  `exe_time` timestamp COMMENT '执行时间',
  `exe_count` int COMMENT '执行次数',
  `exe_err_msg` string COMMENT '执行error信息',
  `task_bean_name` string COMMENT 'task存储beanName',
  `task_method_name` string COMMENT 'task存储beanName',
  `task_biz_id` string COMMENT 'task业务ID用于检索用的',
  `exe_status` int COMMENT '执行状态',
  `task_env` int COMMENT '任务环境',
  `exe_interval_sec` int COMMENT '执行间隔秒',
  `task_param` string COMMENT '任务参数',
  `gmt_created` timestamp COMMENT '创建时间',
  `gmt_modified` timestamp COMMENT '修改时间',
  `shared_id` bigint COMMENT '分库的sharedId',
  `transaction_mode` int COMMENT '事务模型'
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
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_mole_task';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_mole_task_history` (
  `history_id` bigint COMMENT '主键自增',
  `id` bigint COMMENT '主键自增',
  `exe_type` int COMMENT '执行类型',
  `exe_biz_type` int COMMENT '执行业务类型',
  `exe_time` timestamp COMMENT '执行时间',
  `exe_count` int COMMENT '执行次数',
  `exe_err_msg` string COMMENT '执行error信息',
  `task_bean_name` string COMMENT 'task存储beanName',
  `task_method_name` string COMMENT 'task存储beanName',
  `task_biz_id` string COMMENT 'task业务ID用于检索用的',
  `exe_status` int COMMENT '执行状态',
  `task_param` string COMMENT '任务参数',
  `task_env` int COMMENT '任务环境',
  `exe_interval_sec` int COMMENT '执行间隔秒',
  `gmt_created` timestamp COMMENT '创建时间',
  `gmt_modified` timestamp COMMENT '修改时间',
  `history_gmt_created` timestamp COMMENT '历史创建时间',
  `shared_id` bigint COMMENT '分库的sharedId',
  `transaction_mode` int COMMENT '事务模型'
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
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_mole_task_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_pay_order` (
  `id` bigint COMMENT '主键',
  `pay_order_number` bigint COMMENT '平台支付流水号',
  `business_id` int COMMENT '业务方id',
  `customer_id` bigint COMMENT '用户id',
  `buyer_client_ip` string COMMENT '购买用户IP',
  `order_number` bigint COMMENT '订单号',
  `order_name` string COMMENT '订单名',
  `goods_ids` string COMMENT '商品id列表，用,分隔',
  `goods_names` string COMMENT '商品名列表，用,分隔',
  `pay_type` tinyint COMMENT '支付类型  1-微信APP支付  10-支付宝APP支付  20-IAP （Apple-pay）',
  `pay_state` tinyint COMMENT '支付状态  1-已预支付  10-已支付  15-支付失败',
  `pay_id` string COMMENT '支付id(第三方支付的transaction_id)',
  `prepay_id` string COMMENT '预支付id',
  `receipt_data` string COMMENT 'iap支付receipt-data，iap支付唯一凭证',
  `pay_str` string COMMENT '支付串-目前用于阿里的返回的支付串',
  `ios_product_code` string COMMENT 'ios支付的具体产品code',
  `pay_fee` bigint COMMENT '付款金额 分为单位',
  `fee_currency` tinyint COMMENT '金额类型  0-人民币（CNY）1-美元（USD）',
  `prepay_time` timestamp COMMENT '预支付时间-生单时间',
  `pay_time` timestamp COMMENT '支付完成时间',
  `expire_time` timestamp COMMENT '失效时间',
  `pay_notify_time` timestamp COMMENT '支付通知时间',
  `pay_notify_biz_time` timestamp COMMENT '支付通知业务时间',
  `is_notify_biz` int COMMENT '是否已通知业务线',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间'
) COMMENT '支付单表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_pay_order';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_pay_refund_order` (
  `id` bigint COMMENT '主键',
  `pay_order_number` bigint COMMENT '平台支付流水号',
  `business_id` int COMMENT '业务方id',
  `customer_id` bigint COMMENT '用户id',
  `order_number` bigint COMMENT '订单号',
  `refund_state` tinyint COMMENT '退款状态 10-已申请退款  20-退款成功  99-退款失败',
  `pay_id` string COMMENT '支付id(第三方支付的transaction_id)',
  `refund_order_number` bigint COMMENT '退款订单号',
  `refund_id` string COMMENT '退款id(第三方支付的transaction_id)',
  `refund_fee` bigint COMMENT '退款金额 分为单位',
  `refund_request_time` timestamp COMMENT '退款申请时间',
  `refund_time` timestamp COMMENT '退款完成时间',
  `refund_notify_time` timestamp COMMENT '退款处理时间-退款一般都是自己查询',
  `refund_notify_biz_time` timestamp COMMENT '退款通知业务线时间',
  `is_notify_biz` int COMMENT '是否已通知业务线',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间'
) COMMENT '退款单表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_pay_refund_order';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_pay_refund_request_log` (
  `id` bigint COMMENT '主键',
  `pay_order_number` bigint COMMENT '平台支付流水号',
  `pay_refund_id` bigint COMMENT '退款Id',
  `log_type` tinyint COMMENT '日志类型 1.支付  2. 退款',
  `in_param` string COMMENT '入参',
  `out_result` string COMMENT '出参',
  `handle_time` timestamp COMMENT '处理时间',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间'
) COMMENT '支付请求日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_pay_refund_request_log';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_pay_refund_state_change` (
  `id` bigint COMMENT '主键',
  `refund_order_id` bigint COMMENT '退款主键ID',
  `pay_order_number` bigint COMMENT '平台支付流水号',
  `old_state` tinyint COMMENT '参考支付订单的状态',
  `new_state` tinyint COMMENT '参考支付订单的状态',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间'
) COMMENT '退款状态转换表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_pay_refund_state_change';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_pay_state_change` (
  `id` bigint COMMENT '主键',
  `pay_order_number` bigint COMMENT '平台支付流水号',
  `old_state` tinyint COMMENT '参考支付订单的状态',
  `new_state` tinyint COMMENT '参考支付订单的状态',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间'
) COMMENT '支付状态转换表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_pay_state_change';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_redeem_code` (
  `id` bigint COMMENT '',
  `redeem_code_name` string COMMENT '兑换码名称',
  `start_time` timestamp COMMENT '有效时间-开始',
  `end_time` timestamp COMMENT '有效时间-结束',
  `usage_count` int COMMENT '用户使用次数',
  `publish_type` tinyint COMMENT '发放类型 0->电子码,1->纸质码',
  `publish_count` int COMMENT '发行数量',
  `redeem_code_batch_code` string COMMENT '批次号',
  `batch_state` tinyint COMMENT '批次状态 0->正常,1->已冻结,2->已过期',
  `apply_department` tinyint COMMENT '申请部门 0->市场运营部,1->商务部,2->协会事业部,3->测试部,4->产品部',
  `apply_purpose` tinyint COMMENT '申请用途 0->厂商购买,1->院方采购,2->内部测试',
  `apply_user` string COMMENT '申请人',
  `apply_note` string COMMENT '备注',
  `op_user` string COMMENT '创建人姓名',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间'
) COMMENT '兑换码批次表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_redeem_code';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_redeem_code_detail` (
  `id` bigint COMMENT '',
  `redeem_code_id` bigint COMMENT '兑换码批次ID',
  `customer_id` bigint COMMENT '使用者ID',
  `redeem_code_detail_code` string COMMENT '兑换码编号',
  `use_state` tinyint COMMENT '使用状态：0->未使用；1->已使用；2->已冻结；3->已过期',
  `use_time` timestamp COMMENT '使用时间',
  `order_id` bigint COMMENT '订单编号',
  `order_number` bigint COMMENT '订单号码',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间'
) COMMENT '兑换码明细表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_redeem_code_detail';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_redeem_product_relation` (
  `id` bigint COMMENT '',
  `redeem_code_id` bigint COMMENT '兑换码批次ID',
  `product_id` bigint COMMENT '商品ID',
  `product_price` int COMMENT '商品单价(单位：分)',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间'
) COMMENT '兑换码和付费课程的关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_redeem_product_relation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_shopping_order` (
  `id` bigint COMMENT '订单id',
  `customer_id` bigint COMMENT '买家ID',
  `order_number` bigint COMMENT '订单编号',
  `platform_serial_number` bigint COMMENT '平台流水号',
  `third_part_serial_number` string COMMENT '第三方流水号',
  `total_amount` int COMMENT '订单总金额（分）',
  `pay_amount` int COMMENT '应付金额（实际支付金额）',
  `coupon_amount` int COMMENT '优惠券抵扣金额',
  `promotion_amount` int COMMENT '促销优化金额（促销价、满减、兑换码）',
  `pay_state` tinyint COMMENT '支付状态 1->未支付,2->已撤销,3->已支付，4->待退款；5->退款中,6->已退款,7->退款失败',
  `pay_type` tinyint COMMENT '支付方式：1->支付宝；2->微信,3->苹果支付，4->其他支付,5->兑换码支付',
  `source_type` tinyint COMMENT '订单来源：1->IOS订单；2->安卓订单；3->微信公众号；4->微信小程序；5->PC订单；6->线下收款；',
  `order_state` tinyint COMMENT '订单状态：1->待付款；2->待发货；3->已发货；4->已完成；5->已关闭(超时)；6->已取消(手动);7->已退货',
  `order_type` tinyint COMMENT '订单类型：1->普通订单；2->优惠券订单；3->兑换码订单；4->拼团订单',
  `device_name` string COMMENT '设备名称(iPhone 6s Plus)',
  `device_token` string COMMENT '设备token',
  `receiver_name` string COMMENT '买家姓名',
  `receiver_phone` string COMMENT '买家电话',
  `note` string COMMENT '订单备注',
  `is_valid` int COMMENT '删除状态：0->未删除；1->已删除',
  `create_time` timestamp COMMENT '下单时间',
  `payment_time` timestamp COMMENT '支付时间',
  `grant_access_time` timestamp COMMENT '开通付费虚拟商品权限时间',
  `update_time` timestamp COMMENT '修改时间',
  `prepay_time` timestamp COMMENT '支付发起时间',
  `ip` string COMMENT ''
) COMMENT '订单表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_shopping_order';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_shopping_order_item` (
  `id` bigint COMMENT '',
  `order_id` bigint COMMENT '订单id',
  `product_id` bigint COMMENT '商品ID',
  `product_name` string COMMENT '商品名称',
  `product_price` int COMMENT '商品价格',
  `coupon_id` bigint COMMENT '优惠券ID',
  `coupon_detail_code` string COMMENT '优惠券编码',
  `redeem_code_id` bigint COMMENT '兑换码ID',
  `redeem_code_detail_code` string COMMENT '兑换码编号',
  `promotion_amount` int COMMENT '知识付费促销/满减金额/兑换码金额',
  `coupon_amount` int COMMENT '优惠券优惠分解金额',
  `real_amount` int COMMENT '该商品经过优惠后的实际金额',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间'
) COMMENT '订单中所包含的知识付费商品/课程'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_shopping_order_item';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_shopping_order_operate_history` (
  `id` bigint COMMENT '',
  `order_id` bigint COMMENT '订单id',
  `user_id` bigint COMMENT '',
  `operate_man` string COMMENT '操作人：用户；系统；后台管理员',
  `create_time` timestamp COMMENT '操作时间',
  `pre_order_status` int COMMENT '订单上一个状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭(超时)；5->已取消(手动);6->已退货',
  `order_status` int COMMENT '订单当前状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭(超时)；5->已取消(手动);6->已退货',
  `note` string COMMENT '备注'
) COMMENT '订单操作历史记录'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_shopping_order_operate_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_shopping_order_return_apply` (
  `id` bigint COMMENT '',
  `order_id` bigint COMMENT '订单id',
  `product_id` bigint COMMENT '退货商品id/课程ID',
  `create_time` timestamp COMMENT '申请时间',
  `customer_id` bigint COMMENT '会员Id',
  `return_amount` int COMMENT '退款金额',
  `status` int COMMENT '申请状态：1->退款中；2->已完成；3->已失败，4->已取消/关闭',
  `refund_failure_reason` string COMMENT '退款失败原因。第三方失败原因',
  `modify_time` timestamp COMMENT '处理时间',
  `reason` string COMMENT '原因',
  `description` string COMMENT '描述',
  `handle_note` string COMMENT '处理备注',
  `operator_id` string COMMENT '处理人员',
  `refund_finish_time` timestamp COMMENT '退款完成时间',
  `amount_source_type` tinyint COMMENT '退款资金来源（1-未结算金额2-账户余额）'
) COMMENT '退款申请单'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_shopping_order_return_apply';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_test_table` (
  `id` bigint COMMENT '',
  `nick_name` string COMMENT '昵称',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '测试表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_test_table';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_coupon` (
  `id` bigint COMMENT '',
  `coupon_type` tinyint COMMENT '优惠卷类型；0->通用优惠券；1->商品优惠券',
  `coupon_name` string COMMENT '优惠卷名称',
  `display_name` string COMMENT '展示名称',
  `coupon_denomination` int COMMENT '金额/面额(单位：分)',
  `per_limit` int COMMENT '每人限领张数',
  `use_condition` int COMMENT '使用条件(门槛)；0表示无门槛(单位：分)',
  `start_time` timestamp COMMENT '有效时间-开始',
  `end_time` timestamp COMMENT '有效时间-结束',
  `batch_state` tinyint COMMENT '批次状态 0->正常,1->已废弃,2->已过期',
  `publish_state` tinyint COMMENT '发放状态 0->未发放,1->已发放',
  `publish_count` int COMMENT '发行数量',
  `use_count` int COMMENT '已使用数量',
  `receive_count` int COMMENT '领取数量',
  `coupon_batch_code` string COMMENT '批次号',
  `apply_department` tinyint COMMENT '申请部门 0->市场运营部,1->商务部,2->协会事业部,3->测试部,4->产品部',
  `apply_purpose` tinyint COMMENT '申请用途 0->渠道合作,1->营销推广,2->内部测试',
  `apply_user` string COMMENT '申请人',
  `apply_note` string COMMENT '备注',
  `op_user` string COMMENT '创建人姓名',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间'
) COMMENT '优惠卷批次表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_coupon';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_coupon_detail` (
  `id` bigint COMMENT '',
  `coupon_id` bigint COMMENT '优惠券批次主键',
  `customer_id` bigint COMMENT '领取人ID',
  `coupon_detail_code` string COMMENT '优惠券券号',
  `use_state` tinyint COMMENT '使用状态：0->未使用；1->已使用；2->已过期；3->无效',
  `use_time` timestamp COMMENT '使用时间',
  `apply_time` timestamp COMMENT '领取时间',
  `order_id` bigint COMMENT '订单编号',
  `order_number` bigint COMMENT '订单号码',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间'
) COMMENT '优惠券明细表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_coupon_detail';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_coupon_product_relation` (
  `id` bigint COMMENT '',
  `coupon_id` bigint COMMENT '优惠券批次ID',
  `product_id` bigint COMMENT '商品ID',
  `product_price` int COMMENT '商品单价(单位：分)',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间'
) COMMENT '优惠券和付费课程的关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_coupon_product_relation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_mole_task` (
  `id` bigint COMMENT '主键自增',
  `exe_type` int COMMENT '执行类型',
  `exe_biz_type` int COMMENT '执行业务类型',
  `exe_time` timestamp COMMENT '执行时间',
  `exe_count` int COMMENT '执行次数',
  `exe_err_msg` string COMMENT '执行error信息',
  `task_bean_name` string COMMENT 'task存储beanName',
  `task_method_name` string COMMENT 'task存储beanName',
  `task_biz_id` string COMMENT 'task业务ID用于检索用的',
  `exe_status` int COMMENT '执行状态',
  `task_env` int COMMENT '任务环境',
  `exe_interval_sec` int COMMENT '执行间隔秒',
  `task_param` string COMMENT '任务参数',
  `gmt_created` timestamp COMMENT '创建时间',
  `gmt_modified` timestamp COMMENT '修改时间',
  `shared_id` bigint COMMENT '分库的sharedId',
  `transaction_mode` int COMMENT '事务模型'
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
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_mole_task';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_mole_task_history` (
  `history_id` bigint COMMENT '主键自增',
  `id` bigint COMMENT '主键自增',
  `exe_type` int COMMENT '执行类型',
  `exe_biz_type` int COMMENT '执行业务类型',
  `exe_time` timestamp COMMENT '执行时间',
  `exe_count` int COMMENT '执行次数',
  `exe_err_msg` string COMMENT '执行error信息',
  `task_bean_name` string COMMENT 'task存储beanName',
  `task_method_name` string COMMENT 'task存储beanName',
  `task_biz_id` string COMMENT 'task业务ID用于检索用的',
  `exe_status` int COMMENT '执行状态',
  `task_param` string COMMENT '任务参数',
  `task_env` int COMMENT '任务环境',
  `exe_interval_sec` int COMMENT '执行间隔秒',
  `gmt_created` timestamp COMMENT '创建时间',
  `gmt_modified` timestamp COMMENT '修改时间',
  `history_gmt_created` timestamp COMMENT '历史创建时间',
  `shared_id` bigint COMMENT '分库的sharedId',
  `transaction_mode` int COMMENT '事务模型'
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
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_mole_task_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_pay_order` (
  `id` bigint COMMENT '主键',
  `pay_order_number` bigint COMMENT '平台支付流水号',
  `business_id` int COMMENT '业务方id',
  `customer_id` bigint COMMENT '用户id',
  `buyer_client_ip` string COMMENT '购买用户IP',
  `order_number` bigint COMMENT '订单号',
  `order_name` string COMMENT '订单名',
  `goods_ids` string COMMENT '商品id列表，用,分隔',
  `goods_names` string COMMENT '商品名列表，用,分隔',
  `pay_type` tinyint COMMENT '支付类型  1-微信APP支付  10-支付宝APP支付  20-IAP （Apple-pay）',
  `pay_state` tinyint COMMENT '支付状态  1-已预支付  10-已支付  15-支付失败',
  `pay_id` string COMMENT '支付id(第三方支付的transaction_id)',
  `prepay_id` string COMMENT '预支付id',
  `receipt_data` string COMMENT 'iap支付receipt-data，iap支付唯一凭证',
  `pay_str` string COMMENT '支付串-目前用于阿里的返回的支付串',
  `ios_product_code` string COMMENT 'ios支付的具体产品code',
  `pay_fee` bigint COMMENT '付款金额 分为单位',
  `fee_currency` tinyint COMMENT '金额类型  0-人民币（CNY）1-美元（USD）',
  `prepay_time` timestamp COMMENT '预支付时间-生单时间',
  `pay_time` timestamp COMMENT '支付完成时间',
  `expire_time` timestamp COMMENT '失效时间',
  `pay_notify_time` timestamp COMMENT '支付通知时间',
  `pay_notify_biz_time` timestamp COMMENT '支付通知业务时间',
  `is_notify_biz` int COMMENT '是否已通知业务线',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间'
) COMMENT '支付单表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_pay_order';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_pay_refund_order` (
  `id` bigint COMMENT '主键',
  `pay_order_number` bigint COMMENT '平台支付流水号',
  `business_id` int COMMENT '业务方id',
  `customer_id` bigint COMMENT '用户id',
  `order_number` bigint COMMENT '订单号',
  `refund_state` tinyint COMMENT '退款状态 10-已申请退款  20-退款成功  99-退款失败',
  `pay_id` string COMMENT '支付id(第三方支付的transaction_id)',
  `refund_order_number` bigint COMMENT '退款订单号',
  `refund_id` string COMMENT '退款id(第三方支付的transaction_id)',
  `refund_fee` bigint COMMENT '退款金额 分为单位',
  `refund_request_time` timestamp COMMENT '退款申请时间',
  `refund_time` timestamp COMMENT '退款完成时间',
  `refund_notify_time` timestamp COMMENT '退款处理时间-退款一般都是自己查询',
  `refund_notify_biz_time` timestamp COMMENT '退款通知业务线时间',
  `is_notify_biz` int COMMENT '是否已通知业务线',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间'
) COMMENT '退款单表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_pay_refund_order';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_pay_refund_request_log` (
  `id` bigint COMMENT '主键',
  `pay_order_number` bigint COMMENT '平台支付流水号',
  `pay_refund_id` bigint COMMENT '退款Id',
  `log_type` tinyint COMMENT '日志类型 1.支付  2. 退款',
  `in_param` string COMMENT '入参',
  `out_result` string COMMENT '出参',
  `handle_time` timestamp COMMENT '处理时间',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间'
) COMMENT '支付请求日志表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_pay_refund_request_log';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_pay_refund_state_change` (
  `id` bigint COMMENT '主键',
  `refund_order_id` bigint COMMENT '退款主键ID',
  `pay_order_number` bigint COMMENT '平台支付流水号',
  `old_state` tinyint COMMENT '参考支付订单的状态',
  `new_state` tinyint COMMENT '参考支付订单的状态',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间'
) COMMENT '退款状态转换表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_pay_refund_state_change';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_pay_state_change` (
  `id` bigint COMMENT '主键',
  `pay_order_number` bigint COMMENT '平台支付流水号',
  `old_state` tinyint COMMENT '参考支付订单的状态',
  `new_state` tinyint COMMENT '参考支付订单的状态',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间'
) COMMENT '支付状态转换表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_pay_state_change';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_redeem_code` (
  `id` bigint COMMENT '',
  `redeem_code_name` string COMMENT '兑换码名称',
  `start_time` timestamp COMMENT '有效时间-开始',
  `end_time` timestamp COMMENT '有效时间-结束',
  `usage_count` int COMMENT '用户使用次数',
  `publish_type` tinyint COMMENT '发放类型 0->电子码,1->纸质码',
  `publish_count` int COMMENT '发行数量',
  `redeem_code_batch_code` string COMMENT '批次号',
  `batch_state` tinyint COMMENT '批次状态 0->正常,1->已冻结,2->已过期',
  `apply_department` tinyint COMMENT '申请部门 0->市场运营部,1->商务部,2->协会事业部,3->测试部,4->产品部',
  `apply_purpose` tinyint COMMENT '申请用途 0->厂商购买,1->院方采购,2->内部测试',
  `apply_user` string COMMENT '申请人',
  `apply_note` string COMMENT '备注',
  `op_user` string COMMENT '创建人姓名',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间'
) COMMENT '兑换码批次表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_redeem_code';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_redeem_code_detail` (
  `id` bigint COMMENT '',
  `redeem_code_id` bigint COMMENT '兑换码批次ID',
  `customer_id` bigint COMMENT '使用者ID',
  `redeem_code_detail_code` string COMMENT '兑换码编号',
  `use_state` tinyint COMMENT '使用状态：0->未使用；1->已使用；2->已冻结；3->已过期',
  `use_time` timestamp COMMENT '使用时间',
  `order_id` bigint COMMENT '订单编号',
  `order_number` bigint COMMENT '订单号码',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间'
) COMMENT '兑换码明细表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_redeem_code_detail';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_redeem_product_relation` (
  `id` bigint COMMENT '',
  `redeem_code_id` bigint COMMENT '兑换码批次ID',
  `product_id` bigint COMMENT '商品ID',
  `product_price` int COMMENT '商品单价(单位：分)',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间'
) COMMENT '兑换码和付费课程的关系表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_redeem_product_relation';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_shopping_order` (
  `id` bigint COMMENT '订单id',
  `customer_id` bigint COMMENT '买家ID',
  `order_number` bigint COMMENT '订单编号',
  `platform_serial_number` bigint COMMENT '平台流水号',
  `third_part_serial_number` string COMMENT '第三方流水号',
  `total_amount` int COMMENT '订单总金额（分）',
  `pay_amount` int COMMENT '应付金额（实际支付金额）',
  `coupon_amount` int COMMENT '优惠券抵扣金额',
  `promotion_amount` int COMMENT '促销优化金额（促销价、满减、兑换码）',
  `pay_state` tinyint COMMENT '支付状态 1->未支付,2->已撤销,3->已支付，4->待退款；5->退款中,6->已退款,7->退款失败',
  `pay_type` tinyint COMMENT '支付方式：1->支付宝；2->微信,3->苹果支付，4->其他支付,5->兑换码支付',
  `source_type` tinyint COMMENT '订单来源：1->IOS订单；2->安卓订单；3->微信公众号；4->微信小程序；5->PC订单；6->线下收款；',
  `order_state` tinyint COMMENT '订单状态：1->待付款；2->待发货；3->已发货；4->已完成；5->已关闭(超时)；6->已取消(手动);7->已退货',
  `order_type` tinyint COMMENT '订单类型：1->普通订单；2->优惠券订单；3->兑换码订单；4->拼团订单',
  `device_name` string COMMENT '设备名称(iPhone 6s Plus)',
  `device_token` string COMMENT '设备token',
  `receiver_name` string COMMENT '买家姓名',
  `receiver_phone` string COMMENT '买家电话',
  `note` string COMMENT '订单备注',
  `is_valid` int COMMENT '删除状态：0->未删除；1->已删除',
  `create_time` timestamp COMMENT '下单时间',
  `payment_time` timestamp COMMENT '支付时间',
  `grant_access_time` timestamp COMMENT '开通付费虚拟商品权限时间',
  `update_time` timestamp COMMENT '修改时间',
  `prepay_time` timestamp COMMENT '支付发起时间',
  `ip` string COMMENT ''
) COMMENT '订单表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_shopping_order';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_shopping_order_item` (
  `id` bigint COMMENT '',
  `order_id` bigint COMMENT '订单id',
  `product_id` bigint COMMENT '商品ID',
  `product_name` string COMMENT '商品名称',
  `product_price` int COMMENT '商品价格',
  `coupon_id` bigint COMMENT '优惠券ID',
  `coupon_detail_code` string COMMENT '优惠券编码',
  `redeem_code_id` bigint COMMENT '兑换码ID',
  `redeem_code_detail_code` string COMMENT '兑换码编号',
  `promotion_amount` int COMMENT '知识付费促销/满减金额/兑换码金额',
  `coupon_amount` int COMMENT '优惠券优惠分解金额',
  `real_amount` int COMMENT '该商品经过优惠后的实际金额',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '修改时间'
) COMMENT '订单中所包含的知识付费商品/课程'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_shopping_order_item';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_shopping_order_operate_history` (
  `id` bigint COMMENT '',
  `order_id` bigint COMMENT '订单id',
  `user_id` bigint COMMENT '',
  `operate_man` string COMMENT '操作人：用户；系统；后台管理员',
  `create_time` timestamp COMMENT '操作时间',
  `pre_order_status` int COMMENT '订单上一个状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭(超时)；5->已取消(手动);6->已退货',
  `order_status` int COMMENT '订单当前状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭(超时)；5->已取消(手动);6->已退货',
  `note` string COMMENT '备注'
) COMMENT '订单操作历史记录'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_shopping_order_operate_history';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_shopping_order_return_apply` (
  `id` bigint COMMENT '',
  `order_id` bigint COMMENT '订单id',
  `product_id` bigint COMMENT '退货商品id/课程ID',
  `create_time` timestamp COMMENT '申请时间',
  `customer_id` bigint COMMENT '会员Id',
  `return_amount` int COMMENT '退款金额',
  `status` int COMMENT '申请状态：1->退款中；2->已完成；3->已失败，4->已取消/关闭',
  `refund_failure_reason` string COMMENT '退款失败原因。第三方失败原因',
  `modify_time` timestamp COMMENT '处理时间',
  `reason` string COMMENT '原因',
  `description` string COMMENT '描述',
  `handle_note` string COMMENT '处理备注',
  `operator_id` string COMMENT '处理人员',
  `refund_finish_time` timestamp COMMENT '退款完成时间',
  `amount_source_type` tinyint COMMENT '退款资金来源（1-未结算金额2-账户余额）'
) COMMENT '退款申请单'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_shopping_order_return_apply';

CREATE EXTERNAL TABLE IF NOT EXISTS `ods.ods_allin_shopping_test_table` (
  `id` bigint COMMENT '',
  `nick_name` string COMMENT '昵称',
  `create_time` timestamp COMMENT '创建时间',
  `update_time` timestamp COMMENT '创建时间',
  `is_valid` int COMMENT '是否有效'
) COMMENT '测试表'
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\001',
  'line.delim'='\n',
  'escape.delim'='\\',
  'serialization.null.format'='')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://allincluster/user/hive/data/ods/allin_shopping/ods_allin_shopping_test_table';

