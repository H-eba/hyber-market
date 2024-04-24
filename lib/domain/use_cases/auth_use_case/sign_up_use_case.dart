import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/auth_entity/AuthEntity.dart';
import 'package:ecommerce/domain/repository_contract/auth_repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/auth/AuthResponse.dart';
@Injectable()
class SignUpUseCase{
  AuthRepo authRepo;
  @factoryMethod
  SignUpUseCase(this.authRepo);
  Future<Either<AuthEntity,String>>call({required String fullName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  })=>authRepo.signUp(fullName: fullName, email: email, password: password, rePassword: rePassword, phone: phone);


}