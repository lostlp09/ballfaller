extends Line2D
@onready var  staticbody = $"../StaticBody2D"
@onready var player = $"../RigidBody2D"
var instance = preload("res://player.tscn")
var start = false
var oldpos = 0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	oldpos = player.position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mouse"):
		Start.despawn =false
		var distance = player.position.distance_to(get_global_mouse_position())
		print(distance)
		if distance <= 110:
			print("hi")
			
			Start.despawn = true
		for i in staticbody.get_children():
		
			i.queue_free()
		self.clear_points()
		
	if Input.is_action_pressed("mouse") :
		self.add_point(get_global_mouse_position())

	if Input.is_action_just_released("mouse"):
		if self.points.size() != 0:
			var line_poly = Geometry2D.offset_polyline(points,self.width/2)
			for poly in line_poly :
				
				var col = CollisionPolygon2D.new()
				col.polygon = poly
				staticbody.add_child(col)
			
	
		if Start.despawn ==true:
				
			for i in staticbody.get_children():
				i.queue_free()
				self.clear_points()
			
			self.clear_points()
			player.queue_free()
			await get_tree().physics_frame
			var clone = instance.instantiate()
			clone.position = oldpos
			self.get_parent().add_child(clone)
			player = clone
		get_tree().create_timer(0.1).timeout
		
	
	
		
		
func _on_button_pressed() -> void:

	if self.points.size() != 0:
		var line_poly = Geometry2D.offset_polyline(points,self.width/2)
		for poly in line_poly :

			var col = CollisionPolygon2D.new()
			col.polygon = poly
			staticbody.add_child(col)			
	player.gravity_scale = 1.5
	start = true	
func _on_reset_pressed() -> void:
	player.queue_free()
	var clone = instance.instantiate()
	player = clone
	player.position = oldpos
	self.get_parent().add_child(clone)
	
	for i in staticbody.get_children():
			i.queue_free()
			self.clear_points()

	self.clear_points()
