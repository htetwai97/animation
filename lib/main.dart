import 'package:animation_lessons/explicit_animations/explicit_animations.dart';
import 'package:animation_lessons/inplicit_animations/implicit_animations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImplicitAnimations(),
    );
  }
}
