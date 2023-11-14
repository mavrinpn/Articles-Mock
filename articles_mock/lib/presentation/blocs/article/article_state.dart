part of 'article_bloc.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object?> get props => [];
}

class ArticleInitial extends ArticleState {
  @override
  List<Object?> get props => [];
}

class ArticleLoading extends ArticleState {
  @override
  List<Object?> get props => [];
}

class ArticleLoaded extends ArticleState {
  final ArticleEntity item;

  const ArticleLoaded({required this.item});

  @override
  List<Object?> get props => [item];
}

class ArticleError extends ArticleState {
  final String message;

  const ArticleError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
