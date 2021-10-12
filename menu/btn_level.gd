extends Button

## VARS
export(String) var level_name = "level0"
onready var level_path = "res://levels/%s.tscn" % level_name


## FUNCS


## SIGNALS
func on_button_down():
	Util.change_scene(level_path)

## SETGET


## EXECUTION
func _ready():
	self.text = level_name
	var err_connect = connect("button_down", self, "on_button_down")
	
	if err_connect != OK:
		print("[ERR] Could not connect to signal. (Error code: %s)" % err_connect)
