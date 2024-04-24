import 'package:ecommerce/presentation/home/tabs/home_tab/viewmodel/home_tab_view_model.dart';
import 'package:ecommerce/presentation/home/tabs/home_tab/widgets/categories_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesListedWidget extends StatefulWidget {
   CategoriesListedWidget({super.key});

  @override
  State<CategoriesListedWidget> createState() => _CategoriesListedWidgetState();
}

class _CategoriesListedWidgetState extends State<CategoriesListedWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     HomeTabViewModel.get(context).getCategory();
    }
    );
  }
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabViewModel, HomeTabStates>(
      listenWhen:(prevState,currentState){
        if (currentState is CategoriesLoadingState){
          return true;
        }
        if (currentState is CategoriesErrorState){
          return true;
        }
        if(currentState is CategoriesSuccessState){
          return true;
        }
        return false;
      } ,
      buildWhen: (prevState,currentState){
        if (currentState is CategoriesSuccessState){
          return true;
        }
        return false;
      },
        builder: (context, state){
        if (state is CategoriesSuccessState){
          {
            return SizedBox(
              height: 288.h,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return CategoriesWidget(category: state.categories[index]);
                },
              itemCount: state.categories.length,),
            );
          }
        }
        return Container();
        }

      , listener: (BuildContext context, HomeTabStates state) {
      if( state is CategoriesLoadingState){
        showDialog(context: context, builder: (context) => AlertDialog(
          content: SizedBox(height: 70.h,
              child: Center(child: CircularProgressIndicator(),)),
        ),);
      }
      if (state is CategoriesErrorState){
        showDialog(context: context, builder: (context) => AlertDialog(
          content: SizedBox(
            height: 70.h,
              child: Center(child: Text(state.error),)),
        ),);
      }
      if(state is CategoriesSuccessState){
        Navigator.pop(context);
      }
    },

    );
  }
}
