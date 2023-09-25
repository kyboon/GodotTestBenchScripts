extends Node

class_name AStarGD

var grid: GridGD

func setup(_grid_size_x: int, _grid_size_y: int):
	var gridClass = load("res://TestSubjects/Pathfinding/GD/GridGD.gd")
	grid = gridClass.new()
	grid.setup(_grid_size_x, _grid_size_y)
	
func get_id_path(start_pos: Vector2i, target_pos: Vector2i) -> Array[Vector2i]:
	var start_node: NodeGD = grid.get_nodeGD(start_pos)
	var target_node: NodeGD = grid.get_nodeGD(target_pos)
	
	var openSet: Array[NodeGD] = []
	var closedSet: Array[NodeGD] = []
	openSet.append(start_node)
	
	while openSet.size() > 0:
		var node: NodeGD = openSet[0]
		var nodeIndexToClose: int = 0
		
		for i in range(1, openSet.size()):
			if openSet[i].f_cost() <= node.f_cost():
				if openSet[i].h_cost < node.h_cost:
					node = openSet[i]
					nodeIndexToClose = i
		
		closedSet.append(node)
		openSet.remove_at(nodeIndexToClose)
		
		if node == target_node:
			return retrace_path(start_node, target_node)
			
		var neighbours: Array[NodeGD] = grid.get_neighbours(node)
		
		for i in neighbours.size():
			if !neighbours[i].walkable || closedSet.has(neighbours[i]):
				continue
			
			var new_cost_to_neigh: int = node.g_cost + get_distance(node, neighbours[i])
			if new_cost_to_neigh < neighbours[i].g_cost || !openSet.has(neighbours[i]):
				neighbours[i].g_cost = new_cost_to_neigh
				neighbours[i].h_cost = get_distance(neighbours[i], target_node)
				neighbours[i].parent = node
				
				if !openSet.has(neighbours[i]):
					openSet.append(neighbours[i])
	return []
		
	
func retrace_path(start_node, target_node) -> Array[Vector2i]:
	var path: Array[Vector2i] = []
	var current_node: NodeGD = target_node
	
	while current_node != start_node:
		path.append(Vector2i(current_node.grid_pos.x, current_node.grid_pos.y))
		current_node = current_node.parent
	path.append(Vector2i(current_node.grid_pos.x, current_node.grid_pos.y))
		
	path.reverse()
	return path
	
func get_distance(nodeA: NodeGD, nodeB: NodeGD) -> int:
	var dstX: int = abs(nodeA.grid_pos.x - nodeB.grid_pos.x)
	var dstY: int = abs(nodeA.grid_pos.y - nodeB.grid_pos.y)

	if dstX > dstY:
		return 14*dstY + 10* (dstX-dstY);
	return 14*dstX + 10 * (dstY-dstX);
	
func clear_walkable():
	grid.clear_walkable()
	
func set_walkable(pos: Vector2i, walkable: bool):
	grid.set_walkable(pos.x, pos.y, walkable)
