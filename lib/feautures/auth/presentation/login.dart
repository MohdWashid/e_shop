import 'package:e_shop/components/primary_button.dart';
import 'package:e_shop/constants/appcolors.dart';
import 'package:e_shop/constants/apptextstyle.dart';
import 'package:e_shop/core/enum.dart';
import 'package:e_shop/core/size_config.dart';
import 'package:e_shop/feautures/auth/bloc/email_cubit.dart';
import 'package:e_shop/feautures/auth/bloc/state.dart';
import 'package:e_shop/feautures/auth/presentation/signup.dart';
import 'package:e_shop/feautures/auth/presentation/widgets/custom_password_field.dart';
import 'package:e_shop/feautures/auth/presentation/widgets/email_textfield.dart';
import 'package:e_shop/feautures/home/presenation/homepage.dart';
import 'package:e_shop/helper/quickhelp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const String route = '/loginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: AppColors.kGrey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.kTransparent,
          title: Text('e-shop', style: AppTextStyle.f20PoopinsBlackW700),
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              QuickHelp.showToast(context,
                  type: ToastType.success, title: 'Login Successfull!');
              Navigator.pushReplacementNamed(context, ProductListScreen.route);
            } else if (state is AuthFailure) {
              QuickHelp.showToast(context,
                  type: ToastType.error, title: 'Login faoled!');
            }
          },
          builder: (context, state) {
            final isLoading = state is AuthLoading;
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 18 * SizeConfig.widthMultiplier),
              child: Column(
                children: [
                  SizedBox(height: 192 * SizeConfig.heightMultiplier),
                  EmailTextfield(emailController: emailController),
                  SizedBox(height: 19 * SizeConfig.heightMultiplier),
                  CustomPasswordField(passwordController: passwordController),
                  const Spacer(),
                  isLoading
                      ? QuickHelp.showLoadingAnimation()
                      : PrimaryButton(
                          label: 'Login',
                          onTap: () {
                            context.read<AuthCubit>().login(
                                emailController.text, passwordController.text);
                          },
                        ),
                  SizedBox(height: 9 * SizeConfig.heightMultiplier),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('New User? ',
                          style: AppTextStyle.f14PoopinsBlackW400),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignupScreen.route);
                        },
                        child: Text('Signup',
                            style: AppTextStyle.f16PoopinskDarkBlueW700),
                      )
                    ],
                  ),
                  SizedBox(height: 37 * SizeConfig.heightMultiplier),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
