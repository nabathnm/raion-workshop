import 'package:flutter/material.dart';
import 'package:level_1/detail_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
                child: BannerCarousel(),
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
                ],
              ),

              Row(
                spacing: 20,
                children: [
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
  final String star;
  final String rating;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.star,
    required this.rating,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                title: title,
                description: description,
                image: image,
                star: star,
                rating: rating,
                isFavorite: isFavorite,
                onToggleFavorite: onToggleFavorite,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    onTap: onToggleFavorite,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white.withOpacity(0.65),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),

            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Text(
                  star,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  '($rating)',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff939393),
                  ),
                ),
              ],
            ),

            Text(
              description,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xff939393),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerCarousel extends StatelessWidget {
  BannerCarousel({super.key});

  final List<String> banners = [
    'gambar1.png',
    'gambar1.png',
    'gambar1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 160,
        viewportFraction: 1,
      ),
      items: banners.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                'assets/images/$image',
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}