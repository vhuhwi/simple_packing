extends VehicleBody



const STEER_SPEED = 1.5
const STEER_LIMIT = .8
var steer_target = 0

export var engine_force_value = 100
var target
var active = false
var complite = false



	
func _physics_process(delta):
	_driver(delta)


func _driver(delta):
	
	var _fwd_mps = transform.basis.xform_inv(linear_velocity).x

	steer_target = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
	steer_target *= STEER_LIMIT

	if Input.is_action_pressed("ui_up"):
		engine_force =engine_force_value
	else:
		engine_force = 0

	if Input.is_action_pressed("ui_down"):
		engine_force = -engine_force_value
	else:
		brake= 0
		

	steering = move_toward(steering, steer_target, STEER_SPEED * delta)
	


