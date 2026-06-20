import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop/features/cart/cart_bloc.dart';
import 'package:workshop/features/cart/cart_event.dart';
import 'package:workshop/features/cart/cart_state.dart';
import 'package:workshop/features/favorites/favorite_bloc.dart';
import 'package:workshop/features/favorites/favorite_state.dart';
import 'package:workshop/widgets/banner_caraousel.dart';
import 'package:workshop/widgets/category_card.dart';
import 'package:workshop/widgets/category_cips.dart';
import 'package:workshop/widgets/fake_store_product_card.dart';
import 'package:workshop/widgets/search_product_bar.dart';
import 'package:workshop/widgets/statistic_card.dart';
import 'package:provider/provider.dart';
import 'package:workshop/providers/product_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductProvider>().fetchProducts();
    });
  }

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

              Consumer<ProductProvider>(
                builder: (context, provider, child) {
                  Color bannerColor;
                  IconData bannerIcon;
                  String message;

                  if (provider.isOffline) {
                    bannerColor = Colors.red.shade600;
                    bannerIcon = Icons.wifi_off_rounded;
                    message = provider.statusMessage;
                  } else if (provider.statusMessage == 'Koneksi lambat.') {
                    bannerColor = Colors.orange.shade700;
                    bannerIcon = Icons.warning_amber_rounded;
                    message = provider.statusMessage;
                  } else {
                    bannerColor = Colors.green.shade600;
                    bannerIcon = Icons.wifi_rounded;
                    message = provider.statusMessage;
                  }

                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: bannerColor,
                    ),
                    child: Row(
                      children: [
                        Icon(bannerIcon, color: Colors.white, size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            message,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              Text(
                'Categories',
                style: TextStyle(fontWeight: .w700, fontSize: 16),
              ),

              CategoryCips(),

              Text(
                'Browse Products',
                style: TextStyle(fontWeight: .w700, fontSize: 16),
              ),

              Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  if (productProvider.status == FetchStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (productProvider.status == FetchStatus.error) {
                    return Center(child: Text(productProvider.errorMessage));
                  }

                  return GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.57,
                        ),
                    children: productProvider.products.map((product) {
                      final id = product.id.toString();

                      return FakeStoreProductCard(
                        id: product.id,
                        title: product.title,
                        price: product.price,
                        category: product.category,
                        image: product.image,
                        onAdd: () {
                          context.read<CartBloc>().add(AddItem(id));
                        },
                        onRemove: () {
                          context.read<CartBloc>().add(RemoveItem(id));
                        },
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
