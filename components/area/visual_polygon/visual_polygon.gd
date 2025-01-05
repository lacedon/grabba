extends Node2D
class_name AreaVisualPolygon

const PolygonHelpers = preload('res://helpers/polygon_helpers.gd')

const DEFAULT_COLOR: Color = Color(1, 1, 1, 0.15)
const BORDER_SIZE: int = 4

@onready var _visualBodyPolygon: Polygon2D = $VisualBody
@onready var _borderPolygon: Polygon2D = $BorderPolygon

func setUpBorder() -> void:
  _borderPolygon.polygon = Geometry2D.offset_polygon(_visualBodyPolygon.polygon, -BORDER_SIZE)[0]
  _borderPolygon.invert_border = BORDER_SIZE

func setColor(ownerPlayerIndex: int) -> void:
  if ownerPlayerIndex >= 0 && ownerPlayerIndex < GameState.players.size():
    _visualBodyPolygon.color = GameState.players[ownerPlayerIndex].color
  else:
    _visualBodyPolygon.color = DEFAULT_COLOR

func getCenter() -> Vector2:
  return PolygonHelpers.calcPolygonCenter(_visualBodyPolygon)

func getPolygons() -> PackedVector2Array:
  return _visualBodyPolygon.polygon

func init(ownerPlayerIndex: int = -1) -> void:
  setUpBorder()
  setColor(ownerPlayerIndex)
