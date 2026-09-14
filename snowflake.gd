extends Area2D
class_name Snowflake
@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = randf_range(get_viewport_rect().position.x + 40, get_viewport_rect().end.x - 40)
	
func _physics_process(delta: float) -> void:
	sprite_2d.rotate(2 * delta)
	position.y += 30 * delta;
	
	if position.y > get_viewport_rect().end.y + 40:
		queue_free()
