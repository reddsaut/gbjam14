extends CharacterBody2D

const TERMINAL_VELOCITY = 400
const GRAVITY = 10
const BOUNCE = GRAVITY * 15


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func bounce():
	velocity.y = maxf(TERMINAL_VELOCITY * -1, velocity.y - BOUNCE)
	
func gravity():
	velocity.y = minf(TERMINAL_VELOCITY, velocity.y + GRAVITY)
	
# called every physics step. changes to acceleration/velocity should happen here
func _physics_process(delta):
	gravity()
	if(move_and_slide()):
		velocity = Vector2.ZERO
	
	print(velocity.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("up"):
		bounce()
