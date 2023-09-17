import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AssetImage crossImg = const AssetImage('assets/images/cross.png');
  AssetImage circleImg = const AssetImage('assets/images/circle.png');
  AssetImage editImg = const AssetImage('assets/images/edit.png');
  AssetImage resetImg = const AssetImage('assets/images/reset.jpg');

  bool isCross = true;
  late String message;
  late List<String> gameState;

  @override
  void initState() {
    super.initState();
    gameState = [
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
    ];
    message = '';
  }

  resetGame() {
    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      message = '';
    });
  }

  getImage(String value) {
    switch (value) {
      case ('empty'):
        return editImg;
      case ('cross'):
        return crossImg;
      case ('circle'):
        return circleImg;
      default:
    }
  }

  playGame(int index) {
    if (gameState[index] == "empty") {
      setState(() {
        if (isCross) {
          gameState[index] = "cross";
        } else {
          gameState[index] = "circle";
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

  checkWin() {
    if (gameState[0] != "empty" &&
        gameState[0] == gameState[1] &&
        gameState[1] == gameState[2]) {
      setState(() {
        message = '${gameState[0]} Wins';
        Future.delayed(const Duration(seconds: 3), () => resetGame());
      });
    } else if (gameState[3] != "empty" &&
        gameState[3] == gameState[4] &&
        gameState[4] == gameState[5]) {
      setState(() {
        message = '${gameState[3]} Wins';
        Future.delayed(const Duration(seconds: 3), () => resetGame());
      });
    } else if (gameState[6] != "empty" &&
        gameState[6] == gameState[7] &&
        gameState[7] == gameState[8]) {
      setState(() {
        message = '${gameState[6]} Wins';
        Future.delayed(const Duration(seconds: 3), () => resetGame());
      });
    } else if (gameState[0] != "empty" &&
        gameState[0] == gameState[3] &&
        gameState[3] == gameState[6]) {
      setState(() {
        message = '${gameState[0]} Wins';
        Future.delayed(const Duration(seconds: 3), () => resetGame());
      });
    } else if (gameState[1] != "empty" &&
        gameState[1] == gameState[4] &&
        gameState[4] == gameState[7]) {
      setState(() {
        message = '${gameState[1]} Wins';
        Future.delayed(const Duration(seconds: 3), () => resetGame());
      });
    } else if (gameState[2] != "empty" &&
        gameState[2] == gameState[5] &&
        gameState[5] == gameState[8]) {
      setState(() {
        message = '${gameState[2]} Wins';
        Future.delayed(const Duration(seconds: 3), () => resetGame());
      });
    } else if (gameState[0] != "empty" &&
        gameState[0] == gameState[4] &&
        gameState[4] == gameState[8]) {
      setState(() {
        message = '${gameState[0]} Wins';
        Future.delayed(const Duration(seconds: 3), () => resetGame());
      });
    } else if (gameState[2] != "empty" &&
        gameState[2] == gameState[4] &&
        gameState[4] == gameState[6]) {
      setState(() {
        message = '${gameState[2]} Wins';
        Future.delayed(const Duration(seconds: 3), () => resetGame());
      });
    } else if (!gameState.contains('empty')) {
      message = 'Game Draw';
      Future.delayed(const Duration(seconds: 3), () => resetGame());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0),
            itemCount: gameState.length,
            itemBuilder: (context, index) => SizedBox(
              width: 100.0,
              height: 100.0,
              child: MaterialButton(
                onPressed: () {
                  playGame(index);
                },
                child: Image(image: getImage(gameState[index])),
              ),
            ),
          ),
        ),
        SizedBox(
            height: 100.0,
            width: 100.0,
            child: Text(
              message,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 100.0,
          width: 100.0,
          child: MaterialButton(
            onPressed: resetGame,
            child: Image(image: resetImg),
          ),
        ),
      ],
    );
  }
}
