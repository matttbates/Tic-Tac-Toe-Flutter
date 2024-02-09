import 'package:tictactoeflutter/tictactoe/cell_state.dart';
import 'package:tictactoeflutter/tictactoe/game.dart';
import 'package:tictactoeflutter/tictactoe/game_service.dart';

class GameViewModel {
  GameService gameService = Game();

  String get title {
    switch (gameService.getWinner()) {
      case CellState.X:
        return 'X wins!';
      case CellState.O:
        return 'O wins!';
      case CellState.empty:
        return '${gameService.getTurn().value} turn';
      case CellState.tie:
        return 'Tie!';
    }
  }

  List<List<String>> get board => gameService.getBoard().map((e) => e.map((e) => e.value).toList()).toList();

  void makeMove(int x, int y) {
    gameService.makeMove(x, y);
  }

  void startGame() {
    gameService.startGame();
  }
}
