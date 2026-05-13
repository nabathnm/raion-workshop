import 'package:flutter/material.dart';

class ProductCartButton extends StatelessWidget {
  final String name;
  final Color color;
  final VoidCallback action;

  const ProductCartButton({
    super.key,
    required this.name,
    required this.color,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: action,
        child: Container(
          alignment: .center,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(name, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
