class EndPoint{
  static const String categoriesEndPoint='/api/v1/categories';
  static const String brandsEndPoint='/api/v1/brands';
  static const String productsEndPoint='/api/v1/products';
  static const String signUpEndPoint='/api/v1/auth/signup';
  static  String subCategoriesOfCategoriesEndPoint(String categoryId)=>'/api/v1/categories/$categoryId/subcategories';

}