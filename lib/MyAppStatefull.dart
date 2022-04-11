import 'package:flutter/material.dart';

class MyAppStatefull extends StatefulWidget {
  // State full widget has internal state
  String name;
  int age;
  MyAppStatefull({ required this.name,required this.age });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyAppStatefull> with WidgetsBindingObserver{
  String _email = '';
  final emailEditingController = TextEditingController();

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    print('Run initial state.....');
  }

  // when you know 'the app is in background mode or not'
  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.paused){
      print('App is in Background mode');
    }else if(state == AppLifecycleState.resumed){
      print('App is in Foreground mode'); //use mode (miniumze)
    }
  }
  @override
  void dispose(){
    super.dispose();
    emailEditingController.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    print('run dispose() ...');
  }

  @override
  Widget build(BuildContext context){
    print('build run....');
    // TODO: implement build
    return MaterialApp(
      title: 'This is StateFullWidget',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child:  TextField(
                  controller: emailEditingController,
                  onChanged: (text){
                    setState(() {
                      _email =text; // when state change => build() re-run => reload widget
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(30)
                      ),
                    ),
                    labelText: 'Enter your email'
                  ),
                ),
              ),
              const Text(
                'See result here',
                style: TextStyle(fontSize: 30, color: Colors.blueAccent),
              ),
              Text(
                _email,
                style: const TextStyle(fontSize: 30, color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}