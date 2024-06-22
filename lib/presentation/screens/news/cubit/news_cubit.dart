import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/app_router.dart';
import '../../../../domain/news_model/news_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsStateInitial());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  void initialValues(){
    emit(NewsStateEmptyList());
  }

  void onBack(){
    titleController.clear();
    descController.clear();
    navigationStateKey.currentState?.pop();
  }

  void onSubmitData(){
    debugPrint(titleController.text);
    debugPrint(descController.text);
    if (titleController.text.trim().isNotEmpty &&
        descController.text.trim().isNotEmpty) {
      final news = NewsModel(
          title: titleController.text.trim(),
          description: descController.text.trim());
      _addNews(news);
    }
  }

  Future<void> _addNews(NewsModel news) async {
    // loading = true;
    List<NewsModel> copyNews = <NewsModel>[];
    if(state is NewsStateFullList) {
      copyNews = [...(state as NewsStateFullList).news];
    }

    emit(NewsStateAddNewLoading());

    await Future.delayed(const Duration(seconds: 2), () {
      // emit(NewsStateFullList(const <NewsModel>[]));
      // final copyNews = [...(state as NewsStateFullList).news];

      copyNews.add(news);
      emit(NewsStateFullList(copyNews));
      // _newsList.add(news);
      // notifyListeners();
      // loading = false;
      onBack();
    });
  }
}