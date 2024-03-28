import 'package:dartz/dartz.dart';
import 'package:untitled3/core/errors/exceptions.dart';
import 'package:untitled3/core/errors/failures.dart';

import '../../../../core/network/network_status.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/user_remote_data_source.dart';
import '../models/user_model.dart';


class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkStatus networkStatus;

  UserRepositoryImpl(
      {required this.remoteDataSource, required this.networkStatus});

  @override
  Future<Either<Failure, Unit>> deleteUser(int userId) async {
    return await executedFunction(() {
      return remoteDataSource.deleteUser(userId);
    });
  }

  @override
  Future<Either<Failure, Unit>> editUser(User user) async {
    final UserModel userModel = UserModel(id: user.id,
        name: user.name,
        email: user.email,
        phone: user.phone,
        image: user.image,
        points:user.points,
        credit:user.credit,
        token: user.token,
    );

   return await executedFunction(() {
     return remoteDataSource.editUser(userModel);
   });

  }

  @override
  Future<Either<Failure, Unit>> loginUser(
      {required String email, required String password}) async {


    return await executedFunction(() {
      return remoteDataSource.loginUser(email: email, password: password);
    });
  }

  @override
  Future<Either<Failure, Unit>> logoutUser() async{
    return await executedFunction((){
      return remoteDataSource.logoutUser();
    });
  }

  Future<Either<Failure, Unit>> executedFunction (Future<Unit> Function() executedFunction) async{
    if (await networkStatus.isConnected) {
      try {
        await executedFunction();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else {
      return Left(OfflineFailure());
    }
  }
}