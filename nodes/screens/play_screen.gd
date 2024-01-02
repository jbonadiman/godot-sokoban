extends GameScreen

@onready var _tiles := $Center/Stage/Tiles as TileMap
@onready var _nodes := $Center/Stage/Nodes as Node2D

func _ready() -> void:
	var i := 0
	var level: GameLevel = Variables.current_level
	var half: float = floor(level.width / 2.0)
	var remainder := level.width % 2
	Variables.total_crates = 0
	Variables.covered_crates = 0

	for y in range(-half - remainder, half):
		for x in range(-half - remainder, half):
			var current_tile = level.layout[i]
			if Types.tile_coordinates.has(current_tile):
				#print("setting tile at ", x, " ", y, " to ", Types.tile_coordinates[current_tile])
				_tiles.set_cell(
					0,
					Vector2i(x, y),
					2,
					Types.tile_coordinates[current_tile])
			if Constants.node_scenes.has(current_tile):
				var new_node = Constants.node_scenes[current_tile].instantiate()
				_nodes.add_child(new_node)
				new_node.position = Vector2(x * 64, y * 64)
			if current_tile == Types.blocks.crate:
				Variables.total_crates += 1

			i += 1
