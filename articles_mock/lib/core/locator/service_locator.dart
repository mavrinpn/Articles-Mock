import 'package:articles_mock/business/repositories/articles_repository.dart';
import 'package:articles_mock/business/repositories/authentication_repository.dart';
import 'package:articles_mock/business/usecases/articles_usecases.dart';
import 'package:articles_mock/business/usecases/user_usecases.dart';
import 'package:articles_mock/data/repositories/articles_repository.dart';
import 'package:articles_mock/data/repositories/authentication_repository.dart';
import 'package:articles_mock/data/services/local_auth_service.dart';
import 'package:articles_mock/data/services/local_data_service.dart';
import 'package:articles_mock/presentation/blocs/article/article_bloc.dart';
import 'package:articles_mock/presentation/blocs/articles/articles_bloc.dart';
import 'package:articles_mock/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  // BLoCs
  sl.registerFactory(() => AuthenticationBloc(
        userSignIn: sl(),
        userSignUp: sl(),
        userSignOut: sl(),
        userEmail: sl(),
      ));
  sl.registerFactory(() => ArticlesBloc(
        getArtilcesList: sl(),
      ));
  sl.registerFactory(() => ArticleBloc(
        getArtilceById: sl(),
      ));

  // UseCases
  sl.registerLazySingleton(() => UserEmail(sl()));
  sl.registerLazySingleton(() => UserSignIn(sl()));
  sl.registerLazySingleton(() => UserSignUp(sl()));
  sl.registerLazySingleton(() => UserSignOut(sl()));

  sl.registerLazySingleton(() => GetArtilcesList(sl()));
  sl.registerLazySingleton(() => GetArtilceById(sl()));

  // Repositories
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImp(localAuthService: sl()),
  );
  sl.registerLazySingleton<ArticlesRepository>(
    () => ArticlesRepositoryImp(localDataService: sl()),
  );

  // Services
  sl.registerLazySingleton<LocalAuthService>(
    () => LocalAuthService(),
  );
  sl.registerLazySingleton<LocalDataService>(
    () => LocalDataService(),
  );
}
