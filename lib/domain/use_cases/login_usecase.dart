import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/models/login/login_dto.dart';
import 'package:e_commerce/domain/repository/login_repository.dart';
import 'package:e_commerce/helpers/failures.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  LoginRepository repository;

  @factoryMethod
  LoginUsecase(this.repository);

  Future<Either<Failures, LoginDto>>? invoke(
      String email, String password) async {
    final either = await repository.login(email, password);

    return either!.fold(
      (failure) => Left(ServerExeption(errorMessage: failure.errorMessage)),
      (response) => Right(response),
    );
  }
}
