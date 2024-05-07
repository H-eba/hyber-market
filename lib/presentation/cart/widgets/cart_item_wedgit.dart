import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/strings_manager.dart';
import 'package:ecommerce/domain/entites/cart/CartItemEntity.dart';
import 'package:ecommerce/presentation/cart/view_model/view_model_cubit.dart';
import 'package:ecommerce/presentation/cart/view_model/view_model_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartItemWidget extends StatelessWidget {
  CartItemEntity cartItemEntity;
  CartItemWidget({required this.cartItemEntity, super.key});

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
              imageUrl: cartItemEntity.product?.imageCover ?? '',
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
                      cartItemEntity.product?.title ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    )),


 BlocConsumer<CartViewModel, CartViewModelState>(
                      buildWhen: (previous, current) {
                        if(current is DeleteCartViewModelLoadingState||
                        current is DeleteCartViewModelErrorState
                            ||current is DeleteCartViewModelSuccessState){
                          return true;
                        }return false;

                      }
                      ,
                      builder: (context, state) {

                        if(state is DeleteCartViewModelLoadingState &&state.productId==cartItemEntity.id){
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

                           CartViewModel.get(context).DeleteFromCart(cartItemEntity.product?.id??'');


                          },
                            child: SvgPicture.asset(AssetsManager.delete));
                      },
                      listener: (context, state) {
                        if (state is DeleteCartViewModelSuccessState&&state.productId==cartItemEntity.id){

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
                        if (state is DeleteCartViewModelErrorState&&state.productId==cartItemEntity.id){
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
                      'EGP${cartItemEntity.price ?? 0}',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Spacer(),
                    Container(
                      padding: REdgeInsets.all(11),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        children: [

                          BlocConsumer<CartViewModel, CartViewModelState>(
                            buildWhen: (previous, current) {
                              if(current is UpDateCartViewModelLoadingState||
                                  current is UpDateCartViewModelErrorState
                                  ||current is UpDateCartViewModelSuccessState){
                                return true;
                              }return false;

                            }
                            ,
                            builder: (context, state) {

                              if(state is UpDateCartViewModelLoadingState&&state.productID==cartItemEntity.id){
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
                                    int counter=cartItemEntity.count!.toInt();

                                   counter==1?
                                     CartViewModel.get(context).DeleteFromCart(cartItemEntity.product?.id??''):

                                     counter--;
                                     CartViewModel.get(context).UpDateCart(cartItemEntity.product?.id??'',counter);



                                  },
                                  child: SvgPicture.asset(AssetsManager.subtract));
                            },
                            listener: (context, state) {
                              if (state is UpDateCartViewModelSuccessState&&state.productID==cartItemEntity.id){

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
                              if (state is UpDateCartViewModelErrorState&&state.productID==cartItemEntity.id){
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
                          ),


                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            (cartItemEntity.count ?? 0).toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          BlocConsumer<CartViewModel, CartViewModelState>(
                            buildWhen: (previous, current) {
                              if(current is UpDateCartViewModelLoadingState||
                                  current is UpDateCartViewModelErrorState
                                  ||current is UpDateCartViewModelSuccessState){
                                return true;
                              }return false;

                            }
                            ,
                            builder: (context, state) {

                              if(state is UpDateCartViewModelLoadingState&&state.productID==cartItemEntity.id){
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
                                       int counter=cartItemEntity.count!.toInt();
                                       counter++;
                                    CartViewModel.get(context).UpDateCart(cartItemEntity.product?.id??'',counter);


                                  },
                                  child: SvgPicture.asset(AssetsManager.add));
                            },
                            listener: (context, state) {
                              if (state is UpDateCartViewModelSuccessState&&state.productID==cartItemEntity.id){

                                Fluttertoast.showToast(
                                    msg:'add',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }
                              if (state is UpDateCartViewModelErrorState&&state.productID==cartItemEntity.id){
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
