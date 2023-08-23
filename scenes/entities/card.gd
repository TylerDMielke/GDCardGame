extends Node2D
class_name Card

enum CardType {
	Deck,
	Empty,
	Heart,
	HeartAce,
	HeartTwo,
	HeartThree,
	HeartFour,
	HeartFive,
	HeartSix,
	HeartSeven,
	HeartEight,
	HeartNine,
	HeartTen,
	HeartJack,
	HeartQueen,
	HeartKing,
}

@export var card_type: CardType = CardType.Deck

@onready var area: Area2D = $Area2D
@onready var sprite: Sprite2D = $DeckSprite

var is_mouse_over: bool = false
var is_grabbed: bool = false
var mouse_grab_offset: Vector2 = Vector2.ZERO


func _ready():
	_set_card()
	area.mouse_entered.connect(_on_mouse_entered)
	area.mouse_exited.connect(_on_mouse_exited)


func _process(_delta):
	if Input.is_action_pressed("left_click") and is_mouse_over:
		is_grabbed = true
	if Input.is_action_just_released("left_click"):
		is_grabbed = false
	
	if is_grabbed:
		position = get_global_mouse_position() + mouse_grab_offset


func _on_mouse_entered():
	is_mouse_over = true
	if not is_grabbed:
		mouse_grab_offset = (position - get_global_mouse_position()) / Vector2(2,2)
		print_debug("New Mouse Offset: {0}".format([mouse_grab_offset]))


func _on_mouse_exited():
	is_mouse_over = false
	print_debug("Old Mouse Offset: {0}".format([mouse_grab_offset]))


func _set_card():
	var new_sprite: Sprite2D
	match card_type:
		CardType.Empty:
			new_sprite = load("res://scenes/sprites/empty_sprite.tscn").instantiate()
		CardType.Heart:
			new_sprite = load("res://scenes/sprites/heart_sprite0.tscn").instantiate()
		CardType.HeartAce:
			new_sprite = load("res://scenes/sprites/heart_sprite1.tscn").instantiate()
		CardType.HeartTwo:
			new_sprite = load("res://scenes/sprites/heart_sprite2.tscn").instantiate()
		CardType.HeartThree:
			new_sprite = load("res://scenes/sprites/heart_sprite3.tscn").instantiate()
		CardType.HeartFour:
			new_sprite = load("res://scenes/sprites/heart_sprite4.tscn").instantiate()
		CardType.HeartFive:
			new_sprite = load("res://scenes/sprites/heart_sprite5.tscn").instantiate()
		CardType.HeartSix:
			new_sprite = load("res://scenes/sprites/heart_sprite6.tscn").instantiate()
		CardType.HeartSeven:
			new_sprite = load("res://scenes/sprites/heart_sprite7.tscn").instantiate()
		CardType.HeartEight:
			new_sprite = load("res://scenes/sprites/heart_sprite8.tscn").instantiate()
		CardType.HeartNine:
			new_sprite = load("res://scenes/sprites/heart_sprite9.tscn").instantiate()
		CardType.HeartTen:
			new_sprite = load("res://scenes/sprites/heart_sprite10.tscn").instantiate()
		CardType.HeartJack:
			new_sprite = load("res://scenes/sprites/heart_sprite11.tscn").instantiate()
		CardType.HeartQueen:
			new_sprite = load("res://scenes/sprites/heart_sprite12.tscn").instantiate()
		CardType.HeartKing:
			new_sprite = load("res://scenes/sprites/heart_sprite13.tscn").instantiate()
		CardType.Deck:
			new_sprite = self.sprite
	remove_child(self.sprite)
	add_child(new_sprite)
