class CartItemModel {
  final String productId;
  final String productName;
  final double productQuantity;
  final double productPrice;
  final String productImageURL;

  CartItemModel(
      {required this.productId,
      required this.productName,
      required this.productQuantity,
      required this.productPrice,
      required this.productImageURL});
}
