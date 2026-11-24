import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Routes
import 'package:atomino/config/routes.dart';

// Services

// Repositories
import 'package:atomino/data/repositories/game_repository.dart';

// First Page - Home Page
import 'package:atomino/ui/home/home_page.dart';
import 'package:atomino/ui/home/home_viewmodel.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider( //Multiprovider
      //providers: [
        //Provider(create: (context) => SharedPreferencesService()),
        /*ChangeNotifierProvider(
          create: (context) => GameRepository(
            preferencesService: context.read(),
          ),
        ),*/
      //],
      create: (BuildContext context) {},
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(
              viewModel: HomeViewModel(
                //gameRepository: context.read<GameRepository>(),
              ),
            ),
            routes: appRoutes,
          );
        },
      ),
    );
  }
}
