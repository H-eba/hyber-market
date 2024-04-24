import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/model/auth/AuthResponse.dart';

abstract class AuthDataSource{
  Future<Either<AuthResponse,String>>signUp({required String fullName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  });
}