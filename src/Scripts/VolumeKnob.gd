extends Area2D

var start_pos = Vector2()
var start_rot

var rot
var norm_rot

var min_rot = -120
var max_rot = 120
export var sensitivity : float = 0.45

func _ready():
	get_node("Sprite").rotation_degrees = min_rot
	set_process(false)

func _on_VolumeKnob_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		start_pos = get_global_mouse_position()
		start_rot = get_node("Sprite").rotation_degrees
		set_process(true)

func _process(delta):
	var distance = start_pos - get_global_mouse_position()
	rot = start_rot + distance.x * sensitivity * -1
	
	if rot < min_rot:
		rot = min_rot
	elif rot > max_rot:
		rot = max_rot
	
	norm_rot = (rot + 120)/ 240
	
	get_node("Sprite").rotation_degrees = rot
	
	if Input.is_action_just_released("click"):
		set_process(false)
