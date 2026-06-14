import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop/fake_store_detail_page.dart';
import 'package:workshop/features/favorites/favorite_bloc.dart';
import 'package:workshop/features/favorites/favorite_events.dart';
import 'package:workshop/features/favorites/favorite_state.dart';
import 'package:workshop/widgets/product_cart_button.dart';

class FakeStoreProductCard extends StatelessWidget {
  final int id;
  final String title;
  final double price;
  final String category;
  final String image;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const FakeStoreProductCard({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FakeStoreDetailPage(
              id: id,
              title: title,
              price: price,
              category: category,
              image: image,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // 1. Container Foto Utama
              Container(
                width: double.infinity,
                height: 165,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Image.network(image, fit: BoxFit.contain),
              ),

              Positioned(
                top: 8,
                right: 8,
                child: BlocBuilder<FavoriteBloc, FavoriteState>(
                  builder: (context, state) {
                    final isFavorite = state.items.containsKey(id.toString());

                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        constraints:
                            const BoxConstraints(), // Mengecilkan padding default
                        padding: const EdgeInsets.all(8),
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                          size: 20,
                        ),
                        onPressed: () {
                          if (isFavorite) {
                            context.read<FavoriteBloc>().add(
                              RemoveFromFavorite(id.toString()),
                            );
                          } else {
                            context.read<FavoriteBloc>().add(
                              AddToFavorite(id.toString()),
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),

          const SizedBox(height: 4),

          Text(
            category,
            style: const TextStyle(color: Color(0xff939393), fontSize: 13),
          ),

          const SizedBox(height: 4),

          Text(
            '\$${price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.green,
            ),
          ),

          const SizedBox(height: 4),

          Row(
            children: [
              Expanded(
                child: ProductCartButton(
                  color: Colors.red.shade400,
                  name: "Remove",
                  action: onRemove,
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: ProductCartButton(
                  color: Colors.blue.shade400,
                  name: "Add Cart",
                  action: onAdd,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
