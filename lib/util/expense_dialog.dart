import 'package:expense_tracker/util/my_button.dart';
import 'package:flutter/material.dart';

class ExpenseDialog extends StatelessWidget {
  VoidCallback onsave;
  VoidCallback oncancel;
  TextEditingController ExpenseController;
  TextEditingController ExpensePriceController;
  ExpenseDialog(
      {super.key,
      required this.onsave,
      required this.oncancel,
      required this.ExpenseController,
      required this.ExpensePriceController});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: ExpenseController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter Your Expense",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: ExpensePriceController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter Your Expense Price",
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            MyButton(buttonname: "save", onsave: onsave),
            // SizedBox(
            //   width: 5,
            // ),
            MyButton(buttonname: "cancel", onsave: oncancel),
          ])
        ],
      )),
    );
  }
}
