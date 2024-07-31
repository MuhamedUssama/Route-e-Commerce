import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:e_commerce/domain/models/login/login_dto.dart';
import 'package:e_commerce/domain/use_cases/login_usecase.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUsecase usecase;

  @factoryMethod
  LoginViewModel(this.usecase) : super(LoginInitialState());

  var formKey = GlobalKey<FormState>();
  bool isObscurePassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    emit(LoginInitialState());

    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState());

      final either = await usecase.invoke(
        emailController.text,
        passwordController.text,
      );

      either!.fold(
        (failure) => emit(LoginErrorState(failure.errorMessage)),
        (userResponse) => emit(LoginSuccessState(userResponse)),
      );
    }
  }
}

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  String? errorMessage;
  LoginErrorState(this.errorMessage);
}

class LoginSuccessState extends LoginStates {
  LoginDto? userResponse;
  LoginSuccessState(this.userResponse);
}
