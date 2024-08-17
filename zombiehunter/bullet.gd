extends Sprite2D

# Speed of the bullet
var speed = 800

func _process(delta):
	# Move the bullet forward in the direction it is facing
	position += Vector2(cos(rotation), sin(rotation)) * speed * delta

	# Delete the bullet if it goes off-screen
	if not get_viewport_rect().has_point(global_position):
		queue_free()
