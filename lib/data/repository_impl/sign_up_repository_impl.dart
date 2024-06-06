import 'package:e_commerce/data/data_source/sign_up_data_source.dart';
import 'package:e_commerce/domain/models/sign_up/sign_up_dto.dart';
import 'package:e_commerce/domain/repository/sign_up_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpRepository)
class SignUpRepositoryImpl implements SignUpRepository {
  SignUpDataSource signUpDataSource;

  @factoryMethod
  SignUpRepositoryImpl(this.signUpDataSource);
  @override
  Future<SignUpDto> signup(String name, String email, String password,
      String rePassword, String phone) async {
    final user =
        await signUpDataSource.signup(name, email, password, rePassword, phone);
    return user;
  }
}
