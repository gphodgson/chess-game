extends "res://Pieces/Piece.gd"

func initConstants():
	TYPE = 'EMPTY';
	BLACK_TEAM_TEXTURE = load("res://Sprites/Pieces/empty.png")
	WHITE_TEAM_TEXTURE = load("res://Sprites/Pieces/empty.png") 

func GetAvailableMoves():
	return [self.pos];
	
