import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.deepPurple,
      child: Center(
        child: new Text(
          sayHello(),
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.white, fontSize: 36.0),
        ),
      ),
    );
  }

  String sayHello() {
    String hello;
    num myNum;
    myNum = 2;
    DateTime now = new DateTime.now();
    int hour = now.hour;
    int mintue = now.minute;
    if (hour < 12) {
      hello = "Good Morning";
    } else if (hour < 18) {
      hello = "Good Afternoon";
    } else {
      hello = "Good Evening";
    }
    String minutes =
        (mintue < 10) ? "0" + mintue.toString() : mintue.toString();
    return "It's now " + hour.toString() + ":" + minutes + ".\n" + hello;
  }
}
