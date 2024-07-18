extends Node2D

@onready var card_scene: PackedScene = preload("res://scenes/card.tscn")

@onready var hand = $Hand

func _ready():
	pass

func _process(_delta):
	pass

func _on_button_pressed():
	var card = card_scene.instantiate()
	hand.add_card(card)

func _on_button_2_pressed():
	hand.remove_top_card()
