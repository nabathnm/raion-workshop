class CartItem {
  final String title;
  final String description;
  final String image;
  final String star;
  final String rating;

  CartItem({
    required this.title,
    required this.description,
    required this.image,
    required this.star,
    required this.rating,
  });

  CartItem copyWith({
    String? title,
    String? description,
    String? image,
    String? star,
    String? rating,
  }) {
    return CartItem(
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      star: star ?? this.star,
      rating: rating ?? this.rating,
    );
  }
}
