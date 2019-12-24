import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.deepOrangeAccent,
        padding: EdgeInsets.only(top: 30.0, left: 10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text("vokda, Tomato, Mozzi, Bread",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 30.0,
                          decoration: TextDecoration.none,
                          fontFamily: 'Oxygen',
                          fontWeight: FontWeight.normal)),
                ),
                Expanded(
                  child: Text("vokda, Tomato, Mozzi, Bread",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 30.0,
                          decoration: TextDecoration.none,
                          fontFamily: 'Oxygen',
                          fontWeight: FontWeight.normal)),
                )
              ],
            ),
            BearImageWidget(),
            OrderButton(),
          ],
        ));
  }
}

class BearImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage bearAssert = AssetImage('images/bear.png');
    Image image = Image(image: bearAssert, width: 400.0, height: 400.0);
    return Container(child: image);
  }
}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.only(top: 50.0),
      child: RaisedButton(
        child: Text('Order Your Pizza'),
        color: Colors.lightGreen,
        elevation: 5.0,
        onPressed: () {
          order(context);
        },
      ),
    );
    return button;
  }

  void order(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Order Completed"),
      content: Text("Thanks for your order"),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
