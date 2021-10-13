class_name util
extends Node2D


## VARS


## FUNCS
func change_scene(scene_path: String):
	print("[I] Changing scene to: %s" % scene_path)
	var err = get_tree().change_scene(scene_path)


## SIGNALS


## SETGET


## EXECUTION
