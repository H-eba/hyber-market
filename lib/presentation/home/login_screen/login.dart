import 'package:ecommerce/core/DI/di.dart';
import 'package:ecommerce/core/resuable_components/custom_button.dart';
import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/colors_manager.dart';
import 'package:ecommerce/core/utils/route_manager.dart';
import 'package:ecommerce/core/utils/strings_manager.dart';
import 'package:ecommerce/presentation/home/login_screen/login_view_model.dart';
import 'package:ecommerce/presentation/home/login_screen/my_validations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/local/prefsHelper.dart';
import '../../../core/resuable_components/custem_form_filde.dart';

class LoginScreen extends StatefulWidget {

   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController emailController ;

  late TextEditingController passwordController ;
  @override
  void initState() {

    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
  @override
  void dispose() {

    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,

      ),
      child: BlocProvider(
        create: (context) => getIt<LoginViewModel>(),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: REdgeInsets.all(10),
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 Align(alignment: Alignment.center,
                    child: SvgPicture.asset(
                    AssetsManager.logo,
                    height: 71.h,
                    width: 237.w,
                        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                  ),
                    SizedBox(height: 86.h,),
                    Text(StringsManager.welcomeMassage,
                    style: Theme.of(context).textTheme.titleMedium,),
                    Text(StringsManager.signIn,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300
                      ),),
                
                    SizedBox(height: 40.h,),
                    CustomTextFormField(
                      title: 'user name',
                      lable: 'Email',
                      keybordType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'please enter email';
                        }
                
                        if (!MyValidations.isValidEmail(text)) {
                          return "enter valid email";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      title: 'password',
                      lable: 'Password',
                      keybordType: TextInputType.number,
                      controller: passwordController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'please enter Password';
                        }
                        if (text.length < 6) {
                          return 'the password should be at least 6';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: BlocConsumer<LoginViewModel,LoginStates>(
                        listener: (context, state) {
                      if (state is LoginSuccessState){
                        PrefsHelper.saveToken(state.authEntity.token??'');
                        Navigator.pushNamedAndRemoveUntil(context,RoutesManager.homeRouteName, (route) => false);
                        Fluttertoast.showToast(
                            msg: "login successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                      if(state is LoginErrorState){
                        Fluttertoast.showToast(
                            msg: state.error,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                        },
                        builder: (context, state) {
                          if(state is LoginLoadingState){
                            return Center(child: CircularProgressIndicator(
                              color: Colors.white,
                            ));
                          }
                       return CustomButton(title: StringsManager.logIn, onPressed: () {

                         loginValidate();
                         LoginViewModel.get(context).signIn(
                             email: emailController.text,
                             password: passwordController.text);
                       },);
                        },

                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesManager.registerRouteName);
                        },
                        child: Text(
                         "don,t have an account? create an account",
                          style: TextStyle(fontSize: 18,
                          color: Colors.white),
                        ))
                
        
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loginValidate() {
    if (formKey.currentState?.validate() == true) {
      ///register
    }
  }
}
