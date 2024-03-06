import 'package:flutter/material.dart';

class textStyles {
  static const title = TextStyle(fontSize: 20, fontWeight: FontWeight.bold,letterSpacing: 2.0,wordSpacing: 0.3);
  static const greeting = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  static const description = TextStyle(fontSize: 18,letterSpacing: 1.5,wordSpacing: 1.0);
  static const alertButtons = TextStyle(fontSize: 18, fontWeight: FontWeight.bold,letterSpacing: 2.0,wordSpacing: 0.3);
}

BoxDecoration customDecoration() {
  return BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10), boxShadow: [
    BoxShadow(
        color: Colors.black.withOpacity(0.2), spreadRadius: 2, blurRadius: 5),
  ]);
}

BoxDecoration imageContainerDecorations(String imageloc) {
  return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imageloc),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 3),
      ]);
}

/*class Module extends StatelessWidget {
  const Module({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      )),
    );
  }
}

class RoundedWidget extends StatelessWidget {
  const RoundedWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)), child: child);
  }
}*/