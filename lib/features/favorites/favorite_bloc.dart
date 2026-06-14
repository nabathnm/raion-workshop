import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop/features/favorites/favorite_events.dart';
import 'package:workshop/features/favorites/favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvents, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState()) {
    on<AddToFavorite>((event, emit) {
      final updated = Map<String, int>.from(state.items);
      final currentQty = updated[event.itemId] ?? 0;

      if (currentQty == 0) {
        updated[event.itemId] = 1;
        emit(state.copyWith(items: updated));
      }
    });

    on<RemoveFromFavorite>((event, emit) {
      final updated = Map<String, int>.from(state.items);
      final currentQty = updated[event.itemId] ?? 0;

      if (currentQty > 0) {
        updated.remove(event.itemId);
        emit(state.copyWith(items: updated));
      }
    });
  }
}
