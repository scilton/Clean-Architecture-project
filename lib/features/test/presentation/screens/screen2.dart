import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/config/routes/app_routes.dart';
import 'package:untitled3/features/test/data/models/user_model.dart';
import 'package:untitled3/features/test/presentation/cubit/user_cubit/user_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../splash/presentation/cubit/lang_cubit.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  static UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    var langCubit = LangCubit.get(context);
    var cubit = UserCubit.get(context);
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is UserLogoutSuccessful) {
          Navigator.pushReplacementNamed(context, Routes.screen1Route);
        }
      },
      builder: (context, state) {
        final index = ModalRoute.of(context)!.settings.arguments as int;
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
                    print(index);
                    // if (langCubit.currentLangCode == AppStrings.englishCode) {
                    //   langCubit.changeLange(context, AppStrings.arabicCode);
                    // } else {
                    //   langCubit.changeLange(context, AppStrings.englishCode);
                    // }
                  },
                  icon: const Icon(Icons.translate),
                );
              },
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.screen2Name.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    cubit.userLogout();
                  },
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
