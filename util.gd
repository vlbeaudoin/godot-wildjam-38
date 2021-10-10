extends Node2D


export var current_level = "res://levels/level0.tscn"


func _ready():
	pass # Replace with function body.


func _process(delta):
	process_input()

func process_input():
	if Input.is_action_just_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	
	if Input.is_action_just_pressed("restart"):
		handle_restart()
	
	if Input.is_action_just_released("debug"):
		handle_debug()
	
	if Input.is_action_just_released("menu"):
		handle_menu()

func change_scene(new_scene):
	print("[I] Changing scene to: %s" % new_scene)
	var err = get_tree().change_scene(new_scene)
	
	if err != OK:
		print("[ERR] Could not change scene. (Error code: %s)" % err)

func handle_restart():
	change_scene(current_level)

func handle_debug():
	print("[I] Debug!")

func handle_menu():
	change_scene("res://main.tscn")
