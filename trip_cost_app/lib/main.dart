import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Cost Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FuelForm(),
    );
  }
}

class FuelForm extends StatefulWidget {
  @override
  _FuelFormState createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  double _formDistance = 5.0;
  String result = '';
  final _currenies = ['Dollars', 'Euro', 'Pounds'];
  String _currency = 'Dollars';
  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: _formDistance, bottom: _formDistance),
            child: TextField(
              controller: distanceController,
              decoration: InputDecoration(
                  labelText: 'Distance',
                  hintText: "e.g. 124",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
              padding:
                  EdgeInsets.only(top: _formDistance, bottom: _formDistance),
              child: TextField(
                controller: avgController,
                decoration: InputDecoration(
                    labelText: 'Distance per unit',
                    hintText: "e.g. 17",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                keyboardType: TextInputType.number,
              )),
          Padding(
              padding:
                  EdgeInsets.only(top: _formDistance, bottom: _formDistance),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: priceController,
                      decoration: InputDecoration(
                          labelText: 'Price',
                          hintText: "e.g. 1.65",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    width: _formDistance * 2,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      items: _currenies.map((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      value: _currency,
                      onChanged: (String value) {
                        _onDropdownChanged(value);
                      },
                    ),
                  ),
                ],
              )),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  textColor: Theme.of(context).primaryColorLight,
                  onPressed: () {
                    setState(() {
                      result = calculate();
                    });
                  },
                  child: Text(
                    'Submit',
                    textScaleFactor: 1.5,
                  ),
                ),
              ),
              Expanded(
                child: RaisedButton(
                  color: Theme.of(context).buttonColor,
                  textColor: Theme.of(context).primaryColorDark,
                  onPressed: () {
                    setState(() {
                      reset();
                    });
                  },
                  child: Text(
                    'Reset',
                    textScaleFactor: 1.5,
                  ),
                ),
              )
            ],
          ),
          Text(result),
        ]),
      ),
    );
  }

  void _onDropdownChanged(String value) {
    setState(() {
      this._currency = value;
    });
  }

  String calculate() {
    double _distance = double.parse(distanceController.text);
    double _fuelCost = double.parse(priceController.text);
    double _consumption = double.parse(avgController.text);
    double _totalCost = _distance / _consumption * _fuelCost;
    String _result = 'The total cost your trip is ' +
        _totalCost.toStringAsFixed(2) +
        ' ' +
        _currency;
    return _result;
  }

  void reset() {
    distanceController.text = '';
    avgController.text = '';
    priceController.text = '';
    setState(() {
      result = '';
    });
  }
}
