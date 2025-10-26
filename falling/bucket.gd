extends StaticBody2D
var timer = 0
var in1 = false








func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == $"../RigidBody2D":
		in1 = true
		


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == $"../RigidBody2D":
		in1 = false

func _process(delta: float) -> void:
	if in1 == true:
		timer += delta
		if timer >= 2:
			print(timer)
			get_tree().quit()
	else:
		timer = 0
	
		
