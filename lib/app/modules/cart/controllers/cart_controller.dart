import 'package:get/get.dart';
import 'package:get_flutter_fire/constants.dart';
import 'package:get_flutter_fire/models/cart_model.dart';

class CartController extends GetxController {
  final Rx<Cart> _cart = Cart(items: [], id: '').obs;
  Cart get cart => _cart.value;

  int get totalPrice => _cart.value.items
      .fold(0, (total, item) => total + item.price * item.quantity);

  final Rx<int> _pageIndex = 0.obs;
  int get pageIndex => _pageIndex.value;

  final Rx<String> _selectedAddress = ''.obs;
  String get selectedAddress => _selectedAddress.value;

  final Rx<String> _selectedPaymentMethod = 'cash'.obs;
  String get selectedPaymentMethod => _selectedPaymentMethod.value;

  void handlePaymentMethodChange(String paymentMethod) {
    _selectedPaymentMethod.value = paymentMethod;
  }

  void selectAddress(String addressID) {
    _selectedAddress.value = addressID;
  }

  void changePageIndex(int newIndex) {
    if (newIndex != _pageIndex.value) {
      _pageIndex.value = newIndex;
    }
  }

  Future<void> fetchCartData(String userID) async {
    try {
      List<CartItem> cartItems = [];
      final snapshot = await firestore.collection('carts').doc(userID).get();
      if (snapshot.exists) {
        Map<String, dynamic> cartData = snapshot.data() as Map<String, dynamic>;
        if (cartData.containsKey('cartItems')) {
          List<dynamic> cartItemsData = cartData['cartItems'];
          cartItems = cartItemsData
              .map((itemData) => CartItem.fromMap(itemData))
              .toList();
        }
      }
      _cart.value = Cart(items: cartItems, id: userID);
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while fetching cart data');
    }
  }

  bool isProductInCart(String productID) {
    return _cart.value.items.any((item) => item.id == productID);
  }

  void incrementQuantity(CartItem item) {
    int index = _cart.value.items.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      _cart.update((cart) {
        cart!.items[index].quantity++;
      });
      syncCartwithDB();
    }
  }

  void decrementQuantity(CartItem item) {
    int index = _cart.value.items.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      _cart.update((cart) {
        cart!.items[index].quantity--;
      });
      syncCartwithDB();
    }
  }

  void addItem(CartItem item) {
    int index = _cart.value.items.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      _cart.update((cart) {
        cart!.items[index].quantity += item.quantity;
      });
    } else {
      _cart.update((cart) {
        cart!.items.add(item);
      });
    }
    syncCartwithDB();
  }

  void removeItem(CartItem item) {
    int index = _cart.value.items.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      _cart.update((cart) {
        cart!.items.removeAt(index);
      });
    }
    syncCartwithDB();
  }

  Future<void> syncCartwithDB() async {
    List<Map<String, dynamic>> cartItemsData =
        _cart.value.items.map((item) => item.toMap()).toList();
    await firestore
        .collection('carts')
        .doc(_cart.value.id)
        .set({'cartItems': cartItemsData, 'id': _cart.value.id});
  }

  void clearCart() {
    _cart.value = Cart(items: [], id: cart.id);
    syncCartwithDB();
  }
}
