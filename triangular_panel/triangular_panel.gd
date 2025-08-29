extends Node2D

@export var wall_angle := 1.9373

@onready var animation_player := $AnimationPlayer

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Ball:
		var tangent := Vector2(cos(wall_angle), sin(wall_angle))        # along the wall
		var normal := Vector2(-tangent.y, tangent.x)                    # +90° normal
		if body.linear_velocity.normalized().dot(normal) > 0:
			normal = -normal
		
		var reflected = body.linear_velocity.bounce(normal)
		body.linear_velocity = reflected
		
		animation_player.play("panel_hit")
