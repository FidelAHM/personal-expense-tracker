import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void Submit() {
    final enterdTitle = titleController.text;
    final enterdAmount = double.parse(amountController.text);

    if (enterdTitle.isEmpty || enterdAmount < 0) {
      return;
    }
    widget.addTx(titleController.text, double.parse(amountController.text));
    Navigator.of(context).pop;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
                decoration: InputDecoration(labelText: 'title'),
                controller: titleController,
                onSubmitted: (_) {
                  Submit();
                }),
            TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) {
                  Submit();
                }),
            TextButton(
              onPressed: () {
                Submit();
              },
              child: Text(
                'Add transaction',
                style: TextStyle(
                  color: Color.fromARGB(255, 79, 105, 255),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
