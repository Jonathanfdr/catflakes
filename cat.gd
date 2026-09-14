extends Node2D

@export
var SPEED = 50.0
signal make_point
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction == -1 && position.x < get_viewport_rect().position.x + 40 :
		direction = 0
	if direction == 1 && position.x > get_viewport_rect().end.x - 40 :
		direction = 0
	
	if direction:
		position.x += direction * SPEED * delta
		animated_sprite_2d.play("Walk")
		animated_sprite_2d.flip_h = direction < 0
	else:
		animated_sprite_2d.play("Idle")


func _on_area_entered(area: Area2D) -> void:
	if area is not Snowflake:
		return
		
	make_point.emit()
	audio_stream_player_2d.play()
	area.queue_free()
