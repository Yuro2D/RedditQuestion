extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D


func _on_area_entered(area: Area2D) -> void:
	sprite_2d.self_modulate = GlobalSignal.colorToChange
