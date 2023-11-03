class ProfileDataModel {
  String userId;
  String? phoneNumber;
  String? deliveryPhoneNumber;
  String? nameOfAccount;
  String? fullName;
  String? userImageURL;
  String? userAddress;
  String? userPostOfficeData;
  String? selectedWayOfDelivery;
  double? ordersTotalSum;
  int? bonuses;

  ProfileDataModel({
    required this.userId,
    required this.phoneNumber,
    required this.deliveryPhoneNumber,
    required this.fullName,
    required this.nameOfAccount,
    required this.userImageURL,
    required this.userAddress,
    required this.selectedWayOfDelivery,
    required this.userPostOfficeData,
    required this.ordersTotalSum,
    required this.bonuses,
  });
  // String get deliveryWay {
  //   return selectedWayOfDelivery ?? 'самовивіз';
  // }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'phoneNumber': phoneNumber,
      'deliveryPhoneNumber': deliveryPhoneNumber,
      'fullName': fullName,
      'nameOfAccount': nameOfAccount,
      'userImageURL': userImageURL,
      'userAddress': userAddress,
      'selectedWayOfDelivery': selectedWayOfDelivery,
      'userPostOfficeData': userPostOfficeData,
      'ordersTotalSum': ordersTotalSum,
      'bonuses': bonuses,
    };
  }

  factory ProfileDataModel.fromMap(Map<String, dynamic> map) {
    return ProfileDataModel(
      userId: map['userId'] as String,
      phoneNumber: map['phoneNumber'] as String,
      deliveryPhoneNumber: map['deliveryPhoneNumber'] as String,
      fullName: map['fullName'] as String?,
      nameOfAccount: map['nameOfAccount'] as String?,
      userImageURL: map['userImageURL'] as String?,
      userAddress: map['userAddress'] as String?,
      selectedWayOfDelivery: map['selectedWayOfDelivery'] as String?,
      userPostOfficeData: map['userPostOfficeData'] as String?,
      ordersTotalSum: map['ordersTotalSum'] as double?,
      bonuses: map['bonuses'] as int?,
    );
  }
}
