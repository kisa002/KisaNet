/// @description Insert description here
// HolyKnight - vnycall74@naver.com
// http://haeyum.com && http://holykisa.tistory.com

if(string_length(system.nickname) >= 4 && string_length(system.nickname) <= 8)
	if(string_length(system.username) >= 4 && string_length(system.username) <= 12)
		if(string_length(system.password) >= 6 && string_length(system.password) <= 12)
			if(system.password == system.password_confirm)
			{
				buffer = buffer_create(1, buffer_grow, 1);
				buffer_seek(buffer, buffer_seek_start, 0);

				buffer_write(buffer, buffer_u8, 2);
				buffer_write(buffer, buffer_string, system.nickname);
				buffer_write(buffer, buffer_string, system.username);
				buffer_write(buffer, buffer_string, system.password);

				network_send_packet(0, buffer, buffer_tell(buffer));
			}
			else
				show_message_async("비밀번호가 일치하지 않습니다.");
		else
			show_message_async("비밀번호는 6글자 이상, 12글자 이하이여야 합니다.");
	else
		show_message_async("사용자이름은 4글자 이상, 12글자 이하이여야 합니다.");
else
	show_message_async("닉네임은 4글자 이상, 8글자 이하이여야 합니다.");