import 'package:articles_mock/business/entities/article_entity.dart';
import 'package:articles_mock/business/usecases/articles_usecases.dart';
import 'package:articles_mock/core/error/failure.dart';
import 'package:articles_mock/core/helpers.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final GetArtilcesList getArtilcesList;

  ArticlesBloc({required this.getArtilcesList}) : super(ArticlesInitial()) {
    on<LoadArticlesEvent>((event, emit) async {
      emit(ArticlesLoading());
      await loadItems(event, emit);
    });

    on<UpdateArticlesEvent>((event, emit) async {
      emit(ArticlesLoading());
      await loadItems(event, emit);
    });
  }

  Future<void> loadItems(event, emit) async {
    final failureOrItems = await getArtilcesList();
    failureOrItems.fold((failure) {
      emit(ArticlesError(message: mapFailureToMessage(failure)));
    }, (items) {
      emit(ArticlesLoaded(items: items));
    });
  }

  void failureOrDone(Either<Failure, void> failureOrDone, emit) {
    failureOrDone.fold((failure) {
      emit(ArticlesError(message: mapFailureToMessage(failure)));
    }, (_) {
      if (state is ArticlesLoaded) {
        add(const UpdateArticlesEvent());
      }
    });
  }
}
