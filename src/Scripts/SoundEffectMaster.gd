
class SoundEffectMaster:
	var bus = AudioServer.get_bus_index("Master")
	var reverb = AudioEffectReverb.new()
	var delay = AudioEffectDelay.new()
	var distortion = AudioEffectDistortion.new()
	var panner = AudioEffectPanner.new()
	var lpf = AudioEffectLowPassFilter.new()
	var amp = AudioEffectAmplify.new()
	var effect_pos = 0
	
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
	func remove_effect(class_type):
		for i in range(0, AudioServer.get_bus_effect_count(bus)):
			if (AudioServer.get_bus_effect(bus, i) == class_type):
				AudioServer.remove_bus_effect(bus, i)
				break
	func apply_reverb():
		AudioServer.add_bus_effect(bus, reverb, effect_pos)
		print(AudioServer.get_bus_effect_count(bus))
	func remove_reverb():
		remove_effect(reverb)
		print(AudioServer.get_bus_effect_count(bus))
	func apply_delay():
		AudioServer.add_bus_effect(bus, delay, effect_pos)
	func remove_delay():
		remove_effect(delay)
		print(AudioServer.get_bus_effect_count(bus))
	func apply_LPF():
		AudioServer.add_bus_effect(bus, lpf, effect_pos)
		print(AudioServer.get_bus_effect_count(bus))
	func remove_LPF():
		remove_effect(lpf)
		print(AudioServer.get_bus_effect_count(bus))
	func apply_distortion():
		AudioServer.add_bus_effect(bus, distortion, effect_pos)
		print(AudioServer.get_bus_effect_count(bus))
	func remove_distortion():
		remove_effect(distortion)
	func apply_panner():
		AudioServer.add_bus_effect(bus, panner, effect_pos)
		print(AudioServer.get_bus_effect_count(bus))
	func remove_panner():
		remove_effect(panner)
	func apply_amp():
		AudioServer.add_bus_effect(bus, amp, effect_pos)
		print(AudioServer.get_bus_effect_count(bus))
	func remove_amp():
		remove_effect(amp)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
