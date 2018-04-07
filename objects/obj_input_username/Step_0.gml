/// @description Insert description here
// HolyKnight - vnycall74@naver.com
// http://haeyum.com && http://holykisa.tistory.com

if(keyboard_check_pressed(vk_tab))
{
	if(room == r_login)
	{
		if(obj_input_username.focus)
		{
			keyboard_string = system.password;

			obj_input_username.focus = false;
			obj_input_password.focus = true;
		}
		else if(obj_input_password.focus)
		{
			keyboard_string = system.username;

			obj_input_password.focus = false;
			obj_input_username.focus = true;
		}
	}
	else
	{
		if(obj_input_nickname.focus)
		{
			keyboard_string = system.username;
		
			obj_input_nickname.focus = false;
			obj_input_username.focus = true;
		}
		else if(obj_input_username.focus)
		{
			keyboard_string = system.password;

			obj_input_username.focus = false;
			obj_input_password.focus = true;
		}
		else if(obj_input_password.focus)
		{
			keyboard_string = system.password_confirm;

			obj_input_password.focus = false;
			obj_input_password_confirm.focus = true;
		}
		else if(obj_input_password_confirm.focus)
		{
			keyboard_string = system.nickname;

			obj_input_password_confirm.focus = false;
			obj_input_nickname.focus = true;
		}
		
	}
}