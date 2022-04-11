import 'package:flutter/material.dart';
import 'Transaction.dart';

class LayoutFlutter extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _MyApplicationState();
  }
}

class _MyApplicationState extends State<LayoutFlutter> with WidgetsBindingObserver{
  // define a global key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // define Edit controller for each text field
  final _contentEditingController = TextEditingController();
  final _amountEditingController = TextEditingController();

  // define states
  Transaction _transaction = Transaction(content: '', amount: 0.0);
  List<Transaction> _transactions = [];

  // initialize state
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    print('run initState()...');
  }

  // dispose widget
  @override
  void dispose(){
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    print('run dispose()...');
  }

  // when state of widget changed
  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.paused){
      print('App is in Background mode');
    }
    else if(state == AppLifecycleState.resumed){
      print('App is in Foreground mode');
    }
  }

  @override
  Widget build(BuildContext context){
    List<Widget> _buildWidgetList(){
      return _transactions.map((e){
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          elevation: 10,
          child: ListTile(
            leading: const Icon(Icons.arrow_right_alt),
            title: Text(e.content),
            subtitle: Text('Price: ${e.amount}', style: const TextStyle(fontWeight: FontWeight.bold)),
            onTap: (){
              print('Tap me');
            },
          ),
        );
      }).toList();
    }
    
    return MaterialApp(
      title: 'This is a Layout',
      home: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Content'),
                controller: _contentEditingController,
                onChanged: (text){
                  setState(() {
                    _transaction.content = text;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount (Money)'),
                controller: _amountEditingController,
                onChanged: (text){
                  setState(() {
                    _transaction.amount = double.tryParse(text) ?? 0;
                  });
                },
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ButtonTheme(
                height: 50,
                child: FlatButton(
                  child: const Text('Insert Transaction'),
                  color: Colors.pinkAccent,
                  textColor: Colors.white,
                  onPressed: (){
                    // print('Content = $_content, money\'s amount = $_amount');
                    // Display UI
                    setState(() {
                      _transactions.add(_transaction);
                      _transaction = Transaction(content: '', amount: 0.0);
                      _contentEditingController.text = '';
                      _amountEditingController.text = '';
                    });
                    // _scaffoldKey.currentState?.showSnackBar(
                    //     SnackBar(
                    //       content: Text(_transactions.toString()),
                    //       duration: const Duration(seconds: 3),
                    //     )
                    // );
                  },
                ),
              ),
              Column(
                children: _buildWidgetList(),
              )
            ],
          ),
        ),
      )
    );
  }
}