extends CharacterBody2D

@export var speed : float = 200.0
@export var Gravity : float = 350.0
var Green_Bin = preload("res://trash_can.tscn")
var Blue_Bin = preload("res://Blue_trash_can.tscn")
var Black_Bin = preload("res://Black_trash_can.tscn")
var move_direction
var green_bin
var blue_bin
var black_bin
var facing
var item_index = 0
var bin_position

func movement():
	move_direction = Input.get_axis("Left","Right")
	if move_direction:
		velocity.x = move_direction * speed
	else:
		velocity.x = move_toward(velocity.x,0,speed)
	
	#green_bin.position = $Marker2D.position
	
	if move_direction == -1:
		$Sprite2D.play("Walking")
		$Sprite2D.scale.x = -1.0
		$Sprite2D.offset.x = 6.0
		if bin_position != null:
			bin_position.position.x = -10.0
			$Marker2D.position.x = bin_position.position.x
	elif move_direction == 1:
		$Sprite2D.play("Walking")
		$Sprite2D.scale.x = 1.0
		$Sprite2D.offset.x = 0
		if bin_position != null:
			bin_position.position.x = 4.0
			$Marker2D.position.x = bin_position.position.x
	else:
		$Sprite2D.stop()
	
		
func _ready():
	print("Let's Goo")
	Spawn_Bins()
	

func Spawn_Bins():
	if  is_instance_valid(bin_position):
		bin_position.queue_free()
	if item_index == 0:
		green_bin = Green_Bin.instantiate()
		get_node("/root/Game/Player/").add_child(green_bin)
		green_bin.global_position = get_node("Marker2D").global_position
		bin_position = green_bin
	elif item_index == 1:
		blue_bin = Blue_Bin.instantiate()
		get_node("/root/Game/Player/").add_child(blue_bin)
		blue_bin.global_position = get_node("Marker2D").global_position
		bin_position = blue_bin
	elif item_index == 2:
		black_bin = Black_Bin.instantiate()
		get_node("/root/Game/Player/").add_child(black_bin)
		black_bin.global_position = get_node("Marker2D").global_position
		bin_position = black_bin


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += Gravity * delta
	if Input.is_action_just_pressed("Switching"):
		item_index += 1
		if item_index >= 3:
			item_index = 0        #resetting it to Zeroth item_index
		Spawn_Bins()
	movement()
	move_and_slide()
