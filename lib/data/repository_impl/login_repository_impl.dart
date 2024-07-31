import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/data_source/login_data_source.dart';
import 'package:e_commerce/domain/models/login/login_dto.dart';
import 'package:e_commerce/domain/repository/login_repository.dart';
import 'package:e_commerce/helpers/failures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  LoginDataSource loginDataSource;

  @factoryMethod
  LoginRepositoryImpl(this.loginDataSource);

  @override
  Future<Either<Failures, LoginDto>>? login(
      String email, String password) async {
    final either = await loginDataSource.login(email, password);

    return either!.fold(
      (failure) => Left(ServerExeption(errorMessage: failure.errorMessage)),
      (response) => Right(response),
    );
  }
}
