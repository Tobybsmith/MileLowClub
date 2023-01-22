extends Node2D

var start_pos = Vector2()
var current_pos = Vector2()
var start_rot

var pos
var norm_pos

var min_pos = 0
export var max_pos : int = 150
export var sensitivity : float = 0.75

func _ready():
	start_pos = get_node("SliderKnob").global_position
	set_process(false)

func _on_Slider_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		start_pos = get_node("SliderKnob").global_position
		set_process(true)

func _process(delta):
	#problematic area
	pos = (get_global_mouse_position().y - start_pos.y)
	
	if pos < min_pos:
		pos = min_pos
	elif pos > max_pos:
		pos = max_pos
	
	norm_pos = 1 - (pos / max_pos)
	
	get_node("SliderKnob").global_position.y = pos + max_pos
	
	if Input.is_action_just_released("click"):
		set_process(false)
