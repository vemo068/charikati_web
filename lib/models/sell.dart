class Sell {
  int? id;
  int? total;
  String date;
  int clientId;
  Sell({required this.date, this.total, required this.clientId, this.id});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'total': total,
      'date': date,
      'clientId': clientId,
    };
  }

  factory Sell.fromMap(Map<String, dynamic> map) {
    return Sell(
      id: map['id']?.toInt() ?? 0,
      date: map['date'],
      clientId: map['clientId'],
      total: map['total'] ?? 0,
    );
  }
}
