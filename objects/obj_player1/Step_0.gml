/// @description Insert description here
// HolyKnight - vnycall74@naver.com
// http://haeyum.com && http://holykisa.tistory.com

if(system.player == id)
{
	if(keyboard_check(vk_left))
	{
		x -= 4;
		is_move = true;
	}
	if(keyboard_check(vk_right))
	{
		x += 4;
		is_move = true;
	}
	if(keyboard_check(vk_up))
	{
		y -= 4;
		is_move = true;
	}
	if(keyboard_check(vk_down))
	{
		y += 4;
		is_move = true;
	}

	if(is_move)
	{
		buffer = buffer_create(1, buffer_grow, 1);
		buffer_seek(buffer, buffer_seek_start, 0);
	
		buffer_write(buffer, buffer_u8, 11);
		buffer_write(buffer, buffer_string, system.username);
		buffer_write(buffer, buffer_s16, x);
		buffer_write(buffer, buffer_s16, y);
	
		network_send_packet(0, buffer, buffer_tell(buffer));
		
		is_move = false;
	}
}