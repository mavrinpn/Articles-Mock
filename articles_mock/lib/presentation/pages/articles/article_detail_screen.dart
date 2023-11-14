import 'package:articles_mock/business/entities/article_entity.dart';
import 'package:articles_mock/presentation/blocs/article/article_bloc.dart';
import 'package:articles_mock/presentation/theme/color_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ArticleDetailScreen extends StatefulWidget {
  final ArticleEntity article;
  const ArticleDetailScreen({required this.article, super.key});

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    context
        .read<ArticleBloc>()
        .add(LoadArticleEvent(articleId: widget.article.id));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            stretch: true,
            pinned: false,
            expandedHeight: 160,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.all(16),
              title: Text(widget.article.title),
            ),
          ),
          BlocBuilder<ArticleBloc, ArticleState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case ArticleLoading:
                  return _showProgressIndicator();
                case ArticleLoaded:
                  return _showArticle();
                default:
                  return const SliverToBoxAdapter();
              }
            },
          ),
        ],
      ),
    );
  }

  SliverMainAxisGroup _showArticle() {
    final colorTheme = Theme.of(context).extension<ColorThemeExtension>()!;

    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.article.text),
          ),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: Text(
              DateFormat('dd MMMM, yyyy kk:mm').format(widget.article.date),
              style: TextStyle(
                color: colorTheme.subtitleTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  SliverToBoxAdapter _showProgressIndicator() {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 240,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
