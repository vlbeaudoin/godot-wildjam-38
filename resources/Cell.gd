class_name Cell
extends Resource


## VARS
export(int) var id
export(Vector2) var coordinates

enum Cells {
	INVALID = -10,
	EMPTY = -1,
	CLOUDS = 6,
	WATER_1 = 11,
	GRASS = 14,
}

## FUNCS


## SIGNALS


## SETGET


## EXECUTION
func _init(new_id: int, new_coordinates: Vector2):
	self.id = new_id
	self.coordinates = new_coordinates
