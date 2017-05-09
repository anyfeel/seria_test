local cjson = require "cjson.safe"
local cmsgpack = require "cmsgpack"

local sproto = require "sproto"
local print_r = require "print_r"

local sp = sproto.parse [[
.log {
slice_size                      1 : integer
dyn_parents                     3 : string
request_uri                     4 : string
remote_addr                     5 : string
first_byte_time                 6 : integer
slice_abnormal_message          7 : string
protocol                        8 : string
msec                            9 : integer
request_args                   10 : string
content_range                  11 : string
via                            12 : string
node_version                   13 : string
node_host                      14 : string
bytes_sent                     15 : integer
x_source                       16 : string
slice_retry_max_times          17 : string
x_cache                        18 : string
timestamp                      19 : string
upnode                         20 : string
cache_status                   21 : string
slice_response_time            22 : string
status                         23 : string
slice_max_response_time        24 : integer
uptype                         25 : string
slice_retry_shares             27 : string
ssl_session_fetch_mode         28 : string
slice_status                   29 : string
remote_user                    30 : string
req_uri                        31 : string
node_type                      32 : string
error_type                     33 : string
url                            34 : string
exit_from_rewrite              35 : string
bucket                         36 : string
connection                     37 : integer
http_host                      38 : string
uptime                         39 : integer
slice_retry_times              40 : string
upstream_response_time         41 : integer
age                            42 : integer
ssl_session_reuse              43 : string
node_speed                     44 : integer
x_forwarded_for                45 : string
customer                       46 : string
method                         47 : string
cache0                         48 : string
x_request_id                   49 : string
upstream_response_length       50 : integer
scheme                         51 : string
dyn_parents_type               52 : string
location                       53 : string
node_name                      54 : string
client_slow                    55 : integer
content_type                   56 : string
node_room                      57 : string
body_bytes_sent                58 : integer
upstats_dynamic                59 : string
user_agent                     60 : string
referer                        61 : string
diverse_cdn_redirect           62 : string
slice_abnormal_shares          63 : integer
cache1                         64 : string
cache_control                  65 : string
client_block_time              66 : integer
range                          67 : string
upcode                         68 : string
request_time                   69 : integer
up_prematurely_closed          70 : integer
upstats_key                    71 : string
content_length                 72 : integer
}
]]

local log = {
    age = 0,
    body_bytes_sent = 7162,
    bucket = "qn-02817988582817364",
    bytes_sent = 8179,
    cache0 = "HIT",
    cache1 = "HIT",
    cache_control = "max-age=2592000",
    cache_status = "M",
    client_block_time = 0,
    client_slow = 0,
    connection = 1344409161,
    content_length = 30916,
    content_range = "-",
    content_type = "image/jpeg",
    customer = "",
    diverse_cdn_redirect = "-",
    dyn_parents = "-",
    dyn_parents_type = "-",
    error_type = "size",
    exit_from_rewrite = "-",
    first_byte_time = 0.064,
    http_host = "img8.cclycs.com",
    location = "-",
    method = "GET",
    msec = 1494225711.363,
    node_host = "120.192.92.198",
    node_name = "cmn-sd-tna-198",
    node_room = "cmn-sd-tna",
    node_speed = 78.585849719101,
    node_type = "marco_access_error",
    node_version = "e4a59d4-1.0.0",
    protocol = "HTTP/1.1",
    range = "-",
    referer = "http://www.cclycs.com/e24524.html",
    remote_addr = "117.136.8.67",
    remote_user = "-",
    request_args = "wx_fmt=jpeg\\x26amp;tp=webp\\x26amp;wxfrom=5\\x26amp;wx_lazy=1",
    request_time = 0.089,
    request_uri = "/mmbiz_jpg/YMpwaTPiaTcT2MzwB6UuPgytrwZEHE3iaibguNLkyDttKW3zEuevpTicWQR0pEH17EewbdEHAkTTM8rqWGZYy45NYA/640?wx_fmt=jpeg\\x26amp;tp=webp\\x26amp;wxfrom=5\\x26amp;wx_lazy=1",
    req_uri = "/mmbiz_jpg/YMpwaTPiaTcT2MzwB6UuPgytrwZEHE3iaibguNLkyDttKW3zEuevpTicWQR0pEH17EewbdEHAkTTM8rqWGZYy45NYA/640",
    scheme = "http",
    slice_abnormal_message = "-",
    slice_abnormal_shares = 0,
    slice_max_response_time = 0,
    slice_response_time = "-",
    slice_retry_max_times = "0",
    slice_retry_shares = "0",
    slice_retry_times = "0",
    slice_size = -1,
    slice_status = "-",
    ssl_session_fetch_mode = "-",
    ssl_session_reuse = "r",
    status = "200",
    timestamp = "08/May/2017:14:41:51 +0800",
    upcode = "-",
    upnode = "-",
    up_prematurely_closed = 0,
    upstats_dynamic = "",
    upstats_key = "img8.cclycs.com",
    upstream_response_length = 7276,
    upstream_response_time = 0.089,
    uptime = -1,
    uptype = "dcdn",
    url = "http://img8.cclycs.com/mmbiz_jpg/YMpwaTPiaTcT2MzwB6UuPgytrwZEHE3iaibguNLkyDttKW3zEuevpTicWQR0pEH17EewbdEHAkTTM8rqWGZYy45NYA/640?wx_fmt=jpeg\\x26amp;tp=webp\\x26amp;wxfrom=5\\x26amp;wx_lazy=1",
    user_agent = "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Mobile/14E304 baiduboxapp/0_7.0.2.8_enohpi_4331_057/1.3.01_2C2%257enohPi/1099a/907FA682D6C412D773B84F4F5BEEABA61CA0A444FFRJNJIOPRG/1",
    via = "S.mix-sd-dst-036, T.22140.M.1, V.mix-sd-dst-043, T.92197.M.1, M.cmn-sd-tna-198",
    x_cache = "MISS from mix-sd-dst-043, MISS from cmn-sd-tna-198",
    x_forwarded_for = "-",
    x_request_id = "2c7a98672b0355a8ab4a2700042a33fb",
    x_source = "C/200",
}

