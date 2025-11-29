extends Control

func touch_inputs():
	if Input.is_action_just_pressed("Left"):
		$TouchScreenButton/AnimatedSprite2D.play("Left_pressed")
	if Input.is_action_just_released("Left"):
		$TouchScreenButton/AnimatedSprite2D.play_backwards("Left_pressed")
	if Input.is_action_just_pressed("Right"):
		$TouchScreenButton2/AnimatedSprite2D.play("Right_pressed")
	if Input.is_action_just_released("Right"):
		$TouchScreenButton2/AnimatedSprite2D.play_backwards("Right_pressed")
	if Input.is_action_just_pressed("Switching"):
		$TouchScreenButton3/AnimatedSprite2D.play("Switching_pressed")
	if Input.is_action_just_released("Switching"):
		$TouchScreenButton3/AnimatedSprite2D.play_backwards("Switching_pressed")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	touch_inputs()
	
