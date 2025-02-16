extends KinematicBody2D

#initial speed on x and y axis and the position (forces?) of the ball
var speed = 10
var dir = Vector2()

onready var sprite = $Sprite
onready var tween = $Tween

onready var paddleOne = get_node("../paddle1/Paddle1")
onready var paddleTwo = get_node("../paddle2/Paddle2")



# Called when the node enters the scene tree for the first time.
func _ready():
	#picks number between 1 and 2, choses which direction the ball starts
	var rand = Global.rng.randi_range(1,2)
	var rand2 = Global.rng.randi_range(1,3)
	if(rand == 1):
		dir.x = 1
	else:
		dir.x = -1
	
	if rand2 == 1:
		dir.y = 1
	elif rand2 == 2:
		dir.y = -1
	elif rand2 == 3:
		dir.y = 0
	
	sprite.modulate = Color(SinglePlayerLogic.RGB[0], SinglePlayerLogic.RGB[1], SinglePlayerLogic.RGB[2], 1)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#makes collision a var that checks if a collision has occured in move_and_collide
	var is_colliding = move_and_collide(Vector2(dir.x, dir.y).normalized() * speed)
	
	
	
	#bounces the ball if collision occurs
	if(is_colliding):
		dir = dir.bounce(is_colliding.normal)
	
	#makes ball sprite the global colour
	sprite.modulate = Color(SinglePlayerLogic.RGB[0], SinglePlayerLogic.RGB[1], SinglePlayerLogic.RGB[2], 1)

#makes the ball faster once the paddle enters the outer area of the collision
func _on_Area2D_body_entered(body):
	if body.name == "Paddle1":
		SinglePlayerLogic.explosionDIR(get_position(), 0)
	elif body.name == "Paddle2":
		SinglePlayerLogic.explosionDIR(get_position(), 180)
	elif body.name == "top":
		SinglePlayerLogic.explosionDIR(get_position(), 90)
	elif body.name == "bottom":
		SinglePlayerLogic.explosionDIR(get_position(), 270)
	else:
		SinglePlayerLogic.explosion(get_position())
	
	if body.name == "Paddle1":
		if Settings.newMovement == true:
			dir.y = (self.position.y - paddleOne.position.y) * 0.015
		else:
			if (self.position.y - paddleOne.position.y) * 0.01 <= -0.3:
				dir.y = -1
			elif (self.position.y - paddleOne.position.y) * 0.01 >= 0.3: 
				dir.y = 1
			else:
				dir.y = 0
	if body.name == "Paddle2":
		if Settings.newMovement == true:
			dir.y = (self.position.y - paddleTwo.position.y) * 0.015
		else:
			if (self.position.y - paddleTwo.position.y) * 0.01 <= -0.3:
				dir.y = -1
			elif (self.position.y - paddleTwo.position.y) * 0.01 >= 0.3: 
				dir.y = 1
			else:
				dir.y = 0
	
	#changes ball speed by 10 every collision
	speed += 0.15

func _on_Area2D_area_entered(area):
	
	#starts the timer to despawn
	if "lose" in area.name or "negBall" in area.name:
		SinglePlayerLogic.explosion(get_position())
		tween.interpolate_property(self, "modulate", Color(1,1,1, 1), Color(1, 1, 1, 0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
		tween.start()
		$endTimer.start()


#despawns on timer end
func _on_endTimer_timeout():
	queue_free()

