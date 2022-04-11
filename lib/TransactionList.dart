import 'package:flutter/material.dart';
import 'Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({Key? key ,required this.transactions}) : super(key: key);

  ListView _buildListView(){
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context,index){
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          elevation: 10,
          child: ListTile(
            leading: const Icon(Icons.arrow_right_alt),
            title: Text(transactions[index].content),
            subtitle: Text('Price: ${transactions[index].amount}', style: const TextStyle(fontWeight: FontWeight.bold)),
            onTap: (){
              print('Tap me');
            },
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context){
    return Container(
      height: 400,
      child: _buildListView(),
    );
  }
}