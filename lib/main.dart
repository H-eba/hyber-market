import 'package:ecommerce/core/api/api_manager/api_manager.dart';
import 'package:ecommerce/core/local/prefsHelper.dart';
import 'package:ecommerce/presentation/cart/view_model/view_model_cubit.dart';
import 'package:ecommerce/presentation/home/tabs/home_tab/viewmodel/home_tab_view_model.dart';
import 'package:ecommerce/presentation/home/tabs/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/DI/di.dart';
import 'core/my_observer.dart';
import 'myapp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  ApiManager.init();
  await PrefsHelper.init();
  configureDependencies();


  runApp(
     // const MyApp());
      MultiBlocProvider(
        providers: [
          BlocProvider<CartViewModel>(
            create: (BuildContext context)=> getIt<CartViewModel>(),
          ),
          BlocProvider<HomeTabViewModel>(
            create: (BuildContext context)=> getIt<HomeTabViewModel>(),
          ),
        ],
       child:  const MyApp())
      );

      //BlocProvider(

      //create: (BuildContext context)=> getIt<CartViewModel>(),

    //child:  const MyApp()));
}




