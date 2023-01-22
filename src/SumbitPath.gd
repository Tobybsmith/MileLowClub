extends Area2D

var down_sprite = load("res://images/Submit_p.jpeg")
var up_sprite = load("res://images/Submit_u.jpeg")

var IsPressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
		pass # Replace with function body
 
func _on_SumbitPath_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		get_node("Sprite").texture = down_sprite
		get_node("Timer").start()


func _on_Timer_timeout():
	get_node("Sprite").texture = up_sprite
