import 'package:flutter/material.dart';

class Car {
   late String name;
   late int yearOfProduction;

  // Constructor with named arguments
  Car({
    required this.name,
    this.yearOfProduction = 2022
  });

  @override
  String toString() {
    //TODO: implement toString
    return '${this.name} - ${this.yearOfProduction}';
  }

  void doSomething(){
    print('I am doing something...');
    this.handleEvent();
  }

  // method with named arguments
  void sayHello({String? personName}){
    print('Hello $personName');
  }

  // function as 'a variable'
  late Function handleEvent;
}
