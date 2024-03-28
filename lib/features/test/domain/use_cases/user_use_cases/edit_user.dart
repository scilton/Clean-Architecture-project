import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../../entities/user_entity.dart';
import '../../repositories/user_repository.dart';

class EditUserUseCase {
  final UserRepository repository;

  EditUserUseCase(this.repository);

  Future<Either<Failure,Unit>> call(User user) async{
    return await repository.editUser(user);
  }
}