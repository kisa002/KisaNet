/// @description Insert description here
// HolyKnight - vnycall74@naver.com
// http://haeyum.com && http://holykisa.tistory.com

buffer = ds_map_find_value(async_load, "buffer");
buffer_type = ds_map_find_value(async_load, "type");

switch(buffer_type)
{
	case network_type_connect:
		break;
		
	case network_type_disconnect:
		break;
		
	case network_type_data:
		client_id = ds_map_find_value(async_load, "id");
		event_user(0);
		break;
}