extends Node2D

const MAX_CHARGE_TIME = 1.0
const MAX_LAUNCHER_MOVE = 28
const MAX_LAUNCHER_VELOCITY = -500.0

@onready var spring_sprite = $SpringSprite
@onready var launcher_sprite = $LauncherSprite
@onready var static_body_2d = $StaticBody2D

var charge_time := 0.0
var charging := false
var percent_charged := 0.0
var collision_starting_pos: Vector2

func _ready() -> void:
	collision_starting_pos = static_body_2d.position

func _physics_process(delta: float) -> void:
	process_controls()
	percent_charged = charge_time / MAX_CHARGE_TIME
	process_charge(delta)
	alter_sprites()
		
func process_controls() -> void:
	if Input.is_action_just_pressed("launcher"):
		charging = true
	if Input.is_action_just_released("launcher"):
		charging = false
		
func process_charge(delta: float) -> void:
	if charging == false and charge_time == 0.0:
		return
	if charging:
		charge_time = clamp(charge_time + delta, 0.0, MAX_CHARGE_TIME)
		alter_collision()
		return
	launch(charge_time)
	charge_time = 0.0
	
func launch(charge_time: float):
	static_body_2d.constant_linear_velocity = Vector2(0, MAX_LAUNCHER_VELOCITY * percent_charged)
	move_to(static_body_2d, collision_starting_pos)

func alter_sprites() -> void:
	launcher_sprite.position.y = percent_charged * MAX_LAUNCHER_MOVE
	spring_sprite.scale.y = 1.0 - percent_charged * .9
	
func alter_collision() -> void:
	static_body_2d.position.y = percent_charged * MAX_LAUNCHER_MOVE
	
func move_to(object: Node2D, target_pos: Vector2):
	var tween = create_tween()
	tween.tween_property(object, "position", target_pos, .1)
	tween.finished.connect(_on_tween_finished)

func _on_tween_finished():
	static_body_2d.constant_linear_velocity = Vector2.ZERO
	
	
	
	
	
	
