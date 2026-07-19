/// @description 
draw_self()

// Draw text
draw_set_halign(fa_middle)
draw_set_valign(fa_center)
draw_set_font(font_adding_demo)
draw_text(x, y, label)

// Reset state
draw_set_font(-1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
