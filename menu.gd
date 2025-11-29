extends Control

var Instruction_Menu = preload("res://instruction_menu.tscn")
var instruction_menu

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_2_pressed():
	instruction_menu = Instruction_Menu.instantiate()
	get_node(".").add_child(instruction_menu)
