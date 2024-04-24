import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/DI/di.dart';
import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/strings_manager.dart';
import 'package:ecommerce/presentation/home/tabs/home_tab/viewmodel/home_tab_view_model.dart';
import 'package:ecommerce/presentation/home/tabs/home_tab/widgets/brand_widget/brands_list_widget.dart';
import 'package:ecommerce/presentation/home/tabs/home_tab/widgets/catogries_listed_widget.dart';
import 'package:ecommerce/presentation/home/tabs/home_tab/widgets/most_selling_products_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  static const List<String> ecommerceAdsList = [
    AssetsManager.ad1,
    AssetsManager.ad2,
    AssetsManager.ad3,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeTabViewModel>(),
      child: Padding(
          padding: REdgeInsets.all(16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CarouselSlider.builder(
                    itemCount: ecommerceAdsList.length,
                    itemBuilder: (context, index, realIndex) => Image.asset(
                          ecommerceAdsList[index],
                          height: 200.h,
                          width: 398.w,
                        ),
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 0.6,
                      enlargeFactor: 0.5,
                      enlargeCenterPage: true,
                    )),
              ),
              SliverToBoxAdapter(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(StringsManager.category,
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text(StringsManager.viewALL,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                fontSize: 12.sp, fontWeight: FontWeight.w400))
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 16.h,
                ),
              ),
              SliverToBoxAdapter(child: CategoriesListedWidget()),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 24.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Text(StringsManager.brands,
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              SliverToBoxAdapter(
                child: BrandsListedWidget(),
              ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 24.h,
          ),),
              SliverToBoxAdapter(
                child: Text(StringsManager.mostSellingProducts,
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              SliverToBoxAdapter(
                child: MostSellingProductsListWidget(),
              )

            ],
          )),
    );
  }
}
