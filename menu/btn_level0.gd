extends Button

## VARS
export(String) var level_name = "level0"


## FUNCS


## SIGNALS
func on_button_down():
	print("[I] Changing scene to: %s" % level_name)
	var err = get_tree().change_scene("res://levels/{level}.tscn".format({"level":level_name}))
	
	if err != OK:
		print("[ERR] Could not change scene. (Error code: %s)" % err)


## SETGET


## EXECUTION
func _ready():
	self.text = level_name
	connect("button_down", self, "on_button_down")
