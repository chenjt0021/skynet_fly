local assert = assert
local ARGV = {...}
local skynet_fly_path = ARGV[1]
assert(skynet_fly_path,'缺少 skynet_fly_path')

package.cpath = skynet_fly_path .. "/luaclib/?.so;"
package.path = './?.lua;' .. skynet_fly_path .."/lualib/utils/?.lua;"
local file_util = require "file_util"
local svr_name = file_util.get_cur_dir_name()

local skynet_path = file_util.path_join(skynet_fly_path, '/skynet')
local server_path = "./"
local lua_path = skynet_path .. '/3rd/lua/lua'

local shell_str = "#!/bin/bash\n"
shell_str = shell_str .. [[
if [ "$#" -lt 1 ]; then
	echo "arg1 [load_mods] 启动的load_mods配置"
	echo "please format script/stop.sh load_mods.lua"
	exit 1
fi
]]
shell_str = shell_str .. string.format("pkill -f skynet.%s_config.lua.$1\n",svr_name)
shell_str = shell_str .. string.format("echo kill %s $1\n",svr_name)

local shell_path = server_path .. 'script/'

if not os.execute("mkdir -p " .. shell_path) then
	error("create shell_path err")
end

local file_path = shell_path .. 'stop.sh'

local file = io.open(file_path,'w+')
assert(file)
file:write(shell_str)
file:close()
print("make " .. file_path)