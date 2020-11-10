shader_type canvas_item;

uniform float ANGLE = 0.0;
uniform vec2 CENTER = vec2(0.5);
uniform float TILING = 3.0;

void fragment() {
	vec2 uv = (UV - CENTER)*TILING;
	
	float a = ANGLE * sin(2.0*TIME);
	
	mat2 rot = mat2(
		vec2( cos(a), -sin(a) ),
		vec2( sin(a),  cos(a)));
	
	uv = rot * uv + CENTER;
	
	COLOR = vec4(fract(uv), 0.0, 1.0);
}