extends Area2D

var score : int = 10
var Gravity : int = 350

var despawn_time : int = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position += transform.y * Gravity * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	await get_tree().create_timer(despawn_time).timeout
	queue_free()


func _on_area_entered(area):
	if area.name == "Black_can":
		area.OnScore(score)
		queue_free()
	elif area.name == "Blue_can" or area.name == "Trash_can":
		ScoreDamage.Wrong_Bin_Damange = 5
		print(ScoreDamage.Wrong_Bin_Damange)
		queue_free()
