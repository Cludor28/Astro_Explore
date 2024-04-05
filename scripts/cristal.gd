extends Node2D

var vel = 0.0
var dir = Vector2()
var rot = 0

func _ready():
	randomize()
	var frames = $sprite.hframes * $sprite.vframes
	$sprite.frame = randi() % frames
	
	vel = rand_range(10 ,  30)
	dir = Vector2(rand_range(-1 , 1) , rand_range(-1 , 1))
	rot = rand_range(-10 , 10)

func _process(delta):
	translate(dir * vel * delta)
	rotate(rot * delta)


func _on_Area2D_area_entered(area):
	queue_free()
