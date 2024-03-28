import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/config/routes/app_routes.dart';
import 'package:untitled3/core/utils/app_colors.dart';
import 'package:untitled3/core/utils/app_constant.dart';
import 'package:untitled3/core/utils/app_strings.dart';
import 'package:untitled3/features/splash/presentation/cubit/lang_cubit.dart';
import 'package:untitled3/features/test/data/models/user_model.dart';

import '../cubit/user_cubit/user_cubit.dart';

class Screen1 extends StatelessWidget {
  Screen1({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener

        if (state is UserLoginSuccess) {
          UserModel? userModel;
          Navigator.pushReplacementNamed(context, Routes.screen2Route,
              arguments: 5);
        }
      },
      builder: (context, state) {
        var cubit = UserCubit.get(context);
        var langCubit = LangCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            leading: BlocConsumer<LangCubit, LangState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    if (langCubit.currentLangCode == AppStrings.englishCode) {
                      langCubit.changeLange(context, AppStrings.arabicCode);
                    } else {
                      langCubit.changeLange(context, AppStrings.englishCode);
                    }
                  },
                  icon: const Icon(Icons.translate),
                );
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppConstant.padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.loginScreenTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ).tr(),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email Address',
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                MaterialButton(
                  color: AppColors.primaryColor,
                  onPressed: () {
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, Routes.screen2Route, (route) => false,
                    //     arguments: "5aaaa");
                    // Navigator.pushReplacementNamed(context, Routes.screen2Route,
                    //     arguments: 5);
                    cubit.userLogin(
                        email: emailController.text,
                        password: passwordController.text);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
