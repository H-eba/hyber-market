import 'package:ecommerce/data/model/products/ProductsResponse.dart';
import 'package:ecommerce/domain/entites/cart/CartItemEntity.dart';

/// count : 3
/// _id : "6631b1f0d9d766027579766f"
/// product : "6428ebc6dc1175abc65ca0b9"
/// price : 160

class CartItemModel {
  CartItemModel({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  CartItemModel.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] is! String
        ? ProductModel.fromJson(json['product'])
        : null;
    price = json['price'];
  }
  int? count;
  String? id;
  ProductModel? product;
  int? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }
  CartItemEntity toCartItemEntity(){
    return CartItemEntity(
      id: id,
      price: price,
      product: product?.toProductEntity(),
      count: count
    );
  }
}
