class_name Bumper extends StaticBody2D

const BUMPER_STRENGTH = 20

@onready var animation_player = $AnimationPlayer

var laser_1_wav = preload("res://assets/sounds/Laser_1.wav")

func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body is Ball:
		print("ball position: ", body.position, "bumper position: ", position)
		var normal = (body.position - position).normalized()
		if body.linear_velocity.dot(normal) > 0:
			normal = -normal
		var angle = normal.angle()
		print(angle)
		
		var reflected = body.linear_velocity.bounce(normal)
		body.linear_velocity = reflected
		
		#body.apply_central_impulse(Vector2(cos(angle) * BUMPER_STRENGTH, sin(angle) * BUMPER_STRENGTH))
		
		animation_player.play("bumber_hit")
		
func bump(ball: Ball):
	animation_player.play("bumber_hit")

func play_sound(sound: Resource) -> void:
	var audioPlayer = AudioStreamPlayer.new()
	add_child(audioPlayer)
	audioPlayer.finished.connect(func():
		audioPlayer.queue_free()
	)
	audioPlayer.stream = sound
	audioPlayer.pitch_scale = randf_range(.9, 1.1)
	audioPlayer.play()

func play_laser_sound(audioPlayer: Node) -> void:
	play_sound(laser_1_wav)
	
func deleteAudioPlayer(audioPlayer: Node):
	audioPlayer.queue_free()
