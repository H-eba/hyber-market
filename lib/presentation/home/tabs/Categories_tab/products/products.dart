import 'package:ecommerce/core/DI/di.dart';
import 'package:ecommerce/core/resuable_components/product_widget.dart';
import 'package:ecommerce/presentation/home/tabs/home_tab/viewmodel/home_tab_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/route_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../domain/entites/ProductEntity.dart';

class ProductsScreen extends StatelessWidget {

ProductsScreen({ super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>getIt.get<HomeTabViewModel>()..getMostSellingProducts(),
      child: Scaffold(
        appBar: AppBar(


        ),
        body: Padding(
          padding: REdgeInsets.all(15),
          child: BlocBuilder<HomeTabViewModel, HomeTabStates>(
            buildWhen: (previous, current) {
              if(current is mostSellingCategoryProductsErorrState || current is mostSellingCategoryProductsLoadingState
                  ||current is mostSellingCategoryProductsSuccessState){
                return true;
              }return false;
            },
            builder: (context, state) {
              if (state is mostSellingCategoryProductsSuccessState){
                return Column(
                  children: [
                    Expanded(
                      child:  GridView.builder(
                        gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                        childAspectRatio: 2/2.5
                      ),
                          itemBuilder: (context, index) =>

                              InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, RoutesManager.ProductDetailsRouteName,
                                  arguments:state.products[index] );
                                },
                                  child: ProductWidget(productEntity:state.products[index] )),
                      itemCount: state.products.length,)
                    ),
                  ],
                );
              }if(state is mostSellingCategoryProductsErorrState){
                return Center(child: Text(state.error),);
              }return Center(child: CircularProgressIndicator(),);
            },
          ),
        ),
      ),
    );
  }
}
