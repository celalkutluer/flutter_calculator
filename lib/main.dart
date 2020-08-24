import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/calc_button.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _CalcAppState createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      if (text == 'AC') {
        _expression = '';
        _history = '';
      } else if (text == 'C') {
        _expression = '';
      } else if (text == '=') {
        Parser p = Parser();
        Expression exp = p.parse(_expression);
        ContextModel cm = ContextModel();
        _history = _expression;
        _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
      } else {
        _expression += text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hesap Makinesi',
      debugShowCheckedModeBanner: false,
      color: Color(0xff283637),
      home: Scaffold(
        backgroundColor: Color(0xff283637),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                _history,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                  fontSize: 24,
                  color: Colors.blueGrey,
                )),
              ),
              alignment: Alignment(1, 1),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                _expression,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            SizedBox(
              height: 24,
            ),
            myRow('AC', 'C', '%', '/'),
            myRow('7', '8', '9', '*', myfillColor: Colors.grey),
            myRow('4', '5', '6', '-', myfillColor: Colors.grey),
            myRow('1', '2', '3', '+', myfillColor: Colors.grey),
            myRow('.', '0', '00', '=', myfillColor: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget myRow(String item1, String item2, String item3, String item4,
      {Color myfillColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CalculatorButton(
          text: item1,
          fillColor: Colors.grey,
          callback: numClick,
        ),
        CalculatorButton(
          text: item2,
          fillColor: Colors.grey,
          callback: numClick,
        ),
        CalculatorButton(
          text: item3,
          fillColor: myfillColor == null ? null : myfillColor,
          callback: numClick,
        ),
        CalculatorButton(
          text: item4,
          callback: numClick,
        ),
      ],
    );
  }
}

//TODO font ekle
