import '../../../domain/entites/cart/CartResponseEntity.dart';
import 'CartModel.dart';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 3
/// data : {"_id":"6631b1f0d9d766027579766e","cartOwner":"6407cf6f515bdcf347c09f17","products":[{"count":3,"_id":"6631b1f0d9d766027579766f","product":"6428ebc6dc1175abc65ca0b9","price":160},{"count":1,"_id":"6631b1f3d9d766027579767b","product":"6428eb43dc1175abc65ca0b3","price":149},{"count":1,"_id":"6632807cd9d76602757a382e","product":"6428e997dc1175abc65ca0a1","price":149}],"createdAt":"2024-05-01T03:07:28.289Z","updatedAt":"2024-05-01T18:04:34.086Z","__v":2,"totalCartPrice":778}

class CartResponseModel {
  CartResponseModel({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.data,
    this.statusMsg
  });

  CartResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? CartModel.fromJson(json['data']) : null;
    statusMsg=json['statusMsg'];
  }
  String? status;
  String? message;
  int? numOfCartItems;
  CartModel? data;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
  CartResponseEntity toCartResponseEntity(){
    return CartResponseEntity(
      numOfCartItems: numOfCartItems,
      data:data?.toCartEntity(),
      message: message,
      status: status,
      statusMsg: statusMsg

    );
  }

}