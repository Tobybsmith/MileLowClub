extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func music_dir_loaded(music_queue):
	#Kill the old stuff, and add the music queue to this area
	get_tree().call_group("left-monitor", "queue_free")
	#Print the queue to the screen
	get_node("MusicFinder/PathLabel").text = "Queue:"
	for song in music_queue:
		get_node("MusicFinder/QueueContentsLabel").text += song + "\n"


func _on_VolumeSlider_value_changed(value):
	get_parent().get_node("SpriteManager/PlayButton/AudioStreamPlayer").set_volume_db(value)
