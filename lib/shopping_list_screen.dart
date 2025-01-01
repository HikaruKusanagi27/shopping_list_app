import 'package:flutter/material.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  List<String> shoppingList = [];
//1. **`TextEditingController`クラス**:
    - `TextEditingController`は、Dartで用意されているクラスで、テキスト入力を管理する機能を持つ設計図（クラス）です。
2. **`TextEditingController();`（インスタンス化）**:
    - この部分で、`TextEditingController`クラスを元に、新しいインスタンス（オブジェクト）が作られます。
    - インスタンス化とは、「設計図（クラス）」を基に「実物（オブジェクト）」を作成することを指します。
3. **変数`_controller`**:
    - この変数は、新しく作成されたインスタンスを参照（格納）します。
    - `_controller`を使うことで、そのインスタンスにアクセスし、操作や値の取得ができます。
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
      appBar: AppBar(title: const Text('🛍️買い物リスト🛍️')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: '買い物名',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(onPressed: _addItem, child: const Text('追加')),
          Expanded(
            child: ListView.builder(
              itemCount: shoppingList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('・${shoppingList[index]}'),
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
