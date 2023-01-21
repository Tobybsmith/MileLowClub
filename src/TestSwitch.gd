extends Area2D

var IsPressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TestSwitch_input_event(viewport, event, shape_idx):
	if event.type == InputEvent.MOUSE_BUTTON and event.pressed:
		if IsPressed:
			#Un-Press the button
			print("Un-Pressed")
		else:
			print("Pressed")
		
		IsPressed = not IsPressed
