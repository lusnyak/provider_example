part of 'news_cubit.dart';

sealed class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class NewsStateInitial extends NewsState {}

final class NewsStateEmptyList extends NewsState {}

final class NewsStateAddNewLoading extends NewsState {}

final class NewsStateFullList extends NewsState {
  final List<NewsModel> news;
  NewsStateFullList(this.news);

  @override
  List<Object?> get props => [news];
}



