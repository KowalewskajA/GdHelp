extends ColorRect

var width:int
var height:int

func _ready() -> void:
	width = ProjectSettings.get_setting("display/window/size/viewport_width") / 2
	height = ProjectSettings.get_setting("display/window/size/viewport_height") / 2
	position = Vector2(3*width/4, 3*height/4)
	size = Vector2(width/2, height/2)
	self.mouse_entered.connect(_turn_blue)
	self.mouse_exited.connect(_turn_yellow)

func _process(delta:float) -> void:
	pass

func _turn_blue() -> void:
	self.color = Color.BLUE

func _turn_yellow() -> void:
	self.color = Color.YELLOW
