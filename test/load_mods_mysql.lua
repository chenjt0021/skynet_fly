local host = '127.0.0.1'
local port = 3306
local user = "root"
local password = "123456"

return {
	mysql_m = {
		launch_seq = 4,
		launch_num = 4,
		mod_args = {
			{
				instance_name = "game",
				db_conf = {
					host = host,
					port = port,
					max_packet_size = 1048576,
					user = user,
					password = password,
					database = 'gamedb',
				},
				is_create = true,  --不存在数据库就创建
			},
			{
				instance_name = "game",
				db_conf = {
					host = host,
					port = port,
					max_packet_size = 1048576,
					user = user,
					password = password,
					database = 'gamedb',
				},
				is_create = true,  --不存在数据库就创建
			},
			{
				instance_name = "hall",
				db_conf = {
					host = host,
					port = port,
					max_packet_size = 1048576,
					user = user,
					password = password,
					database = 'halldb',
				},
				is_create = true,  --不存在数据库就创建
			},
			{
				instance_name = "hall",
				db_conf = {
					host = host,
					port = port,
					max_packet_size = 1048576,
					user = user,
					password = password,
					database = 'halldb',
				},
				is_create = true,  --不存在数据库就创建
			},
		}
	},
	
    mysql_test_m = {
		launch_seq = 2,
		launch_num = 1,
	}
}