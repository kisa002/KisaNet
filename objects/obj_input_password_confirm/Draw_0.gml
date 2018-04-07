/// @description Insert description here
// HolyKnight - vnycall74@naver.com
// http://haeyum.com && http://holykisa.tistory.com

draw_self();
draw_set_font(f_10);

draw_set_halign(fa_left);
draw_set_valign(fa_center);

draw_set_color(c_black);

if(string_length(system.password_confirm) == 0 && !focus)
{
	draw_set_font(f_i10);
	draw_set_color(c_gray);
	
	draw_text(x + sprite_width / 30, y + sprite_height / 2, "password confirm");
}
else
	if(l && focus)
		draw_text(x + sprite_width / 30, y + sprite_height / 2, secret + "l");
	else
		draw_text(x + sprite_width / 30, y + sprite_height / 2, secret);