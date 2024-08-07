import 'package:dartz/dartz.dart';
import 'package:e_commerce/helpers/failures.dart';
import 'package:e_commerce/domain/models/login/login_dto.dart';

abstract class LoginDataSource {
  Future<Either<Failures, LoginDto>>? login(String email, String password);
}
