extends Node2D

var music_path = ""
var music_label
var playlist 
var audio_loader

func _ready():
	music_label = get_node("MusicLabel")
	audio_loader = AudioLoader.new()
	playlist = AudioStreamPlayer.new()
	add_child(playlist)
	
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
				if file.get_basename() == "kick" or file.get_basename() == "snare":
					continue
				if file.get_basename() == "horn" or file.get_basename() == "hat":
					continue
				var button = Button.new()
				button.text = file.get_basename()
				var style = StyleBoxFlat.new()
				#style.border_width_bottom = 2
				#style.border_width_left = 2
				#style.border_width_right = 2
				#style.border_width_top = 2
				
				style.bg_color = Color(1.0, 1.0, 1.0, 0.0)
				style.border_color = Color("#ffa53c")
				button.add_stylebox_override("normal",style)
				button.add_stylebox_override("hover",style)
				button.add_stylebox_override("pressed",style)
				button.add_stylebox_override("focus",style)
				button.add_color_override("font_color", Color("#ffa53c"))
				button.add_color_override("font_color_focus", Color("#ffa53c"))
				button.add_color_override("font_color_hover", Color("#ffa53c"))
				button.add_color_override("font_color_pressed", Color("#ffa53c"))
				button.connect("pressed", self, "_on_track_button_pressed", [file])
				vbox.add_child(button)
			music_label.add_child(vbox)
		
		music_dir_loaded(track_queue)
				
var track_queue = []

func _on_track_button_pressed(file):
	var full_path = music_path + "/" + file
	if OS.get_name() == "Windows":
		full_path = full_path.replace("/", "\\")
	else:
		full_path = full_path.replace("\\", "/")
	track_queue.append(full_path)
	if track_queue.size() == 1:
		playlist.stream = audio_loader.loadfile(track_queue[0])
		playlist.play()
	

	if (len(track_queue) < 6):
		get_node("QueueContentsLabel").text += file.get_file() + "\n"
	else:
		get_node("QueueContentsLabel").text += ""
	
func music_dir_loaded(track_queue):
	#Kill the old stuff, and add the music queue to this area
	get_tree().call_group("left-monitor", "queue_free")
	#Print the queue to the screen
	get_node("PathLabel").text = "Queue:"
	
		



#"C:\Users\David\Desktop\Proj\MileLowClub\src\audio"
