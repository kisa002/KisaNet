/// @description Insert description here
// HolyKnight - vnycall74@naver.com
// http://haeyum.com && http://holykisa.tistory.com

type = buffer_read(buffer, buffer_u8);

switch(type)
{
	case 1:
		result = buffer_read(buffer, buffer_u8);
		
		if(result == 0)
		{
			show_message("Login SUCCESS");
			
			room = r_game;
		}
		else if(result == 1)
			show_message_async("존재하지않는 사용자입니다.");
		else
			show_message_async("비밀번호가 일치하지 않습니다.");
			
		break;
		
	case 2:
		result = buffer_read(buffer, buffer_u8);
		
		if(result == 0)
		{
			show_message("REGISTER SUCCESS");
			room = r_login;
		}
		else if(result == 1)
			show_message_async("이미 존재하는 닉네임입니다.");
		else
			show_message_async("이미 존재하는 사용자이름입니다.");
		break;		
}