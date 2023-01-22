extends Sprite

var state = 0

const MAX_STATE = 2

var init_pos = Vector2()

var beach = load("res://images/beach.jpg")
var club = load("res://images/club_bkg.jpg")
var haus = load("res://images/haus.jpg")

var manager_obj
var IsPressed = false

func _ready():
	init_pos = global_position
 
func _on_Bkg_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if state == 0:
			texture = club
			scale = Vector2(1.7,1.6)
			global_position = init_pos
		if state == 1:
			global_position = init_pos;
			texture = beach
			scale = Vector2(4,1.5)
			global_position += Vector2(0, -75)
		if state == 2:
			texture = haus
			scale = Vector2(1.05, 0.7)
		state += 1
		if state > MAX_STATE:
			state = 0

