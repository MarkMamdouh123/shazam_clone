import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shazam_clone/views/home_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: const Shazam(),
    ),
  );
}

class Shazam extends StatelessWidget {
  const Shazam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
