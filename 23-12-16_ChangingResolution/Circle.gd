class_name Circle extends Node2D

var radius:int
var viewport:Viewport
var cur_width:int
var cur_width_percentage:float

func _ready()->void:
	viewport = get_viewport()
	cur_width = viewport.size.x
	
	position = viewport.size / 2
	radius = viewport.size.y / 8
	viewport.size_changed.connect(_resize)

func _process(delta:float)->void:
	position.x -= 100 * delta
	cur_width_percentage = cur_width / float(position.x)
	queue_redraw()

func _draw()->void:
	draw_unfilled_circle(Vector2.ZERO, radius, Color.AQUAMARINE)
	
func _resize()->void:
	cur_width = viewport.size.x
	position = Vector2(cur_width_percentage * cur_width, viewport.size.y/2)
	radius= viewport.size.y / 8

func draw_unfilled_circle(center:Vector2, radius:float, color:Color) -> void:
	var nb_points:int = 32
	var points_arc:Array = PackedVector2Array()
	for i in range(nb_points + 1):
		var angle_point:float = deg_to_rad(i * 360.0 / nb_points )
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	for index_point in range(nb_points):
		draw_line(points_arc[index_point], points_arc[index_point + 1], color)
