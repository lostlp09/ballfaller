extends Button
var accelartion = 51
var amount = 0
var firsthovered =false
const maxsize = 0.1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _process(delta: float) -> void:
	
	if self.is_hovered() and amount != 50:
			accelartion -= 1
		
			self.get_child(0).scale +=Vector2(0.01 ,0.01) * delta  * accelartion
			amount += 1
			if self.get_child(0).scale.y >= 0.1:
				self.get_child(0).scale = Vector2(0.1,0.1)
				
	elif not self.is_hovered():
		if amount != 0:
			accelartion += 1
			self.get_child(0).scale-=Vector2(0.01 ,0.01) * delta * accelartion 
			if self.get_child(0).scale.y <= 0.05:
				self.get_child(0).scale = Vector2(0.05,0.05)

			amount -= 1
			
		

		
