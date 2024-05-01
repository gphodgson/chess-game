extends "res://Pieces/Piece.gd"

func initConstants():
	TYPE = 'QUEEN';
	BLACK_TEAM_TEXTURE = load("res://Sprites/Pieces/queen.png")
	WHITE_TEAM_TEXTURE = load("res://Sprites/Pieces/white_queen.png") 

func GetTargets(board):
	var targets = [];

	var x = 0;
	var y = 0;
	
	#north
	y = self.pos.y - 1;
	while y >= 0:
		targets.append(Vector2(self.pos.x, y))
		var pieceAtCell = board[self.pos.x][y].piece;
		if(pieceAtCell.TYPE != 'EMPTY'):
			y = -1
		y -= 1;
		
	#east
	y = self.pos.y + 1;
	while y <= 7:
		targets.append(Vector2(self.pos.x, y))
		var pieceAtCell = board[self.pos.x][y].piece;
		if(pieceAtCell.TYPE != 'EMPTY'):
			y = 9
		y += 1;
	
	#west
	x = self.pos.x - 1;
	while x >= 0:
		targets.append(Vector2(x, self.pos.y))
		var pieceAtCell = board[x][self.pos.y].piece;
		if(pieceAtCell.TYPE != 'EMPTY'):
			x = -1
		x -= 1;
		
	#east
	x = self.pos.x + 1;
	while x <= 7:
		targets.append(Vector2(x, self.pos.y))
		var pieceAtCell = board[x][self.pos.y].piece;
		if(pieceAtCell.TYPE != 'EMPTY'):
			x = 9
		x += 1;
	
	#nw
	x = self.pos.x - 1;
	y = self.pos.y - 1;
	
	while x >= 0 and y >= 0:
		targets.append(Vector2(x, y))
		var pieceAtCell = board[x][y].piece
		if(pieceAtCell.TYPE != 'EMPTY'):
			x = -1
			y = -1
		y -= 1;
		x -= 1;
	
	#ne
	x = self.pos.x + 1;
	y = self.pos.y - 1;
	
	while x <= 7 and y >= 0:
		targets.append(Vector2(x, y))
		var pieceAtCell = board[x][y].piece
		if(pieceAtCell.TYPE != 'EMPTY'):
			x = 9
			y = -1
		y -= 1;
		x += 1;
	
	#sw
	x = self.pos.x - 1;
	y = self.pos.y + 1;
	
	while x >= 0 and y <= 7:
		targets.append(Vector2(x, y))
		var pieceAtCell = board[x][y].piece
		if(pieceAtCell.TYPE != 'EMPTY'):
			x = -1
			y = 9
		y += 1;
		x -= 1;
	
	#se
	x = self.pos.x + 1;
	y = self.pos.y + 1;
	
	while x <= 7 and y <= 7:
		targets.append(Vector2(x, y))
		var pieceAtCell = board[x][y].piece
		if(pieceAtCell.TYPE != 'EMPTY'):
			x = 9
			y = 9
		y += 1;
		x += 1;
	
		
	return targets;
