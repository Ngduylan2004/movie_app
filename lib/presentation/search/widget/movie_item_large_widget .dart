import 'package:flutter/material.dart';

class MovieItemLargeWidget extends StatelessWidget {
  final String image;
  final String name;
  final bool isLarge;
  const MovieItemLargeWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.isLarge});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 48) / 2,
      height: isLarge ? 260 : 220,
      child: Column(
        children: [
          Expanded(child: Image.asset(image)),
          const SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }
}
