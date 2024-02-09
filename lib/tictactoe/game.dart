import 'package:tictactoeflutter/tictactoe/board.dart';
import 'package:tictactoeflutter/tictactoe/cell_state.dart';
import 'package:tictactoeflutter/tictactoe/game_service.dart';

class Game implements GameService{

  Board _board = Board();

  @override
  void startGame() {
    _board = Board();
  }

  @override
  void makeMove(int x, int y) {
    _board.makeMove(x, y);
    _board.checkWinner();
  }

  @override
  List<List<CellState>> getBoard() {
    return _board.getBoard();
  }

  @override
  CellState getTurn() {
    return _board.getTurn();
  }

  @override
  CellState getWinner() {
    return _board.getWinner();
  }

}