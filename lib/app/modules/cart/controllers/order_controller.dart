import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_flutter_fire/models/order_model.dart';

class OrderController extends GetxController {
  var orders = <OrderModel>[].obs;
  var filteredOrders = <OrderModel>[].obs;
  var isLoading = false.obs;
  var currentOrder = Rxn<OrderModel>();

  OrderModel getOrderByID(String id) {
    return orders.firstWhere((order) => order.id == id);
  }

  Future<void> fetchOrders() async {
    try {
      isLoading.value = true;
      final snapshot =
          await FirebaseFirestore.instance.collection('orders').get();
      final fetchedOrders =
          snapshot.docs.map((doc) => OrderModel.fromMap(doc.data())).toList();
      orders.assignAll(fetchedOrders);
      filteredOrders.assignAll(fetchedOrders);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch orders: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadOrder(String id) async {
    try {
      isLoading.value = true;
      await fetchOrders();
      currentOrder.value = getOrderByID(id);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch order: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void filterOrders(String searchQuery, List<String> statusFilter) {
    filteredOrders.assignAll(orders.where((order) {
      final matchesSearch = order.id.contains(searchQuery.toUpperCase());
      final matchesStatus = statusFilter.isEmpty ||
          statusFilter.contains(order.currentStatus.name);
      return matchesSearch && matchesStatus;
    }).toList());
  }

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }
}
