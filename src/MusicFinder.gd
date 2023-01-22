extends Node2D

var music_path = ""
var music_label
var playlist = AudioStreamPlayer.new()
var player = AudioStreamPlayer.new()
var audio_loader

func _ready():
	music_label = get_node("MusicLabel")
	add_child(player)
	add_child(playlist)
	audio_loader = AudioLoader.new()
	
func _on_SumbitPath_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		music_label.text = ""
		music_path = get_node("MusicPathInput").text
		
		if music_path == "":
		#null path, bail
			music_label.text = "Empty Directory"
			return
		else:
			
			music_path = music_path.replace("\"", "")
			if OS.get_name() == "Windows":
				music_path = music_path.replace("/", "\\")
			else:
				music_path = music_path.replace("\\", "/")
			
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
				if file.ends_with(".mp3"):
					valid_files.append(file)
			dir.list_dir_end()
			
			var vbox = VBoxContainer.new()
			for file in valid_files:
				var button = Button.new()
				button.text = file.get_basename()
				button.connect("pressed", self, "_on_track_button_pressed", [file])
				vbox.add_child(button)
			music_label.add_child(vbox)
				
func _on_track_button_pressed(file):
	var full_path = music_path + "/" + file
	if OS.get_name() == "Windows":
		full_path = full_path.replace("/", "\\")
	else:
		full_path = full_path.replace("\\", "/")	
	player.stream = audio_loader.loadfile(full_path)
	player.play()


#"C:\Users\David\Desktop\Proj\MileLowClub\src\audio"
