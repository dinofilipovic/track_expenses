import 'package:flutter/material.dart';
import 'package:track_expenses/widgets/new_transaction.dart';
import 'package:track_expenses/widgets/transaction_list.dart';

// Custom Widgets and Components

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String? amountInput;
  String? titleInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.blue,
              child: const Text('CHART!'),
              elevation: 5,
            ),
          ),
          NewTransaction(),
          TransactionList(),
        ],
      ),
    );
  }
}
