import 'package:flutter/material.dart';
import 'package:workshop/fake_store_detail_page.dart';
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
