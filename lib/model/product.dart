class Product {
  Product(this.image, this.imageTitle, this.price, this.subTitle);

  factory Product.fromJson(dynamic productInJson) {
    return Product(
      productInJson['image'] ?? '',
      productInJson['imageTitle'] ?? '',
      productInJson['price'] ?? '',
      productInJson['subTitle'] ?? '',
    );
  }

  final String image;
  final String imageTitle;
  final String price;
  final String subTitle;
}
