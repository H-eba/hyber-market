import 'package:ecommerce/core/DI/di.dart';
import 'package:ecommerce/presentation/home/tabs/whish_list_tab/view_model/wish_list_cubit.dart';
import 'package:ecommerce/presentation/home/tabs/whish_list_tab/whish_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<WishListViewModel>()..GetWishList(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        body: Padding(
          padding: REdgeInsets.all(15),
          child: BlocBuilder<WishListViewModel, WishListViewModelState>(
            buildWhen: (previous, current) {
              if(current is GetWishListErrorState|| current is GetWishListLoadingState
                  ||current is GetWishListSuccessState){
                return true;
              }return false;
            },
            builder: (context, state) {
              if (state is GetWishListSuccessState){
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => WishItemWidget(item: state.getWishListEntity.data![index]),

                          separatorBuilder: (context, index) => SizedBox(
                            height: 15.h,
                          ),

                          itemCount: state.getWishListEntity.data?.length??0),
                    ),

                  ],
                );
              }if(state is GetWishListErrorState){
                return Center(child: Text(state.error),);
              }return Center(child: CircularProgressIndicator(),);
            },
          ),
        ),
      ),
    );
  }
}
