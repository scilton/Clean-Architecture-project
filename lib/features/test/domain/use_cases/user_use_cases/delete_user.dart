import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../repositories/user_repository.dart';


class DeleteUserUseCase {
  final UserRepository repository;

  DeleteUserUseCase(this.repository);


  Future<Either<Failure,Unit>> call(int userId) async{
    return await repository.deleteUser(userId);
  }
}