import 'package:flutter/material.dart';

class ArticleDetailsWidget extends StatelessWidget {
  const ArticleDetailsWidget({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Text("Rise of Online content\ncreators",style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w500
        ),),
        SizedBox(height: 20,),

      ],
    );
  }
}
