import 'package:flutter/material.dart';
import 'package:tictactoeflutter/pages/game_page/game_viewmodel.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  GameViewModel gameViewModel = GameViewModel();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(gameViewModel.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            GameBoard(
              board: gameViewModel.board,
              onCellTap: (x, y) {
                gameViewModel.makeMove(x, y);
                setState(() {});
              },
            ),
            IconButton(
                onPressed: () {
                  gameViewModel.startGame();
                  setState(() {});
                },
                icon: const Icon(Icons.refresh, size: 48.0, color: Colors.white)
            ),
          ],
        ),
      ),
    );
  }
}

class GameBoard extends StatefulWidget {

  Function(int, int) onCellTap;
  List<List<String>> board;

  GameBoard({super.key, required this.board, required this.onCellTap});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: widget.board.asMap().entries.map((e) => [
          if (e.key == 0) null else const Divider(height: 1.0, color: Colors.white),
          _buildRow(e.key, e.value),
        ]).expand((element) => element).nonNulls.toList()
    );
  }

  Widget _buildRow(int x, List<String> row) {
    return IntrinsicHeight(
      child: Row(
        children: row.asMap().entries.map((e) => [
            if (e.key == 0) null else Container(width: 1.0, color: Colors.white),
            _buildCell(x, e.key, e.value),
        ]).expand((element) => element).nonNulls.toList(),
      ),
    );
  }

  Widget _buildCell(int x, int y, String value) {
    return Expanded(
      child: InkWell(
        onTap: () {
          widget.onCellTap(x, y);
        },
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            color: Colors.grey[900],
            alignment: Alignment.center,
            child: Text(value,
              style: TextStyle(
                  color: value == 'X' ? Colors.red : Colors.blue,
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}
