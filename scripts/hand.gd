extends Node2D

@export var spread_curve: Curve

const CARD = preload("res://scenes/card.tscn")
# determines the width of the hand
const HAND_WIDTH: int = 650
var cards: Array = []

func add_5_cards() -> void:
	for _x in 5:
		var card = CARD.instantiate()
		cards.push_back(card)
		add_child(card)

func position_cards() -> void:
	for card in cards:
		var hand_ratio = 0.5
		# special case 
		if cards.size() > 1:
			# assigns float between 0 - 1 for each card when taking position on the curve
			hand_ratio = float(card.get_index()-1) / float(cards.size()-1)
		
		var destination: Transform2D = transform
		# spaces the cards out based on HAND_WIDTH x hand_ratio
		destination.origin.x += spread_curve.sample(hand_ratio) * HAND_WIDTH
		card.position.x = destination.origin.x

func _ready():
	add_5_cards()
	position_cards()

func _process(delta):
	pass
