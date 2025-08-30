extends Node2D

var ball: Ball

func _ready():
	get_new_ball()

func _process(delta: float) -> void:
	if ball != null and ball.position.y > 300:
		ball.queue_free()
		get_new_ball()
 
func get_new_ball():
	ball = Ball.new_ball()
	add_child(ball)
