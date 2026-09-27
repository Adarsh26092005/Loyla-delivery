import '../entities/order.dart';

class OrderService {
  Future<List<DeliveryOrder>> fetchActiveOrders() async {
    await Future.delayed(const Duration(milliseconds: 400)); // simulate network

    return [
      DeliveryOrder(
        id: 'ord_001',
        shopName: 'Green Leaf Cafe',
        shopAddress: '12 High Street, Manchester',
        customerName: 'Alice Turner',
        customerAddress: '45 Oak Avenue, Manchester',
        customerPhone: '+44 7700 900001',
        totalAmount: 18.50,
        status: OrderStatus.accepted,
        createdAt: DateTime.now().subtract(const Duration(minutes: 12)),
      ),
      DeliveryOrder(
        id: 'ord_002',
        shopName: 'Spice Route',
        shopAddress: '78 Market Road, Manchester',
        customerName: 'Ben Carter',
        customerAddress: '9 Willow Close, Manchester',
        customerPhone: '+44 7700 900002',
        totalAmount: 32.00,
        status: OrderStatus.pending,
        createdAt: DateTime.now().subtract(const Duration(minutes: 3)),
      ),
      DeliveryOrder(
        id: 'ord_003',
        shopName: 'Bella Pizzeria',
        shopAddress: '3 Church Lane, Manchester',
        customerName: 'Chloe Davis',
        customerAddress: '21 Birch Street, Manchester',
        totalAmount: 24.75,
        status: OrderStatus.onTheWay,
        createdAt: DateTime.now().subtract(const Duration(minutes: 25)),
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