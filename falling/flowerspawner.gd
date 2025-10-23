extends Node2D
@onready var herbstblatt = $Herbstblatt
var script1 = load("res://herbstblatt.gd")



func _ready() -> void:
	spawner()

	
	pass # Replace with function body.



func _process(delta: float) -> void:
	pass
func spawner()->void:

	while true :
		var  clone = herbstblatt.duplicate()
		var pos = Vector2(randi_range(16,1136),16.0)   
		var rotation1  = randi_range(0,359)
		clone.position =  pos
		clone.rotation_degrees = rotation1
		clone.set_script(script1)
		self.get_parent().add_child(clone)
		await get_tree().create_timer(3).timeout
	
