import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/route_manager.dart';
import '../../../../../domain/entites/ProductEntity.dart';
import '../../../../cart/view_model/view_model_cubit.dart';
import '../../../../cart/view_model/view_model_states.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var productEntity =
        ModalRoute.of(context)!.settings.arguments as ProductEntity;
    // var productEntity=ModalRoute.of(context)!.settings.arguments as ProductEntity ;
    return Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            AssetsManager.logo,
            height: 22.h,
            width: 66.w,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesManager.cartRouteName);
              },
              icon: SvgPicture.asset(
                AssetsManager.cartIcon,
                height: 22.h,
                width: 66.w,
              ),
            )
          ],
        ),
        body: Padding(
          padding: REdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                        width: 2.w,
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.3))),
                child: CarouselSlider.builder(
                    itemCount: productEntity.images?.length,
                    itemBuilder: (context, index, realIndex) => Image.network(
                          productEntity.images![index],
                          height: 200.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                    options: CarouselOptions(
                      autoPlay: true,
                    )),
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      '${productEntity.title}\n\n ' ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              color: Theme.of(context).primaryColor)),
                  Spacer(),
                  Text(' EGP  ${productEntity.price ?? 0}',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              color: Theme.of(context).primaryColor)),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                            width: 2.w,
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.3))),
                    child: Padding(
                      padding: REdgeInsets.all(8.0),
                      child: Text('${productEntity.sold ?? 0} sold',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: Theme.of(context).primaryColor)),
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.starIcon,
                        height: 15.h,
                        width: 15.w,
                      ),
                      Text(
                          '${productEntity.ratingsAverage ?? 0} (${productEntity.ratingsQuantity ?? 0})',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: Theme.of(context).primaryColor)),
                      // Text('${productEntity.ratingsQuantity??0} ')
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text('Description',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: Theme.of(context).primaryColor)),
              SizedBox(
                height: 10.h,
              ),
              Text(productEntity.description ?? ''),
              SizedBox(
                height: 10.h,
              ),
              Text('Size',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: Theme.of(context).primaryColor)),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('38'),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text('39'),
                  SizedBox(
                    width: 7.w,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    child: Center(child: Text('40')),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text('41'),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text('42'),
                ],
              ),
              SizedBox(
                height: 25.w,
              ),
              Text('Color',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: Theme.of(context).primaryColor)),
              SizedBox(
                height: 10.w,
              ),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.redAccent),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text('Total Price',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: Theme.of(context).primaryColor)),
                      Text('${productEntity.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: Theme.of(context).primaryColor)),
                    ],
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  BlocConsumer<CartViewModel, CartViewModelState>(
                    buildWhen: (previous, current) {
                      if (current is AddToCartLoadingState ||
                          current is AddToCartSuccessState ||
                          current is AddToCartErorrState) {
                        return true;
                      }
                      return false;
                    },
                    builder: (context, state) {
                      if (state is AddToCartLoadingState &&
                          state.productId == productEntity.id) {
                        return SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                      return InkWell(
                          onTap: () {
                            CartViewModel.get(context)
                                .addToCart(productEntity.id ?? '');
                          },
                          child: Container(
                            width: 190.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  AssetsManager.addToCartIcon,
                                  height: 25.h,
                                  width: 25.w,
                                ),
                                Text(
                                  'Add To Cart',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ));
                    },
                    listener: (context, state) {
                      if (state is AddToCartSuccessState &&
                          state.productId == productEntity.id) {
                        Fluttertoast.showToast(
                            msg: state.cartResponseEntity.message ?? '',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                      if (state is AddToCartErorrState &&
                          state.productId == productEntity.id) {
                        Fluttertoast.showToast(
                            msg: state.error,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
