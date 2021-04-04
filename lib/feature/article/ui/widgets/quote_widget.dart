import 'package:flutter/material.dart';


class QuoteWidget extends StatelessWidget {
  const QuoteWidget({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(

      children:<TextSpan>[
        TextSpan(text: '"To be an artist is to believe in life." -',style: TextStyle(color: Colors.black)),
        TextSpan(text: " Henry \nMoore ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,))


      ]
    ),);
  }
}
