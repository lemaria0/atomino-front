// Funções do jogo, jogar uma peça por exemplo 

import 'package:flutter/material.dart';

import 'package:atomino/models/player.dart';
import 'package:atomino/models/domino_piece.dart';
import 'package:atomino/utils/results.dart';

import 'package:atomino/data/services/shared_preferences_service.dart';

/*
abstract class IGameRepository extends ChangeNotifier {
  Future<Result<void>> play();
}

class GameRepository extends IGameRepository {
  GameRepository({
    required SharedPreferencesService preferencesService,
  }) : _preferencesService = preferencesService;

  final SharedPreferencesService _preferencesService;

  // exemplo de função
  @override
  Future<Result<String>> play() async {
    try {
      final uidResult = await _preferencesService.getUserUid();
      switch (uidResult) {
        case Ok(value: final uid):
          return Result.ok(uid);
        case Error(error: final e):
          return Result.error(e);
      }
    } finally {
      notifyListeners();
    }
  }
}

*/