import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int id;
  final String title;
  final String caption;
  final String text;
  final DateTime date;

  const ArticleEntity({
    required this.id,
    required this.title,
    required this.caption,
    required this.text,
    required this.date,
  });

  @override
  List<Object?> get props => [id, title, caption, text, date];
}
