import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: 
           Image.network(
              imageUrl,
              fit: BoxFit.contain,
              width: double.infinity,
            )
        
    );
  }
}
