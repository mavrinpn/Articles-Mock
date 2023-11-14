import 'package:articles_mock/app/settings.dart';
import 'package:articles_mock/business/entities/article_entity.dart';
import 'package:articles_mock/presentation/blocs/articles/articles_bloc.dart';
import 'package:articles_mock/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<ArticlesBloc>().add(const LoadArticlesEvent());
    final appSettings = Provider.of<Settings>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.articles),
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout),
          ),
          IconButton(
            onPressed: () {
              switch (appSettings.getThemeMode) {
                case ThemeMode.dark:
                  appSettings.setTheme(ThemeMode.light);
                  break;
                case ThemeMode.light:
                  appSettings.setTheme(ThemeMode.dark);
                  break;
                default:
              }
            },
            icon: const Icon(Icons.dark_mode_outlined),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _onRefresh(context),
        child: BlocBuilder<ArticlesBloc, ArticlesState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case ArticlesLoading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ArticlesLoaded:
                final items = (state as ArticlesLoaded).items;
                return _buildListView(items);
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

  ListView _buildListView(List<ArticleEntity> items) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final article = items[index];

        return Card(
          clipBehavior: Clip.hardEdge,
          child: ListTile(
            onTap: () {
              context.go(
                '/articles_list/article_detail',
                extra: article,
              );
            },
            title: Text(article.title),
            subtitle: Text(article.caption),
          ),
        );
      },
    );
  }

  Future<ArticlesState> _onRefresh(BuildContext context) {
    final itemsBloc = context.read<ArticlesBloc>()
      ..add(const UpdateArticlesEvent());

    return itemsBloc.stream.firstWhere((e) => e is! UpdateArticlesEvent);
  }

  void _logout(BuildContext context) {
    context.read<AuthenticationBloc>().add(AuthenticationSignOut());
  }
}
