extends Spatial

var spot_a = false
var spot_b = false
var park   = false
var curent_pos
func _ready():
	randomize()
func _process(delta):
	if spot_a and spot_b:
		get_node("white_line").hide()
		get_node("green_line").show()
		park =true
		
	else:
		get_node("white_line").show()
		get_node("green_line").hide()
		park =false
	if Input.is_action_just_released("ui_accept"):
		if park:
			_next_position()
	

func _on_Area_body_entered(body):
	spot_a =true
func _on_Area_body_exited(body):
	spot_a =false
func _on_Area2_body_entered(body):
	spot_b =true
func _on_Area2_body_exited(body):
	spot_b =false

func _next_position():
	var random_value = randi()%3 +1
	if random_value == curent_pos:
		if random_value == curent_pos:
			return true
	self.translation = get_node("../position_base").get_child(random_value).translation
	curent_pos= random_value
