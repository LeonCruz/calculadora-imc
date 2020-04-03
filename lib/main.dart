import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController txtWeight = TextEditingController();
  TextEditingController txtHeight = TextEditingController();
  String message = 'Seu IMC';
  Color color = Colors.grey;

  void clearData() {
    txtHeight.clear();
    txtWeight.clear();

    setState(() {
      message = 'Seu IMC';
      color = Colors.grey;
    });
  }

  void calculateIMC() {
    double weight = double.parse(txtWeight.text);
    double height = double.parse(txtHeight.text)/100;
    double imc = weight / (height * height);
    
    String msg = '';
    Color colorMsg;

    if(imc < 18) {
      msg = '${imc.toStringAsPrecision(3)} é abaixo do peso';
      colorMsg = Colors.black;
    } else if(imc >= 18.5 && imc <= 24.9) {
      msg = '${imc.toStringAsPrecision(3)} é peso normal';
      colorMsg = Colors.green;
    } else if(imc >= 25 && imc <= 29.9) {
      msg = '${imc.toStringAsPrecision(3)} é sobrepeso';
      colorMsg = Colors.redAccent;
    } else if(imc >= 30 && imc <= 39.9) {
      msg = '${imc.toStringAsPrecision(3)} é obesidade grau 1';
      colorMsg = Colors.red[400];
    } else if(imc >= 35 && imc <= 39.9) {
      msg = '${imc.toStringAsPrecision(3)} é obesidade grau 2';
      colorMsg = Colors.red;
    } else {
      msg = '${imc.toStringAsPrecision(3)} é obesidade grau 3';
      colorMsg = Colors.red[600];
    }

    setState(() {
      message = msg;
      color = colorMsg;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Spacer(),
              Container(
                child: Text('$message',
                    style: TextStyle(fontSize: 30.0, color: color)),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 150.0,
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: TextField(
                      controller: txtWeight,
                      decoration: InputDecoration(labelText: 'Peso'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    width: 150.0,
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: TextField(
                      controller: txtHeight,
                      decoration: InputDecoration(labelText: 'Altura (cm)'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: RaisedButton(
                        onPressed: () {
                          calculateIMC();
                        },
                        child: Text(
                          'Calcular',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: OutlineButton(
                        onPressed: () {
                          clearData();
                        },
                        child:
                            Text('Apagar', style: TextStyle(color: Colors.red)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
              Spacer(flex: 2,),
            ],
          ),
        ));
  }
}
