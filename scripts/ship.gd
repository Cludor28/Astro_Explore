extends Node2D

const PRE_LAZER = preload("res://scenes/lazer.tscn")

export var vel = 100.0

export(NodePath) var lazeres

#posição minima esquerda 21
#posição maxima direita 139

func _ready():
	if lazeres:
		lazeres = get_node(lazeres)
	else:
		lazeres = get_parent()



func _process(delta):
	
	var dirX = 0
	var dirY = 0
	
	if Input.is_action_pressed("ui_left"):
		dirX += -1
	
	if Input.is_action_pressed("ui_right"):
		dirX += 1
	
	if Input.is_action_pressed("ui_up"):
		dirY += -1
	
	if Input.is_action_pressed("ui_down"):
		dirY += 1
		
	if Input.is_action_just_pressed("ui_accept"):
		if get_tree().get_nodes_in_group("lazeres").size() < 3:
			var lazer = PRE_LAZER.instance()
			lazeres.add_child(lazer)
			lazer.global_position = $blaster.global_position 
	
	translate(Vector2(dirX,dirY) * vel * delta)
	
	global_position.x = clamp(global_position.x , 21 , 139)
	global_position.y = clamp(global_position.y , 24 , 266)
