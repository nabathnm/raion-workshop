import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:level_1/features/cart/cart_bloc.dart';
import 'package:level_1/features/cart/cart_event.dart';
import 'package:level_1/features/cart/cart_state.dart';
import 'package:level_1/features/favorites/favorite_bloc.dart';
import 'package:level_1/features/favorites/favorite_events.dart';
import 'package:level_1/features/favorites/favorite_state.dart';
import 'package:level_1/widgets/banner_caraousel.dart';
import 'package:level_1/widgets/category_card.dart';
import 'package:level_1/widgets/product_card.dart';
import 'package:level_1/widgets/search_product_bar.dart';
import 'package:level_1/widgets/statistic_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> products = [
    {
      'id': 'berries',
      'title': 'Berries',
      'image': 'card1.png',
      'star': '4.5',
      'rating': '672',
    },
    {
      'id': 'tulsi',
      'title': 'Tulsi',
      'image': 'card2.png',
      'star': '4.9',
      'rating': '324',
    },
    {
      'id': 'milk',
      'title': 'Milk',
      'image': 'card3.png',
      'star': '4.5',
      'rating': '672',
    },
    {
      'id': 'tomato',
      'title': 'Tomato',
      'image': 'card4.png',
      'star': '4.9',
      'rating': '324',
    },
  ];

  final Map<String, bool> favorites = {
    'berries': false,
    'tulsi': false,
    'milk': false,
    'tomato': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 24,
            children: [
              Text(
                'Explore',
                style: TextStyle(
                  fontWeight: .w700,
                  fontSize: 24,
                  color: Color(0xff007E2F),
                ),
              ),
              SearchProductBar(),
              BannerCarousel(),
              Row(
                spacing: 12,
                children: [
                  BlocBuilder<FavoriteBloc, FavoriteState>(
                    builder: (context, state) {
                      return StatisticCard(
                        color: Colors.red.shade400,
                        title: "Favorites",
                        value: state.totalItems.toString(),
                      );
                    },
                  ),

                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return StatisticCard(
                        color: Colors.green.shade400,
                        title: "Cart",
                        value: state.totalItems.toString(),
                      );
                    },
                  ),
                ],
              ),

              Text(
                'Categories',
                style: TextStyle(fontWeight: .w700, fontSize: 16),
              ),

              SingleChildScrollView(
                scrollDirection: .horizontal,
                child: Row(
                  spacing: 10,
                  children: [
                    CategoryCard(title: 'Fruits', image: 'c1.png'),
                    CategoryCard(title: 'Grains', image: 'c2.png'),
                    CategoryCard(title: 'Herbs', image: 'c3.png'),
                    CategoryCard(title: 'Vegetables', image: 'c1.png'),
                  ],
                ),
              ),

              Text(
                'Browse Products',
                style: TextStyle(fontWeight: .w700, fontSize: 16),
              ),

              BlocBuilder<CartBloc, CartState>(
                builder: (context, cartState) {
                  return GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.53,
                        ),
                    children: products.map((product) {
                      final id = product['id']!;
                      final qty = cartState.items[id] ?? 0;

                      return ProductCard(
                        title: product['title']!,
                        description: 'Lorem ipsum dolor sit amet, consectetur.',
                        image: product['image']!,
                        star: product['star']!,
                        rating: product['rating']!,
                        quantity: qty,
                        isFavorite: favorites[id] ?? false,
                        onToggleFavorite: () {
                          setState(() {
                            favorites[id] = !(favorites[id] ?? false);
                            if (favorites[id]!) {
                              context.read<FavoriteBloc>().add(AddToFavorite());
                            } else {
                              context.read<FavoriteBloc>().add(
                                RemoveFromFavorite(),
                              );
                            }
                          });
                        },
                        onAdd: () => context.read<CartBloc>().add(AddItem(id)),
                        onRemove: () =>
                            context.read<CartBloc>().add(RemoveItem(id)),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
