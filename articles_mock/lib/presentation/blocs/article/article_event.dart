part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object?> get props => [];
}

class LoadArticleEvent extends ArticleEvent {
  final int articleId;
  const LoadArticleEvent({required this.articleId});

  @override
  List<Object?> get props => [];
}
