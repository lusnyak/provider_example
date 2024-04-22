import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_example/presentation/screens/add_news_screen.dart';
import 'package:provider_example/presentation/screens/news_list_screen.dart';
import 'package:provider_example/presentation/screens/news_screen.dart';

abstract class AppRouter {
  static const String newsListScreen = "/news_list";
  static const String addNewsScreen = "/add_news";
  static const String newsScreen = "/news";
}

GlobalKey<NavigatorState> navigationStateKey = GlobalKey<NavigatorState>();

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRouter.newsListScreen:
      return MaterialPageRoute(builder: (_) => const NewsListScreen(), settings: settings);
    case AppRouter.addNewsScreen:
      return MaterialPageRoute(builder: (_) => const AddNewsScreen(), settings: settings);
    case AppRouter.newsScreen:
      return MaterialPageRoute(builder: (_) => const NewsScreen(), settings: settings);
  }
  return null;
}
