import 'package:ecommerce/domain/entites/auth_entity/AuthEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/auth_use_case/sign_up_use_case.dart';
@injectable
class SignUpViewModel extends Cubit<SignUpStates>{
  static SignUpViewModel get(BuildContext context)=>BlocProvider.of(context);
  SignUpUseCase singUpUseCase;
  @factoryMethod
  SignUpViewModel(this.singUpUseCase):super(SignUpInitialState());

 sigUp(
     {required String fullName,
       required String email,
       required String password,
       required String rePassword,
       required String phone,
     }
     )async{
   emit(SignUpLoadingState());
   var result=await singUpUseCase.call(fullName: fullName, email: email, password: password, rePassword: rePassword, phone: phone);
   result.fold((authEntity) {
     emit(SignUpSuccessState(authEntity));

   }
   , (error){
     emit(SignUpErrorState(error));
       });
 }
}
abstract class SignUpStates{}
class SignUpInitialState extends SignUpStates{}
class SignUpLoadingState extends SignUpStates{}
class SignUpSuccessState extends SignUpStates{
  AuthEntity authEntity;
  SignUpSuccessState(this.authEntity);
}
class SignUpErrorState extends SignUpStates{
  String error;
  SignUpErrorState(this.error);
}