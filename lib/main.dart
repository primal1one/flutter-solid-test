import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
/// Main class
class MyApp extends StatelessWidget {
  /// Initialization
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      home: Home(),
    );
  }
}
/// A class for the Home page
class Home extends StatelessWidget {
  /// Initialization
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ColoredBackground(),
      ),
    );
  }
}


/// A class for colored background widget
class ColoredBackground extends StatefulWidget {
  /// Initialization
  const ColoredBackground({super.key});

  @override
  State<ColoredBackground> createState() => _ColoredBackgroundState();
}

class _ColoredBackgroundState extends State<ColoredBackground> {

  Color randomColor = Colors.teal;
  double textSize = 20.0;
  double textStrokeSize = 3.0;
  double textSpacing = 3.0;
  int alpha = 0;
  int red = 0;
  int green = 0;
  int blue = 0;
  Color contrastColor = Colors.white;

  /// A function for generating random ARGB color using Random()
  void colorRandomizer() {
    setState(() {
      alpha = Random().nextInt(256);
      red = Random().nextInt(256);
      green = Random().nextInt(256);
      blue = Random().nextInt(256);
      randomColor = Color.fromARGB(alpha, red, green, blue);
    });
  }
  /// A function for calculating contrast color for RGB color
  /// with "red", "green", and "blue" parameters
  void contrastColorMaker() {
    setState(() {
      const int contrastAlpha = 255;
      final int contrastRed = 255 - red;
      final int contrastGreen = 255 - green;
      final int contrastBlue = 255 - blue;
      contrastColor = Color.fromARGB(
          contrastAlpha, contrastRed, contrastGreen, contrastBlue,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        colorRandomizer();
        contrastColorMaker();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: randomColor,
        child: Center(
          child: Stack(
            children: [
              Text(
                'Hey there',
                style: TextStyle(
                  fontSize: textSize,
                  letterSpacing: textSpacing,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = textStrokeSize
                    ..color = Colors.black,
                ),
              ),
              Text(
                'Hey there',
                style: TextStyle(
                  fontSize: textSize,
                  color: contrastColor,
                  letterSpacing: textSpacing,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
