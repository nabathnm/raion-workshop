import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop/features/cart/cart_bloc.dart';
import 'package:workshop/features/cart/cart_event.dart';
import 'package:workshop/features/cart/cart_state.dart';
import 'package:workshop/widgets/product_cart_button.dart';
import 'package:workshop/features/favorites/favorite_bloc.dart';
import 'package:workshop/features/favorites/favorite_events.dart';
import 'package:workshop/features/favorites/favorite_state.dart';

class FakeStoreDetailPage extends StatelessWidget {
  final int id;
  final String title;
  final double price;
  final String category;
  final String image;

  const FakeStoreDetailPage({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final productId = id.toString();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 389,
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Image.network(image, fit: BoxFit.contain),
                ),

                Positioned(
                  top: 12,
                  left: 12,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),

                Positioned(
                  top: 12,
                  right: 12,
                  child: BlocBuilder<FavoriteBloc, FavoriteState>(
                    builder: (context, state) {
                      final isFavorite = state.items.containsKey(productId);
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
                          constraints: const BoxConstraints(),
                          padding: const EdgeInsets.all(8),
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey,
                            size: 24,
                          ),
                          onPressed: () {
                            if (isFavorite) {
                              context.read<FavoriteBloc>().add(
                                RemoveFromFavorite(productId),
                              );
                            } else {
                              context.read<FavoriteBloc>().add(
                                AddToFavorite(productId),
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

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    category,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      ProductCartButton(
                        color: Colors.red.shade400,
                        name: "Remove",
                        action: () {
                          context.read<CartBloc>().add(RemoveItem(productId));
                        },
                      ),

                      const SizedBox(width: 8),

                      ProductCartButton(
                        color: Colors.blue.shade400,
                        name: "Add Cart",
                        action: () {
                          context.read<CartBloc>().add(AddItem(productId));
                        },
                      ),

                      const SizedBox(width: 8),

                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          final qty = state.items[productId] ?? 0;

                          return ProductCartButton(
                            color: Colors.green.shade400,
                            name: qty.toString(),
                            action: () {},
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
