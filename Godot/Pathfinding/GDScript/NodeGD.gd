extends Object

class_name NodeGD

var walkable: bool = true
var grid_pos: Vector2i = Vector2i.ZERO
var g_cost: int = 0
var h_cost: int = 0
var parent: NodeGD

func f_cost():
	return g_cost + h_cost
