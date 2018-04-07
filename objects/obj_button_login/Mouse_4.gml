/// @description Insert description here
// HolyKnight - vnycall74@naver.com
// http://haeyum.com && http://holykisa.tistory.com

buffer = buffer_create(1, buffer_grow, 1);
buffer_seek(buffer, buffer_seek_start, 0);

buffer_write(buffer, buffer_u8, 1);
buffer_write(buffer, buffer_string, system.username);
buffer_write(buffer, buffer_string, system.password);

network_send_packet(0, buffer, buffer_tell(buffer));