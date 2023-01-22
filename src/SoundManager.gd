extends Node2D

var hat = preload("res://audio/hat.mp3")
var horn = preload("res://audio/horn.mp3")
var snare = preload("res://audio/snare.mp3")
var kick = preload("res://audio/kick.mp3")

var down = load("res://images/Submit_p.jpeg")
var up = load("res://images/Submit_u.jpeg")

var player : AudioStreamPlayer

func _ready():
	player = get_node("AudioStreamPlayer")

func _on_SFXHat_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		player.stream = hat
		player.volume_db = 20
		player.seek(0.75)
		player.play()
		
		get_parent().get_node("SpriteManager/SFXHat/Sprite").texture = down
		get_parent().get_node("SpriteManager/SFXHat/Timer").start()

func _on_SFXHorn_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		player.stream = horn
		player.volume_db = 10
		player.play()
		get_parent().get_node("SpriteManager/SFXHorn/Sprite").texture = down
		get_parent().get_node("SpriteManager/SFXHorn/Timer").start()


func _on_SFXSnare_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		player.stream = snare
		player.volume_db = 20
		player.seek(1)
		player.play()
		get_parent().get_node("SpriteManager/SFXSnare/Sprite").texture = down
		get_parent().get_node("SpriteManager/SFXSnare/Timer").start()

func _on_SFXKick_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		player.stream = kick
		player.volume_db = 20
		player.play()
		get_parent().get_node("SpriteManager/SFXKick/Sprite").texture = down
		get_parent().get_node("SpriteManager/SFXKick/Timer").start()


func _on_Timer_timeout():
	get_parent().get_node("SpriteManager/SFXHat/Sprite").texture = up
	get_parent().get_node("SpriteManager/SFXSnare/Sprite").texture = up
	get_parent().get_node("SpriteManager/SFXHorn/Sprite").texture = up
	get_parent().get_node("SpriteManager/SFXKick/Sprite").texture = up
