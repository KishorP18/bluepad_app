import 'package:flutter/material.dart';


class AppBarWidget extends StatelessWidget {
  final String title;
  final VoidCallback onIconTapped;
  const AppBarWidget({Key key,@required this.onIconTapped,this.title=""}):
        assert(onIconTapped!=null,"App bar icon action can not be null"),
        super(key:key);
  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: IconButton(icon: Icon(Icons.home,color: Colors.black54,), onPressed: onIconTapped)),
        Align(
            alignment: Alignment.center,
            child: Text(title??"",style: TextStyle(color: Colors.blueAccent,fontSize: 18.0),)
        ),
      ],
    );
  }
}
