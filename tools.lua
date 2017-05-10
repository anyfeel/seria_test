local _M = {}

local function gen_meta(log_table, meta)
    local index = 1
    local line = ""
    for k, v in pairs(log_table) do
        if type(v) == "string" then
            line = string.format("%-30s %3d : %s", k, index, "string")
        elseif type(v) == "number" then
            if string.find(tostring(v), '.') then
                line = string.format("%-30s %3d : %s", k, index, "integer(5)")
            else
                line = string.format("%-30s %3d : %s", k, index, "integer")
            end
        elseif type(v)  == "table" then
            line = string.format("%-30s %3d : %s", k, index, "*"..tostring(k))
            meta[k] = {}
            gen_meta(v, meta[k])
        end
        index = index + 1
        table.insert(meta, line)
    end
    return meta
end

local function print_r(name, meta)
    print(".", name," {")
    for k, v in pairs(meta) do
        if type(v) ~= "table" then
            print(v)
        else
            print_r(k, v)
        end
    end
    print("}")
end

--log_table is target log format
function _M.gen(name, log_table)
    print_r(name, gen_meta(log_table, {}))
end

return _M
