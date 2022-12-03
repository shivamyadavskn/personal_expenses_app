import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function adTx;
  const NewTransaction(this.adTx, {super.key});
  @override
  State<NewTransaction> createState() => _NewTransactionState();
}
class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount<=0) {
      return;
    }
    widget.adTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val){
              //   // title=val;
              // },
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              // onChanged: (val){
              //   // amount=val;
              // },
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            TextButton(
              onPressed: submitData,
              child: const Text(
                "Add Transaction",
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
