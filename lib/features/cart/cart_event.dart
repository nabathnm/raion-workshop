import 'package:level_1/features/cart/models/cart_item.dart';

abstract class CartEvent {}

class AddItem extends CartEvent {
  final CartItem item;

  AddItem(this.item);
}
