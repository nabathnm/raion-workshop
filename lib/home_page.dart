import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:level_1/features/cart/cart_bloc.dart';
import 'package:level_1/features/cart/cart_state.dart';
import 'package:level_1/features/favorites/favorite_bloc.dart';
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
  bool fav1 = false;
  bool fav2 = false;
  bool fav3 = false;
  bool fav4 = false;

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

              GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.53,
                ),
                children: [
                  ProductCard(
                    title: 'Berries',
                    description: 'Lorem ipsum dolor sit a met, consectetur.',
                    image: 'card1.png',
                    star: '4.5',
                    rating: '672',
                    isFavorite: fav1,
                    onToggleFavorite: () {
                      setState(() {
                        fav1 = !fav1;
                      });
                    },
                  ),
                  ProductCard(
                    title: 'Tulsi',
                    description: 'Lorem ipsum dolor sit a met, consectetur.',
                    image: 'card2.png',
                    star: '4.9',
                    rating: '324',
                    isFavorite: fav2,
                    onToggleFavorite: () {
                      setState(() {
                        fav2 = !fav2;
                      });
                    },
                  ),
                  ProductCard(
                    title: 'Milk',
                    description: 'Lorem ipsum dolor sit a met, consectetur.',
                    image: 'card3.png',
                    star: '4.5',
                    isFavorite: fav3,
                    rating: '672',
                    onToggleFavorite: () {
                      setState(() {
                        fav3 = !fav3;
                      });
                    },
                  ),
                  ProductCard(
                    title: 'Tomato',
                    description: 'Lorem ipsum dolor sit a met, consectetur.',
                    image: 'card4.png',
                    star: '4.9',
                    rating: '324',
                    isFavorite: fav4,
                    onToggleFavorite: () {
                      setState(() {
                        fav4 = !fav4;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
