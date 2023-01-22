extends Area2D

var down_sprite = load("res://images/button_img_7_p.png")
var up_sprite = load("res://images/button_img_7_u.png")
var IsPressed = false
var music:AudioStreamPlayer

func _ready():
	music = AudioStreamPlayer.new()
	add_child(music)
	music.stream = load("res://audio/Love.mp3")
	get_node("Sprite").texture = up_sprite

func _on_PlayButton_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		IsPressed = not IsPressed
		if IsPressed:
			get_node("Sprite").texture = down_sprite
			music.play()
		else:
			get_node("Sprite").texture = up_sprite
			music.stop()

