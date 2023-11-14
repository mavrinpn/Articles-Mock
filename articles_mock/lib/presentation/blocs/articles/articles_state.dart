part of 'articles_bloc.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object?> get props => [];
}

class ArticlesInitial extends ArticlesState {
  @override
  List<Object?> get props => [];
}

class ArticlesLoading extends ArticlesState {
  @override
  List<Object?> get props => [];
}

class ArticlesLoaded extends ArticlesState {
  final List<ArticleEntity> items;

  const ArticlesLoaded({required this.items});

  @override
  List<Object?> get props => [items];
}

class ArticlesError extends ArticlesState {
  final String message;

  const ArticlesError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
