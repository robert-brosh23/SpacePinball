extends RigidBody2D

@onready var collisionShape = $CollisionShape2D

func _physics_process(delta: float) -> void:
	pass


func _on_body_entered(body: Node) -> void:
	if body is Flipper:
		if body.flip_up:
			physics_material_override.bounce = 1.0
			
func _on_body_exited(body: Node) -> void:
	if body is Flipper:
		if body.flip_up:
			physics_material_override.bounce = .33
