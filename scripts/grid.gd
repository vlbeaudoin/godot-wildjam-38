extends Node2D

## VARS
onready var play_area = get_node("play_area") as TileMap
onready var dynamic_background = get_node("dynamic_background") as TileMap
onready var static_background = get_node("static_background") as TileMap

onready var selection = get_node("selection") as Sprite

var level: Node2D
var selected_cell: Cell
var selected_building: int


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
	if selected_building and not selected_building == -10:
		var old_cell = Cell.new(selected_cell.id, selected_cell.coordinates)
		var new_cell = Cell.new(selected_building, selected_cell.coordinates)
		
		
		if Input.is_action_pressed("click") \
		and not play_area.get_cellv(selected_cell.coordinates) == -1 \
		and not old_cell.id == new_cell.id:
			print("Old cell: [{old}]\nNew cell: [{new}]".format({"old":old_cell, "new":new_cell}))
		
			if new_cell.id == Cell.Cells.EMPTY or Cell.Cells.CLOUDS:
					dynamic_background.set_cellv(new_cell.coordinates, new_cell.id)
					dynamic_background.update()
		
		dynamic_background.update_bitmask_area(new_cell.coordinates)
#
		
#	pass
	
#	if level.game_mode == level.GameModes.BUILD and Util.selected_building \
#	 and not util.selected_building == -10 and not Util.grabbed_chicken:
#
#		var old_cell = Cell.new(util.selected_cell.id, util.selected_cell.coordinates)
#		var new_cell = Cell.new(util.selected_building, util.selected_cell.coordinates)
#
#
#		if Input.is_action_pressed("click") \
#			and not zone_build.get_cellv(util.selected_cell.coordinates) == -1 \
#			and not old_cell.id == new_cell.id:
#
#			match new_cell.id:
#				util.Cells.EMPTY:
#					if old_cell.id == util.Cells.FENCE:
#						player_buildings.set_cellv(new_cell.coordinates, new_cell.id)
#						player_buildings.update()
#						astar_nav.update_astar()
#
#						var test_path = astar_nav.try_path(astar_nav.start_position, astar_nav.end_position) as PoolVector2Array
#
#						if not test_path:
#							player_buildings.set_cellv(old_cell.coordinates, old_cell.id)
#							player_buildings.update()
#							astar_nav.update_astar()
#						else:
#							astar_nav.path = test_path
#							util.inv.white_eggs += util.Costs.FENCE
#							SFXPlayer.sfx_dig(new_cell.coordinates * cell_size)
#
#
#						astar_nav.update_path_shimmer()
#
#
#
#				util.Cells.FENCE:
#					if old_cell.id == util.Cells.EMPTY and util.inv.white_eggs >= util.Costs.FENCE:
#						# try new path
#						player_buildings.set_cellv(new_cell.coordinates, new_cell.id)
#						player_buildings.update()
#						astar_nav.update_astar()
#
#						var test_path = astar_nav.try_path(astar_nav.start_position, astar_nav.end_position) as PoolVector2Array
#
#						if not test_path:
#							player_buildings.set_cellv(old_cell.coordinates, old_cell.id)
#							player_buildings.update()
#							astar_nav.update_astar()
#						else:
#							astar_nav.path = test_path
#							astar_nav.update_path_shimmer()
#							util.inv.white_eggs -= util.Costs.FENCE
#							SFXPlayer.sfx_knock(new_cell.coordinates * cell_size)
#
#			player_buildings.update_bitmask_area(new_cell.coordinates)

func handle_selected_building():
	if Input.is_action_just_pressed("select_1"):
		selected_building = Cell.Cells.CLOUDS
	elif Input.is_action_just_pressed("select_2"):
		selected_building = Cell.Cells.EMPTY

## SIGNALS



## SETGET


## EXECUTION
func _ready():
	add_to_group("grid")
	
	var reference = has_node(get_owner().get_path())
	var level_group = get_tree().get_nodes_in_group("level")
	
	if !level and reference and level_group:
		level = level_group[0] as Node2D
	
	
#	
#	selected_building = Cell.Cells.EMPTY


func _process(_delta):
	handle_selected_cell()
	handle_selection()
	handle_building()
	handle_selected_building()
	
