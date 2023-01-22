extends Node2D

var music_path = ""
var music_label

func _ready():
	music_label = get_node("MusicLabel")
	pass # Replace with function body.

func _on_SumbitPath_input_event(viewport, event, shape_idx):
		music_path = get_node("MusicPathInput").text
		music_path += "/"
		print(music_path)
		if music_path == "":
		#null path, bail
			return
		else:
			#Look at this dir for music
			
			var dir = Directory.new()
			var valid_files = []
			if dir.open(music_path) != OK:
				music_label.text = "Invalid Directory"
				return
			dir.list_dir_begin()
			while true:
				var file = dir.get_next()
				if file == "":
					break
				print(file)
				print(file.get_basename())
				if file.ends_with(".mp3"):
					valid_files.append(file)
			dir.list_dir_end()
			#print("SIZE: " + str(valid_files.size()))
			for file in valid_files:
				music_label.text += (str(file) + "\n") 
			#Display this somewhere
