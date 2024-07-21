import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/models/sign_up/sign_up_dto.dart';
import 'package:e_commerce/domain/repository/sign_up_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUseCase {
  SignUpRepository signUpRepository;

  @factoryMethod
  SignUpUseCase(this.signUpRepository);

  Future<Either<Failures, SignUpDto>>? invoke(String name, String email,
      String password, String rePassword, String phone) async {
    final either =
        await signUpRepository.signup(name, email, password, rePassword, phone);
    return either!.fold(
      (failure) => Left(ServerExeption(errorMessage: failure.errorMessage)),
      (response) => Right(response),
    );
  }
}
