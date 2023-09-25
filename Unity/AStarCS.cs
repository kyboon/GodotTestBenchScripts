using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class AStarCS
{
	GridCS grid;

	public AStarCS(int _gridSizeX, int _gridSizeY)
	{
		grid = new GridCS(_gridSizeX, _gridSizeY);
	}

	public List<Vector2Int> FindPath(Vector2Int startPos, Vector2Int targetPos) {
		NodeCS startNode = grid.NodeById(startPos);
		NodeCS targetNode = grid.NodeById(targetPos);

		List<NodeCS> openSet = new List<NodeCS>();
		HashSet<NodeCS> closedSet = new HashSet<NodeCS>();
		openSet.Add(startNode);

		while (openSet.Count > 0) {
			NodeCS node = openSet[0];
			for (int i = 1; i < openSet.Count; i ++) {
				if (openSet[i].fCost < node.fCost || openSet[i].fCost == node.fCost) {
					if (openSet[i].hCost < node.hCost)
						node = openSet[i];
				}
			}

			openSet.Remove(node);
			closedSet.Add(node);

			if (node == targetNode) {
				return RetracePath(startNode,targetNode);
			}

			foreach (NodeCS neighbour in grid.GetNeighbours(node)) {
				if (!neighbour.walkable || closedSet.Contains(neighbour)) {
					continue;
				}

				int newCostToNeighbour = node.gCost + GetDistance(node, neighbour);
				if (newCostToNeighbour < neighbour.gCost || !openSet.Contains(neighbour)) {
					neighbour.gCost = newCostToNeighbour;
					neighbour.hCost = GetDistance(neighbour, targetNode);
					neighbour.parent = node;

					if (!openSet.Contains(neighbour))
						openSet.Add(neighbour);
				}
			}
		}
		return null;
	}

	List<Vector2Int> RetracePath(NodeCS startNode, NodeCS endNode) {
		List<Vector2Int> path = new List<Vector2Int>();
		NodeCS currentNode = endNode;

		while (currentNode != startNode) {
			path.Add(new Vector2Int(currentNode.gridX, currentNode.gridY));
			currentNode = currentNode.parent;
		}
		path.Add(new Vector2Int(currentNode.gridX, currentNode.gridY));
		path.Reverse();
		return path;
	}

	int GetDistance(NodeCS nodeA, NodeCS nodeB) {
		int dstX = Mathf.Abs(nodeA.gridX - nodeB.gridX);
		int dstY = Mathf.Abs(nodeA.gridY - nodeB.gridY);

		if (dstX > dstY)
			return 14*dstY + 10* (dstX-dstY);
		return 14*dstX + 10 * (dstY-dstX);
	}
}
