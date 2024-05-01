import 'package:ecommerce/domain/entites/auth_entity/AuthEntity.dart';
import 'package:ecommerce/domain/use_cases/auth_use_case/sign_in_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginViewModel extends Cubit<LoginStates>{
  @factoryMethod
LoginViewModel(this.signInUseCase):super(LoginInitialState());
static LoginViewModel get(context)=>BlocProvider.of(context);
SignInUseCase signInUseCase;
signIn({required String email,required String password})async{
  emit(LoginLoadingState());
var result=await signInUseCase.call(email: email, password: password);
result.fold((authEntity) {
  emit(LoginSuccessState(authEntity));
}, (error) {
  emit(LoginErrorState(error));
}
);


}
}
abstract class LoginStates{}
class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  AuthEntity authEntity;
  LoginSuccessState(this.authEntity);
}
class LoginErrorState extends LoginStates{
  String error;
  LoginErrorState(this.error);
}