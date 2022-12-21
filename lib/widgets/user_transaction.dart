import 'dart:collection';

import 'package:flutter/material.dart';
import './user_transaction.dart';
import './new_transaction.dart';
import 'package:expense_app/widgets/transaction_list.dart';
import 'package:expense_app/models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 'tl', title: 'new shoes', amount: 1000, date: DateTime.now()),
    Transaction(id: 't2', title: 'note book', amount: 100, date: DateTime.now())
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        id: DateTime.now().toString(),
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
