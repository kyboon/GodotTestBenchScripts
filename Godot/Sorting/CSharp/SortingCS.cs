using Godot;
using System;

public partial class SortingCS : Sprite2D
{
	int[] array;
	int n = 100;
	bool flipped = false;
	bool should_flip = true;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		array = new int[n];
		for (int i = 0; i < array.Length; i++) {
			array[i] = i;
		}
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		Array.Sort(array);
		if (flipped)
			Array.Reverse(array);
		if (should_flip)
			flipped = !flipped;
	}
}