local log_index = {
 0,
 7162,
 "qn-02817988582817364",
 8179,
 "HIT",
 "HIT",
 "max-age=2592000",
 "M",
 0,
 0,
 1344409161,
 30916,
 "-",
 "image/jpeg",
 "",
 "-",
 "-",
 "-",
 "size",
 "-",
 0.064,
 "img8.cclycs.com",
 "-",
 "GET",
 1494225711.363,
 "120.192.92.198",
 "cmn-sd-tna-198",
 "cmn-sd-tna",
 78.585849719101,
 "marco_access_error",
 "e4a59d4-1.0.0",
 "HTTP/1.1",
 "-",
 "http://www.cclycs.com/e24524.html",
 "117.136.8.67",
 "-",
 "wx_fmt=jpeg\\x26amp;tp=webp\\x26amp;wxfrom=5\\x26amp;wx_lazy=1",
 0.089,
 "/mmbiz_jpg/YMpwaTPiaTcT2MzwB6UuPgytrwZEHE3iaibguNLkyDttKW3zEuevpTicWQR0pEH17EewbdEHAkTTM8rqWGZYy45NYA/640?wx_fmt=jpeg\\x26amp;tp=webp\\x26amp;wxfrom=5\\x26amp;wx_lazy=1",
 "/mmbiz_jpg/YMpwaTPiaTcT2MzwB6UuPgytrwZEHE3iaibguNLkyDttKW3zEuevpTicWQR0pEH17EewbdEHAkTTM8rqWGZYy45NYA/640",
 "http",
 "-",
 0,
 0,
 "-",
 "0",
 "0",
 "0",
 -1,
 "-",
 "-",
 "r",
 "200",
 "08/May/2017:14:41:51 +0800",
 "-",
 "-",
 0,
 "",
 "img8.cclycs.com",
 7276,
 0.089,
 -1,
 "dcdn",
 "http://img8.cclycs.com/mmbiz_jpg/YMpwaTPiaTcT2MzwB6UuPgytrwZEHE3iaibguNLkyDttKW3zEuevpTicWQR0pEH17EewbdEHAkTTM8rqWGZYy45NYA/640?wx_fmt=jpeg\\x26amp;tp=webp\\x26amp;wxfrom=5\\x26amp;wx_lazy=1",
 "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Mobile/14E304 baiduboxapp/0_7.0.2.8_enohpi_4331_057/1.3.01_2C2%257enohPi/1099a/907FA682D6C412D773B84F4F5BEEABA61CA0A444FFRJNJIOPRG/1",
 "S.mix-sd-dst-036, T.22140.M.1, V.mix-sd-dst-043, T.92197.M.1, M.cmn-sd-tna-198",
 "MISS from mix-sd-dst-043, MISS from cmn-sd-tna-198",
 "-",
 "2c7a98672b0355a8ab4a2700042a33fb",
 "C/200",
}


--local code = sp:encode("log", log)
--log = sp:decode("log", code)
--print_r(log)
--
---- core.dumpproto only for debug use
--local core = require "sproto.core"
--core.dumpproto(sp.__cobj)
--

local function encode(cb, unpack, log, name, cbname)
    ngx.update_time()
    local start = ngx.now()

    times = 1000000
    for i=1, times do
        if cbname == "sproto" then
            local temp = cb(sp, "log", log)
            local temp2 = unpack(sp, "log", temp)
        else
            local temp = cb(log)
            local temp2 = unpack(temp)
        end
    end

    ngx.update_time()
    local ends = ngx.now()

    ngx.print(name, ": ", cbname, " times: ", times, " cost cpu time: ", string.format("%.10f", ends - start), "\n")
end

encode(cjson.encode, cjson.decode, log, "string key", "cjson")
encode(cjson.encode, cjson.decode, log_index, "integer key", "cjson")
ngx.print("------------------\n")

encode(cmsgpack.pack, cmsgpack.unpack, log, "string key", "cmsgpack")
encode(cmsgpack.pack, cmsgpack.unpack, log_index, "integer key", "cmsgpack")
ngx.print("------------------\n")

encode(sp.encode, sp.decode, log, "string key", "sproto")
