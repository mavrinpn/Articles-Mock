part of 'articles_bloc.dart';

abstract class ArticlesEvent extends Equatable {
  const ArticlesEvent();

  @override
  List<Object?> get props => [];
}

class LoadArticlesEvent extends ArticlesEvent {
  const LoadArticlesEvent();

  @override
  List<Object?> get props => [];
}


class UpdateArticlesEvent extends ArticlesEvent {
  const UpdateArticlesEvent();

  @override
  List<Object?> get props => [];
}
