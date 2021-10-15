extends Node2D

## VARS
onready var play_area = get_node("play_area") as TileMap
onready var dynamic_background = get_node("dynamic_background") as TileMap
onready var static_background = get_node("static_background") as TileMap

onready var selection = get_node("selection") as Sprite

var level: Node2D
var selected_cell: Cell
var selected_building: int

var dynamic_background_filled: bool = false

## FUNCS
func handle_selected_cell():
	if dynamic_background:
		var cell_position = dynamic_background.world_to_map(get_global_mouse_position()) as Vector2
		var cell_id = dynamic_background.get_cell(cell_position.x, cell_position.y)
		var cell_type = selected_building
	
		selected_cell = Cell.new(cell_id, cell_position)

func handle_selection():
	if selection:
		if selected_cell:
			selection.global_position = dynamic_background.map_to_world(selected_cell.coordinates)

func handle_building():
	if selected_building and not selected_building == -10 and dynamic_background and static_background:
		var old_cell = Cell.new(selected_cell.id, selected_cell.coordinates)
		var new_cell = Cell.new(selected_building, selected_cell.coordinates)
		
		if Input.is_action_pressed("click") \
		and not play_area.get_cellv(selected_cell.coordinates) == -1 \
		and not old_cell.id == new_cell.id:
			print("Old cell: [{old}]\nNew cell: [{new}]".format({"old":old_cell, "new":new_cell}))
		
			match new_cell.id:
				Cell.Cells.EMPTY:
					dynamic_background.set_cellv(new_cell.coordinates, static_background.get_cellv(new_cell.coordinates))
				_:
					match new_cell.id:
						Cell.Cells.CLOUDS:
							dynamic_background.set_cellv(new_cell.coordinates, new_cell.id)
							dynamic_background.update()
		
		dynamic_background.update_bitmask_area(new_cell.coordinates)

func handle_selected_building():
	if Input.is_action_just_pressed("select_1"):
		selected_building = Cell.Cells.CLOUDS
	elif Input.is_action_just_pressed("select_2"):
		selected_building = Cell.Cells.EMPTY

func fill_map(source_map: TileMap, destination_map: TileMap):
	while !dynamic_background_filled:
		if source_map and destination_map:
			print("[I] Populating dynamic_background with static_background")
			var occupied_cells: Array = source_map.get_used_cells()
			
			if occupied_cells:
				print("[I] Occupied cells found:")
			
				for cell in occupied_cells:
					var source_cell = Cell.new(source_map.get_cell(cell.x, cell.y), Vector2(cell.x, cell.y))
					var destination_cell = Cell.new(destination_map.get_cell(cell.x, cell.y), Vector2(cell.x, cell.y))
					replace_cell(source_cell, destination_cell, source_map, destination_map)
			
				dynamic_background_filled = true

func replace_cell(source_cell: Cell, destination_cell: Cell, source_map: TileMap, destination_map: TileMap):
	var copied_cell = Cell.new(source_map.get_cell(source_cell.coordinates.x, source_cell.coordinates.y), Vector2(source_cell.coordinates.x, source_cell.coordinates.y))
	
	destination_map.set_cellv(copied_cell.coordinates, copied_cell.id)

## SIGNALS


## SETGET


## EXECUTION
func _ready():
	add_to_group("grid")
	
	var reference = has_node(get_owner().get_path())
	var level_group = get_tree().get_nodes_in_group("level")
	
	if !level and reference and level_group:
		level = level_group[0] as Node2D


func _process(_delta):
	fill_map(static_background, dynamic_background)
	handle_selected_cell()
	handle_selection()
	handle_building()
	handle_selected_building()
