import 'package:flutter/material.dart';
import 'package:shazam_clone/views/home_page.dart';

void main() {
  runApp(const Shazam());
}

class Shazam extends StatelessWidget {
  const Shazam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
      },
    );
  }
}
