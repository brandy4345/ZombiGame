extends RigidBody3D 

var FORCE = 3
var DIRECCION = sqrt(2)/2
var LERP_VAL = 0.2
var JUMP = 3

@export var inventory: InventoryData

@onready var twist_pivot := $MoverPivote/GirarPivote

@onready var armature := $Prota/Armature
@onready var anim_tree := $AnimationTree
#Raycast for the floor
@onready var r1 := $IsOnFloor1Raycast
@onready var r2:= $IsOnFloor2Raycast
@onready var r3:= $IsOnFloor3Raycast

# Called when the node enters the scene tree for the first time.
func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass

func get_input():
	var a = Input.get_axis("move_forward","move_back")
	var b = Input.get_axis("move_left","move_right")
	return Vector3((a+b)*DIRECCION,0,(a-b)*DIRECCION).normalized()

func _physics_process(delta):
	var input:Vector3 = get_input()
	var moviendose = input.length()>0
	if moviendose: 
		armature.rotation.y = lerp_angle(armature.rotation.y,atan2(-input.x,-input.z),LERP_VAL)
		position += input*FORCE*delta
		anim_tree["parameters/conditions/isMoving"] = true
		anim_tree["parameters/conditions/idle"] = false
	else:
		anim_tree["parameters/conditions/isMoving"] = false
		anim_tree["parameters/conditions/idle"] = true
	var isOnFloor = r1.is_colliding() or r2.is_colliding() or r3.is_colliding()
	if Input.is_action_just_pressed("jump") and isOnFloor:
		linear_velocity.y += JUMP
	
	##if Input.is_action_just_pressed("ui_cancel"):
	##	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

