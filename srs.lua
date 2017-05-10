local srs = {
	pid = 3069840,
    errid = 11,
    node_room = "VDO-GD-CAN",
    msg = "bocar hijack failed, uri=mz-live.s0.aicdn.com/launch. ret=9013(Resource temporarily unavailable)",
    node_name = "VDO-GD-CAN-027",
    xtimestamp = "2017-05-09T23=07=43+08=00",
    node_ip = "127.0.0.1",
    node_version = "4.0",
    loglevel = "error",
    cid = 18036,
    node_type = "srs_error",
    error_type = "other"
}

local tools = require "tools"

tools.gen("srs", srs)
