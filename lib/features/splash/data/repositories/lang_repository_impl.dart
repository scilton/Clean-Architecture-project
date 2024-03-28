import 'package:dartz/dartz.dart';
import 'package:untitled3/core/errors/exceptions.dart';
import 'package:untitled3/core/errors/failures.dart';
import 'package:untitled3/features/splash/data/data_sources/lang_local_data_source.dart';
import 'package:untitled3/features/splash/domain/repositories/lang_repository.dart';

class LangRepositoryImpl implements LangRepository {
  final LangLocalDataSource langLocalDataSource ;

  LangRepositoryImpl({required this.langLocalDataSource});
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final langIsChanged = await langLocalDataSource.changeLang(langCode: langCode);
      return Right(langIsChanged);
    } on EmptyCashException{
      return Left(EmptyCashFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async{
    try {
      final langCode = await langLocalDataSource.getSavedLang();
      return Right(langCode);
    } on EmptyCashException{
      return Left(EmptyCashFailure());
    }
  }
}