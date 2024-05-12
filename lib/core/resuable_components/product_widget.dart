import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/strings_manager.dart';
import 'package:ecommerce/domain/entites/ProductEntity.dart';
import 'package:ecommerce/presentation/cart/view_model/view_model_cubit.dart';
import 'package:ecommerce/presentation/cart/view_model/view_model_states.dart';
import 'package:ecommerce/presentation/home/tabs/home_tab/viewmodel/home_tab_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductWidget extends StatelessWidget {
  ProductEntity productEntity;
  ProductWidget({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
              width: 2.w,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r)
                ),
                child: CachedNetworkImage(
                  imageUrl: productEntity.imageCover ?? '',
                  width: 191.w,
                  height: 120.h,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    size: 30.sp,
                  ),
                ),
              ),
              BlocConsumer<HomeTabViewModel,HomeTabStates>(
                buildWhen: (previous, current) {
                  if(current is AddToWishListLoadingState||
                      current is AddToWishListErrorState||
                      current is AddToWishListSuccessState){
                    return true;
                  }return false;
                },
                builder: (context, state) {

                  if(state is AddToWishListLoadingState && state.productId==productEntity.id){
                    return SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: Center(child: CircularProgressIndicator(
                        color:Colors.white,
                      ),),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      HomeTabViewModel.get(context).addToWishList(productEntity.id??'' );

                    },
                    child:SvgPicture.asset(
                      AssetsManager.watchedListIcon,
                      height: 30.h,
                      width: 30.w,
                    ),
                  );
                },
                listener: (context, state) {
                  if (state is AddToWishListSuccessState && state.productId==productEntity.id){
                    Fluttertoast.showToast(
                        msg: 'add',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                  if(state is AddToWishListErrorState && state.productId==productEntity.id){
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
              )
              /*SvgPicture.asset(
                AssetsManager.watchedListIcon,
                height: 30.h,
                width: 30.w,
              ),*/
            ],
          ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                '${productEntity.title }\n\n '??'',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.w400, fontSize: 14.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
             productEntity.priceAfterDiscount==null?
             Text(
               'EGP ${productEntity.price}',
               style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                   fontWeight: FontWeight.w400, fontSize: 14.sp),
             )
                 : Row(
                children: [
                  Text(
                    'EGP ${productEntity.priceAfterDiscount}',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 14.sp),
                  ),
                  SizedBox(width: 16.w,),
                  Text(
                    '${productEntity.price} EGP',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 14.sp,
                    color: Theme.of(context).primaryColor.withOpacity(0.6),
                    decoration: TextDecoration.lineThrough,
                    decorationStyle: TextDecorationStyle.solid),

                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(width: 191.w,
                child: Row(children: [
                  Text('${StringsManager.review} (${productEntity.ratingsAverage})',
                  style:Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w400, fontSize: 12.sp),),
                  SvgPicture.asset(
                    AssetsManager.starIcon,
                    height: 15.h,
                    width: 15.w,
                  ),
                  Spacer(),
                 BlocConsumer<CartViewModel,CartViewModelState>(
                   buildWhen: (previous, current) {
                     if(current is AddToCartLoadingState||
                         current is AddToCartSuccessState||
                         current is AddToCartErorrState){
                       return true;
                     }return false;
                   },
                   builder: (context, state) {

                   if(state is AddToCartLoadingState && state.productId==productEntity.id){
                     return SizedBox(
                       height: 30.h,
                       width: 30.w,
                       child: Center(child: CircularProgressIndicator(
                         color:Colors.white,
                       ),),
                     );
                   }
                   return InkWell(
                     onTap: () {
                    CartViewModel.get(context).addToCart(productEntity.id??'');
                     },
                     child:SvgPicture.asset(
                       AssetsManager.plusIcon,
                       height: 30.h,
                       width: 30.w,
                     ),
                   );
                 },
                     listener: (context, state) {
                        if (state is AddToCartSuccessState&& state.productId==productEntity.id){
                          Fluttertoast.showToast(
                              msg: state.cartResponseEntity.message??'',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                        if(state is AddToCartErorrState&& state.productId==productEntity.id){
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
                 )
                ],),
              )
            ],
          )

    );
  }
}
