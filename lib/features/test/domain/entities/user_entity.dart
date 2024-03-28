// "data": {
//         "id": 18841,
//         "name": "ahmed",
//         "email": "scilton@gmail.com",
//         "phone": "01555243345",
//         "image": "https://student.valuxapps.com/storage/assets/defaults/user.jpg",
//         "points": 0,
//         "credit": 0,
//         "token": "mlsh5A3lrDx4fo2xDgBxL8tt83hq75BAcAD0JgAyBHZMx8WFgyTJm5IbP93uZ95kAPoNq9"
//     }

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;

 const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
   required this.points,
   required this.credit,
    required this.token,
  });

  @override
  List<Object?> get props => [id, name, email, phone, image, token,];
}
