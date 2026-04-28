import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Farmers',
          style: TextStyle(fontWeight: .w700, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 24,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search..',
                  fillColor: Color(0xffD9D9D9),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: .none,
                    borderRadius: .circular(10),
                  ),
                ),
              ),

              Container(
                width: .infinity,
                height: 160,
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: .circular(10),
                ),
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
                    CategoryCard(title: 'Fruits'),
                    CategoryCard(title: 'Grains'),
                    CategoryCard(title: 'Herbs'),
                    CategoryCard(title: 'Vegetables'),
                  ],
                ),
              ),

              Text(
                'Browse Products',
                style: TextStyle(fontWeight: .w700, fontSize: 16),
              ),

              Row(
                spacing: 20,
                children: [
                  ProductCard(
                    title: 'Berries',
                    description: 'Lorem ipsum dolor sit a met, consectetur.',
                  ),
                  ProductCard(
                    title: 'Tulsi',
                    description: 'Lorem ipsum dolor sit a met, consectetur.',
                  ),
                ],
              ),

              Row(
                spacing: 20,
                children: [
                  ProductCard(
                    title: 'Milk',
                    description: 'Lorem ipsum dolor sit a met, consectetur.',
                  ),
                  ProductCard(
                    title: 'Tomato',
                    description: 'Lorem ipsum dolor sit a met, consectetur.',
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

class CategoryCard extends StatelessWidget {
  final String title;
  const CategoryCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(4),
      height: 56,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: .circular(50),
      ),
      child: Row(
        spacing: 8,
        children: [
          CircleAvatar(backgroundColor: Color(0xffD9D9D9)),
          Padding(padding: .only(right: 20), child: Text(title)),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String description;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            width: 165,
            height: 165,
            decoration: BoxDecoration(
              color: Color(0xffD9D9D9),
              borderRadius: .circular(10),
            ),
          ),
          Row(
            children: [
              Text(title, style: TextStyle(fontWeight: .w700, fontSize: 20)),
              Icon(Icons.favorite_border),
            ],
          ),
          Text(
            description,
            style: TextStyle(
              fontWeight: .w600,
              fontSize: 14,
              color: Color(0xffD9D9D9),
            ),
          ),
        ],
      ),
    );
  }
}
