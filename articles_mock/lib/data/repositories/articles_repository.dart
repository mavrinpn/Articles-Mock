import 'package:articles_mock/business/entities/article_entity.dart';
import 'package:articles_mock/business/repositories/articles_repository.dart';
import 'package:articles_mock/core/error/exception.dart';
import 'package:articles_mock/core/error/failure.dart';
import 'package:articles_mock/data/services/local_data_service.dart';
import 'package:dartz/dartz.dart';

class ArticlesRepositoryImp implements ArticlesRepository {
  final LocalDataService localDataService;

  ArticlesRepositoryImp({required this.localDataService});

  @override
  Future<Either<Failure, ArticleEntity>> getArticle(int articleId) async {
    try {
      final article = await localDataService.getArticleById(articleId);

      return Right(article);
    } on LocalDataException catch (e) {
      return Left(LocalDataServiceFailure(e.errorCode));
    }
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> getList() async {
    try {
      final articles = await localDataService.getArticles();

      return Right(articles);
    } on LocalDataException catch (e) {
      return Left(LocalDataServiceFailure(e.errorCode));
    }
  }
}
