import 'package:e_commerce/domain/models/sign_up/sign_up_dto.dart';

abstract class SignUpRepository {
  Future<SignUpDto> signup(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  );
}
