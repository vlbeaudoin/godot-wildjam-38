class_name Tile
extends Resource


## VARS
export(String) var type

## FUNCS


## SIGNALS


## SETGET


## EXECUTION
func _init(new_id: int, new_coordinates: Vector2, new_type: String):
	self.id = new_id
	self.coordinates = new_coordinates
	self.type = new_type
