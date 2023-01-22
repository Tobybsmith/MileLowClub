extends Node2D

var rng = RandomNumberGenerator.new()
var IsPressed = false

var dir = 1
var rot = 0
var speed = 0.5

var down = load("res://images/Submit_p.jpeg")
var up = load("res://images/Submit_u.jpeg")

func _ready():
	rng.randomize()
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rot += speed * dir
	print(rot)
	if rot > 20:
		dir = -1
	if rot < 0:
		dir = 1
	get_node("Spotlight1").rotation_degrees = rot / 1.1
	get_node("Spotlight2").rotation_degrees = rot / 0.9
	pass


func _on_ColorLights_input_event(viewport, event, shape_idx):
	#select a random color
	if event is InputEventMouseButton and event.pressed:
		get_parent().get_node("ColorLights/Sprite").texture = down
		get_parent().get_node("ColorLights/Timer").start()
		get_node("Spotlight1").modulate = Color(rng.randf_range(0.5,1.0), rng.randf_range(0.5,1.0), rng.randf_range(0.5,1.0))
		get_node("Spotlight2").modulate = Color(rng.randf_range(0.5,1.0), rng.randf_range(0.5,1.0), rng.randf_range(0.5,1.0))


func _on_Timer_timeout():
	get_parent().get_node("ColorLights/Sprite").texture = up
