import 'package:flutter/material.dart';
import 'car.dart';

void main() {
  // init an object
  var myCar = Car(name: 'Mercedes S-class',yearOfProduction: 2021);
  myCar.handleEvent = (){
    print('Handle in main');
  };
  myCar.doSomething();
  myCar.sayHello(personName: 'TrongHD');
  runApp(
    Center(child: Text('${myCar.toString()}',
      style: TextStyle(fontSize: 30),
      textDirection: TextDirection.ltr,
    )),
  );
}

