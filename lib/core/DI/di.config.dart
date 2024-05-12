// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/dao/datasource-impl/auth_ds_impl/auth_ds_impl.dart' as _i9;
import '../../data/dao/datasource-impl/brands_ds_impl/brands_ds_impl.dart'
    as _i7;
import '../../data/dao/datasource-impl/cart_ds_impl/cart_ds_impl.dart' as _i19;
import '../../data/dao/datasource-impl/categories_ds_imp/categories_ds_imp.dart'
    as _i5;
import '../../data/dao/datasource-impl/products_ds_impl/product_ds_impl.dart'
    as _i26;
import '../../data/dao/datasource-impl/sub_categories_ds_imp/sub_categories_ds_imp.dart'
    as _i13;
import '../../data/dao/datasource-impl/wish_list_ds_imp.dart' as _i17;
import '../../data/dao/datasource_contract/auth_ds/auth_ds.dart' as _i8;
import '../../data/dao/datasource_contract/brands_ds/brands_ds.dart' as _i6;
import '../../data/dao/datasource_contract/cart_ds/cart_ds.dart' as _i18;
import '../../data/dao/datasource_contract/categories_ds/categories_ds.dart'
    as _i4;
import '../../data/dao/datasource_contract/products_ds/product_ds.dart' as _i25;
import '../../data/dao/datasource_contract/sub_category_ds/sub_categories_ds.dart'
    as _i12;
import '../../data/dao/datasource_contract/wish_list_ds/wish_list_ds.dart'
    as _i16;
import '../../data/repository_implementation/auth_repo_impl/auth_repo_impl.dart'
    as _i15;
import '../../data/repository_implementation/brands_repo_impl/brands_repo_impl.dart'
    as _i11;
import '../../data/repository_implementation/cart_repo_impl/cart_repo_impl.dart'
    as _i39;
import '../../data/repository_implementation/categories_repo_impl/categories_repo_impl.dart'
    as _i28;
import '../../data/repository_implementation/products_repo_impl/Products_repo_impl.dart'
    as _i36;
import '../../data/repository_implementation/sub_categories_repo_imp/sub_categories_repo_imp.dart'
    as _i23;
import '../../data/repository_implementation/wish_list_repo_impl/wish_list_repo_impl.dart'
    as _i21;
import '../../domain/repository_contract/auth_repo/auth_repo.dart' as _i14;
import '../../domain/repository_contract/brands_repo/brands_repo.dart' as _i10;
import '../../domain/repository_contract/cart_repo/cart_repo.dart' as _i38;
import '../../domain/repository_contract/category_repo/category_repo.dart'
    as _i27;
import '../../domain/repository_contract/products_repo/products_repo.dart'
    as _i35;
import '../../domain/repository_contract/sub_categories_repo/sub_categories_repo.dart'
    as _i22;
import '../../domain/repository_contract/wish_list_repo/wish_list_repo.dart'
    as _i20;
import '../../domain/use_cases/add_to_cart_use_case/add_to_cart_use_case.dart'
    as _i46;
import '../../domain/use_cases/add_to_cart_use_case/delete_from_cart.dart'
    as _i48;
import '../../domain/use_cases/add_to_cart_use_case/get_cart_use_case.dart'
    as _i47;
import '../../domain/use_cases/add_to_cart_use_case/update_cart_use_case.dart'
    as _i49;
import '../../domain/use_cases/auth_use_case/sign_in_use_case.dart' as _i32;
import '../../domain/use_cases/auth_use_case/sign_up_use_case.dart' as _i33;
import '../../domain/use_cases/get_brands_use_case/get_brands_use_case.dart'
    as _i24;
import '../../domain/use_cases/get_category_use_case.dart' as _i37;
import '../../domain/use_cases/get_most_selling_products_use_case/get_most_selling_products_use_case.dart'
    as _i43;
import '../../domain/use_cases/get_sub_categories_use_case/get_sub_categories_use_case.dart'
    as _i41;
import '../../domain/use_cases/wish_list/add_wish_list_item_use_case.dart'
    as _i29;
import '../../domain/use_cases/wish_list/delete_from_wish_list_use_case.dart'
    as _i31;
import '../../domain/use_cases/wish_list/get_wish_list_use_case.dart' as _i30;
import '../../presentation/cart/view_model/view_model_cubit.dart' as _i50;
import '../../presentation/home/login_screen/login_view_model.dart' as _i34;
import '../../presentation/home/register_screen/register_view_mode/sign_up__view_mode.dart'
    as _i40;
import '../../presentation/home/tabs/Categories_tab/categories_tab_view_model.dart'
    as _i44;
import '../../presentation/home/tabs/home_tab/viewmodel/home_tab_view_model.dart'
    as _i45;
import '../../presentation/home/tabs/whish_list_tab/view_model/wish_list_cubit.dart'
    as _i42;
