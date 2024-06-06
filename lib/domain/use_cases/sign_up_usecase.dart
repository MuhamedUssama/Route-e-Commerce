import 'package:e_commerce/domain/models/sign_up/sign_up_dto.dart';
import 'package:e_commerce/domain/repository/sign_up_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUseCase {
  SignUpRepository signUpRepository;

  @factoryMethod
  SignUpUseCase(this.signUpRepository);

  Future<SignUpDto> invoke(String name, String email, String password,
      String rePassword, String phone) async {
    SignUpDto user =
        await signUpRepository.signup(name, email, password, rePassword, phone);
    return user;
  }
}
