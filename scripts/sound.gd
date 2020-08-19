extends Control

onready var MUTE = $CenterContainer/VBoxContainer/mute
onready var BACK = $CenterContainer/VBoxContainer/TextureButton
onready var SFX = $CenterContainer/VBoxContainer/HSlider
onready var MUSIC = $CenterContainer/VBoxContainer/HSlider2

var selection = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	MUTE.pressed = Settings.mute
	
	SFX.value = Settings.SFXvolume
	MUSIC.value = Settings.MUSICvolume
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	Settings.SFXvolume = SFX.value
	Settings.MUSICvolume = MUSIC.value
	
	if MUTE.is_pressed():
		Settings.mute = true
	else:
		Settings.mute = false

func _on_TextureButton_pressed():
	get_tree().change_scene(Preload.settings)
