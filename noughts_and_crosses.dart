/// A 2 player CLI knots and crosses game written in dart
/// Anirudh Koteshwar
/// 11-1-2023

import "dart:io";

List<List<String>> CreateBoard(){
	var Board = [
		['1','2','3'],
		['4','5','6'],
		['7','8','9']
	];
	return Board;
}

void DisplayBoard(List<List<String>> Board){
	for (var i = 0; i < 3; i++){
		for (var j = 0; j < 3; j++){
			(j<2) ? stdout.write('${Board[i][j]} | ') : stdout.write('${Board[i][j]}\n');				
		}
		if (i<2){
			stdout.write('----------\n');
			
		}
	}
}

List<String> SetPlayerNames(){
	List<String> players = ['player1','player2'];
	for (var i=0 ;i < 2; i++){
		stdout.write("Enter player ${i+1}'s name : ");
		String? s = stdin.readLineSync();
		if (s != null){
		players[i] = s; 
		}
	}
	return players;
}

void PlayMove(int player, List<List<String>> board, List<String> sign, List<String> players, List<int?> moves){
    stdout.write("Enter square which player ${players[player]} has selected : ");
    String? s = stdin.readLineSync();
    int selected = 0;
    if (s != null){
    selected = int.parse(s);
    }
    if (selected > 0 && selected < 10){
    int row = (selected-1)~/3;
    int element = (selected-1)%3;
    
    if (moves.contains(selected)){ 
    print("Invalid Square");
    PlayMove(player, board, sign, players, moves);
    }
    else {
    board[row][element] = sign[player];
    moves.add(selected);
    }
    }
    else {
    print("Invalid Square");
    PlayMove(player, board, sign, players, moves);
    }
}


String CheckWin(List<List<String>> board){
	for (int i = 0; i < 3; i++){
		if (board[i][0] == board[i][1] && board[i][0] == board[i][2]){
			return board[i][0];
		}
		else if (board[0][i] == board[1][i] && board[0][i] == board[2][i]){
			return board[0][i];
		}
		else if (board[0][0] == board[1][1] && board[0][0] == board[2][2]){
			return board[0][0];
		}
		else if (board[0][2] == board[1][1] && board[0][2] == board[2][0]){
			return board[0][2];
		}
	}
	return "None";
}

void main(){

	List<String> signs = ['O','X'];
	List<int?> moves = [];
	int current_player = 1;
	var b1 = CreateBoard();
	List<String> players = SetPlayerNames();
	print("\n");
	while(true){
		DisplayBoard(b1);
		print("");
		if (current_player == 3){current_player = 1;}; 
		PlayMove(current_player-1, b1, signs, players, moves);
		if (CheckWin(b1) == 'X'){
      print(Process.runSync("clear", [], runInShell: true).stdout);
      DisplayBoard(b1);
      print("\n");
			print("${players[1]} Wins!");
			exit(0);
		}
		else if (CheckWin(b1) == 'O'){
      print(Process.runSync("clear", [], runInShell: true).stdout);
      DisplayBoard(b1);
      print("\n");
			print("${players[0]} Wins!");
			exit(0);
		}
	 	current_player++;
		print(Process.runSync("clear", [], runInShell: true).stdout);
	}	
}

/* on RangeError {
			print(Process.runSync("clear", [], runInShell: true).stdout);
			print("Player has chosen non-existant square. Please try again.");
			print("\n");
			DisplayBoard(b1);
			print('');
			PlayMove(current_player, b1, signs, players, moves);
		}
*/
