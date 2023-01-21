extends Area2D

var down_sprite = load("res://images/button_img_3_p.png")
var up_sprite = load("res://images/button_img_3_u.png")

var IsPressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
		pass # Replace with function body
 
func _on_LPF_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		IsPressed = not IsPressed
		if IsPressed:
			#Update sprite here
			get_node("Low Pass Filter On!").texture = down_sprite
		else:
			#Update sprite here
			get_node("Low Pass Filter Off!").texture = up_sprite
