extends "res://Pieces/Piece.gd"

func initConstants():
	TYPE = 'KING';
	BLACK_TEAM_TEXTURE = load("res://Sprites/Pieces/king.png")
	WHITE_TEAM_TEXTURE = load("res://Sprites/Pieces/white_king.png") 

func GetTargets(board):
	var targets = [];
	
	targets.append(Vector2(self.pos.x, self.pos.y-1))
	targets.append(Vector2(self.pos.x, self.pos.y+1))
	targets.append(Vector2(self.pos.x-1, self.pos.y))
	targets.append(Vector2(self.pos.x+1, self.pos.y))
	
	targets.append(Vector2(self.pos.x+1, self.pos.y+1))
	targets.append(Vector2(self.pos.x+1, self.pos.y-1))
	targets.append(Vector2(self.pos.x-1, self.pos.y+1))
	targets.append(Vector2(self.pos.x-1, self.pos.y-1))
	
	return targets;
