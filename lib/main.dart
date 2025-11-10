import 'package:flutter/material.dart';
import 'screens/gallery_screen.dart';

void main() {
  runApp(const ComponentGalleryApp());
}

class ComponentGalleryApp extends StatelessWidget {
  const ComponentGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galería de Componentes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const GalleryScreen(),
    );
  }
}
