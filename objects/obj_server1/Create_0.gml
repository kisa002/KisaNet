/// @description Insert description here
// HolyKnight - vnycall74@naver.com
// http://haeyum.com && http://holykisa.tistory.com

room = r_server;

server = network_create_server(network_socket_tcp, 12345, 50);

if(server < 0)
{
	show_message("CREATE SERVER ERROR");
	game_end();
}

//client = ds_map_create();
//client_map = array_create(100, false);
////client_map[0] = false;
//client_map_init = ds_map_create();

//ds_map_add(client_map_init, "client_id", -1);
//ds_map_add(client_map_init, "username", "null");
//ds_map_add(client_map_init, "nickname", "null");
//ds_map_add(client_map_init, "x", 100);
//ds_map_add(client_map_init, "y", 100);

cl_id = array_create(100, false);
cl_username = array_create(100, false);
cl_nickname = array_create(100, false);
cl_x = array_create(100, false);
cl_y = array_create(100, false);

log = string(current_year) + "." + string(current_month) + "." + string(current_day) + "_" + string(current_hour) + ":" + string(current_minute) + ":" + string(current_second) + " - Server Started";