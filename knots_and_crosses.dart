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

List<String?> SetPlayerNames(){
	List<String?>? players = [];
	for (var i=0 ;i < 2; i++){
		stdout.write("Enter player $i's name : ");
		players[i] = stdin.readLineSync(); 
	}
	return players;

}

void main(){
	var b1 = CreateBoard();
	DisplayBoard(b1);
	
}