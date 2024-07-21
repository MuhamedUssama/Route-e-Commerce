import 'package:dartz/dartz.dart';
import 'package:e_commerce/helpers/failures.dart';
import 'package:e_commerce/domain/models/sign_up/sign_up_dto.dart';

abstract class SignUpDataSource {
  Future<Either<Failures, SignUpDto>>? signup(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  );
}
