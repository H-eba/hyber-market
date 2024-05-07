import 'package:ecommerce/domain/entites/cart/CartResponseEntity.dart';

abstract class CartViewModelState{}

class GetCartViewModelInitial extends CartViewModelState{}
class GetCartViewModelLoadingState extends CartViewModelState{}
class GetCartViewModelErrorState extends CartViewModelState{
  String error;
  GetCartViewModelErrorState(this.error);

}
class GetCartViewModelSuccessState extends CartViewModelState{
  CartResponseEntity cartResponseEntity;
  GetCartViewModelSuccessState(this.cartResponseEntity);

}
///delete
class DeleteCartViewModelLoadingState extends CartViewModelState{
  String productId;
  DeleteCartViewModelLoadingState(this.productId);
}
class DeleteCartViewModelErrorState extends CartViewModelState{
  String productId;
  String error;
  DeleteCartViewModelErrorState(this.error,this.productId);

}
class DeleteCartViewModelSuccessState extends CartViewModelState{
  String productId;
 CartResponseEntity cartResponseEntity;
  DeleteCartViewModelSuccessState(this.productId,this.cartResponseEntity);

}
///upDate
class UpDateCartViewModelLoadingState extends CartViewModelState{
  String productID;
UpDateCartViewModelLoadingState(this.productID);
}
class UpDateCartViewModelErrorState extends CartViewModelState{
  String productID;
  String error;
  UpDateCartViewModelErrorState(this.error,this.productID);

}
class UpDateCartViewModelSuccessState extends CartViewModelState{
  CartResponseEntity cartResponseEntity;
  String productID;
  UpDateCartViewModelSuccessState(this.cartResponseEntity,this.productID);

}