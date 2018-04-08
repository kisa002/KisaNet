/// @description Insert description here
// HolyKnight - vnycall74@naver.com
// http://haeyum.com && http://holykisa.tistory.com

client = network_create_socket(network_socket_tcp);
connect = network_connect(client, "localhost", 12345);

cl_id = array_create(100, false);
cl_username = array_create(100, false);
cl_nickname = array_create(100, false);
cl_x = array_create(100, false);
cl_y = array_create(100, false);
cl_instance = array_create(100, false);

if(connect < 0)
{
	show_message("Connect Error");
	game_end();
}