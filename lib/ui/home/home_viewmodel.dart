import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {

  HomeViewModel(
    //{required IGameRepository gameRepository,}
  ); //: _gameRepository = gameRepository,

  //final IGmaeRepository _gameRepository;

  bool startGame({
    required String player1,
    required String player2,
  }) {
    return player1.trim().isNotEmpty && player2.trim().isNotEmpty;
  }
}
