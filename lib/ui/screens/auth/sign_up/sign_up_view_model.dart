import 'package:e_commerce/domain/models/sign_up/sign_up_dto.dart';
import 'package:e_commerce/domain/use_cases/sign_up_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpViewModel extends Cubit<SignUpStates> {
  SignUpUseCase signUpUseCase;

  @factoryMethod
  SignUpViewModel(this.signUpUseCase) : super(SignUpInitialState());

  var formKey = GlobalKey<FormState>();
  bool isObscurePassword = true;
  bool isObscurePasswordConfirm = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> signUp() async {
    emit(SignUpInitialState());

    if (formKey.currentState?.validate() == true) {
      emit(SignUpLoadingState());

      final either = await signUpUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text,
      );

      either!.fold(
        (failure) => emit(SignUpErrorState(failure.errorMessage)),
        (user) => emit(SignUpSuccessState(user)),
      );
    }
  }
}

abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {
  String? errorMessage;
  SignUpErrorState(this.errorMessage);
}

class SignUpSuccessState extends SignUpStates {
  SignUpDto? userResponse;
  SignUpSuccessState(this.userResponse);
}
