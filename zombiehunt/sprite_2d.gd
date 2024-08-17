extends Sprite2D

# Speed of rotation in degrees per second
var rotation_speed = 90
# Reference to the bullet scene
var Bullet = preload("res://Bullet.tscn")

func _process(delta):
	# Rotate right when pressing D
	if Input.is_action_pressed("ui_right"):
		rotation_degrees += rotation_speed * delta

	# Rotate left when pressing A
	if Input.is_action_pressed("ui_left"):
		rotation_degrees -= rotation_speed * delta

	# Shoot bullet when pressing W
	if Input.is_action_just_pressed("ui_up"):
		shoot_bullet()

func shoot_bullet():
	# Instance the bullet
	var bullet = Bullet.instantiate()
	# Set the bullet's position to the soldier's position
	bullet.position = global_position
	# Set the bullet's rotation to the soldier's rotation
	bullet.rotation = rotation
	# Add the bullet to the scene
	get_parent().add_child(bullet)
