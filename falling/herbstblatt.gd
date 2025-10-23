extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(4).timeout
	self.queue_free()
	
func _process(delta: float) -> void:
	self.position.y += 1
