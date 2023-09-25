using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NodeCS {
	
	public bool walkable;
	public int gridX;
	public int gridY;

	public int gCost;
	public int hCost;
	public NodeCS parent;
	
	public NodeCS(bool _walkable, int _gridX, int _gridY) {
		walkable = _walkable;
		gridX = _gridX;
		gridY = _gridY;
	}

	public int fCost {
		get {
			return gCost + hCost;
		}
	}
}
