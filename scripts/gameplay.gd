extends Control

onready var BALL = $CenterContainer/VBoxContainer/ballMovement
onready var BACK = $CenterContainer/VBoxContainer/TextureButton

var selection = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	BALL.pressed = Settings.newMovement

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	
	if BALL.is_pressed():
		Settings.newMovement = true
	else:
		Settings.newMovement = false



func _on_TextureButton_pressed():
	get_tree().change_scene(Preload.settings)
