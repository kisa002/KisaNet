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
			
			//if(client_map[0] == false)
			//{
			//	client_map[0] = client_map_init;
			
			//	ds_map_replace(client_map[0], "client_id", client_id);
			//	ds_map_replace(client_map[0], "username", username);
			//	ds_map_replace(client_map[0], "nickname", nickname);
				
			//	ds_map_add_map(client, username, client_map[0]);
			//}
			//else
			//{
			//	client_map[array_length_1d(client_map)] = client_map_init;
			
			//	ds_map_replace(client_map[array_length_1d(client_map) - 1], "client_id", client_id);
			//	ds_map_replace(client_map[array_length_1d(client_map) - 1], "username", username);
			//	ds_map_replace(client_map[array_length_1d(client_map) - 1], "nickname", nickname);
			
			//	ds_map_add_map(client, username, client_map[array_length_1d(client_map) - 1]);
				
			//	show_debug_message(array_length_1d(client_map) - 1);
			//}
			
			//for(var i=0; i<array_length_1d(client_map); i++)
			//	show_debug_message(string(i) + " > " + ds_map_find_value(client_map[i], "username"));
			
			//for(var i=0; i<100; i++)
			//{
			//	if(client_map[i] == false)
			//	{
			//		client_map[i] = client_map_init;
			//		ds_map_replace(client_map[i], "client_id", client_id);
			//		ds_map_replace(client_map[i], "username", username);
			//		ds_map_replace(client_map[i], "nickname", nickname);
					
			//		ds_map_add_map(client, username, client_map[i]);
					
			//		break;
			//	}
			//}
			
			//show_message(ds_map_find_value(client_map[i], "username"));
			
			for(var i=0; i<100; i++)
			{
				if(cl_id[i] == false)
				{
					cl_id[i] = client_id;
					cl_username[i] = username;
					cl_nickname[i] = nickname;
					
					break;
				}
			}
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
		
		//var cld = buffer_read(buffer, buffer_u8);
		
		var username = buffer_read(buffer, buffer_string);
		//var nickname = buffer_read(buffer, buffer_string);
		
		var X = buffer_read(buffer, buffer_s16);
		var Y = buffer_read(buffer, buffer_s16);
		
		for(var i=0; i<100; i++)
		{
			if(cl_username[i] == false)
				break;
				
			//if(cl_id[i] == cld)
			//	continue;
				
			network_send_packet(cl_id[i], buffer_server, buffer_tell(buffer_server));
		}

		//count = 0;
		
		//for(var i=0; i<100; i++)
		//{
		//	count ++;
		//	if(cl_id[i] == false)
		//		break;
		//}
		
		////show_message("SEND COUNT " + string(count));
		
		//buffer_write(buffer_server, buffer_u8, 10);
		//buffer_write(buffer_server, buffer_u8, count-1);
		
		//for(var i=0; i<100; i++)
		//{
		//	if(cl_id[i] == false)
		//		break;
			
		//	//buffer_write(buffer_server, buffer_string, cl_nickname[i]);
		//	buffer_write(buffer_server, buffer_string, cl_username[i]);
		//	buffer_write(buffer_server, buffer_string, cl_nickname[i]);
		//	buffer_write(buffer_server, buffer_s16, cl_x[i]);
		//	buffer_write(buffer_server, buffer_s16, cl_y[i]);
			
		//	show_debug_message(string(i) + " / " + string(cl_id[i]) + " - " + cl_username[i]);
		//}
		
		//for(var i=0; i<100; i++)
		//{
		//	if(cl_id[i] == false)
		//		break;
			
		//	if(cl_id[i] != client_id)
		//		network_send_packet(cl_id[i], buffer_server, buffer_tell(buffer_server));
		//}
		
		//for(var i=0; i<100; i++)
		//{
		//	if(client_map[i] == false)
		//		break;
			
		//	show_debug_message(ds_map_find_value(client_map[i], "username"));
		//}
		
		//for(var i=0; i<array_length_1d(client_map); i++)
		//{				
		//	buffer_write(buffer_server, buffer_string, ds_map_find_value(client_map[i], "username"));
		//	buffer_write(buffer_server, buffer_s16, ds_map_find_value(client_map[i], "x"));
		//	buffer_write(buffer_server, buffer_s16, ds_map_find_value(client_map[i], "y"));
			
		//	show_debug_message(ds_map_find_value(client_map[i], "username") + string(i) + " - " + string(x) + " / " + string(y));
		//}
		
		//for(var i=0; i<array_length_1d(client_map); i++)
		//	network_send_packet(ds_map_find_value(client_map[i], "client_id"), buffer_server, buffer_tell(buffer_server));
		
		break;
		
	case 11:
		var username = buffer_read(buffer, buffer_string);
		var X = buffer_read(buffer, buffer_s16);
		var Y = buffer_read(buffer, buffer_s16);
		
		//show_debug_message("GET Position - " + string(X) + " / " + string(Y));
		
		//var map = ds_map_find_value(client, username);
		//ds_map_replace(map, "x", X);
		//ds_map_replace(map, "y", Y);
		
		show_debug_message(username + " - : " + string(X) + " / " + string(Y));
		
		cl_x[client_id] = X;
		cl_y[client_id] = Y;
		
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
		
		//for(var i=0; i<array_length_1d(client_map); i++)
		//	network_send_packet(ds_map_find_value(client_map[i], "client_id"), buffer_server, buffer_tell(buffer_server));
		
		//log += kisanet_server_add_log(username + " : " + string(ds_map_find_value(map, "x")) + " / " + string(ds_map_find_value(map, "y")));
		break;
}