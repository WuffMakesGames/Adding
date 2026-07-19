/// @description 

draw_self()

// Setup font
draw_set_halign(fa_right)
draw_set_valign(fa_bottom)
draw_set_font(font_adding_demo_large)

// Draw history

// Draw stack
var _offset = string_height(" ")
draw_set_font(font_adding_demo_subtext)
draw_set_alpha(0.6)
draw_text(bbox_right-16, bbox_bottom-16-_offset, GetStackString())
draw_set_alpha(1)

// Draw current input
draw_set_font(font_adding_demo_large)
draw_text(bbox_right-16, bbox_bottom-16, input)

// Reset draw state
draw_set_font(-1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
