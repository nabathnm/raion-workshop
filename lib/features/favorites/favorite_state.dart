class FavoriteState {
  final Map<String, int> items;

  const FavoriteState({Map<String, int>? items}) : items = items ?? const {};

  int get totalItems => items.values.fold(0, (sum, qty) => sum + qty);

  FavoriteState copyWith({Map<String, int>? items}) {
    return FavoriteState(items: items ?? this.items);
  }
}
