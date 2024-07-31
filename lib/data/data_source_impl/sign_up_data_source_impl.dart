import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/data/data_source/sign_up_data_source.dart';
import 'package:e_commerce/helpers/failures.dart';
import 'package:e_commerce/domain/models/sign_up/sign_up_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpDataSource)
class SignUpDataSourceImpl implements SignUpDataSource {
  ApiManager apiManager;

  @factoryMethod
  SignUpDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, SignUpDto>>? signup(String name, String email,
      String password, String rePassword, String phone) async {
    final either =
        await apiManager.signUp(name, email, password, rePassword, phone);
    return either!.fold(
      (failure) => Left(ServerExeption(errorMessage: failure.errorMessage)),
      (response) => Right(response.toSignUpDto()),
    );
  }
}
