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
			system.client_id = buffer_read(buffer, buffer_u8);
			system.username = buffer_read(buffer, buffer_string);
			system.nickname = buffer_read(buffer, buffer_string);
			
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
		
	case 10:
		count = buffer_read(buffer, buffer_u8);
		//show_message("COUNT : " + string(count) + " ( " + system.username);
		
		for(var i=0; i<100; i++)
		{
			var cld = buffer_read(buffer, buffer_u8);
			
			var username = buffer_read(buffer, buffer_string);
			var nickname = buffer_read(buffer, buffer_string);
			
			var X = buffer_read(buffer, buffer_s16);
			var Y = buffer_read(buffer, buffer_s16);
			
			if(!check)
			{
				cl_instance[i] = instance_create_depth(X, Y, -1000, obj_player);
				cl_instance[i].username = username;
				cl_instance[i].nickname = nickname;
				
				//show_message(username);
			}
			
			//show_message(username + " - XXX : " + string(x) + " / y : " + string(y));
			
			//if(username != system.username)
			//{
			//	//show_message(username + " - x : " + string(x) + " / y : " + string(y));
			//	player = instance_create_depth(X, Y, -1000, obj_player);
			//	player.username = username;
			//}
		}
		break;
		
	case 11:
		var username = buffer_read(buffer, buffer_string);
		var X = buffer_read(buffer, buffer_s16);
		var Y = buffer_read(buffer, buffer_s16);
		
		for(var i=0; i<100; i++)
		{
			if(cl_id[i] == false)
				break;
			
			cl_instance[i].x = X;
			cl_instance[i].y = Y;
			
			show_debug_message(username + " - : " + string(X) + " / " + string(Y));
		}
		break;
}