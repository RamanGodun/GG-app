import 'package:intl/intl.dart';

class OrderModel {
  static final DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");

  final String userFullName;
  final String userPhoneNumber;
  final String userAddress;
  final String selectedWayOfDelivery;
  final String userPostOfficeData;
  final String userComment;
  final String userId;
  final double totalSumOfOrder;
  final num usedBonuses;
  final DateTime createdAt;
  final bool isFinished;
  final bool isVisibleForAdmin;
  final List<Map<String, dynamic>> products;
  final String? salePoint;
  // final Map<String, CartItemModel> products;

  OrderModel({
    required this.userFullName,
    required this.userPhoneNumber,
    required this.userAddress,
    required this.selectedWayOfDelivery,
    required this.userPostOfficeData,
    required this.userComment,
    required this.userId,
    required this.totalSumOfOrder,
    required this.usedBonuses,
    required this.createdAt,
    required this.isFinished,
    required this.isVisibleForAdmin,
    required this.products,
    this.salePoint,
  });

  Map<String, dynamic> toMap() {
    String formattedCreatedAt = dateFormat.format(createdAt);

    return {
      'userFullName': userFullName,
      'userPhoneNumber': userPhoneNumber,
      'userAddress': userAddress,
      'selectedWayOfDelivery': selectedWayOfDelivery,
      'userPostOfficeData': userPostOfficeData,
      'userComment': userComment,
      'userId': userId,
      'totalSumOfOrder': totalSumOfOrder,
      'usedBonuses': usedBonuses,
      'createdAt': formattedCreatedAt,
      'isFinished': isFinished,
      'isVisibleForAdmin': isVisibleForAdmin,
      'products': products,
      'salePoint': salePoint,
    };
  }
}
