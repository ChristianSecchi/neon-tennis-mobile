extends Control

onready var RESUME = $MarginContainer/VBoxContainer/Resume
onready var MAIN = $MarginContainer/VBoxContainer/MainMenu

var selection = 1

#grabs resume's focus for controller
func _ready():
	pass

#changes controller focus if you mouse over
func _process(_delta):
	pass

#when paused, makes the visability and pause the opposite of current value
#func _input(event):
#	if event.is_action_pressed("pause"):
#		get_tree().paused = not get_tree().paused
#		visible = not visible

#resumes game
func _on_Resume_pressed():
	get_parent().get_node("PauseButton").visible = true
	get_tree().paused = not get_tree().paused
	visible = not visible


#unpauses game and takes you to menu
func _on_MainMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/menu.tscn")



func _on_PauseButton_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible
