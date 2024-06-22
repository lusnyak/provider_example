import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_example/presentation/screens/news/cubit/news_cubit.dart';

import '../../../core/router/app_router.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsCubit()..initialValues(),
      child: const NewsListView(),
    );
  }
}

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => onPressedFloatingButton(context.read<NewsCubit>()),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
          child: BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
        if (state is NewsStateEmptyList) {
          return const Center(
            child: Text(
              "You have no any news",
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        if (state is NewsStateFullList) {
          final news = state.news;
          return ListView.separated(
              itemBuilder: (c, index) {
                final newsModel = news[index];
                return Dismissible(
                  // crossAxisEndOffset: 10.0,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: const Text(
                      "Remove",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  key: Key(newsModel.title),
                  onDismissed: (_) {
                    // provider.removeNews(news);
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(newsModel.title),
                      subtitle: Text(newsModel.description),
                    ),
                  ),
                );
              },
              separatorBuilder: (c, index) => const SizedBox(
                    height: 16.0,
                  ),
              itemCount: news.length);
        }
        return Container(
          color: Colors.amber,
        );
      })),
    );
  }

  void onPressedFloatingButton(NewsCubit cubit) {
    debugPrint("onPressedFloatingButton");
    navigationStateKey.currentState
        ?.pushNamed(AppRouter.addNewsScreen, arguments: cubit);
  }
}
