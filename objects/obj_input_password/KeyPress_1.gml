/// @description Insert description here
// HolyKnight - vnycall74@naver.com
// http://haeyum.com && http://holykisa.tistory.com

if(!focus)
	return false;
	
system.password = keyboard_string;

secret_count = string_length(system.password);

secret = "";

for(i=0; i<secret_count; i++)
	secret += "*";