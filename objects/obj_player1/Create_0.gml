/// @description Insert description here
// HolyKnight - vnycall74@naver.com
// http://haeyum.com && http://holykisa.tistory.com

username = "null";
nickname = "null";

if(system.player == false)
{
	system.player = id;
	username = system.username;
}

if(system.player == id)
{
	is_move = false;

	client_id = noone;

	buffer = buffer_create(1, buffer_grow, 1);
	buffer_seek(buffer, buffer_seek_start, 0);

	buffer_write(buffer, buffer_u8, 10);
	buffer_write(buffer, buffer_string, username);
	
	buffer_write(buffer, buffer_s16, x);
	buffer_write(buffer, buffer_s16, y);
	
	network_send_packet(0, buffer, buffer_tell(buffer));
}