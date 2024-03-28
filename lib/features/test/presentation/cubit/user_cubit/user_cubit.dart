import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/test/domain/use_cases/user_use_cases/logout_user.dart';

import '../../../../../core/errors/failures.dart';
import '../../../domain/use_cases/user_use_cases/login_user.dart';


part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final LoginUserUseCase loginUserUseCase;
  final LogoutUserUseCase logoutUserUseCase;

  UserCubit({required this.logoutUserUseCase, required this.loginUserUseCase}) : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of(context);

  Future<void> userLogin(
      {required String email, required String password}) async {
    Either<Failure, Unit> response =
        await loginUserUseCase(email: email, password: password);

    emit(response.fold(
      (failure) => UserLoginError(),
      (unit) => UserLoginSuccess(),
    ));
  }

// void userLogin({
//   required String email,
//   required String password,
// }) async {
//   emit(UserLoginLoading());
//   final login = await loginUser(email: email, password: password);
//   login.fold(
//           (failure) {
//             emit(UserLoginError());
//           },
//           (unit) {
//             emit(UserLoginSuccess());
//           },
//   );
// }

Future<void> userLogout () async{

    Either<Failure, Unit> response = await logoutUserUseCase();

    emit(response.fold((failure) => UserLogoutError(), (unit) => UserLogoutSuccessful()));
}

}