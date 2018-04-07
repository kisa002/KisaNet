/// @description Insert description here
// HolyKnight - vnycall74@naver.com
// http://haeyum.com && http://holykisa.tistory.com

client = network_create_socket(network_socket_tcp);
connect = network_connect(client, "localhost", 12345);

if(connect < 0)
{
	show_message("Connect Error");
	game_end();
}