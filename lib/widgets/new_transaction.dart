import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  // Created callback function
  final Function addTx;

  // Creating Constructor for that function
  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.tryParse(amountController.text) ?? 0;

    if (enteredAmount.isNegative || enteredAmount.isNaN || enteredAmount == 0) {
      return;
    }

    addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            // INPUT: Title
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData,
            ),
            // INPUT: Amount
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData,
            ),
            // INPUT: Submit
            TextButton(
                style:
                    TextButton.styleFrom(foregroundColor: Colors.purpleAccent),
                onPressed: submitData,
                child: const Text('Add Transaction'))
          ],
        ),
      ),
    );
  }
}
