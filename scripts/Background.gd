extends Sprite

onready var nave = get_node("../ship")

func _ready():
	pass



func _process(delta):
	material.set_shader_param("des" , (nave.global_position.x - 80) * 0.002 )


