import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop/features/cart/cart_event.dart';
import 'package:workshop/features/cart/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  static const List<String> itemIds = ['berries', 'tulsi', 'milk', 'tomato'];
  CartBloc() : super(const CartState()) {
    on<AddItem>((event, emit) {
      final updated = Map<String, int>.from(state.items);
      updated[event.itemId] = (updated[event.itemId] ?? 0) + 1;
      emit(state.copyWith(items: updated));
    });

    on<RemoveItem>((event, emit) {
      final qty = state.items[event.itemId] ?? 0;
      if (qty == 0) return;
      final updated = Map<String, int>.from(state.items);
      updated[event.itemId] = qty - 1;
      emit(state.copyWith(items: updated));
    });
  }
}
