class CartState {
  final Map<String, int> items;

  const CartState({Map<String, int>? items}) : items = items ?? const {};

  int get totalItems => items.values.fold(0, (sum, qty) => sum + qty);

  CartState copyWith({Map<String, int>? items}) {
    return CartState(items: items ?? this.items);
  }
}