import '../api/api_manager/api_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.CategoriesDataSource>(
        () => _i5.CategoriesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.BrandsDataSource>(
        () => _i7.BrandsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.AuthDataSource>(
        () => _i9.AuthDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.BrandsRepo>(
        () => _i11.BrandsRepoImpl(gh<_i6.BrandsDataSource>()));
    gh.factory<_i12.SubCategoriesDataSource>(
        () => _i13.SubCategoriesDataSourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i14.AuthRepo>(
        () => _i15.AuthRepoImpl(gh<_i8.AuthDataSource>()));
    gh.factory<_i16.WishListDateSource>(
        () => _i17.WishListDateSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i18.CartDataSource>(
        () => _i19.CartDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i20.WishListRepo>(
        () => _i21.WishListRepoImpl(gh<_i16.WishListDateSource>()));
    gh.factory<_i22.SubCategoriesRepo>(
        () => _i23.SubCategoriesRepoImpl(gh<_i12.SubCategoriesDataSource>()));
    gh.factory<_i24.GetBrandsUseCase>(
        () => _i24.GetBrandsUseCase(gh<_i10.BrandsRepo>()));
    gh.factory<_i25.ProductsDataSource>(
        () => _i26.ProductsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i27.CategoriesRepo>(
        () => _i28.CategoriesRepoImpl(gh<_i4.CategoriesDataSource>()));
    gh.factory<_i29.AddToWishListUseCase>(
        () => _i29.AddToWishListUseCase(gh<_i20.WishListRepo>()));
    gh.factory<_i30.GetWishListUseCase>(
        () => _i30.GetWishListUseCase(gh<_i20.WishListRepo>()));
    gh.factory<_i31.DeleteFromWishListUseCase>(
        () => _i31.DeleteFromWishListUseCase(gh<_i20.WishListRepo>()));
    gh.factory<_i32.SignInUseCase>(
        () => _i32.SignInUseCase(gh<_i14.AuthRepo>()));
    gh.factory<_i33.SignUpUseCase>(
        () => _i33.SignUpUseCase(gh<_i14.AuthRepo>()));
    gh.factory<_i34.LoginViewModel>(
        () => _i34.LoginViewModel(gh<_i32.SignInUseCase>()));
    gh.factory<_i35.ProductsRepo>(
        () => _i36.ProductsRepoImpl(gh<_i25.ProductsDataSource>()));
    gh.factory<_i37.GetCategoriesUseCase>(
        () => _i37.GetCategoriesUseCase(gh<_i27.CategoriesRepo>()));
    gh.factory<_i38.CartRepo>(
        () => _i39.CartRepoImpl(gh<_i18.CartDataSource>()));
    gh.factory<_i40.SignUpViewModel>(
        () => _i40.SignUpViewModel(gh<_i33.SignUpUseCase>()));
    gh.factory<_i41.getSubCategoriesOfSpecificCategoryUseCase>(() =>
        _i41.getSubCategoriesOfSpecificCategoryUseCase(
            gh<_i22.SubCategoriesRepo>()));
    gh.factory<_i42.WishListViewModel>(() => _i42.WishListViewModel(
          gh<_i30.GetWishListUseCase>(),
          gh<_i31.DeleteFromWishListUseCase>(),
        ));
    gh.factory<_i43.GetMostSellingProductsUseCase>(
        () => _i43.GetMostSellingProductsUseCase(gh<_i35.ProductsRepo>()));
    gh.factory<_i44.CategoriesTabViewModel>(() => _i44.CategoriesTabViewModel(
          gh<_i37.GetCategoriesUseCase>(),
          gh<_i41.getSubCategoriesOfSpecificCategoryUseCase>(),
        ));
    gh.factory<_i45.HomeTabViewModel>(() => _i45.HomeTabViewModel(
          gh<_i29.AddToWishListUseCase>(),
          gh<_i37.GetCategoriesUseCase>(),
          gh<_i24.GetBrandsUseCase>(),
          gh<_i43.GetMostSellingProductsUseCase>(),
        ));
    gh.factory<_i46.AddToCartUseCase>(
        () => _i46.AddToCartUseCase(gh<_i38.CartRepo>()));
    gh.factory<_i47.GetCartUseCase>(
        () => _i47.GetCartUseCase(gh<_i38.CartRepo>()));
    gh.factory<_i48.DeleteFromCartUseCase>(
        () => _i48.DeleteFromCartUseCase(gh<_i38.CartRepo>()));
    gh.factory<_i49.UpDateCartUseCase>(
        () => _i49.UpDateCartUseCase(gh<_i38.CartRepo>()));
    gh.factory<_i50.CartViewModel>(() => _i50.CartViewModel(
          gh<_i46.AddToCartUseCase>(),
          gh<_i47.GetCartUseCase>(),
          gh<_i48.DeleteFromCartUseCase>(),
          gh<_i49.UpDateCartUseCase>(),
        ));
    return this;
  }
}
