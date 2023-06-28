import 'package:expense_tracker/util/expense_dialog.dart';
import 'package:expense_tracker/util/list_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List expenselist = [
    ["Food", 15],
    ["Groceries", 35]
  ];

  num total = 0;

  @override
  void initState() {
    for (int i = 0; i < expenselist.length; i++) {
      total += expenselist[i][1];
    }
    super.initState();
  }

  // int overallprice() {
  //   for (int i = 0; i < expenselist.length; i++) {
  //     total += int.parse(expenselist[i][1]);
  //   }
  //   return total;
  // }

  final TextEditingController ExpenseController = TextEditingController();
  final TextEditingController ExpensePriceController = TextEditingController();

  void onsave() {
    setState(() {
      expenselist.add(
          [ExpenseController.text, int.parse(ExpensePriceController.text)]);
      ExpenseController.clear();
      ExpensePriceController.clear();
    });
    Navigator.pop(context);
  }

  void ondelete(int index) {
    setState(() {
      expenselist.removeAt(index);
    });
  }

  void oncancel() {
    Navigator.pop(context);
  }

  void createnewtask() {
    showDialog(
      context: context,
      builder: (context) => ExpenseDialog(
          onsave: onsave,
          oncancel: oncancel,
          ExpenseController: ExpenseController,
          ExpensePriceController: ExpensePriceController),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${total}'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: expenselist.length,
        itemBuilder: (context, index) => ExpenseTile(
          textname: expenselist[index][0],
          expenseprice: expenselist[index][1],
          ondelete: (context) => ondelete(index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createnewtask,
        child: Icon(Icons.add),
      ),
    );
  }
}
