extends Sprite

var timer_counter : int = 0
var max_height = 50
var direction = 1
var speed = 1.5

func _process(delta):
	timer_counter += direction * speed
	int(timer_counter)
	global_position = Vector2(global_position.x, timer_counter)
	if timer_counter >= max_height:
		direction = -1
	if timer_counter <= 0:
		direction = 1
