extends Control

onready var BABBY = $CenterContainer/VBoxContainer/babbyMode
onready var BACK = $CenterContainer/VBoxContainer/TextureButton
onready var SPEED = $CenterContainer/VBoxContainer/SPEED

# Called when the node enters the scene tree for the first time.
func _ready():
	BABBY.pressed = Settings.babbyMode
	SPEED.value = Settings.ColourSpeed
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	
	Settings.ColourSpeed = SPEED.value
	
	if BABBY.is_pressed():
		Settings.babbyMode = true
	else:
		Settings.babbyMode = false
		SinglePlayerLogic.RGB[0] = 1
		SinglePlayerLogic.RGB[1] = 0
		SinglePlayerLogic.RGB[2] = 0


func _on_TextureButton_pressed():
	get_tree().change_scene(Preload.settings)
