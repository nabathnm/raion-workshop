import 'package:flutter/material.dart';
import 'package:workshop/widgets/category_card.dart';

class CategoryCips extends StatelessWidget {
  const CategoryCips({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
