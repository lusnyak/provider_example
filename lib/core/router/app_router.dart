import 'package:flutter/material.dart';
// import 'package:provider_example/presentation/screens/add_news_screen.dart';
import 'package:provider_example/presentation/screens/news/cubit/news_cubit.dart';
import 'package:provider_example/presentation/screens/news_screen.dart';

import '../../presentation/screens/news/add_news_page.dart';
import '../../presentation/screens/news/news_list_page.dart';

abstract class AppRouter {
  static const String newsListScreen = "/news_list";
  static const String addNewsScreen = "/add_news";
  static const String newsScreen = "/news";
}

GlobalKey<NavigatorState> navigationStateKey = GlobalKey<NavigatorState>();

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRouter.newsListScreen:
      return MaterialPageRoute(
          builder: (_) => const NewsListPage(), settings: settings);
    case AppRouter.addNewsScreen:
      return MaterialPageRoute(
          builder: (_) => AddNewsPage(
                cubit: settings.arguments as NewsCubit,
              ),
          settings: settings);
    case AppRouter.newsScreen:
      return MaterialPageRoute(
          builder: (_) => const NewsScreen(), settings: settings);
  }
  return null;
}
