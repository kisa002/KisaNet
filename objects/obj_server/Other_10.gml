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
			
		}
		
		buffer_server = buffer_create(1, buffer_grow, 1);
		buffer_seek(buffer_server, buffer_seek_start, 0);
		
		buffer_write(buffer_server, buffer_u8, 1);
		buffer_write(buffer_server, buffer_u8, result);
		
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
								
				//temp_map = client_map_init;
				
				//ds_map_replace(temp_map, "username", username);
				//ds_map_replace(temp_map, "nickname", nickname);
				//ds_map_replace(temp_map, "password", password);
				
				//if(!ds_map_exists(client_map, username))
				//	ds_map_add_map(client_map, username, temp_map);
					
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
		
		break;
}