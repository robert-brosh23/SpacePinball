class_name Ball extends RigidBody2D

const BALL_SCENE = preload("res://ball/ball.tscn")

func _ready() -> void:
	pass

static func new_ball() -> Node:
	var ball = BALL_SCENE.instantiate()
	ball.global_position = Vector2(232, 148)
	return ball
