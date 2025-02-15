extends Node

const colors: Array[Color] = [Color.RED, Color.BLUE, Color.GREEN, Color.ORANGE, Color.VIOLET]

var units: Dictionary = {
  footman = GameUnit.new('Footman', preload("res://static/sword.png"),   100, 2,  2,   1  ),
  archer  = GameUnit.new('Archer',  preload("res://static/archer.png"),  70,  1,  2,   10 ),
  ogre    = GameUnit.new('Ogre',    preload("res://static/monster.png"), 400, 10, 0.5, 1  ),
}

var buildings: Dictionary = {
  barracks = GameBuilding.new('Barracks', preload("res://static/military_base.png"), [units.footman] ),
  archery  = GameBuilding.new('Archery',  preload("res://static/target.png"),        [units.archer]   ),
  cave     = GameBuilding.new('Cave',     preload("res://static/cave.png"),          [units.ogre]       ),
}

var buildingsAsList = buildings.values()
