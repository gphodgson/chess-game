extends "res://Pieces/Piece.gd"

func initConstants():
	TYPE = 'PAWN';
	BLACK_TEAM_TEXTURE = load("res://Sprites/Pieces/pawn.png")
	WHITE_TEAM_TEXTURE = load("res://Sprites/Pieces/white_pawn.png") 

func GetAvailableMoves():
	var board = get_parent().get_parent().board;
	var moves = [];
	if (self.team == 'white'):
		#NW piece check
		if(self.pos.x-1 >=0 and self.pos.y-1 >= 0):
			var nwPiece = board[self.pos.x-1][self.pos.y-1].piece;
			if(nwPiece.TYPE != 'EMPTY' and nwPiece.team != self.team):
				moves.append(Vector2(self.pos.x-1, self.pos.y-1));
		
		#NE piece check
		if(self.pos.x+1 <= 7 and self.pos.y-1 >= 0):
			var nePiece = board[self.pos.x+1][self.pos.y-1].piece;
			if(nePiece.TYPE != 'EMPTY'  and nePiece.team != self.team):
				moves.append(Vector2(self.pos.x+1, self.pos.y-1));
		
		if(self.pos.y - 1 >= 0):
			moves.append(Vector2(self.pos.x, self.pos.y-1));
		if(!hasMoved and self.pos.y - 2 >= 0):
			moves.append(Vector2(self.pos.x, self.pos.y-2));
	else:
		
		#SW piece check
		if(self.pos.x-1 >=0 and self.pos.y+1 <= 7):
			var swPiece = board[self.pos.x-1][self.pos.y+1].piece;
			if(swPiece.TYPE != 'EMPTY' and swPiece.team != self.team):
				moves.append(Vector2(self.pos.x-1, self.pos.y+1));
		
		#SE piece check
		if(self.pos.x+1 <= 7 and self.pos.y+1 <= 7):
			var sePiece = board[self.pos.x+1][self.pos.y+1].piece;
			if(sePiece.TYPE != 'EMPTY' and sePiece.team != self.team):
				moves.append(Vector2(self.pos.x+1, self.pos.y+1));
		
		if(self.pos.y + 1 <= 7):
			moves.append(Vector2(self.pos.x, self.pos.y+1));
		if(!hasMoved and self.pos.y + 2 <= 7):
			moves.append(Vector2(self.pos.x, self.pos.y+2));
	
	moves.append(self.pos);
	return moves;
