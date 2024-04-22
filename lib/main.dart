import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/core/router/app_router.dart';
import 'package:provider_example/presentation/provider/news_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context, _) {
        return MaterialApp(
          title: 'Provider example changed',
          onGenerateRoute: onGenerateRoutes,
          initialRoute: AppRouter.newsListScreen,
          navigatorKey: navigationStateKey,
          theme: ThemeData(
            primaryColor: Colors.purple,
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.purple, foregroundColor: Colors.white),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
            useMaterial3: true,
          ),
        );
      }, create: (_) => NewsProvider(),
    );
  }
}
