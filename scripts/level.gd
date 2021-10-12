extends Node2D

onready var level_path = "res://levels/%s.tscn" % self.name

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("level")

func _process(_delta):
	process_input()


func process_input():
	if Input.is_action_just_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	
	if Input.is_action_just_pressed("restart"):
		handle_restart()
	
	if Input.is_action_just_released("debug"):
		handle_debug()
	
	if Input.is_action_just_pressed("menu"):
		handle_menu()

func handle_restart():
	print("[I] Restarting level")
	Util.change_scene(level_path)

func handle_debug():
	print("[I] Debug!")

func handle_menu():
	print("[I] Opening menu")
	Util.change_scene("res://main.tscn")
