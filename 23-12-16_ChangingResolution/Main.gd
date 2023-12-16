class_name Main extends Node2D

var timer:Timer
var circles:Array = []

func _ready():
	_create_timer(timer, "default_timer", 1.0, _spawn_circle)

func _process(delta):
	pass

func _spawn_circle():
	var circle = Circle.new()
	circles.append(circle)
	add_child(circle)
	
func _create_timer(variable:Variant, variable_name:String, time:float, function:Callable) -> void:
	variable = Timer.new()
	variable.name = variable_name
	variable.set_autostart(true)
	variable.set_wait_time(time)
	variable.timeout.connect(function)
	add_child(variable)
