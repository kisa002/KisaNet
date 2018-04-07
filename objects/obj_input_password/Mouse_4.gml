/// @description Insert description here
// HolyKnight - vnycall74@naver.com
// http://haeyum.com && http://holykisa.tistory.com

focus = true;

if(room == r_login)
{
	obj_input_username.focus = false;
}
else
{
	obj_input_nickname.focus = false;
	obj_input_username.focus = false;
	obj_input_password_confirm.focus = false;
}

keyboard_string = system.password;