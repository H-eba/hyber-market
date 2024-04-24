import 'package:ecommerce/core/DI/di.dart';
import 'package:ecommerce/presentation/registerl/register_view_mode/sign_up__view_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/resuable_components/custem_form_filde.dart';
import '../../../core/resuable_components/custom_button.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/colors_manager.dart';
import '../../../core/utils/strings_manager.dart';
import '../login_screen/my_validations.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController fullNameController ;
  late TextEditingController phoneController ;
  late TextEditingController emailController ;

  late TextEditingController passwordController ;
  @override
  void initState() {

    super.initState();
    fullNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
  @override
  void dispose() {

    super.dispose();
   fullNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return
      Container(
        color:  ColorManager.primaryColor,
        child: BlocProvider(
          create: (context) => getIt<SignUpViewModel>(),
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(onPressed: () {
                Navigator.pop(context);
              },
               icon:  Icon(Icons.arrow_back_ios,),
              color: Colors.white,),
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
                      SizedBox(height: 46.h,),
                      CustomTextFormField(
                        title: 'full name',
                        lable: 'enter your full name',
                        controller: fullNameController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'please enter user name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h,),
                      CustomTextFormField(lable: 'enter mobile numbrr',
                          title:'mobile number',
                          controller: phoneController,
                          keybordType: TextInputType.phone,
                          maxLenght: 11,
                          validator: (text){
                            if (text!.length <11) {
                              return 'not valid phone';
                            }
                            return null;
                          }),
                    SizedBox(height: 20.h,),
                      CustomTextFormField(
                        title: 'E-mail address',
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
                      SizedBox(height: 20.h,),
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
                      SizedBox(height: 20.h,),
                      SizedBox(
                        width: double.infinity,
                        child: BlocConsumer<SignUpViewModel,SignUpStates>(
                          listener: (context, state) {
                            if(state is SignUpSuccessState){
                              Fluttertoast.showToast(
                                  msg: "account created successfully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );

                            }
                            if(state is SignUpErrorState){
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
                            if(state is SignUpLoadingState){
                              return Center(child: CircularProgressIndicator(),);
                            }
                         return
                           CustomButton(title: StringsManager.signUp, onPressed: () {
                             registerValidate();
                             SignUpViewModel.get(context).sigUp(fullName: fullNameController.text,
                                 email: emailController.text,
                                 password: passwordController.text,
                                 rePassword: passwordController.text,
                                 phone: phoneController.text);
                           },);
                          },

                        ),
                      ),
          
          
          
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  }
  void registerValidate() {
    if (formKey.currentState?.validate() == true) {
      ///register
    }
  }
}
