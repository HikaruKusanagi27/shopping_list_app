import 'package:flutter/material.dart';
import 'package:shopping_list_app/shopping_list_screen.dart';

void main() {
  runApp(const ShoppingListApp());
}

class ShoppingListApp extends StatelessWidget {
  const ShoppingListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ShoppingListScreen(),
    );
  }
}
