extends Area2D

var sound_manager = load("res://Scripts/SoundEffectMaster.gd")
var down_sprite = load("res://images/button_img_4_p.png")
var up_sprite = load("res://images/button_img_4_u.png")

var manager_obj
var IsPressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	manager_obj = sound_manager.SoundEffectMaster.new()
 
func _on_Distortion_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		IsPressed = not IsPressed
		if IsPressed:
			#Update sprite here
			manager_obj.apply_distortion()
			get_node("Sprite").texture = down_sprite
			
			print("Distortion Enabled")
		else:
			#Update sprite here
			manager_obj.remove_distortion()
			get_node("Sprite").texture = up_sprite
			print("Distortion Disabled")

func _on_DistortionKnob_area_exited(magnitude):
	manager_obj.adjust_distortion(magnitude)
