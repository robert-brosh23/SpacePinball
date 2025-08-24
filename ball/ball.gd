class_name Ball extends RigidBody2D

@onready var collisionShape = $CollisionShape2D

func _ready():
	linear_velocity = Vector2(0, -300)

func _physics_process(delta: float) -> void:
	pass
			
func _on_body_exited(body: Node) -> void:
	if body is Flipper:
		pass
