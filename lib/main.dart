import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/splash/presentation/cubit/lang_cubit.dart';
import 'package:untitled3/helpers/dio_helper.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'dependency_injection.dart' as di;
import 'features/test/presentation/cubit/user_cubit/user_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  DioHelper.init();
  await di.init();
  runApp(EasyLocalization(
      path: "assets/langs",
      supportedLocales: const [
        Locale(AppStrings.englishCode),
        Locale(AppStrings.arabicCode)
      ],
      fallbackLocale: const Locale(AppStrings.englishCode),
      useFallbackTranslations: true,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<UserCubit>()),
        BlocProvider(create: (_) => di.sl<LangCubit>()),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: AppStrings.appTitle,
        theme: appTheme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
