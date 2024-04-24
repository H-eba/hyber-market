import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/entites/CategoryEntity.dart';

class CategoriesWidget extends StatelessWidget {
  CategoryEntity category;
  CategoriesWidget({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: category.image?? '',
        progressIndicatorBuilder: (context, url, progress) {
          return Center(child: CircularProgressIndicator(),);
        },
          errorWidget: (context, url, error) {
            return Icon(Icons.error,size: 20.sp,);
          },
          imageBuilder: (context, imageProvider) {
            return CircleAvatar(
              radius: 50.r,
              backgroundImage: imageProvider,
            );
          },
        ),
        Text(
          category.name??'',
          style: Theme.of(context).textTheme.labelSmall,
        )
      ],
    );
  }
}
