extends StaticBody2D
var timer = 0
var in1 = false
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		in1 = true
		


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("ball"):
		in1 = false

func _process(delta: float) -> void:
	print(in1)
	if timer >= 2:
		print(timer)
		get_tree().change_scene_to_file("res://levelmenue.tscn")
	if in1 == true:
		timer += delta
		
	else:
		timer = 0
	
		
