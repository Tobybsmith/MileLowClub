extends Area2D

var IsPressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
		pass # Replace with function body
 
func _on_Reverb_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		IsPressed = not IsPressed
<<<<<<< HEAD
		
		# Create a variable to store the audio stream player
var audio_scratch = AudioStreamPlayer.new()
audio_scratch.set_stream("res://scratch.ogg")

# Create a variable to store the current track
var current_track = AudioStreamPlayer.new()
current_track.set_stream("res://track.ogg")
current_track.play()

# Create a variable to store the steering wheel image
var steering_wheel = TextureButton.new()
steering_wheel.set_normal_texture("res://steering_wheel.png")
steering_wheel.set_position(Vector2(50, 50))

# Connect the steering wheel's pressed signal to a function
steering_wheel.connect("pressed", self, "_on_steering_wheel_pressed")
add_child(steering_wheel)

# Create the function that will handle the steering wheel's pressed signal
func _on_steering_wheel_pressed():
	# Play the scratch sound effect
	audio_scratch.play()
	# Scratch the current track
	current_track.seek(current_track.get_playback_position() + 0.1)

=======
		if IsPressed:
			#Update sprite here
			print("Reverb Enabled")
		else:
			#Update sprite here
			print("Reverb Disabled")
>>>>>>> 5bae4ef4106f1c81d4d8954e6a336bdbedb0c2f4
