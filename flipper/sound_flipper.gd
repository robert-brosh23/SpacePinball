extends AudioStreamPlayer2D

func play_flipper_sound() -> void:
	pitch_scale = randf_range(.9, 1.1)
	print("print")
	play()
