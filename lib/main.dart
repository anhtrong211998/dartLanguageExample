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

  runApp(
    Center(child: Text(
      cars.toString(),
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 30),
    )),
  );
}

