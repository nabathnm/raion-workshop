import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final String star;
  final String rating;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const DetailPage({
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
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late bool favorite;

  @override
  void initState() {
    super.initState();
    favorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 389,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/${widget.image}'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: GestureDetector(
                  onTap: widget.onToggleFavorite,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: Icon(
                      widget.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Text(widget.star),
                        Text('(${widget.rating})'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff505050),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
