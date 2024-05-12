class EndPoint{
  static const String categoriesEndPoint='/api/v1/categories';
  static const String brandsEndPoint='/api/v1/brands';
  static const String productsEndPoint='/api/v1/products';
  static const String signUpEndPoint='/api/v1/auth/signup';
  static const String signInEndPoint='/api/v1/auth/signin';
  static const String cardEndPoint='/api/v1/cart';
  static const String wishListEndPoint='/api/v1/wishlist';
  static  String subCategoriesOfCategoriesEndPoint(String categoryId)=>'/api/v1/categories/$categoryId/subcategories';

}