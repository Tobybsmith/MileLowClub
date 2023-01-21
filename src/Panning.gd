extends Area2D

var IsPressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
		pass # Replace with function body
 
func _on_Panning_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		IsPressed = not IsPressed
		if IsPressed:
			#Update sprite here
			print("Panning Enabled")
		else:
			#Update sprite here
			print("Panning Disabled")
