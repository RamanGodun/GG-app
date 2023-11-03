class CashbackModel {
  final List<int> discountPercentage;
  final List<int> spentMoneyLevel;

  CashbackModel({
    required this.discountPercentage,
    required this.spentMoneyLevel,
  });

  CashbackModel.initial()
      : discountPercentage = [0, 0, 0, 0],
        spentMoneyLevel = [0, 0, 0, 0];

  factory CashbackModel.fromMap(Map<String, dynamic> map) {
    return CashbackModel(
      discountPercentage: List<int>.from(map['discountPercentage']),
      spentMoneyLevel: List<int>.from(map['spentMoneyLevel']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'discountPercentage': discountPercentage,
      'spentMoneyLevel': spentMoneyLevel,
    };
  }
}
