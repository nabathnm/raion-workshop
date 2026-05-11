import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:level_1/features/cart/cart_event.dart';
import 'package:level_1/features/cart/cart_state.dart';
import 'package:level_1/features/cart/models/cart_item.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([])) {
    on<AddItem>((event, emit) {
      final items = List<CartItem>.from(state.items);

      final index = items.indexWhere((e) => e.name == event.item.name);

      if (index != -1) {
        items[index].quantity++;
      } else {
        items.add(event.item);
      }

      emit(CartState(items));
    });
  }
}
