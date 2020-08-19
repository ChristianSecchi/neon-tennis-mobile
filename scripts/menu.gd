extends Control

onready var SP = $MarginContainer/VBoxContainer/VBoxContainer2/Singleplayer
onready var MP = $MarginContainer/VBoxContainer/VBoxContainer2/Multiplayer
onready var OPT = $MarginContainer/VBoxContainer/VBoxContainer2/Options
onready var EXIT = $MarginContainer/VBoxContainer/VBoxContainer2/Exit

var selection = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	SinglePlayerLogic.CurrentMode = "MENU"
	$MarginContainer/VBoxContainer/Label.modulate = Color(SinglePlayerLogic.RGB[0], SinglePlayerLogic.RGB[1], SinglePlayerLogic.RGB[2], 1)
	$MarginContainer/VBoxContainer/Label2.set_text("HIGH SCORE: "+str(Settings.topScore)+"\n\n")
	$AudioStreamPlayer.volume_db = linear2db(Settings.MUSICvolume)
	
	if !Settings.mute:
		$AudioStreamPlayer.play()
	else: 
		pass
	Settings.loadEverything()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$MarginContainer/VBoxContainer/Label.modulate = Color(SinglePlayerLogic.RGB[0], SinglePlayerLogic.RGB[1], SinglePlayerLogic.RGB[2], 1)

func _on_Singleplayer_pressed():
	SinglePlayerLogic.explosion(Vector2(960,621))
	$Timer1.start()

func _on_Multiplayer_pressed():
	SinglePlayerLogic.explosion(Vector2(960,721))
	$Timer2.start()

#quits game
func _on_Exit_pressed():
	get_tree().quit()

func _on_Options_pressed():
	SinglePlayerLogic.explosion(Vector2(960,828))
	$Timer3.start()
	
	

func _on_Timer1_timeout():
	get_tree().change_scene(Preload.SP)


func _on_Timer2_timeout():
	get_tree().change_scene(Preload.MP)


func _on_Timer3_timeout():
	get_tree().change_scene(Preload.settings)
