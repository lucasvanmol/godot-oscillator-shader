extends Spatial

var start_pos : Vector2

onready var mesh = $EiffelTower

func _input(event):
	if event is InputEventMouseButton and not event.pressed and event.button_index == 1 and mesh.holding:
		mesh.holding = false

func _on_Area_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		mesh.holding = true
		start_pos = get_viewport().get_mouse_position()
		
func _process(_delta):
	if mesh.holding:
		var disp = (get_viewport().get_mouse_position() - start_pos) / get_viewport().get_visible_rect().size
		disp = Vector2(disp.y, -disp.x) * 0.5
		
		mesh.set_displacement(disp.clamped(0.5).rotated(mesh.rotation.y))
		mesh.velocity = Vector2.ZERO
