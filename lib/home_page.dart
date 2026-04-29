import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                style: TextStyle(fontWeight: .w700, fontSize: 24),
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search..',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(999),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(999),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),

              Container(
                width: .infinity,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: .circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/gambar1.png'),
                    fit: BoxFit.cover,
                  ),
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

              Row(
                spacing: 20,
                children: [
                  ProductCard(
                    title: 'Berries',
                    description: 'Lorem ipsum dolor sit a met, consectetur.',
                    image: 'card1.png',
                  ),
                  ProductCard(
                    title: 'Tulsi',
                    description: 'Lorem ipsum dolor sit a met, consectetur.',
                    image: 'card2.png',
                  ),
                ],
              ),

              Row(
                spacing: 20,
                children: [
                  ProductCard(
                    title: 'Milk',
                    description: 'Lorem ipsum dolor sit a met, consectetur.',
                    image: 'card3.png',
                  ),
                  ProductCard(
                    title: 'Tomato',
                    description: 'Lorem ipsum dolor sit a met, consectetur.',
                    image: 'card4.png',
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
  final String image;
  const CategoryCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(4),
      height: 56,
      decoration: BoxDecoration(
        color: Color(0xffDFF1E6),
        borderRadius: .circular(50),
      ),
      child: Row(
        spacing: 8,
        children: [
          CircleAvatar(backgroundImage: AssetImage('assets/images/$image')),
          Padding(padding: .only(right: 20), child: Text(title)),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Stack(
            children: [
              Container(
                width: 165,
                height: 165,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/$image'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    // nanti toggle di sini
                  },
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(title, style: TextStyle(fontWeight: .w700, fontSize: 20)),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber),
              Text("4.6"),
              Text("(673)"),
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
