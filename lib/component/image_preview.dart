import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  final String imageUrl;
  final String title;

  const ImagePreview({Key? key, required this.imageUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          imageUrl,
          width: 300,
          height: 300,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: const TextStyle(
              color: Colors.red, fontSize: 18.0, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
