shader_type canvas_item;

uniform float STRENGTH = 0.0;
uniform vec2 CENTER = vec2(0.5);

void fragment() {
	vec2 uv = UV - CENTER;

	float angle =  STRENGTH * uv.y;

	mat2 rot = mat2(
		vec2( cos(angle), -sin(angle) ),
		vec2( sin(angle),  cos(angle)));

	uv = rot * uv + CENTER;
	COLOR = texture(TEXTURE, uv);
}