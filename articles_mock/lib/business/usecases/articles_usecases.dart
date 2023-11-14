import 'package:articles_mock/business/entities/article_entity.dart';
import 'package:articles_mock/business/repositories/articles_repository.dart';
import 'package:articles_mock/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class GetArtilcesList {
  final ArticlesRepository articlesRepository;

  const GetArtilcesList(this.articlesRepository);

  Future<Either<Failure, List<ArticleEntity>>> call() async {
    return await articlesRepository.getList();
  }
}

class GetArtilceById {
  final ArticlesRepository articlesRepository;

  const GetArtilceById(this.articlesRepository);

  Future<Either<Failure, ArticleEntity>> call(int articleId) async {
    return await articlesRepository.getArticle(articleId);
  }
}
