import 'package:ecommerce/core/DI/di.dart';
import 'package:ecommerce/core/utils/strings_manager.dart';
import 'package:ecommerce/presentation/cart/view_model/view_model_cubit.dart';
import 'package:ecommerce/presentation/cart/view_model/view_model_states.dart';
import 'package:ecommerce/presentation/cart/widgets/cart_item_wedgit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/assets_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<CartViewModel>()..GetCart(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(StringsManager.cart),
        ),
        body: Padding(
          padding: REdgeInsets.all(15),
          child: BlocBuilder<CartViewModel, CartViewModelState>(
            buildWhen: (previous, current) {
              if(current is GetCartViewModelLoadingState || current is GetCartViewModelSuccessState
              ||current is GetCartViewModelErrorState){
                return true;
              }return false;
            },
            builder: (context, state) {
            if (state is GetCartViewModelSuccessState){
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => CartItemWidget(
                          cartItemEntity: state.cartResponseEntity.data!.products![index],
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 15.h,
                        ),
                        itemCount: state.cartResponseEntity.data?.products?.length??0),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            StringsManager.totalPrice,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.6)),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            'EGP ${state.cartResponseEntity.data?.totalCartPrice??0}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                Theme.of(context).colorScheme.primary),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                 // state.cartResponseEntity.numOfCartItems.toString(),
                                  StringsManager.checkOut,
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                SvgPicture.asset(AssetsManager.arrow)
                              ],
                            ),
                          ))
                    ],
                  )
                ],
              );
            }if(state is GetCartViewModelErrorState){
              return Center(child: Text(state.error),);
            }return Center(child: CircularProgressIndicator(),);
            },
          ),
        ),
      ),
    );
  }
}
