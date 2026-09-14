extends Node2D

@export
var snoflakes: PackedScene

@onready var label: Label = $Label

var points: int = 0

func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	var s : Snowflake = snoflakes.instantiate()
	add_child(s)
	
func _on_cat_make_point() -> void:
	points += 1
	label.text = "%04d flocos"%points
