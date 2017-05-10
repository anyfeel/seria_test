local cjson = require "cjson.safe"
local cmsgpack = require "cmsgpack"

local sproto = require "sproto"
local print_r = require "print_r"

local sp = sproto.parse [[
	.marco_log {
		.upstream {
			status                       1 : string
			response_length              2 : string
			addr                         3 : string
			response_time                4 : string
		}

		slice_size                       1 : integer(5)
		xtimestamp                       2 : integer(5)
		dyn_parents                      3 : string
		request_uri                      4 : string
		remote_addr                      5 : string
		first_byte_time                  6 : integer(5)
		slice_abnormal_message           7 : string
		protocol                         8 : string
		msec                             9 : integer(5)
		request_args                    10 : string
		content_range                   11 : string
		via                             12 : string
		node_version                    13 : string
		upstats_key                     14 : string
		bytes_sent                      15 : integer(5)
		x_source                        16 : string
		slice_retry_max_times           17 : string
		x_cache                         18 : string
		timestamp                       19 : string
		upnode                          20 : string
		range                           21 : string
		slice_response_time             22 : string
		status                          23 : string
		slice_abnormal_shares           24 : integer(5)
		user_agent                      25 : string
		upstream                        26 : *upstream
		slice_retry_shares              27 : string
		ssl_session_fetch_mode          28 : string
		slice_status                    29 : string
		remote_user                     30 : string
		req_uri                         31 : string
		node_type                       32 : string
		x_request_id                    33 : string
		exit_from_rewrite               34 : string
		bucket                          35 : string
		connection                      36 : integer(5)
		http_host                       37 : string
		uptime                          38 : integer(5)
		method                          39 : string
		upstream_response_time          40 : integer(5)
		age                             41 : integer(5)
		ssl_session_reuse               42 : string
		cache0                          43 : string
		customer                        44 : string
		slice_retry_times               45 : string
		client_block_time               46 : integer(5)
		upstream_response_length        47 : integer(5)
		scheme                          48 : string
		request_time                    49 : integer(5)
		upcode                          50 : string
		up_prematurely_closed           51 : integer(5)
		error_type                      52 : string
		uptype                          53 : string
		referer                         54 : string
		body_bytes_sent                 55 : integer(5)
		upstats_dynamic                 56 : string
		slice_max_response_time         57 : integer(5)
		node_room                       58 : string
		diverse_cdn_redirect            59 : string
		node_host                       60 : string
		cache1                          61 : string
		cache_control                   62 : string
		location                        63 : string
		client_slow                     64 : integer(5)
		content_type                    65 : string
		node_name                       66 : string
		dyn_parents_type                67 : string
		x_forwarded_for                 68 : string
		content_length                  69 : integer(5)
	}
]]

local raw_log = {
	first_byte_time = -1,
	protocol = "HTTP/1.1",
    upstream = {
        status= "-",
        addr= "192.168.118.135:8100",
        response_time= "-",
        response_length= "0"
    },
	request_args = "~sid=_1494322633_883273512_SH_VCCWO8CQ",
	remote_addr = "123.66.35.42",
	node_version = "e4a59d4-1.0.0",
	upstats_key = "upyun.v.tvxio.com",
	age = -1,
	slice_status = "-",
	slice_size = -1,
	scheme = "http",
	timestamp = "09/May/2017:17:37:34 +0800",
	up_prematurely_closed = 0,
	slice_max_response_time = 0,
	range = "bytes=917504-1064644",
	ssl_session_reuse = "r",
	content_range = "-",
	request_time = 0,
	slice_abnormal_shares = 0,
	cache0 = "HIT",
	dyn_parents_type = "-",
	bytes_sent = 0,
	dyn_parents = "-",
	upnode = "-",
	location = "-",
	error_type = "abnormal",
	diverse_cdn_redirect = "-",
	via = "-",
	status = "499",
	content_length = -1,
	node_room = "cmn-sd-tao",
	referer = "-",
	node_host = "120.221.19.199",
	http_host = "upyun.v.tvxio.com",
	body_bytes_sent = 0,
	bucket = "shiyun-vod",
	uptime = -1,
	cache_control = "-",
	uptype = "-",
	client_slow = 1,
	content_type = "-",
	req_uri = "/cdn/0/ee/157dd07cf4479da9fc5934082a037d/medium/slice/slice-8.ts",
	upstream_response_length = -1,
	node_name = "cmn-sd-tao-199",
	x_request_id = "4af8bda895b18089cd2886b156cc3ebf",
	x_source = "-",
	xtimestamp= 1494322654000,
	x_forwarded_for = "-",
	ssl_session_fetch_mode = "-",
	slice_abnormal_message = "-",
	cache1 = "HIT",
	upcode = "-",
	msec = 1494322654.214,
	user_agent = "sh_vccwo8cq",
	upstats_dynamic = "",
	method = "GET",
	connection = 1626967706,
	upstream_response_time = -1,
	remote_user = "-",
	exit_from_rewrite = "-",
	slice_retry_shares = "0",
	customer = "nil",
	slice_response_time = "-",
	request_uri = "/cdn/0/ee/157dd07cf4479da9fc5934082a037d/medium/slice/slice-8.ts?~sid=_1494322633_883273512_SH_VCCWO8CQ",
	client_block_time = 1,
	x_cache = "-",
	slice_retry_max_times = "0",
	node_type = "marco_access_error",
	slice_retry_times = "0"
}

local code = sp:encode("marco_log", raw_log)
local decode = sp:decode("marco_log", code)

print(cjson.encode(decode))
