
class SoundEffectMaster:
	var bus = AudioServer.get_bus_index("Master")
	var reverb = AudioEffectReverb.new()
	var reverb_pos = 0
	var delay = AudioEffectDelay.new()
	var delay_pos = 0
	var lpf = AudioEffectLowPassFilter.new()
	var effect_pos = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

	func apply_reverb():
		AudioServer.add_bus_effect(bus, reverb, effect_pos)
		effect_pos += 1
	func remove_reverb():
		var bus = AudioServer.get_bus_index("Master")
		AudioServer.remove_bus_effect(bus, effect_pos)
		effect_pos -= 1
	func apply_delay():
		AudioServer.add_bus_effect(bus, delay, effect_pos)
	func apply_LPF():
		AudioServer.add_bus_effect(bus, lpf, effect_pos)
		effect_pos += 1
	func remove_LPF():
		AudioServer.remove_bus_effect(bus, effect_pos)
		effect_pos -= 1



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
