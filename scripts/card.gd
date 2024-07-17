@tool
class_name Card extends Node2D

@export var card_name: String = "Default Name"
@export var card_description: String = "Default Card Description"
@export var card_cost: int = 0
@export var card_image = Sprite2D

@onready var cost_label: Label = $CostDisplay/CostLabel
@onready var name_label: Label = $CardName/NameLabel
@onready var description: Label = $CardDescription
@onready var base_sprite: Sprite2D = $BaseCardSprite

func _ready():
	set_values(card_cost, card_name, card_description)

func set_values(_cost: int, _name: String, _description: String):
	card_name = _name
	card_description = _description
	card_cost = _cost
	_update_graphics()

func _update_graphics():
	if str(cost_label) != str(card_cost):
		cost_label.set_text(str(card_cost))
	if str(name_label) != card_name:
		name_label.set_text(card_name)
	if str(description) != card_description:
		description.set_text(card_description)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
