import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/data/data_source/login_data_source.dart';
import 'package:e_commerce/domain/models/login/login_dto.dart';
import 'package:e_commerce/helpers/failures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginDataSource)
class LoginDataSourceImpl implements LoginDataSource {
  ApiManager apiManager;

  @factoryMethod
  LoginDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, LoginDto>>? login(
      String email, String password) async {
    final either = await apiManager.login(email, password);

    return either!.fold(
      (failure) => Left(ServerExeption(errorMessage: failure.errorMessage)),
      (response) => Right(response.toLoginDto()),
    );
  }
}
