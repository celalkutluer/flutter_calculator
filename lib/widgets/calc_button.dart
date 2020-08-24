import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color fillColor;
  final double textFontSize;
  final Function callback;
  const CalculatorButton(
      {Key key, @required this.text, this.textColor, this.fillColor,this.textFontSize,this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      child: SizedBox(
        height: MediaQuery.of(context).size.height/9.4,
        width: MediaQuery.of(context).size.width/5.15,
        child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          child: Text(
            text,
            style: GoogleFonts.rubik(textStyle: TextStyle(
                fontSize: textFontSize==null?MediaQuery.of(context).size.height/21.0:textFontSize,
                color: textColor==null?Colors.black:textColor)),

          ),
          onPressed: () {
           callback(text);
          },
          color: fillColor==null ? Colors.white:fillColor,
        ),
      ),
    );
  }
}
