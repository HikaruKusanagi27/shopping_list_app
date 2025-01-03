import 'package:flutter/material.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  List<String> shoppingList = [];

  final TextEditingController _controller = TextEditingController(); // 初期値を設定
// 1. TextEditingControllerは、Dartで用意されているクラスで、テキスト入力を管理する機能を持つ設計図（クラス）です。

// void関数の使い方の勉強中
  void greet() {
    print("こんにちは！");
  }

  void main() {
    greet(); // 実行すると "こんにちは！" と表示される
  }

  void _addItem() {
    // もし入力欄に何か文字が入力されていたら
    // _controller.text は、ユーザーが入力欄に書いた文字を取得します。
    // .isNotEmpty は、「文字が空ではない（何か書いてある）」かどうかを確認します。

    // 例：
    // ユーザーが「りんご」と入力 → 条件は true（処理を進める）。
    // ユーザーが何も入力していない → 条件は false（処理をスキップ）。
    setState(() {
      if (_controller.text.isEmpty) {
        // 入力欄が空の場合
        // 入力欄が空の場合エラーハンドリング表示
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('エラー'),
                content: const Text('入力欄が空です。値を入力してください。'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });
      } else if (_controller.text.isNotEmpty) {
        // 入力欄に値がある場合
        // エラーメッセージをリセット
        shoppingList.add(_controller.text);
        _controller.clear();
      }
    });
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
