part of 'wish_list_cubit.dart';


 class WishListViewModelState {}

class WishListInitialState extends WishListViewModelState {}
class GetWishListLoadingState extends WishListViewModelState {}
class GetWishListSuccessState extends WishListViewModelState {
  GetWishListResponseModel getWishListEntity;
   GetWishListSuccessState(this.getWishListEntity);
}
class GetWishListErrorState extends WishListViewModelState {
   String error;
   GetWishListErrorState(this.error);


}
class  DeleteFromWishListLoadingState extends WishListViewModelState  {
  String productId;
  DeleteFromWishListLoadingState(this.productId);

}
class  DeleteFromWishListSuccessState extends  WishListViewModelState {
  GetWishListResponseModel  WishListEntityResponse;
  String productId;
  DeleteFromWishListSuccessState(this.WishListEntityResponse,this.productId);
}
class  DeleteFromWishListErrorState extends  WishListViewModelState {
  String error;
  String productId;
  DeleteFromWishListErrorState(this.error,this.productId);
}



