import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/core/router/app_router.dart';
import 'package:provider_example/presentation/provider/news_provider.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressedFloatingButton,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Consumer<NewsProvider>(builder: (context, provider, _) {
          if (provider.newsList.isEmpty) {
            return const Center(child: Text("You have no any news"),);
          }
          return ListView.separated(
              itemBuilder: (c, index) {
                final news = provider.newsList[index];
                return Dismissible(
                  // crossAxisEndOffset: 10.0,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: const Text("Remove", style: TextStyle(color: Colors.white),),
                  ),
                  key: Key(news.title),
                  onDismissed: (_){
                      provider.removeNews(news);
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(news.title),
                      subtitle: Text(news.description),
                    ),
                  ),
                );
              },
              separatorBuilder: (c, index) =>
              const SizedBox(
                height: 16.0,
              ),
              itemCount: provider.newsList.length);
        }),
      ),
    );
  }

  void onPressedFloatingButton() {
    debugPrint("onPressedFloatingButton");
    navigationStateKey.currentState?.pushNamed(AppRouter.addNewsScreen);
  }
}
