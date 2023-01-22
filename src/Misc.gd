extends Node2D

var rng = RandomNumberGenerator.new()
var IsPressed = false

var down = load("res://images/Submit_p.jpeg")
var up = load("res://images/Submit_u.jpeg")

func _ready():
	rng.randomize()
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ColorLights_input_event(viewport, event, shape_idx):
	#select a random color
	if event is InputEventMouseButton and event.pressed:
		if IsPressed:
			get_parent().get_node("ColorLights/Sprite").texture = down
		else: 
			get_parent().get_node("ColorLights/Sprite").texture = up
		IsPressed = not IsPressed
		get_node("Spotlight1").modulate = Color(rng.randf(), rng.randf(), rng.randf())
		get_node("Spotlight2").modulate = Color(rng.randf(), rng.randf(), rng.randf())
