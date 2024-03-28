import 'package:dartz/dartz.dart';
import 'package:untitled3/core/errors/failures.dart';

import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, Unit>> editUser(User user);
  Future<Either<Failure, Unit>> loginUser(
      {required String email, required String password});
  Future<Either<Failure, Unit>> logoutUser();
  Future<Either<Failure, Unit>> deleteUser(int id);
}
