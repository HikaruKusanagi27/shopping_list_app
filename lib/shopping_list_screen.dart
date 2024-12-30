import 'package:flutter/material.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  List<String> shoppingList = ['Apple', 'Banana', 'Carrot'];

  final TextEditingController _controller = TextEditingController(); // 初期値を設定

  void _addItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        shoppingList.add(_controller.text);
      });
      _controller.clear();
    }
  }

  void _removeItem(int index) {
    setState(() {
      shoppingList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Add an item',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(onPressed: _addItem, child: const Text('Add')),
          Expanded(
            child: ListView.builder(
              itemCount: shoppingList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(shoppingList[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeItem(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
