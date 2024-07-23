
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entites/ProductEntity.dart';
import '../../../../domain/entites/cart/CartItemEntity.dart';

class SearchItem extends StatelessWidget {
  CartItemEntity  productEntity;
 SearchItem({required this.productEntity,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            )),
        child: Row(
          children: [
          Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              )),
          child: CachedNetworkImage(
            imageUrl: productEntity.product?.imageCover ?? '',
            height: 133.h,
            width: 120.w,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),

  ]
    ));
  }
}
