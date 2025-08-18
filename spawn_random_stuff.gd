extends Node2D

# Loading stuff
@onready var item_textures: Array[Texture2D] = [
	preload("res://random_item/Grapes.png"),
	preload("res://random_item/ChickenLeg.png"),
	preload("res://random_item/LightBulb.png"),
	preload("res://random_item/WaterDrop.png"),
	preload("res://random_item/Watermelon.png")
]

	# Pick a random texture
	
func _on_timer_timeout() -> void:
	var texture: Texture2D = item_textures.pick_random()
	var area := Area2D.new()
	var sprite := Sprite2D.new()
	sprite.texture = texture
	#i am tired to make it small manuallly --- hahhahahaha
	sprite.scale = Vector2(1, 1)
	var shape := CollisionShape2D.new()
	var rect_shape := RectangleShape2D.new()
	rect_shape.size = sprite.texture.get_size() * sprite.scale
	shape.shape = rect_shape
	#why I Did thsi affafafaf
	area.add_child(sprite)
	area.add_child(shape)
	
	# It must be near
	area.position = Vector2(randi_range(0, 100), randi_range(0, 100))
	area.input_event.connect(_on_item_clicked.bind(area))
	add_child(area)

func _on_item_clicked(viewport, event, shape_idx, area: Area2D) -> void:
	if event is InputEventMouseButton and event.pressed:
		area.queue_free()
