import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/utils/app_strings.dart';
import 'package:untitled3/features/splash/domain/use_cases/change_lang.dart';
import 'package:untitled3/features/splash/domain/use_cases/get_saved_lang.dart';
import 'package:untitled3/http_consumer.dart';

part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit(
      {required this.changeLangUseCase, required this.getSavedLangUseCase})
      : super(LangInitial());
  static LangCubit get(context) => BlocProvider.of(context);

  final ChangeLangUseCase changeLangUseCase;
  final GetSavedLangUseCase getSavedLangUseCase;

  String currentLangCode = AppStrings.englishCode;

  Future<void> changeLange(BuildContext context, String langCode) async {
    final response = await changeLangUseCase.call(langCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      EasyLocalization.of(context)!.setLocale(Locale(langCode));
      currentLangCode = langCode;
      emit(ChangeLangState());
    });
  }

  Future<void> getSavedLang() async {
    final response = await getSavedLangUseCase.call();
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = value;
      emit(ChangeLangState());
    });
  }

  void register() {
    HttpHelper.postData(url: "user/auth/register", data: {
      /// Put your data here
    });
  }
}
