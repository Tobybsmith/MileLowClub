extends Area2D

var sound_manager = load("res://Scripts/SoundEffectMaster.gd")
var down_sprite = load("res://images/button_img_3_p.png")
var up_sprite = load("res://images/button_img_3_u.png")

var manager_obj
var IsPressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	manager_obj = sound_manager.SoundEffectMaster.new()
 
func _on_LPF_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		IsPressed = not IsPressed
		if IsPressed:
			#Update sprite here
			get_node("Sprite").texture = down_sprite
			manager_obj.apply_LPF()
			print("LPF ENABLED")
		else:
			#Update sprite here
			manager_obj.remove_LPF()
			get_node("Sprite").texture = up_sprite
			print("LPF DISABLED")
			

func _on_LPFKnob_amplitude(magnitude):
	manager_obj.adjust_LPF(magnitude)
