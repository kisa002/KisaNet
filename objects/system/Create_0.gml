/// @description Insert description here
// HolyKnight - vnycall74@naver.com
// http://haeyum.com && http://holykisa.tistory.com

client_id = -1
;
nickname = "";
username = "";
password = "";
password_confirm = "";

player = false;

is_server = false;
is_server = show_question("Server : Yes\nClient : No");

if(is_server)
	instance_create_depth(x, y, -1000, obj_server);
else
	instance_create_depth(x, y, -1000, obj_client);