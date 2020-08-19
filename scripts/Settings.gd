extends Control

var selection = 1

onready var GRAPH = $CenterContainer/VBoxContainer/graphics
onready var SOUND = $CenterContainer/VBoxContainer/sound
onready var GAME = $CenterContainer/VBoxContainer/gameplay
onready var CRED = $CenterContainer/VBoxContainer/credits
onready var BACK = $CenterContainer/VBoxContainer/back

# Called when the node enters the scene tree for the first time.
func _ready():
	SinglePlayerLogic.CurrentMode = "OPTIONS"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):	
	pass


func _on_graphics_pressed():
	get_tree().change_scene(Preload.graphics)


func _on_back_pressed():
	Settings.saveEverything()
	get_tree().change_scene(Preload.menu)


func _on_sound_pressed():
	get_tree().change_scene(Preload.sound)


func _on_credits_pressed():
	get_tree().change_scene(Preload.credits)


func _on_gameplay_pressed():
	get_tree().change_scene(Preload.gameplay)
