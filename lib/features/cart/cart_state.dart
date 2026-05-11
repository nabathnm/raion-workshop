import 'package:level_1/features/cart/models/cart_item.dart';

class CartState {
  final List<CartItem> items;

  CartState(this.items);

  int get totalItems {
    return items.fold(0, (total, item) => total + item.quantity);
  }
}
