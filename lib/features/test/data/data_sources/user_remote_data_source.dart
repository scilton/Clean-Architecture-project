import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/core/api/end_points.dart';
import 'package:untitled3/core/errors/exceptions.dart';
import 'package:untitled3/helpers/dio_helper.dart';

import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<Unit> editUser(UserModel userModel);

  Future<Unit> loginUser({required String email, required String password});

  Future<Unit> deleteUser(int userId);

  Future<Unit> logoutUser();
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final SharedPreferences sharedPreferences;

  UserRemoteDataSourceImpl(this.sharedPreferences);

  @override
  Future<Unit> deleteUser(int userId) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Unit> editUser(UserModel userModel) {
    final userToken = userModel.token;
    final body = {
      "name": userModel.name,
      "email": userModel.email,
      "phone": userModel.phone,
    };
    // DioHelper.postData(
    //   url: 'update-profile',
    //   token: userToken,
    // );
    throw UnimplementedError();
  }

  @override
  Future<Unit> loginUser(
      {required String email, required String password}) async {
    UserModel userModel;
    int? statusCode;

    await DioHelper.post(
      path: EndPoints.login,
      body: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      print(value.statusCode);
      // statusCode = value.statusCode;
      // if (statusCode == 200) {
      //   userModel = UserModel.fromJson(value.data['data']);
      //   debugPrint(userModel.email);
      //   sharedPreferences.setString('token', userModel.token);
      // }
    });
    if (statusCode == 200) {
      return Future.value(unit);
    } else {
      throw const ServerException();
    }

    // .then((value) {
    //     print(value);
    //     if (value.statusCode == 200) {
    //       UserModel userModel;
    //       userModel = UserModel.fromJson(value.data);
    //       return Future.value(unit);
    //       // print(userModel);
    //     } else {
    //       throw ServerException();
    //     }
    //   });
  }

  @override
  Future<Unit> logoutUser() async {
    int? statusCode;
    await DioHelper.post(
      path: 'logout',
      token: sharedPreferences.getString('token'),
    ).then((value) {
      if (value.statusCode == 200) {
        print(value);
        statusCode = value.statusCode;
        sharedPreferences.remove('token');
      }
    });
    if (statusCode == 200) {
      return Future.value(unit);
    } else {
      throw const ServerException();
    }
  }
}
