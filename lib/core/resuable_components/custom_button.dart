
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  String title;
  void Function() onPressed;
   CustomButton({required this.title,required this.onPressed,super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r)
        )
      ),
        onPressed: onPressed, child: Text(title,style:
      Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
          color: Theme.of(context).primaryColor
      ),));
  }
}
