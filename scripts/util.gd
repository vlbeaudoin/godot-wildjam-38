extends Node2D


func change_scene(scene_path: String):
	print("[I] Changing scene to: %s" % scene_path)
	var err = get_tree().change_scene(scene_path)
#	var msg = "[ERR] Could not change scene. (Error code: %s)" % err
#	
#	if err != OK:
#		match err:
#			19:
#				msg = "[ERR] Level %s not found." % scene_path
#		print(msg)
