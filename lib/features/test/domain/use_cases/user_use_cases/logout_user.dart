import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../repositories/user_repository.dart';

class LogoutUserUseCase {
  final UserRepository repository;

  LogoutUserUseCase(this.repository);


  Future<Either<Failure,Unit>> call() async{
    return await repository.logoutUser();
  }
}