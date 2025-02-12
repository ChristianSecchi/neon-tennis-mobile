extends Node

var rng = RandomNumberGenerator.new()

var babbyModePressed = false


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	
	OS.window_size = OS.get_screen_size() / 1.5
	
	OS.center_window()

# Called every frame. 'delta' is the elapsed time since the previous frame.


func playSound(sound, pos, shift, shift1 := 1, shift2 := 1.5):
	if !Settings.mute:
		if shift == false:
			var audio = AudioStreamPlayer2D.new()
			add_child(audio)
			audio.connect("finished", self, "_on_audio_finished", [audio])
			audio.set_position(pos)
			audio.volume_db = linear2db(Settings.SFXvolume)
			audio.stream = load(sound)
			audio.play()
		elif shift == true:
			var audio = AudioStreamPlayer2D.new()
			add_child(audio)
			audio.connect("finished", self, "_on_audio_finished", [audio])
			audio.set_position(pos)
			audio.volume_db = linear2db(Settings.SFXvolume)
			audio.stream = load(sound)
			audio.pitch_scale = rng.randf_range(shift1,shift2)
			audio.play()
	else:
		pass
	
func _on_audio_finished(audio):
	audio.queue_free()
