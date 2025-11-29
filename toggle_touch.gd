extends Control

var toogle : bool = false
var Pressed_Once = 0

func _ready():
	Toogle_Down(toogle)

func Toogle_Down(toogle):
	if toogle == true:
		$CheckButton.button_pressed = true
		$Touch_Control.visible = true
		Pressed_Once = 1
		#print(Pressed_Once)
	elif toogle == false:
		$CheckButton.button_pressed = false
		$Touch_Control.visible = false
		Pressed_Once = 0

func _on_touch_screen_button_pressed():
	if Pressed_Once == 0:
		Toogle_Down(true)
	elif Pressed_Once == 1:
		Toogle_Down(false)
		
		
