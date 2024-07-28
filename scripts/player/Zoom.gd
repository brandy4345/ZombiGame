extends Node3D

const MAX_ZOOM = Vector3(1,1,1)
const MIN_ZOOM = Vector3(5,5,5)
const SMOOTH = 0.3

var sensibilidad = 0.7
var nextPosition  

var ZOOM_SPEED = sensibilidad * Vector3(1,1,1)

# Called when the node enters the scene tree for the first time.
func _ready():
	nextPosition = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("scroll_up"):
			var resta = (position-ZOOM_SPEED)
			nextPosition = Vector3(max(resta.x,MAX_ZOOM.x),max(resta.y,MAX_ZOOM.y),max(resta.z,MAX_ZOOM.z))
	elif Input.is_action_just_released("scroll_down"):
		var resta = (position+ZOOM_SPEED)
		nextPosition = Vector3(min(resta.x,MIN_ZOOM.x),min(resta.y,MIN_ZOOM.y),min(resta.z,MIN_ZOOM.z))
	var velocity = abs(position.distance_to(nextPosition))
	position = position.move_toward(nextPosition,10*delta*velocity)
