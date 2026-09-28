import '../entities/order.dart';

class OrderService {
  Future<List<DeliveryOrder>> fetchActiveOrders() async {
    await Future.delayed(const Duration(milliseconds: 400)); // simulate network

    return [
      DeliveryOrder(
        id: 'ord1',
        shopName: 'De La Vies',
        shopAddress: 'BrookField,Bangalore',
        customerName: 'Krish',
        customerAddress: 'AECS Layout, Bangalore',
        customerPhone: '+44 6743679853',
        totalAmount: 20.50,
        status: OrderStatus.accepted,
        createdAt: DateTime.now().subtract(const Duration(minutes: 15)),
      ),
      DeliveryOrder(
        id: 'ord2',
        shopName: 'Chai Green',
        shopAddress: 'Sarjapur Road, Bangalore',
        customerName: 'Harsh',
        customerAddress: 'Kasvanhalli, Bangalore',
        customerPhone: '+44 8796543564',
        totalAmount: 36.00,
        status: OrderStatus.pending,
        createdAt: DateTime.now().subtract(const Duration(minutes: 20)),
      ),
      DeliveryOrder(
        id: 'ord3',
        shopName: 'corner cafe',
        shopAddress: 'Kundalahalli gate, Bangalore',
        customerName: 'Kunal',
        customerAddress: 'Whitefield, Bangalore',
        totalAmount: 44.75,
        status: OrderStatus.onTheWay,
        createdAt: DateTime.now().subtract(const Duration(minutes: 35)),
      ),
    ];
  }

  Future<DeliveryOrder> fetchOrderById(String id) async {
    final orders = await fetchActiveOrders();
    return orders.firstWhere(
      (o) => o.id == id,
      orElse: () => throw Exception('Order not found: $id'),
    );
  }

  Future<void> updateOrderStatus(String id, OrderStatus newStatus) async {
    await Future.delayed(const Duration(milliseconds: 300));
    // TODO: real API call, e.g. PATCH /orders/:id/status
  }
}
