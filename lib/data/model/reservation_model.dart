class ReservationModel {
  int? id;
  String suiteName;
  DateTime startDate;
  DateTime endDate;
  double finalPrice;

  ReservationModel({
    this.id,
    required this.suiteName,
    required this.startDate,
    required this.endDate,
    required this.finalPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'suiteName': suiteName,
      'startDate': startDate.toString(),
      'endDate': endDate.toString(),
      'finalPrice': finalPrice,
    };
  }

  @override
  String toString() {
    return 'ReservationModel{suiteName: $suiteName, startDate: $startDate, endDate: $endDate, finalPrice: $finalPrice}';
  }
}
