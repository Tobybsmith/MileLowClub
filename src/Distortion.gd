extends Area2D

var down_sprite = load("res://images/button_img_4_p.png")
var up_sprite = load("res://images/button_img_4_u.png")

var IsPressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
		pass # Replace with function body
 
func _on_Distortion_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		IsPressed = not IsPressed
		if IsPressed:
			#Update sprite here
			get_node("Sprite").texture = down_sprite
			print("Distortion Enabled")
		else:
			#Update sprite here
			get_node("Sprite").texture = up_sprite
			print("Distortion Disabled")

