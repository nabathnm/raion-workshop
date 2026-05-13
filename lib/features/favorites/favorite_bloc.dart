import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:level_1/features/favorites/favorite_events.dart';
import 'package:level_1/features/favorites/favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvents, FavoriteState> {
  FavoriteBloc() : super(FavoriteState(0)) {
    on<addToFavorite>((event, emit) {
      emit(FavoriteState(state.totalItems + 1));
    });
  }
}
