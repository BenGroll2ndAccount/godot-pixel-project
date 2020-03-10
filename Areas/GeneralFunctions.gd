extends Node

var Spawnpoints = {
	standard = Vector2(50,50)
	}
	
func init(spawnpoint):
	spawn_player(Spawnpoints[spawnpoint])
	
	

func spawn_player(spawnpoint):
	var Player = preload("res://Players/Player.tscn").instance()
	$YSort.add_child(Player)
	Player.position = spawnpoint
	GeneralPlayerUI.Player = Player
