import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/local/prefsHelper.dart';
import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/route_manager.dart';
import 'package:ecommerce/domain/entites/cart/CartResponseEntity.dart';
import 'package:ecommerce/presentation/cart/view_model/view_model_cubit.dart';
import 'package:ecommerce/presentation/cart/view_model/view_model_states.dart';
import 'package:ecommerce/presentation/home/tabs/Categories_tab/categories_tab.dart';
import 'package:ecommerce/presentation/home/tabs/home_tab/home_tab.dart';
import 'package:ecommerce/presentation/home/tabs/home_tab/search.dart';
import 'package:ecommerce/presentation/home/tabs/home_view_model.dart';
import 'package:ecommerce/presentation/home/tabs/profile_tab/profilr_tab.dart';
import 'package:ecommerce/presentation/home/tabs/whish_list_tab/wish_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatelessWidget {
  CartResponseEntity?cartResponseEntity;
   HomeScreen({this.cartResponseEntity,super.key});
  static List<Widget>tabs=[
    HomeTab(),
    CategoriesTab(),
    WishList(),
    ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
   // print(PrefsHelper.getToken());
   // CartViewModel cart=CartViewModel.get(context);
    return BlocProvider(
      create: (context)=>HomeViewModel(),
      child: BlocBuilder<HomeViewModel,HomeStates>(
        builder: (context,state){
          HomeViewModel homeViewModel=HomeViewModel.get(context);
         // HomeViewModel cartViewModel=CartViewModel.get(context);
          return Scaffold(
            appBar: AppBar(

              title:
              SvgPicture.asset(
                AssetsManager.logo,
                height: 22.h,
                width: 66.w,
              ),

              actions: [

                IconButton(onPressed: () {
                  PrefsHelper.clearToken();
                  Navigator.pushNamedAndRemoveUntil(context, RoutesManager.loginRouteName, (route) => false);
                }, icon:Icon(Icons.logout) ),



              /* BlocConsumer<CartViewModel,CartViewModelState>(
                  buildWhen: (previous, current) {
                    if(current is AddToCartLoadingState||
                        current is AddToCartSuccessState||
                        current is AddToCartErorrState){
                      return true;
                    }return false;
                  },
                  builder: (context, state) {

                    if(state is AddToCartSuccessState ){
                      return Badge(

                        label:Text(state.cartResponseEntity.numOfCartItems.toString(),),
                        child: IconButton(onPressed: () {
                          Navigator.pushNamed(context,RoutesManager.cartRouteName);
                        }, icon: SvgPicture.asset(
                          AssetsManager.cartIcon,
                          height: 22.h,
                          width: 66.w,),),
                      );
                    }
                    if(state is AddToCartLoadingState){
                      return Center(child: CircularProgressIndicator(),);
                    }return Center(child:Text('error'),);
                  },
                 listener: (context, state) {

                 },
                )*/



              ],
            ),

            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: BottomNavigationBar(
                showUnselectedLabels: false,
                showSelectedLabels: false,
                currentIndex:homeViewModel.currentTabIndex ,
               // type: BottomNavigationBarType.fixed,
                onTap: (newIndex){
                  homeViewModel.changeTabIndex(newIndex);
                },
                items: [
                  BottomNavigationBarItem(
                      backgroundColor: Theme.of(context).colorScheme.primary,

                      icon: SvgPicture.asset(AssetsManager.homeUnSelected,
                        width:40.w,
                        height: 40.h,),
                      activeIcon: SvgPicture.asset(AssetsManager.homeSelected,
                        width:40.w,
                        height: 40.h,),
                      label: ''
                  ),
                  BottomNavigationBarItem(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      icon: SvgPicture.asset(AssetsManager.categoriesUnSelected,
                        width:40.w,
                        height: 40.h,),
                      activeIcon: SvgPicture.asset(AssetsManager.categoriesSelected,
                        width:40.w,
                        height: 40.h,),
                      label: ''
                  ),
                  BottomNavigationBarItem(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      icon: SvgPicture.asset(AssetsManager.whishUnSelected,
                        width:40.w,
                        height: 40.h,),
                      activeIcon: SvgPicture.asset(AssetsManager.whishSelected,
                        width:40.w,
                        height: 40.h,),
                      label: ''
                  ),
                  BottomNavigationBarItem(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      icon: SvgPicture.asset(AssetsManager.profileUnSelected,
                        width:40.w,
                        height: 40.h,),
                      activeIcon: SvgPicture.asset(AssetsManager.profileSelected,
                        width:40.w,
                        height: 40.h,),
                      label: ''
                  ),


                ],
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 5.h),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xFF004182)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xFF004182)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              prefixIcon: InkWell(
                                onTap: (){
                                  showSearch(context: context, delegate: ProductsSearch());
                                },
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xFF06004E),
                                ),
                              ),
                              hintText: 'what do you search for?',
                              hintStyle: TextStyle(
                                color: Color(0x9906004E),
                                fontSize: 14.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.shopping_cart,
                          size: 30.0.sp,
                          color: Color(0xff004182),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Expanded(child:  tabs[homeViewModel.currentTabIndex]),
              ],
            ),
          );
        },
      ),
    );



  }
//tabs[homeViewModel.currentTabIndex]
}
