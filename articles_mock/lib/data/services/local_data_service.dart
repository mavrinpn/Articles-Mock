import 'package:articles_mock/core/error/exception.dart';
import 'package:articles_mock/data/models/article_model.dart';
import 'package:articles_mock/data/services/local_data_mockset.dart';

class LocalDataService with LocalDataMockSet {
  Future<List<ArticleModel>> getArticles() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return articles;
    } catch (_) {
      throw const LocalDataException();
    }
  }

  Future<ArticleModel> getArticleById(int articleId) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return articles.where((element) => element.id == articleId).first;
    } catch (_) {
      throw LocalDataException.fromCode('element_not_found');
    }
  }
}
