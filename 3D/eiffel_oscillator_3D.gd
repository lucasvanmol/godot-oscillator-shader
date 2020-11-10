extends MeshInstance

onready var material : Material = get_surface_material(0)
var holding := false
var displacement := Vector2.ZERO setget set_displacement
var velocity := Vector2.ZERO

export (float) var spring_constant : float = 500.0
export (float) var damp_constant : float = 5.0


func _physics_process(delta):
	if not holding:
		var force = -spring_constant * displacement + damp_constant * velocity
		velocity -= force * delta
		displacement -= velocity * delta
		set_displacement(displacement)

func set_displacement(disp : Vector2):
	displacement = disp
	material.set_shader_param("strength_x", disp.x)
	material.set_shader_param("strength_z", disp.y)
	
	# Call this to update lighting (bug workaround)
	set_extra_cull_margin(0)
