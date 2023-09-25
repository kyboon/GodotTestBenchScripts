extends Node

class_name GridGD

var grid: Array[NodeGD]
var grid_size_x: int = 44
var grid_size_y: int = 31

func setup(_grid_size_x: int, _grid_size_y: int):
	grid_size_x = _grid_size_x
	grid_size_y = _grid_size_y
	create_grid()
	
func create_grid():
	var nodeClass = load("res://TestSubjects/Pathfinding/GD/NodeGD.gd")
	grid.resize(grid_size_x * grid_size_y)
	for x in grid_size_x:
		for y in grid_size_y:
			var nodeInstance = nodeClass.new()
			nodeInstance.grid_pos = Vector2i(x, y)
			grid[x + y * grid_size_x] = nodeInstance
			
func set_walkable(x: int, y: int, walkable: bool):
	grid[x + y * grid_size_x].walkable = walkable
	
func clear_walkable():
	for x in grid_size_x:
		for y in grid_size_y:
			grid[x + y * grid_size_x].walkable = true

func get_neighbours(node_gd: NodeGD):
	var neighbours: Array[NodeGD] = []
	for x in range(-1, 2):
		for y in range(-1, 2):
			if x == 0 && y == 0:
				continue
			var checkX: int = node_gd.grid_pos.x + x
			var checkY: int = node_gd.grid_pos.y + y
			
			if checkX >= 0 && checkX < grid_size_x && checkY >= 0 && checkY < grid_size_y:
				neighbours.append(grid[checkX + checkY * grid_size_x])
	return neighbours
	
func get_nodeGD(pos: Vector2i):
	return grid[pos.x + pos.y * grid_size_x]
