import 'package:articles_mock/business/entities/article_entity.dart';
import 'package:articles_mock/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ArticlesRepository {
  Future<Either<Failure, List<ArticleEntity>>> getList();
  Future<Either<Failure, ArticleEntity>> getArticle(int articleId);
}
