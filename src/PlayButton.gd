extends Area2D

var down_sprite = load("res://images/button_img_7_p.png")
var up_sprite = load("res://images/button_img_7_u.png")
var IsPressed = false
var music:AudioStreamPlayer

var crowd
var spotlights

func _ready():
	music = get_node("AudioStreamPlayer")
	music.stream = load("res://audio/Love.mp3")
	get_node("Sprite").texture = up_sprite
	crowd = get_parent().get_node("Misc").get_node("Crowd")
	spotlights = get_parent().get_node("Misc")

func _on_PlayButton_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		IsPressed = not IsPressed
		if IsPressed:
			get_node("Sprite").texture = down_sprite
			crowd.bumping = true
			spotlights.bumping = true
			music.play()
		else:
			crowd.bumping = false
			spotlights.bumping = false
			get_node("Sprite").texture = up_sprite
			music.stop()

