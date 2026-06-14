abstract class FavoriteEvents {}

class AddToFavorite extends FavoriteEvents {
  final String itemId;
  AddToFavorite(this.itemId);
}

class RemoveFromFavorite extends FavoriteEvents {
  final String itemId;
  RemoveFromFavorite(this.itemId);
}
