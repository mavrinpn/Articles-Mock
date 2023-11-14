import 'package:articles_mock/business/entities/article_entity.dart';
import 'package:flutter/material.dart';

class ArticleDetailScreen extends StatefulWidget {
  final ArticleEntity article;
  const ArticleDetailScreen({required this.article, super.key});

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
