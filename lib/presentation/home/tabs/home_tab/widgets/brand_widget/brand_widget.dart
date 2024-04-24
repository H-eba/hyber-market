import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/domain/entites/BrandEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandWidget extends StatelessWidget {
  BrandEntity brand;
   BrandWidget({required this.brand,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: brand.image?? '',
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
          brand.name??'',
          style: Theme.of(context).textTheme.labelSmall,
        )
      ],
    );
  }
}
