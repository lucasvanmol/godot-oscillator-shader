extends Sprite

var displacement := 0.0
var velocity := 0.0

export (float) var spring_constant := 150.0
export (float) var damp_constant := 5.0
export (float) var velocity_gain := 20.0


func _process(delta):
	var force = -spring_constant * displacement + damp_constant * velocity
	velocity -= force * delta
	displacement -= velocity * delta
	material.set_shader_param("STRENGTH", displacement)
	
	if Input.is_action_just_pressed("ui_accept"):
		velocity = velocity_gain
