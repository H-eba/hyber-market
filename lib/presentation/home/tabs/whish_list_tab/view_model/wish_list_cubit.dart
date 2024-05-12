import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';



import '../../../../../data/model/wish_list/GetWishListResponseModel.dart';

import '../../../../../domain/entites/wishListEntity/AddToWhishListEntity.dart';
import '../../../../../domain/use_cases/wish_list/delete_from_wish_list_use_case.dart';
import '../../../../../domain/use_cases/wish_list/get_wish_list_use_case.dart';

part 'wish_list_state.dart';

@injectable

class WishListViewModel extends Cubit<WishListViewModelState> {
  @factoryMethod
  WishListViewModel(this.getWishListUseCase,this.deleteFromWishListUseCase) : super(WishListInitialState());
  static WishListViewModel get(context) => BlocProvider.of(context);
  GetWishListUseCase getWishListUseCase;
  DeleteFromWishListUseCase deleteFromWishListUseCase;
  
  DeleteItemFromWishList(String productId)async{
    if (!isClosed){
      emit (DeleteFromWishListLoadingState(productId));
    }

    var result=await deleteFromWishListUseCase.call(productId:productId );
    result.fold((response) {
      if(!isClosed){
        emit(DeleteFromWishListSuccessState(response, productId));
           emit(GetWishListSuccessState(response));
       // emit(GetWishListSuccessState(response as GetWishListResponseModel ));

      }


    }, (error)
    {
      if(!isClosed){
        emit(DeleteFromWishListErrorState(error, productId));
      }

    }
    );
  }
  GetWishList()async{
    if (!isClosed){
      emit(GetWishListLoadingState());
    }

    var result=await getWishListUseCase.call();
    result.fold((response) {
      if(!isClosed){
        emit(GetWishListSuccessState(response));
      }


    }, (error)
    {
      if(!isClosed){
       emit(GetWishListErrorState(error));
      }

    }
    );
  }
}
