extends CharacterBody2D

var speed = 100
var target : Node2D

func _ready():
	target = get_parent().get_node("Soldier")

func _process(delta):
	var direction = (target.global_position - global_position).normalized()
	position += direction * speed * delta

func _on_body_entered(body):
	if body.name == "Soldier":
		body.queue_free()
		get_tree().change_scene("res://GameOver.tscn")
