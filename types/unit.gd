extends Resource
class_name GameUnit

@export var name: String
@export var icon: CompressedTexture2D

@export var maxHealth: int
@export var health: int

@export var attack: int
## How many attack per second
@export var attackSpeed: float
## How far can attack
@export var attackDistance: float

func _init(
  _name: String,
  _icon: CompressedTexture2D,
  _maxHealth: int,
  _attack: int,
  _attackSpeed: float,
  _attackDistance: float,
) -> void:
  _name = name
  _icon = icon
  _maxHealth = maxHealth
  _attack = attack
  _attackSpeed = attackSpeed
  _attackDistance = attackDistance
