/// @description Insert description here
// HolyKnight - vnycall74@naver.com
// http://haeyum.com && http://holykisa.tistory.com

draw_self();
draw_set_font(f_25);

draw_set_halign(fa_center);
draw_set_valign(fa_center);

if(system.username != "" && system.password != "")
	draw_set_color(c_black);
else
	draw_set_color(c_gray);

draw_text(x + sprite_width / 2, y + sprite_height / 2, "Login");