import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/DI/di.dart';
import 'package:ecommerce/data/model/wish_list/GetWishListResponseModel.dart';
import 'package:ecommerce/presentation/home/tabs/whish_list_tab/view_model/wish_list_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../cart/view_model/view_model_cubit.dart';
import '../../../cart/view_model/view_model_states.dart';

class WishItemWidget extends StatelessWidget {
Data item;
 WishItemWidget({ required this.item,super.key});

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
                imageUrl: item.imageCover??'',
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
            Expanded(
                child: Padding(
                  padding: REdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                                 item.title??'',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              )),


                          BlocConsumer<WishListViewModel, WishListViewModelState>(
                            buildWhen: (previous, current) {
                              if(current is DeleteFromWishListErrorState||
                                  current is DeleteFromWishListSuccessState
                                  ||current is DeleteFromWishListLoadingState){
                                return true;
                              }return false;

                            }
                            ,
                            builder: (context, state) {

                              if(state is DeleteFromWishListLoadingState &&state.productId==item.id){
                                return SizedBox(
                                  height: 30.h,
                                  width: 30.w,
                                  child: Center(child: CircularProgressIndicator(
                                    color:Colors.blue,
                                  ),),
                                );

                              }
                              return InkWell(
                                  onTap: (){

                                    WishListViewModel.get(context).DeleteItemFromWishList(item.id??'');


                                  },
                                  child: SvgPicture.asset(AssetsManager.fivorateselected));
                            },
                            listener: (context, state) {
                              if (state is DeleteFromWishListSuccessState&&state.productId==item.id){

                                Fluttertoast.showToast(
                                    msg:'delete',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }
                              if (state is DeleteFromWishListErrorState&&state.productId==item.id){
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



                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'EGP ${item.price??0}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),

                          Spacer(),
                          Container(
                            padding: REdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child:   BlocConsumer<CartViewModel,CartViewModelState>(
                              buildWhen: (previous, current) {
                                if(current is AddToCartLoadingState||
                                    current is AddToCartSuccessState||
                                    current is AddToCartErorrState){
                                  return true;
                                }return false;
                              },
                              builder: (context, state) {

                                if(state is AddToCartLoadingState && state.productId==item.id){
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
                                    CartViewModel.get(context).addToCart(item.id??'');
                                  },
                                  child:Text('Add To Cart',style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp)
                                ));
                              },
                              listener: (context, state) {
                                if (state is AddToCartSuccessState&& state.productId==item.id){
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
                                if(state is AddToCartErorrState&& state.productId==item.id){
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
                            /*child: Text('Add To Cart',style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp),)
                            ),

                             */
                          )
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      );
  }
}


