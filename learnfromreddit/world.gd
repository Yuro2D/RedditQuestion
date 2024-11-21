extends Node2D

@onready var blue_box_1: Area2D = $BlueBox1
@onready var blue_box_2: Area2D = $BlueBox2
@onready var blue_box_3: Area2D = $BlueBox3
@onready var blue_box_4: Area2D = $BlueBox4
@onready var blue_box_5: Area2D = $BlueBox5
@onready var green_box: Area2D = $GreenBox
@onready var green_box_2: Area2D = $GreenBox2
@onready var green_box_3: Area2D = $GreenBox3
@onready var green_box_4: Area2D = $GreenBox4
@onready var green_box_5: Area2D = $GreenBox5
@export var bluegear1: Area2D
@export var bluegear2: Area2D
@export var bluegear3: Area2D
@export var bluegear4: Area2D
@export var gear1: Area2D
@export var gear2: Area2D
@export var gear3: Area2D
@export var gear4: Area2D
var turning:bool = false
var reverseturning:bool = false
var gear1pos:Vector2
var gear2pos:Vector2
var gear3pos:Vector2
var gear4pos:Vector2
var bluegear1pos:Vector2
var bluegear2pos:Vector2
var bluegear3pos:Vector2
var bluegear4pos:Vector2
var changedPosition:bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	recordPosition()
func recordPosition() -> void:
	gear1pos = gear1.global_position
	gear2pos = gear2.global_position
	gear3pos = gear3.global_position
	gear4pos = gear4.global_position
	bluegear1pos = bluegear1.global_position
	bluegear2pos = bluegear2.global_position
	bluegear3pos = bluegear3.global_position
	bluegear4pos = bluegear4.global_position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if turning == true:
		gear1.global_position = gear1.global_position.move_toward(gear2pos,delta * 100)
		gear2.global_position = gear2.global_position.move_toward(gear3pos,delta * 100)
		gear3.global_position = gear3.global_position.move_toward(gear4pos,delta * 100)
		gear4.global_position = gear4.global_position.move_toward(gear1pos,delta * 100)
		bluegear1.global_position = bluegear1.global_position.move_toward(bluegear2pos,delta * 100)
		bluegear2.global_position = bluegear2.global_position.move_toward(bluegear3pos,delta * 100)
		bluegear3.global_position = bluegear3.global_position.move_toward(bluegear4pos,delta * 100)
		bluegear4.global_position = bluegear4.global_position.move_toward(bluegear1pos,delta * 100)
		checkpos()
		if changedPosition == true:
			recordPosition()
			turning = false
			changedPosition = false
	
	if reverseturning == true:
		gear1.global_position = gear1.global_position.move_toward(gear4pos,delta * 100)
		gear2.global_position = gear2.global_position.move_toward(gear1pos,delta * 100)
		gear3.global_position = gear3.global_position.move_toward(gear2pos,delta * 100)
		gear4.global_position = gear4.global_position.move_toward(gear3pos,delta * 100)
		bluegear1.global_position = bluegear1.global_position.move_toward(bluegear4pos,delta * 100)
		bluegear2.global_position = bluegear2.global_position.move_toward(bluegear1pos,delta * 100)
		bluegear3.global_position = bluegear3.global_position.move_toward(bluegear2pos,delta * 100)
		bluegear4.global_position = bluegear4.global_position.move_toward(bluegear3pos,delta * 100)
		reversecheckpos()
		if changedPosition == true:
			recordPosition()
			reverseturning = false
			changedPosition = false

func checkpos()->void:
	if gear1.global_position == gear2pos and gear2.global_position == gear3pos and gear3.global_position == gear4pos and gear4.global_position == gear1pos:
		changedPosition = true

func reversecheckpos()->void:
	if gear1.global_position == gear4pos and gear2.global_position == gear1pos and gear3.global_position == gear2pos and gear4.global_position == gear3pos:
		changedPosition = true


func _on_button_pressed() -> void:
	turning = true
	GlobalSignal.colorToChange = Color.BLUE

func _on_button_2_pressed() -> void:
	reverseturning = true
	GlobalSignal.colorToChange = Color.GREEN
