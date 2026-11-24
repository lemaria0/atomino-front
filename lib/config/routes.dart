import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Pages
import 'package:atomino/ui/home/home_page.dart';

// View Models
import 'package:atomino/ui/home/home_viewmodel.dart';

// Repositories
import 'package:atomino/data/repositories/game_repository.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  
  '/home': (context) => HomePage(
    viewModel: HomeViewModel(
      //gameRepository: context.read<GameRepository>(),
    ),
  ),
};