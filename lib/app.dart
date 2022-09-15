import 'package:flutter/material.dart';
import 'package:sample_app_uses_uikit/screens/showcase/showcase.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: const ShowcaseScreen(),
      ),
    );
  }
}
