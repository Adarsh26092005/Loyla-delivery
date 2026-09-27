enum OrderStatus {
  pending,
  accepted,
  pickedUp,
  onTheWay,
  delivered,
  cancelled,
}

class DeliveryOrder {
  final String id;
  final String shopName;
  final String shopAddress;
  final String customerName;
  final String customerAddress;
  final String? customerPhone;
  final double totalAmount;
  final OrderStatus status;
  final DateTime createdAt;

  const DeliveryOrder({
    required this.id,
    required this.shopName,
    required this.shopAddress,
    required this.customerName,
    required this.customerAddress,
    this.customerPhone,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
  });

  factory DeliveryOrder.fromJson(Map<String, dynamic> json) {
    return DeliveryOrder(
      id: json['id'] as String,
      shopName: json['shopName'] as String,
      shopAddress: json['shopAddress'] as String,
      customerName: json['customerName'] as String,
      customerAddress: json['customerAddress'] as String,
      customerPhone: json['customerPhone'] as String?,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      status: _statusFromString(json['status'] as String? ?? 'pending'),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  static OrderStatus _statusFromString(String value) {
    return OrderStatus.values.firstWhere(
      (e) => e.name == value,
      orElse: () => OrderStatus.pending,
    );
  }
}