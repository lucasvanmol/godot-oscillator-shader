shader_type canvas_item;

uniform float STRENGTH = 0.0;
uniform vec2 CENTER = vec2(0.5);
uniform float TILING = 3.0;

void fragment() {
	vec2 uv = (UV - CENTER) * TILING;
	
	float angle = length(uv) * STRENGTH * sin(2.0* TIME);
	
	mat2 rot = mat2(
		vec2( cos(angle), -sin(angle) ),
		vec2( sin(angle),  cos(angle)));
	
	uv = rot * uv + CENTER;
	
	COLOR = vec4(fract(uv), 0.0, 1.0);
}