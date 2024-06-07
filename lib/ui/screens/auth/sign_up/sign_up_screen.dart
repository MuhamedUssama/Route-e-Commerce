import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/ui/screens/auth/login/login_screen.dart';
import 'package:e_commerce/ui/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants/image_constats.dart';
import '../../../utils/theme/app_text_style.dart';
import '../../../widgets/dialog_utiles.dart';
import '../../../widgets/text_form_field.dart';
import 'sign_up_view_model.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "signup";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpViewModel viewModel = getIt.get<SignUpViewModel>();

  @override
  void dispose() {
    viewModel.emailController.dispose();
    viewModel.nameController.dispose();
    viewModel.phoneController.dispose();
    viewModel.passwordController.dispose();
    viewModel.rePasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff004182),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: BlocListener<SignUpViewModel, SignUpStates>(
            bloc: viewModel,
            listener: (context, state) {
              if (state is SignUpSuccessState) {
                DialogUtils.hideLoading(context);
                DialogUtils.showMessage(
                  context,
                  title: "Successfully",
                  contentMessage: "You are now member of our family",
                  posActionName: "Ok",
                  posActionFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                );
              } else if (state is SignUpErrorState) {
                DialogUtils.hideLoading(context);
                DialogUtils.showMessage(
                  context,
                  title: "Error",
                  contentMessage: state.errorMessage ?? "Somthing went wrong",
                  posActionName: "Ok",
                );
              } else if (state is SignUpLoadingState) {
                DialogUtils.showLoading(context, "Loading");
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
                const SizedBox(height: 30),
                Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Full name",
                        style: AppTextStyle.signUpTextFieldHeaderText,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: viewModel.nameController,
                        hintText: 'enter your full name',
                        isObscureText: false,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 24),
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
                        "phone",
                        style: AppTextStyle.signUpTextFieldHeaderText,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: viewModel.phoneController,
                        hintText: 'enter your mobile no.',
                        isObscureText: false,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your phone";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
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
                      const SizedBox(height: 24),
                      const Text(
                        "Confirm Password",
                        style: AppTextStyle.signUpTextFieldHeaderText,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: viewModel.rePasswordController,
                        hintText: 'enter your confirm password',
                        isObscureText: viewModel.isObscurePassword,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your confirm password";
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
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      viewModel.signUp();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.white,
                      ),
                      padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(
                          horizontal: 102.5,
                          vertical: 14,
                        ),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width, 0.0),
                      ),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: AppTextStyle.buttonTextStyle,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: AppTextStyle.haveOrCreateAcoountTextStyle,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
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
