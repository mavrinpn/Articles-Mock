import 'package:articles_mock/business/entities/article_entity.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    required id,
    required title,
    required caption,
    required text,
    required date,
  }) : super(
          id: id,
          title: title,
          caption: caption,
          text: text,
          date: date,
        );

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
      id: entity.id,
      title: entity.title,
      caption: entity.caption,
      text: entity.text,
      date: entity.date,
    );
  }
}
