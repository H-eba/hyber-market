import 'package:ecommerce/domain/entites/ProductEntity.dart';



/// count : 14
/// _id : "6632c1b6d9d76602757ba4fb"
/// product : {"subcategory":[{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}],"_id":"6428cbd5dc1175abc65ca037","title":"Essentials Embroidered Linear Logo T-Shirt Navy","quantity":118,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680395220407-cover.jpeg","category":{"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"},"brand":{"_id":"64089c3924b25627a2531593","name":"Adidas","slug":"adidas","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285881943.png"},"ratingsAverage":3.8,"id":"6428cbd5dc1175abc65ca037"}
/// price : 749

class CartItemEntity {
  CartItemEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});


  int? count;
  String? id;
  ProductEntity? product;
  int? price;



}