import 'package:articles_mock/business/entities/article_entity.dart';
import 'package:articles_mock/business/usecases/articles_usecases.dart';
import 'package:articles_mock/core/helpers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArtilceById getArtilceById;

  ArticleBloc({required this.getArtilceById}) : super(ArticleInitial()) {
    on<LoadArticleEvent>((event, emit) async {
      emit(ArticleLoading());
      await loadItem(event, emit, event.articleId);
    });
  }

  Future<void> loadItem(event, emit, int articleId) async {
    final failureOrItem = await getArtilceById(articleId);
    failureOrItem.fold((failure) {
      emit(ArticleError(message: mapFailureToMessage(failure)));
    }, (item) {
      emit(ArticleLoaded(item: item));
    });
  }
}
