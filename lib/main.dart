import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'car.dart';

void main() {
  // init an object
  // var myCar = Car(name: 'Mercedes S-class',yearOfProduction: 2021);
  // myCar.handleEvent = (){
  //   print('Handle in main');
  // };
  // myCar.doSomething();
  // myCar.sayHello(personName: 'TrongHD');

  List<Car> cars = <Car>[
    Car(name: 'Mercedes Benz C-class 250', yearOfProduction: 2016),
    Car(name: 'Mercedes-Maybach Benz S-class Saloon', yearOfProduction: 2020),
    Car(name: 'Mercedes Benz C-class C300 AMG', yearOfProduction: 2017)
  ];

  cars.sort((car1,car2) => car1.yearOfProduction - car2.yearOfProduction); // sort ascending
  //cars.sort((car1,car2) => car2.yearOfProduction - car1.yearOfProduction); // sort descending

  // add more item
  cars.add(Car(name: '2020 Mercedes-AMG ONE', yearOfProduction: 2020));

  // Update an item in list
  cars[0].yearOfProduction = 2015;

  // delete an item from list
  cars = cars.where((element) => element.name != 'Mercedes-Maybach Benz S-class Saloon'
      || element.yearOfProduction != 2020).toList();

  // filter an item from list
  var filteredCars = cars.where((element) => element.yearOfProduction == 2020
      && element.name.toUpperCase().contains('AMG')).toList();
  print(filteredCars);

  // now we try with final and constant
  // when work with array, final and constant cannot reference to another array but
  // final can add more element
  const List<int> numberConst = [1,2,3,4];
  // numberConst.add(99); // return error

  final List<int> numberFinal = [2,3,4,5];
  numberFinal.add(99); // now numberFinal array will have 5 elements are 2,3,4,5,99

  // you can create an Object without creating a class <=> Map type
  // usually use this in draw graphic
  Map<String, dynamic> persons = Map(); // key: String, value: dynamic
  persons['name'] = 'Trong';
  persons['age'] = 23;

  runApp(
    Center(child: Text(
      cars.toString(),
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 30),
    )),
  );
}

