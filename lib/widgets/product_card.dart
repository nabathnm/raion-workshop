import 'package:flutter/material.dart';
import 'package:level_1/detail_page.dart';
import 'package:level_1/widgets/product_cart_button.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String star;
  final String rating;
  final bool isFavorite;
  final int quantity;
  final VoidCallback onToggleFavorite;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.star,
    required this.rating,
    required this.isFavorite,
    required this.quantity,
    required this.onToggleFavorite,
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
                  onTap: () {
                    onToggleFavorite();
                  },
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

          SizedBox(height: 4),
          Row(
            spacing: 4,
            children: [
              ProductCartButton(
                color: Colors.red.shade400,
                name: "Remove",
                action: onRemove,
              ),
              ProductCartButton(
                color: Colors.blue.shade400,
                name: "Add Cart",
                action: onAdd,
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
    );
  }
}
