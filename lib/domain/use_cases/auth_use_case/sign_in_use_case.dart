import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/auth_entity/AuthEntity.dart';
import 'package:ecommerce/domain/repository_contract/auth_repo/auth_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class SignInUseCase{
  AuthRepo authRepo;
  @factoryMethod
  SignInUseCase(this.authRepo);
  Future<Either<AuthEntity,String>>call({required String email,required String password})=>authRepo.signIn(email: email, password: password);
}