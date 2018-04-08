/// @description Insert description here
// HolyKnight - vnycall74@naver.com
// http://haeyum.com && http://holykisa.tistory.com

buffer = ds_map_find_value(async_load, "buffer");
buffer_type = ds_map_find_value(async_load, "type");

if(buffer_type == network_type_data)
	event_user(0);