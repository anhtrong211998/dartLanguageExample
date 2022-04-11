import 'package:flutter/material.dart';

class LayoutFlutter extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _MyApplicationState();
  }
}

class _MyApplicationState extends State<LayoutFlutter> with WidgetsBindingObserver{
  // define a global key
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // define Edit controller for each text field
  final _contentEditingController = TextEditingController();
  final _amountEditingController = TextEditingController();

  // define states
  String? _content;
  double? _amount;

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
                    _content = text;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount (Money)'),
                controller: _amountEditingController,
                onChanged: (text){
                  setState(() {
                    _amount = double.tryParse(text) ?? 0;
                  });
                },
              ),
              FlatButton(
                child: const Text('Insert Transaction'),
                color: Colors.pinkAccent,
                textColor: Colors.white,
                onPressed: (){
                  // print('Content = $_content, money\'s amount = $_amount');
                  // Display UI
                  _scaffoldKey.currentState?.showSnackBar(
                    SnackBar(
                      content: Text('Content = $_content, money\'s amount = $_amount'),
                      duration: const Duration(seconds: 3),
                    )
                  );
                },
              )
            ],
          ),
        ),
      )
    );
  }
}