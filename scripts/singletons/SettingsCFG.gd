extends Node

# [audio]
var SFXvolume = 1
var MUSICvolume = 1
var mute = false

# [graphics]
var babbyMode = false
var ColourSpeed = 0.001

# [gameplay]
var newMovement = true
var topScore = 0

var savePath = "user://settings.cfg"
var config = ConfigFile.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	if config.load(savePath) == OK:
		if config.has_section("Audio") == false:
			config.set_value("Audio","SFXvolume",SFXvolume)
			config.set_value("Audio","MUSICvolume",MUSICvolume)
			config.set_value("Audio","mute",mute)
			config.save(savePath)
		if config.has_section("Graphics") == false:
			config.set_value("Graphics","babbyMode",babbyMode)
			config.set_value("Graphics","colourSpeed",ColourSpeed)
			config.save(savePath)
		if config.has_section("Gameplay") == false:
			config.set_value("Gameplay","newMovement",newMovement)
			config.set_value("Gameplay","topScore",topScore)
			config.save(savePath)
		loadEverything()
	else:
		saveEverything()
		
#	if !config.has_section("Gameplay"):
#		config.set_value("Gameplay","newMovement",newMovement)
#		config.save(savePath)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	print(fullscreen)

func loadEverything():
	SFXvolume = config.get_value("Audio", "SFXvolume")
	MUSICvolume = config.get_value("Audio", "MUSICvolume")
	mute = config.get_value("Audio", "mute")
	babbyMode = config.get_value("Graphics", "babbyMode")
	ColourSpeed = config.get_value("Graphics", "colourSpeed")
	newMovement = config.get_value("Gameplay", "newMovement")
	topScore = config.get_value("Gameplay", "topScore")

func saveEverything():
	config.set_value("Audio","SFXvolume",SFXvolume)
	config.set_value("Audio","MUSICvolume",MUSICvolume)
	config.set_value("Audio","mute",mute)
	config.set_value("Graphics","babbyMode",babbyMode)
	config.set_value("Graphics","colourSpeed",ColourSpeed)
	config.set_value("Gameplay","newMovement",newMovement)
	config.set_value("Gameplay","topScore",topScore)
	config.save(savePath)
