import 'package:ecommerce/presentation/home/tabs/home_tab/viewmodel/home_tab_view_model.dart';
import 'package:ecommerce/presentation/home/tabs/home_tab/widgets/brand_widget/brand_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsListedWidget extends StatefulWidget {
  BrandsListedWidget({super.key});

  @override
  State<BrandsListedWidget> createState() => _BrandsListedWidgetState();
}

class _BrandsListedWidgetState extends State<BrandsListedWidget> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<HomeTabViewModel>().getBrands();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabViewModel,HomeTabStates>(
      buildWhen: (prevState,currentState){
        if(currentState is BrandsSuccessState||currentState is BrandsErrorState||
            currentState is BrandsLoadingState){
          return true;
        }return false;
      },
        builder: (context,state){
        if(state is BrandsSuccessState){
          return SizedBox(
            height: 140.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>BrandWidget(brand: state.brands[index]),
                separatorBuilder: (context, index) => SizedBox(width: 20.w,),
                itemCount: state.brands.length),
          );
        }else if(state is BrandsErrorState){
          return Center(child: Text(state.error),);
        }return Center(child: CircularProgressIndicator(),);

        },
        listener:(context,state){

        },);
  }
}
