import 'package:dartz/dartz.dart';
import 'package:untitled3/core/errors/failures.dart';
import 'package:untitled3/features/splash/domain/repositories/lang_repository.dart';

class GetSavedLangUseCase {
  final LangRepository langRepository ;

  GetSavedLangUseCase(this.langRepository);

  Future<Either<Failure,String>> call() async{
    return await langRepository.getSavedLang();
  }
}