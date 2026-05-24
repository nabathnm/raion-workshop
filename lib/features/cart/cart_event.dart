abstract class CartEvent {}

class AddItem extends CartEvent {
  final String itemId;
  AddItem(this.itemId);
}

class RemoveItem extends CartEvent {
  final String itemId;
  RemoveItem(this.itemId);
}
