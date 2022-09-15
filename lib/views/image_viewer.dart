import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({Key? key, required this.name, required this.imageSrc})
      : super(key: key);

  final String imageSrc;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Hero(
          tag: 'gambar-$name',
          child: InteractiveViewer(child: Image.network(imageSrc)),
        ),
      ),
    );
  }
}
