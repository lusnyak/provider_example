import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:provider_example/core/router/app_router.dart';
import 'package:provider_example/domain/news_model/news_model.dart';

class NewsProvider extends ChangeNotifier {
  NewsProvider() {
    debugPrint("NewsProvider constructor");
  }

  final TextEditingController _titleController = TextEditingController();

  TextEditingController get titleController => _titleController;

  final TextEditingController _descController = TextEditingController();

  TextEditingController get descController => _descController;

  final List<NewsModel> _newsList = <NewsModel>[];

  UnmodifiableListView<NewsModel> get newsList =>
      UnmodifiableListView(_newsList);

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool newValue) {
    _loading = newValue;
    notifyListeners();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void onBack() {
    _titleController.clear();
    _descController.clear();
    navigationStateKey.currentState?.pop();
  }

  void onSubmitData() {
    debugPrint(_titleController.text);
    debugPrint(_descController.text);
    if (_titleController.text.trim().isNotEmpty &&
        _descController.text.trim().isNotEmpty) {
      final news = NewsModel(
          title: _titleController.text.trim(),
          description: _descController.text.trim());
      _addNews(news);
    }
  }

  void removeNews(NewsModel news) {
    _newsList.remove(news);
    if(_newsList.isEmpty) {
      notifyListeners();
    }
  }
  Future<void> _addNews(NewsModel news) async {
    loading = true;
    Future.delayed(const Duration(seconds: 2), () {
      _newsList.add(news);
      notifyListeners();
      loading = false;
      onBack();
    });
  }
}
