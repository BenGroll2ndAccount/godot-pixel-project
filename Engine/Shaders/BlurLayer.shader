shader_type canvas_item;

uniform float blur_intensity : hint_range(0, 6) = 0.5;

void fragment() {
	vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV, blur_intensity);
	COLOR = color;
	}