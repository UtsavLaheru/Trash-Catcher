extends Node

var Banana = preload("res://green_bin_food.tscn")
var Paper = preload("res://blue_bin_food.tscn")
var Bandage = preload("res://black_bin_food.tscn")
var banana
var paper
var bandage

var Game_Over = preload("res://game_over.tscn")
var game_over

#var Gravity
var x_axis = 20
var can_spawn : bool = true
var random_spawn : int = 0
var Spawn_Delay = 5
var Damange : int = 0

var Heart_List : Array[TextureRect]
var Health : float = 3

func _ready():
	$Hub.visible = false
	get_tree().paused = true
	Engine.max_fps = ProjectSettings.get_setting("physics/common/physics_ticks_per_second")
	print(x_axis)
	#Spawn_Food()
	var heart_parent = $Hub/Panel/HBoxContainer
	for child in heart_parent.get_children():
		Heart_List.append(child)
	print(Heart_List)
	
	
func Spawn_Food():
	if can_spawn == true:
		random_spawn = randi_range(1,3)
		#print(random_spawn)
	if can_spawn == true and random_spawn == 1:
		banana = Banana.instantiate()
		get_node("/root/Game/").add_child(banana)
		banana.global_position = Vector2(x_axis,-17)
		can_spawn = false
		Food_Delay()
	elif can_spawn == true and random_spawn == 2:
		paper = Paper.instantiate()
		get_node("/root/Game/").add_child(paper)
		paper.global_position = Vector2(x_axis,-17)
		can_spawn = false
		Food_Delay()
	elif can_spawn == true and random_spawn == 3:
		bandage = Bandage.instantiate()
		get_node("/root/Game/").add_child(bandage)
		bandage.global_position = Vector2(x_axis,-17)
		can_spawn = false
		Food_Delay()

func Food_Delay():
	$Timer.set_wait_time(Spawn_Delay)
	$Timer.start()
	
	
func _physics_process(delta):
	Spawn_Food()
	x_axis = randi_range(20,632)
	$Hub/Panel/Label.text = "Score:%d" % ScoreDamage.Scores
	if ScoreDamage.Wrong_Bin_Damange == 5:
		Damage()
		ScoreDamage.Wrong_Bin_Damange = 0


func _on_timer_timeout():
	can_spawn = true
	$Timer.stop()
	

func Heart_Update_display():
	for i in range(Heart_List.size()):
		Heart_List[i].visible = i < Health
		#print(Heart_List[i].visible)


func _on_area_2d_area_entered(area):
	if $Player != null:
		Damange += 10
		Damage()
	print("Damanged:",Damange)
	#print(area.name)

func Damage():
	if Health > 0 and ScoreDamage.Wrong_Bin_Damange == 5:
		Health -= 0.5
	else:
		if Health > 0:
			Health -= 1
	if Health == 2.5:
		$Hub/Panel/HBoxContainer/Heart3/AnimatedSprite2D.play("Half")
	if Health == 1.5:
		$Hub/Panel/HBoxContainer/Heart2/AnimatedSprite2D.play("Half")
	if Health == 0.5:
		$Hub/Panel/HBoxContainer/Heart/AnimatedSprite2D.play("Half")
	Heart_Update_display()
	if Health <= 0 && $Player != null:
		$Player.queue_free()
		ScoreDamage.Scores = 0
		game_over = Game_Over.instantiate()
		get_node("/root/Game/").add_child(game_over)
		
		


func _on_button_pressed():
	get_tree().paused = false
	$Menu.hide()
	$Hub.visible = true
