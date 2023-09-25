using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GridCS
{
	NodeCS[,] grid;
	int gridSizeX = 44;
	int gridSizeY = 31;

	public GridCS(int _gridSizeX, int _gridSizeY) {
		gridSizeX = _gridSizeX;
		gridSizeY = _gridSizeY;
		CreateGrid();
	}

	void CreateGrid() {
		grid = new NodeCS[gridSizeX, gridSizeY];
		for (int x = 0; x < gridSizeX; x++) {
			for (int y = 0; y < gridSizeY; y++) {
				grid[x, y] = new NodeCS(true, x, y);
			}
		}
	}
	public void setWalkable(int x, int y, bool walkable) {
		grid[x, y].walkable = walkable;
	}

	public void clearWalkable() {
		for (int x = 0; x < gridSizeX; x++) {
			for (int y = 0; y < gridSizeY; y++) {
				grid[x, y].walkable = true;
			}
		}
	}

	public List<NodeCS> GetNeighbours(NodeCS node) {
		List<NodeCS> neighbours = new List<NodeCS>();

		for (int x = -1; x <= 1; x++) {
			for (int y = -1; y <= 1; y++) {
				if (x == 0 && y == 0)
					continue;

				int checkX = node.gridX + x;
				int checkY = node.gridY + y;

				if (checkX >= 0 && checkX < gridSizeX && checkY >= 0 && checkY < gridSizeY) {
					neighbours.Add(grid[checkX,checkY]);
				}
			}
		}

		return neighbours;
	}

	public NodeCS NodeById(Vector2Int id) {
		return grid[id.x, id.y];
	}
}
