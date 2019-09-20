extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 50
var hunger = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	linear_velocity = Vector2()
	if Input.is_action_pressed("ui_page_down"):
		linear_velocity += Vector2(speed, 0)
	if Input.is_action_pressed("ui_accept"):
		linear_velocity += Vector2(-speed, 0)
	if Input.is_action_pressed("ui_home"):
		linear_velocity += Vector2(0, -speed)
	if Input.is_action_pressed("ui_end"):
		linear_velocity += Vector2(0, speed)
#	pass

func eat_food():
	_increase_hunger()
	
	
func _increase_hunger():
	hunger += 0.1
	var sprite = self.get_node("./Health")
	var collision_shape = self.get_node("./CollisionShape2D")
	sprite.scale += Vector2(0.1, 0.1)
	collision_shape.scale += Vector2(0.2, 0.2)
		
		
func _physics_process(delta):
	for collider in get_colliding_bodies():
		if hunger > collider.hunger:
			print(hunger)
			print(collider.hunger)
			collider.queue_free()
			_increase_hunger()
		
