shader_type spatial;

uniform vec4 albedo : hint_color;
uniform float metallic : hint_range(0, 1);
uniform float roughness : hint_range(0, 1);

uniform float strength_x = 0.0;
uniform float strength_y = 0.0;
uniform float strength_z = 0.0;

uniform vec3 center = vec3(0.0, 0.0, 1.0);

void vertex() {
	vec3 v = VERTEX - center;

	float delta = v.y * 0.1;

	float theta = strength_x * delta;

	mat3 rot_x = mat3(
		vec3(1, 0, 0),
		vec3(0, cos(theta), -sin(theta)),
		vec3(0, sin(theta), cos(theta))		
	);

	float phi = strength_y * delta;

	mat3 rot_y = mat3(
		vec3(cos(phi), 0, sin(phi)),
		vec3(0, 1, 0),
		vec3(-sin(phi), 0, cos(phi))		
	);

	float psi = strength_z * delta;

	mat3 rot_z = mat3(
		vec3(cos(psi), -sin(psi), 0),
		vec3(sin(psi), cos(psi), 0),
		vec3(0, 0, 1)		
	);

	VERTEX = v * rot_x * rot_y * rot_z + center;
	NORMAL = NORMAL * rot_x * rot_y * rot_z;
}

void fragment() {
	ALBEDO = albedo.rgb;
	METALLIC = metallic;
	ROUGHNESS = roughness;
}