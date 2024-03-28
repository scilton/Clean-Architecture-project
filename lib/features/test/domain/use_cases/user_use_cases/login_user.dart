import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../repositories/user_repository.dart';


class LoginUserUseCase {
  final UserRepository repository;

  LoginUserUseCase(this.repository);


  Future<Either<Failure,Unit>> call({required String email,required String password}) async{
    return await repository.loginUser(email: email,password: password);
  }
}