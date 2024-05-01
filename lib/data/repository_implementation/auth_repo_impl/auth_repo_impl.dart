import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/dao/datasource_contract/auth_ds/auth_ds.dart';
import 'package:ecommerce/domain/entites/auth_entity/AuthEntity.dart';
import 'package:ecommerce/domain/repository_contract/auth_repo/auth_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRepo )
class AuthRepoImpl extends AuthRepo {
  AuthDataSource apiDataSource;

  @factoryMethod
  AuthRepoImpl(this.apiDataSource);

  @override
  Future<Either<AuthEntity, String>> signUp(
      {required String fullName, required String email, required String password, required String rePassword, required String phone}) async {
    var result = await apiDataSource.signUp(fullName: fullName,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone);
    return result.fold((response) {
      AuthEntity authEntity = response.toAuthEntity();
      return Left(authEntity);
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<AuthEntity, String>> signIn({required String email, required String password})async {
    var result=await apiDataSource.signIn(email: email, password: password);
    return result.fold((response) {
      AuthEntity authEntity = response.toAuthEntity();
      return Left(authEntity);
    }, (error) {
      return Right(error);
    });
  }
}
