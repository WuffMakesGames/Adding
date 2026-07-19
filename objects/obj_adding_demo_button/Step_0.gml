/// @description 
hover = lerp(hover, !is_held && is_hovered, 0.4)
held = lerp(held, is_held, 1)

image_blend = merge_color(color, c_white, hover*0.2)
image_blend = merge_color(image_blend, c_black, held*0.2)