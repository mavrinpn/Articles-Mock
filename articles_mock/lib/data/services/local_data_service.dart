import 'package:articles_mock/core/error/exception.dart';
import 'package:articles_mock/data/models/article_model.dart';

class LocalDataService {
  final List<ArticleModel> articles = [
    ArticleModel(
      id: 0,
      title: 'Заголовок 1',
      caption: 'Подпись 1',
      text: 'Текст 1',
      date: DateTime.now(),
    ),
    ArticleModel(
      id: 1,
      title: 'Заголовок 2',
      caption: 'Подпись 2',
      text: 'Текст 2',
      date: DateTime.now(),
    ),
    ArticleModel(
      id: 2,
      title: 'Заголовок 3',
      caption: 'Подпись 3',
      text: 'Текст 3',
      date: DateTime.now(),
    ),
  ];

  Future<List<ArticleModel>> getArticles() async {
    try {
      return articles;
    } catch (_) {
      throw const LocalDataException();
    }
  }

  Future<ArticleModel> getArticleById(int articleId) async {
    try {
      return articles.where((element) => element.id == articleId).first;
    } catch (_) {
      throw LocalDataException.fromCode('element_not_found');
    }
  }
}
