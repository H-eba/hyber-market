import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  String lable;
  String title;
  TextInputType keybordType;
  TextEditingController controller;
  String? Function(String?) validator;
  int? maxLenght;
  bool isObscure;

  CustomTextFormField(
      {required this.lable,
      required this.title,
      required this.controller,
        this.maxLenght,
      required this.validator,
       this.isObscure=false,
      this.keybordType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${title}",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w500, fontSize: 18.sp),
          ),
          SizedBox(
            height: 24.h,
          ),

          TextFormField(

            decoration: InputDecoration(
           //   fillColor: Colors.white,
              filled: true,
              label: Text(
                lable,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color:
                Colors.black.withOpacity(0.7)),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.blue, width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.blue, width: 2)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.red, width: 2)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.red, width: 2)),
            ),
            keyboardType: keybordType,
            controller: controller,
            style: Theme.of(context).textTheme.titleSmall,
            validator: validator,
            maxLength: maxLenght,
            obscureText: isObscure,
          ),
        ],
      ),
    );
  }
}
