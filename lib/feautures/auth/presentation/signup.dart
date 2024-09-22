import 'package:e_shop/core/enum.dart';
import 'package:e_shop/feautures/auth/bloc/email_cubit.dart';
import 'package:e_shop/feautures/auth/bloc/state.dart';
import 'package:e_shop/feautures/home/presenation/homepage.dart';
import 'package:e_shop/helper/quickhelp.dart';
import 'package:e_shop/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_shop/constants/appcolors.dart';
import 'package:e_shop/constants/apptextstyle.dart';
import 'package:e_shop/core/size_config.dart';
import 'package:e_shop/components/primary_button.dart';
import 'package:e_shop/feautures/auth/presentation/login.dart';
import 'package:e_shop/feautures/auth/presentation/widgets/custom_text_field.dart';
import 'package:e_shop/feautures/auth/presentation/widgets/custom_password_field.dart';

class SignupScreen extends StatelessWidget {
  static const String route = '/signupScreen';

  SignupScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: AppColors.kGrey,
        appBar: AppBar(
          backgroundColor: AppColors.kTransparent,
          title: Text(
            'e-shop',
            style: AppTextStyle.f20PoopinsBlackW700,
          ),
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              QuickHelp.showToast(context,
                  type: ToastType.success, title: 'Login Successfull');
            } else if (state is AuthFailure) {
              QuickHelp.showToast(context, type: ToastType.error);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18 * SizeConfig.widthMultiplier,
              ),
              child: Column(
                children: [
                  SizedBox(height: 150 * SizeConfig.heightMultiplier),
                  CustomTextField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    hintText: "Name",
                  ),
                  SizedBox(height: 19 * SizeConfig.heightMultiplier),
                  CustomTextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Email",
                  ),
                  SizedBox(height: 19 * SizeConfig.heightMultiplier),
                  CustomPasswordField(passwordController: passwordController),
                  const Spacer(),
                  if (state is AuthLoading)
                    QuickHelp.showLoadingAnimation()
                  else
                    PrimaryButton(
                      label: 'Sign Up',
                      onTap: () {
                        final name = nameController.text.trim();
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();
                        if (name.isEmpty || email.isEmpty || password.isEmpty) {
                          QuickHelp.showToast(context,
                              type: ToastType.error,
                              title: "Field can't be empty");
                        }
                        if (name.isNotEmpty &&
                            email.isNotEmpty &&
                            password.isNotEmpty) {
                          context
                              .read<AuthCubit>()
                              .signUp(name, email, password);

                          Navigator.pushNamed(context,ProductListScreen.route );
                        }
                      },
                    ),
                  SizedBox(height: 13 * SizeConfig.heightMultiplier),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: AppTextStyle.f14PoopinsBlackW400,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          'Login',
                          style: AppTextStyle.f16PoopinskDarkBlueW700,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 51 * SizeConfig.heightMultiplier)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
