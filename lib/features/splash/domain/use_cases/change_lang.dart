import 'package:dartz/dartz.dart';
import 'package:untitled3/core/errors/failures.dart';
import 'package:untitled3/features/splash/domain/repositories/lang_repository.dart';

class ChangeLangUseCase {
  final LangRepository langRepository;

  ChangeLangUseCase({required this.langRepository});

  Future<Either<Failure, bool>> call(String langCode) async {
    return await langRepository.changeLang(langCode: langCode);
  }
}
