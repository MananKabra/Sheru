import 'package:get/get.dart';
import 'package:get_flutter_fire/constants.dart';
import 'package:get_flutter_fire/models/cart_model.dart';

class CartController extends GetxController {
  Rx<Cart> _cart = Cart(items: [], id: '').obs;

  Cart get cart => _cart.value;

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
}
