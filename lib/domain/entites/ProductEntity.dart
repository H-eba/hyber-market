import 'package:ecommerce/domain/entites/BrandEntity.dart';
import 'package:ecommerce/domain/entites/CategoryEntity.dart';

class ProductEntity {
  ProductEntity({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.priceAfterDiscount, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
     });

  int? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  int? priceAfterDiscount;
  String? imageCover;
  CategoryEntity? category;
  BrandEntity? brand;
  num? ratingsAverage;




}

class BrandModel {
  BrandModel({
      this.id,
      this.name,
      this.slug,
      this.image,});


  String? id;
  String? name;
  String? slug;
  String? image;



}

class CategoryModel {
  CategoryModel({
      this.id,
      this.name,
      this.slug,
      this.image,});

  String? id;
  String? name;
  String? slug;
  String? image;



}

class SubcategoryEntity {
  SubcategoryEntity({
      this.id,
      this.name,
      this.slug,
      this.category,});

  String? id;
  String? name;
  String? slug;
  String? category;



}