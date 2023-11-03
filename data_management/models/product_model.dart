class ProductModel {
  String productId;
  String productName;
  double productPrice;
  String productImageURL;
  int productQuantity;
  String productDescription;
  bool isHoney;
  bool? isDiscount;
  int? discountPercentage;
  double? discountPrice;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productImageURL,
    required this.productQuantity,
    required this.productDescription,
    required this.isHoney,
    this.isDiscount,
    this.discountPercentage,
    this.discountPrice,
  });

  double get calculatedNewPrice {
    if (isDiscount == true) {
      double discountPercentage2 = (100 - discountPercentage!) / 100;
      double newPrice = (productPrice * discountPercentage2);
      return newPrice;
    } else {
      return productPrice;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'productPrice': productPrice,
      'productImageURL': productImageURL,
      'productQuantity': productQuantity,
      'productDescription': productDescription,
      'isHoney': isHoney,
      'isDiscount': isDiscount,
      'discountPercentage': discountPercentage,
      'discountPrice': discountPrice,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productId: map['productId'] ?? '',
      productName: map['productName'] ?? '',
      productPrice: (map['productPrice']) ?? 0,
      productImageURL: map['productImageURL'] ?? '',
      productQuantity: map['productQuantity'] ?? 0,
      productDescription: map['productDescription'] ?? '',
      isHoney: map['isHoney'] ?? true,
      isDiscount: map['isDiscount'] ?? false,
      discountPercentage: map['discountPercentage'] ?? 0,
      discountPrice: map['discountPrice'] ?? 0,
    );
  }
}
