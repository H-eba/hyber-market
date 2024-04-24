import 'package:ecommerce/core/resuable_components/product_widget.dart';
import 'package:ecommerce/presentation/home/tabs/home_tab/viewmodel/home_tab_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MostSellingProductsListWidget extends StatefulWidget {
  const MostSellingProductsListWidget({super.key});

  @override
  State<MostSellingProductsListWidget> createState() => _MostSellingProductsListWidgetState();
}

class _MostSellingProductsListWidgetState extends State<MostSellingProductsListWidget> {
  @override
  void initState() {

    super.initState();
    context.read<HomeTabViewModel>().getMostSellingProducts();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel,HomeTabStates>
      (buildWhen: (previous,current){
        if(current is mostSellingCategoryProductsSuccessState||current is mostSellingCategoryProductsLoadingState
        || current is mostSellingCategoryProductsErorrState){
          return true;
        }return false;
    },
        builder: (context,state){
        if(state is mostSellingCategoryProductsErorrState){
          return Center(child: Text(state.error),);
        }
        if(state is mostSellingCategoryProductsSuccessState){
          return SizedBox(
            height: 250.h,
            child: ListView.separated(scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProductWidget(productEntity: state.products[index],);
                },
                separatorBuilder: (context, index) => SizedBox(width: 20.w,),
                itemCount: state.products.length),
          );
        }return Center(child: CircularProgressIndicator(),);
    }
    );
  }
}
