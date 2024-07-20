extends Node2D

@export var spread_curve: Curve
@export var height_curve: Curve
@export var rotation_curve: Curve

const CARD = preload("res://scenes/card.tscn")

var HAND_WIDTH: int = 650
var HAND_CURVE: int = 150
var HAND_ROTATION: float = 0.3
var cards: Array = []

func add_5_cards() -> void:
	for _x in 2:
		var card = CARD.instantiate()
		cards.push_back(card)
		add_child(card)
		
func add_card(card: Card) -> void:
	cards.push_back(card)
	add_child(card)
	position_cards()

func remove_top_card() -> void:
	var card = cards.pop_front()
	remove_child(card)
	position_cards()

func position_cards() -> void:
	for card in cards:
		var hand_ratio = 0.5
		# special case to centre card if only 1 in hand 
		if cards.size() > 1:
			# assigns float between 0 - 1 for each card when taking position on the curve
			hand_ratio = float(card.get_index()-1) / float(cards.size()-1)

		if cards.size() <= 2:
			HAND_WIDTH = 100
			HAND_CURVE = 0
			HAND_ROTATION = 0
		elif cards.size() <= 4:
			HAND_WIDTH = 200
			HAND_CURVE = 25
			HAND_ROTATION = 0.1
		elif cards.size() <= 4:
			HAND_WIDTH = 250
			HAND_CURVE = 50
			HAND_ROTATION = 0.2
		else:
			HAND_WIDTH = 300
			HAND_CURVE = 75
			HAND_ROTATION = 0.2
		
		# spaces the cards out based on HAND_WIDTH x hand_ratio
		card.position.x = spread_curve.sample(hand_ratio) * HAND_WIDTH
		# spaces the cards out vertically based on HAND_CURVE x hand_ratio
		card.position.y = -height_curve.sample(hand_ratio) * HAND_CURVE
		# rotates the card based on HAND_ROTATION x hand_ratio
		card.rotation =- rotation_curve.sample(hand_ratio) * HAND_ROTATION
		print("x: ", card.position.x, " y: ", card.position.y, " rotation: ", card.rotation)

func _ready():
	pass

func _process(_delta):
	pass
