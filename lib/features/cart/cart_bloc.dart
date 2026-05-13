import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:level_1/features/cart/cart_event.dart';
import 'package:level_1/features/cart/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(0)) {
    on<AddToCart>((event, emit) {
      emit(CartState(state.totalItems + 1));
    });
  }
}
