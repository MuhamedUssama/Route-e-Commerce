import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/ui/screens/auth/login/login_view_model.dart';
import 'package:e_commerce/ui/screens/auth/sign_up/sign_up_screen.dart';
import 'package:e_commerce/ui/screens/tabs/main_screen.dart';
import 'package:e_commerce/ui/utils/constants/image_constats.dart';
import 'package:e_commerce/ui/utils/theme/app_colors.dart';
import 'package:e_commerce/ui/utils/theme/app_text_style.dart';
import 'package:e_commerce/ui/widgets/dialog_utiles.dart';
import 'package:e_commerce/ui/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel = getIt.get<LoginViewModel>();

  @override
  void dispose() {
    viewModel.emailController.dispose();
    viewModel.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff004182),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocListener<LoginViewModel, LoginStates>(
            bloc: viewModel,
            listener: (context, state) {
              if (state is LoginLoadingState) {
                DialogUtils.showLoading(context, "Loading");
              } else if (state is LoginSuccessState) {
                DialogUtils.hideLoading(context);
                DialogUtils.showMessage(
                  context,
                  title: "Successfully",
                  contentMessage: "Loged in successfully",
                  posActionName: "Ok",
                  posActionFunction: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  },
                );
              } else if (state is LoginErrorState) {
                DialogUtils.hideLoading(context);
                DialogUtils.showMessage(
                  context,
                  title: "Error",
                  contentMessage: state.errorMessage ?? "Somthing went wrong",
                  posActionName: "Ok",
                );
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(ImagesBath.logo),
                ),
                const SizedBox(height: 60),
                const Text(
                  "Welcome Back To Route",
                  style: AppTextStyle.firstLineOfLoginScreen,
                ),
                const Text(
                  "Please sign in with your mail",
                  style: AppTextStyle.secondLineOfLoginScreen,
                ),
                const SizedBox(height: 60),
                Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "E-mail address",
                        style: AppTextStyle.signUpTextFieldHeaderText,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: viewModel.emailController,
                        hintText: 'enter your email address',
                        isObscureText: false,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Password",
                        style: AppTextStyle.signUpTextFieldHeaderText,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: viewModel.passwordController,
                        hintText: 'enter your password',
                        isObscureText: viewModel.isObscurePassword,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              if (viewModel.isObscurePassword) {
                                viewModel.isObscurePassword = false;
                              } else {
                                viewModel.isObscurePassword = true;
                              }
                            });
                          },
                          child: viewModel.isObscurePassword
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      viewModel.login();
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        AppColors.white,
                      ),
                      padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(
                          horizontal: 102.5,
                          vertical: 14,
                        ),
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      minimumSize: WidgetStateProperty.all(
                        Size(MediaQuery.of(context).size.width, 0.0),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: AppTextStyle.buttonTextStyle,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: AppTextStyle.haveOrCreateAcoountTextStyle,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: AppTextStyle.haveOrCreateAcoountTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
