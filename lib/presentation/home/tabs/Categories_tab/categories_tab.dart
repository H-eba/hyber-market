import 'package:ecommerce/core/DI/di.dart';
import 'package:ecommerce/core/utils/colors_manager.dart';
import 'package:ecommerce/presentation/home/tabs/Categories_tab/categories_tab_view_model.dart';
import 'package:ecommerce/presentation/home/tabs/Categories_tab/widget/selection_category_widget.dart';
import 'package:ecommerce/presentation/home/tabs/Categories_tab/widget/sub_category_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesTab extends StatefulWidget {
   CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  int selectedIndex=1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoriesTabViewModel>()..getCategories(),
      child: BlocConsumer<CategoriesTabViewModel, CategoriesTabStates>(
        buildWhen: (previous, current) {
          if (current is GetCategoriesErrorStates ||
              current is GetCategoriesSuccessStates ||
              current is GetCategoriesLoadingStates) {
            return true;
          }
          return false;
        },
        listener: (context, state) {
          if(state is GetCategoriesSuccessStates){
            CategoriesTabViewModel.get(context).
            getSubCategories(state.categories[selectedIndex].id ??'');
          }
        },
        builder: (context, state) {
          if (state is GetCategoriesErrorStates) {
            return Center(
              child: Text('error'),
            );
          }
          if (state is GetCategoriesSuccessStates) {
            return Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ColorManager.categoriesBackGround,
                      border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(10.r)),
                  width: 137.w,
                  child: ListView.separated(
                      itemBuilder: (context, index) => SelectionCategoryWidget(
                        onSelected: (){
                          selectedIndex=index;
                          setState(() {

                          });
                          CategoriesTabViewModel.get(context).
                          getSubCategories(state.categories[selectedIndex].id??'');


                        },
                          category: state.categories[index],isSelected: index==selectedIndex,),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 20.h,
                          ),
                      itemCount: state.categories.length),
                ),
               Expanded(
                   child:

             Container(
               //color:Colors.redAccent,
               child: BlocBuilder<CategoriesTabViewModel,CategoriesTabStates>(
                 buildWhen: (previous, current) {
                   if(current is SubCategoriesErrorStates ||
                       current is SubCategoriesSuccessStates||
                       current is SubCategoriesLoadingStates){
                     return true;
                   }return false;
                 },
                 builder: (context, state) {
                   if (state is SubCategoriesSuccessStates){
                     return   Expanded(
                       child: GridView.builder(itemCount: state.subCategories.length,
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 2,
                             mainAxisExtent: 16.h,
                             crossAxisSpacing: 16.w,
                             childAspectRatio: 1/2
                         ),
                         itemBuilder:(context, index) =>
                             SubCategoryWidget(subcategoryEntity: state.subCategories[index]),),
                     );
                   }if(state is SubCategoriesErrorStates){
                     return Center(child: Text('erroe'),);
                   }return Center(child: CircularProgressIndicator(),);

                 },
               ),
             )
                   )

              ],

            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
