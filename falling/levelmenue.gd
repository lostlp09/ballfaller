extends Node2D
@onready var button = $Button
var levels = ["res://level2.tscn","res://level1.tscn",
"res://level3.tscn","res://level4.tscn",
"res://level5.tscn","res://level6.tscn"]

func _ready() -> void:
	for i in range(1,5):
		var clone = button.duplicate()
		clone.text = str(i)
		clone.position = button.position
		clone.position.x += 256 * i
		clone.pressed.connect(pressed.bind(clone))
		self.add_child(clone)
		
		await  get_tree().create_timer(0.05).timeout
		smoothzoomout(clone)

func smoothzoomout(a) ->void:
	var accelarion = 50
	for i in range(0,29):
		a.position.y -= 0.1 * accelarion
		accelarion -= 1
		await get_tree().create_timer(0.01).timeout


func pressed(btd:Button):
	var index = int(btd.text)
	get_tree().change_scene_to_file(levels[index - 1])
	
	
