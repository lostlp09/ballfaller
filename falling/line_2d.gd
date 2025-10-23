extends Line2D
@onready var  staticbody = $"../StaticBody2D"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mouse"):
			for i in staticbody.get_children():
		
				i.queue_free()
			self.clear_points()
		
	if Input.is_action_pressed("mouse"):
	

		self.add_point(get_global_mouse_position())

	if Input.is_action_just_released("mouse"):
		var line_poly = Geometry2D.offset_polyline(points,self.width/2)
		for poly in line_poly:
			print(poly)
			var col = CollisionPolygon2D.new()
			col.polygon = poly
			staticbody.add_child(col)
			
		

			
		
			
			
