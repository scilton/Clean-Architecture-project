import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/core/network/network_status.dart';
import 'package:untitled3/features/splash/data/data_sources/lang_local_data_source.dart';
import 'package:untitled3/features/splash/data/repositories/lang_repository_impl.dart';
import 'package:untitled3/features/splash/domain/repositories/lang_repository.dart';
import 'package:untitled3/features/splash/domain/use_cases/change_lang.dart';
import 'package:untitled3/features/splash/domain/use_cases/get_saved_lang.dart';
import 'package:untitled3/features/splash/presentation/cubit/lang_cubit.dart';
import 'package:untitled3/features/test/domain/repositories/user_repository.dart';
import 'features/test/data/data_sources/user_remote_data_source.dart';
import 'features/test/data/repositories/user_repository_impl.dart';
import 'features/test/domain/use_cases/user_use_cases/delete_user.dart';
import 'features/test/domain/use_cases/user_use_cases/edit_user.dart';
import 'features/test/domain/use_cases/user_use_cases/login_user.dart';
import 'features/test/domain/use_cases/user_use_cases/logout_user.dart';
import 'features/test/presentation/cubit/user_cubit/user_cubit.dart';


final GetIt sl = GetIt.instance;


Future<void> init() async {
// bloc

  sl.registerFactory(() => UserCubit(loginUserUseCase: sl(),logoutUserUseCase: sl()));
  sl.registerFactory(() => LangCubit(changeLangUseCase: sl(),getSavedLangUseCase: sl()));

// Use cases

  sl.registerLazySingleton(() => LoginUserUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUserUseCase(sl()));
  sl.registerLazySingleton(() => EditUserUseCase(sl()));
  sl.registerLazySingleton(() => DeleteUserUseCase(sl()));
  sl.registerLazySingleton(() => GetSavedLangUseCase(sl()));
  sl.registerLazySingleton(() => ChangeLangUseCase(langRepository: sl()));

// repo

sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(remoteDataSource: sl(), networkStatus: sl()));
sl.registerLazySingleton<LangRepository>(() => LangRepositoryImpl(langLocalDataSource: sl()));
// data source
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<LangLocalDataSource>(() =>LangLocalDataSourceImpl(sharedPreferences: sl()) );

// core

  sl.registerLazySingleton<NetworkStatus>(() => NetworkStatusImpl(sl()));


// external
final sharedPreferences= await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => sharedPreferences);

}
