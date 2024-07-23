import 'package:ecommerce/core/resuable_components/product_widget.dart';
import 'package:ecommerce/domain/entites/ProductEntity.dart';
import 'package:ecommerce/presentation/home/tabs/home_tab/item_seatch.dart';
import 'package:ecommerce/presentation/home/tabs/home_tab/viewmodel/home_tab_view_model.dart';
import 'package:ecommerce/presentation/home/tabs/whish_list_tab/whish_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entites/cart/CartItemEntity.dart';

class ProductsSearch extends SearchDelegate {
  CartItemEntity? cartItemEntity;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: (Icon(
            Icons.search,
            color: Colors.black,
          )))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: (Icon(
          Icons.clear,
          color: Colors.black,
        )));
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocConsumer< HomeTabViewModel, HomeTabStates>(
      buildWhen: (previous, current) {
        if(current is mostSellingCategoryProductsLoadingState ||
            current is mostSellingCategoryProductsErorrState ||
            current is mostSellingCategoryProductsSuccessState){
          return true;
        }return false;

      },
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state)

      {  if (state is mostSellingCategoryProductsSuccessState){
        return ListView.builder(itemBuilder: (context, index) =>
         ProductWidget(productEntity: state.products[index]));
      }if (state is mostSellingCategoryProductsLoadingState){
        return Center(child: CircularProgressIndicator(),);
      }return Center(child: Text('error'),);

      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text('search', style: TextStyle(fontSize: 25),));
  }

}