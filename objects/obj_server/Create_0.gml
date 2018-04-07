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

client_map = ds_map_create();
client_map_init = ds_map_create();

ds_map_add(client_map_init, "username", noone);
ds_map_add(client_map_init, "nickname", noone);
ds_map_add(client_map_init, "x", noone);
ds_map_add(client_map_init, "y", noone);

log = string(current_year) + "." + string(current_month) + "." + string(current_day) + "_" + string(current_hour) + ":" + string(current_minute) + ":" + string(current_second) + " - Server Started";