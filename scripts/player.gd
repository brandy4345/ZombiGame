extends RigidBody3D

var FORCE = 256
var DIRECCION = sqrt(2)/2
var LERP_VAL = 0.2

@onready var twist_pivot := $MoverPivote/GirarPivote

@onready var armature := $Prota/Armature
@onready var anim_tree := $AnimationTree

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input := Vector3.ZERO
	var a = Input.get_axis("move_forward","move_back")
	var b = Input.get_axis("move_left","move_right")
	input = Vector3((a+b)*DIRECCION,0,(a-b)*DIRECCION).normalized()
	linear_velocity = (input*FORCE*delta)
	var moviendose = input.length()>0
	if moviendose:
		armature.rotation.y = lerp_angle(armature.rotation.y,atan2(-input.x,-input.z),LERP_VAL)
		anim_tree["parameters/conditions/isMoving"] = true
		anim_tree["parameters/conditions/idle"] = false
	else:
		anim_tree["parameters/conditions/isMoving"] = false
		anim_tree["parameters/conditions/idle"] = true
	
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
