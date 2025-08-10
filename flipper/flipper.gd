extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var flipper_up_wav = preload("res://assets/sounds/Pinball_flipper_up.wav")
var flipper_down_wav = preload("res://assets/sounds/Pinball_flipper_down.wav")

func _physics_process(delta: float) -> void:
	process_controls(delta)
	
func process_controls(delta:float) -> void:
	if Input.is_action_just_pressed("right_bumper"):
		animation_player.play("press")
	if Input.is_action_just_released("right_bumper"):
		animation_player.play("un_press")

func play_sound(sound: Resource) -> void:
	var audioPlayer = AudioStreamPlayer.new()
	add_child(audioPlayer)
	audioPlayer.finished.connect(func():
		audioPlayer.queue_free()
	)
	audioPlayer.stream = sound
	audioPlayer.pitch_scale = randf_range(.9, 1.1)
	audioPlayer.play()

func play_flipper_up_sound() -> void:
	play_sound(flipper_up_wav)
	
func play_flipper_down_sound() -> void:
	play_sound(flipper_down_wav)
	
func deleteAudioPlayer(audioPlayer: Node):
	audioPlayer.queue_free()
