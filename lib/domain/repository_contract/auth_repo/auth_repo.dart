import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/auth_entity/AuthEntity.dart';



abstract class AuthRepo{
  Future<Either<AuthEntity,String>>signUp({required String fullName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  });
}