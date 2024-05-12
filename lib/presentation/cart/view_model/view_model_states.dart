import 'package:ecommerce/domain/entites/cart/CartResponseEntity.dart';

import '../../../domain/entites/wishListEntity/AddToWhishListEntity.dart';

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
///add to cart
class AddToCartLoadingState extends CartViewModelState{
  String productId;
  AddToCartLoadingState(this.productId);
}
class AddToCartSuccessState extends CartViewModelState{
  CartResponseEntity cartResponseEntity;
  String productId;
  AddToCartSuccessState(this.cartResponseEntity,this.productId);
}
class AddToCartErorrState extends CartViewModelState{
  String error;
  String productId;
  AddToCartErorrState(this.error,this.productId);
}
