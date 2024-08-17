extends Node2D

var zombie_scene : PackedScene
var spawn_timer : Timer
var score = 0

func _ready():
	# Preload the zombie scene
	zombie_scene = preload("res://zombie.tscn")
	
	# Create and configure the Timer
	spawn_timer = Timer.new()
	spawn_timer.wait_time = 2.0
	spawn_timer.one_shot = false  # Make sure the timer is not one-shot if you want it to repeat
	spawn_timer.connect("timeout", self, "_spawn_zombie")  # Correct signal connectioN
	# Add the Timer to the scene
	add_child(spawn_timer)
	
	# Start the Timer
	spawn_timer.start()

func _spawn_zombie():
	# Instantiate and position the zombie
	var zombie = zombie_scene.instantiate()
	zombie.position = Vector2(randf() * get_viewport_rect().size.x, randf() * get_viewport_rect().size.y)
	add_child(zombie)

func increase_score():
	score += 1
	# Ensure that $ScoreLabel points to a valid Label node
	var score_label = $ScoreLabel
	if score_label:
		score_label.text = "Score: %d" % score
