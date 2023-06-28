import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpenseTile extends StatelessWidget {
  final String textname;
  final int expenseprice;
  Function(BuildContext)? ondelete;
  ExpenseTile(
      {super.key,
      required this.textname,
      required this.expenseprice,
      required this.ondelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: ondelete,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(textname),
              Text('${expenseprice}'),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
