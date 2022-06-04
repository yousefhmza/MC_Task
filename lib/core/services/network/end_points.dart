class EndPoints {
  static const String getHome = "home";

  static String getProduct(int prodId) => "product_details/$prodId";

  static String getCategoryProducts(int catId) => "products_cat/$catId";
}
