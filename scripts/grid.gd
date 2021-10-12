extends Node2D

## VARS
const DEBUG = true

#onready var util = $"/root/main/util"
#onready var zone_build = $"/root/main/zone_build" as TileMap


#onready var player_buildings = $"/root/main/player_buildings" as TileMap
#onready var astar_nav = $"/root/main/astar_nav"
#onready var level = get_tree().get_nodes_in_group("level")[0] as Node2D
onready var play_area = get_node("play_area") as TileMap
onready var dynamic_background = get_node("dynamic_background") as TileMap

var level: Node2D

func _ready():
	var reference = has_node(get_owner().get_path())
	var level_group = get_tree().get_nodes_in_group("level")
	
	if !level and reference and level_group:
		level = get_tree().get_nodes_in_group("level")[0] as Node2D

## FUNCS
func handle_building():
	pass
#	if level.game_mode == level.GameModes.BUILD and util.selected_building and not util.selected_building == -10 and not util.grabbed_chicken:
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

## SIGNALS



## SETGET


## EXECUTION


#func _process(_delta):
#	handle_building()
