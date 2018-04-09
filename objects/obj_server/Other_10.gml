/// @description Insert description here
// HolyKnight - vnycall74@naver.com
// http://haeyum.com && http://holykisa.tistory.com

type = buffer_read(buffer, buffer_u8);
//buffer_server = buffer_create(0, buffer_grow, 1);

switch(type)
{
	case 1:
		var username = buffer_read(buffer, buffer_string);
		var password = buffer_read(buffer, buffer_string);
		
		ini_open("account.ini");
			var nickname = ini_read_string(username, "nickname", noone);
			var check_username = ini_read_string(username, "username", noone);
			var check_password = ini_read_string(username, "password", noone);
		ini_close();
		
		if(username != check_username)
		{
			result = 1;
			
			log += kisanet_server_add_log("[LoginFailed] Incorrect Username > localhost");
		}
		else if(password != check_password)
		{
			result = 2;
			
			log += kisanet_server_add_log("[LoginFailed] Incorrect Password > localhost");
		}
		else
		{
			result = 0;
			
			log += kisanet_server_add_log("[LoginSuccess] Login > " + username);
			
			for(var i=0; i<100; i++)
			{
				if(cl_id[i] == false)
				{
					cl_id[i] = client_id;
					cl_username[i] = username;
					cl_nickname[i] = nickname;
					temp = i;
					
					break;
				}
			}
		}
		
		buffer_server = buffer_create(1, buffer_grow, 1);
		buffer_seek(buffer_server, buffer_seek_start, 0);
		
		buffer_write(buffer_server, buffer_u8, 1);
		
		buffer_write(buffer_server, buffer_u8, result);
		
		if(result == 0)
		{
			buffer_write(buffer_server, buffer_u8, cl_id[temp]);
			buffer_write(buffer_server, buffer_string, cl_username[temp]);
			buffer_write(buffer_server, buffer_string, cl_nickname[temp]);
		}
		
		network_send_packet(client_id, buffer_server, buffer_tell(buffer_server));
		
		break;
		
	case 2:
		var nickname = buffer_read(buffer, buffer_string);
		var username = buffer_read(buffer, buffer_string);
		var password = buffer_read(buffer, buffer_string);
		
		ini_open("account.ini");
			if(ini_section_exists(nickname))
			{
				result = 1;
				
				log += kisanet_server_add_log("[RegisterFailed] Nickname Exists > " + nickname);
			}
			else if(ini_section_exists(username))
			{
				result = 2;
				
				log += kisanet_server_add_log("[RegisterFailed] Username Exists > " + username);
			}
			else
			{
				ini_write_string(username, "nickname", nickname);
				ini_write_string(username, "username", username);
				ini_write_string(username, "password", password);
				
				log += kisanet_server_add_log("[RegisterSuccess] Register > " + username);
					
				result = 0;
			}
		ini_close();

		buffer_server = buffer_create(1, buffer_grow, 1);
		buffer_seek(buffer_server, buffer_seek_start, 0);
		
		buffer_write(buffer_server, buffer_u8, 2);
		buffer_write(buffer_server, buffer_u8, result);
		
		network_send_packet(client_id, buffer_server, buffer_tell(buffer_server));
		break;
	
	case 10:
		buffer_server = buffer_create(1, buffer_grow, 1);
		buffer_seek(buffer_server, buffer_seek_start, 0);
		
		var username = buffer_read(buffer, buffer_string);
		
		buffer_write(buffer_server, buffer_u8, 10);
		
		var index = -1;
		
		for(var i=0; i<100; i++)
			if(cl_id[i] == false)
			{
				index = i;
				buffer_write(buffer_server, buffer_u8, index);
				show_debug_message(index);
				break;
			}
		
		for(var i=0; i<index; i++)
		{
			buffer_write(buffer_server, buffer_u8, cl_id[i]);
			buffer_write(buffer_server, buffer_string, cl_username[i]);
			buffer_write(buffer_server, buffer_string, cl_nickname[i]);
			buffer_write(buffer_server, buffer_s16, cl_x[i]);
			buffer_write(buffer_server, buffer_s16, cl_y[i]);
		}
		
		for(var i=0; i<index; i++)
		{			
			//if(cl_username[i] != username)
				network_send_packet(cl_id[i], buffer_server, buffer_tell(buffer_server));
		}
				
		break;
		
	case 11:
		var username = buffer_read(buffer, buffer_string);
		var X = buffer_read(buffer, buffer_s16);
		var Y = buffer_read(buffer, buffer_s16);
		
		show_debug_message(username + " - : " + string(X) + " / " + string(Y));
		
		//cl_x[client_id] = X;
		//cl_y[client_id] = Y;
		
		cl_x[cl_id[client_id]] = X;
		cl_y[cl_id[client_id]] = Y;
		
		buffer_server = buffer_create(1, buffer_grow, 1);
		buffer_seek(buffer_server, buffer_seek_start, 0);
		
		buffer_write(buffer_server, buffer_u8, 11);
		buffer_write(buffer_server, buffer_string, username);
		buffer_write(buffer_server, buffer_s16, X);
		buffer_write(buffer_server, buffer_s16, Y);
		
		for(var i=0; i<100; i++)
		{
			if(cl_id[i] == false)
				break;
				
			network_send_packet(cl_id[i], buffer_server, buffer_tell(buffer_server));
		}
		break;
}