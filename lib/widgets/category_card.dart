import 'package:flutter/material.dart';

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
