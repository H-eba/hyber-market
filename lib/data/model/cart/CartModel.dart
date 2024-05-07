import 'package:ecommerce/domain/entites/cart/CartEntity.dart';

import 'CartItemModel.dart';

/// _id : "6631b1f0d9d766027579766e"
/// cartOwner : "6407cf6f515bdcf347c09f17"
/// products : [{"count":3,"_id":"6631b1f0d9d766027579766f","product":"6428ebc6dc1175abc65ca0b9","price":160},{"count":1,"_id":"6631b1f3d9d766027579767b","product":"6428eb43dc1175abc65ca0b3","price":149},{"count":1,"_id":"6632807cd9d76602757a382e","product":"6428e997dc1175abc65ca0a1","price":149}]
/// createdAt : "2024-05-01T03:07:28.289Z"
/// updatedAt : "2024-05-01T18:04:34.086Z"
/// __v : 2
/// totalCartPrice : 778

class CartModel {
  CartModel({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  CartModel.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(CartItemModel.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
  String? id;
  String? cartOwner;
  List<CartItemModel>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }
CartEntity toCartEntity(){
    return CartEntity(
      totalCartPrice: totalCartPrice,
      products: products?.map((e) => e.toCartItemEntity()).toList(),
      id: id,
      cartOwner: cartOwner
    );
}

}