extends Node2D
## Top level game script.


@onready var background: Sprite2D = $Background
@onready var window_size: Vector2i = DisplayServer.window_get_size()


func _ready():
	get_tree().get_root().size_changed.connect(_on_viewport_size_changed)
	_scale_background()


func _process(_delta):
	pass


func _on_viewport_size_changed() -> void:
	window_size = DisplayServer.window_get_size()
	_scale_background()


func _scale_background() -> void:
	pass
