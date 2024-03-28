
import '../../domain/entities/user_entity.dart';

class UserModel extends User {
  const UserModel({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String image,
    required String token,
    required int points,
    required int credit,
  }) : super(
          id: id,
          name: name,
          email: email,
          phone: phone,
          image: image,
          points: points,
          credit: credit,
          token: token,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      token: json['token'],
      points: json['points'],
      credit: json['credit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'token': token
    };
  }
}
