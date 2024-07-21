import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/failures.dart';
import 'package:e_commerce/domain/models/login/login_dto.dart';

abstract class LoginRepository {
  Future<Either<Failures, LoginDto>>? login(
    String email,
    String password,
  );
}
