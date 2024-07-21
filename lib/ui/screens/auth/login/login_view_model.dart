import 'package:e_commerce/domain/models/login/login_dto.dart';

abstract class LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  String? errorMessage;
  LoginErrorState(this.errorMessage);
}

class LoginSuccessState extends LoginStates {
  LoginDto? userResponse;
  LoginSuccessState(this.userResponse);
}
