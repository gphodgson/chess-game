extends "res://Pieces/Piece.gd"

func initConstants():
	TYPE = 'KNIGHT';
	BLACK_TEAM_TEXTURE = load("res://Sprites/Pieces/knight.png")
	WHITE_TEAM_TEXTURE = load("res://Sprites/Pieces/white_knight.png") 

func GetTargets(board):
	var targets = [];
	
	#north
	targets.append(Vector2(self.pos.x - 1, self.pos.y - 2));
	targets.append(Vector2(self.pos.x + 1, self.pos.y - 2));
	
	#south
	targets.append(Vector2(self.pos.x - 1, self.pos.y + 2));
	targets.append(Vector2(self.pos.x + 1, self.pos.y + 2));
	
	#west
	targets.append(Vector2(self.pos.x - 2, self.pos.y + 1));
	targets.append(Vector2(self.pos.x - 2, self.pos.y - 1));
	
	#east
	targets.append(Vector2(self.pos.x + 2, self.pos.y + 1));
	targets.append(Vector2(self.pos.x + 2, self.pos.y - 1));
	
	return targets;
