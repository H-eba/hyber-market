import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/domain/entites/ProductEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SubCategoryWidget extends StatelessWidget {
  SubcategoryEntity subcategoryEntity;
   SubCategoryWidget({required this.subcategoryEntity,super.key});

  @override
  Widget build(BuildContext context) {
    return
     Column(
       children: [
      Container(
        height: 70.h,
        width: 70.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary
        ),
       child:
       SvgPicture.asset(AssetsManager.logo,

       colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),),),
      SizedBox(height: 8.h,),
      Text(subcategoryEntity.name??'',style:
        Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400
        ),)
    ],);
  }
}
