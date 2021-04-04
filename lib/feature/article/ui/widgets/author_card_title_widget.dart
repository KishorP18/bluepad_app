import 'package:flutter/material.dart';

class AuthorCardTitleWidget extends StatelessWidget {
  final String authorName;
  final String publishedDate;

  const AuthorCardTitleWidget({Key key,this.authorName="",this.publishedDate=""})
      :super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: Icon(Icons.person,size: 30,color: Colors.black38,),
          backgroundColor: Colors.grey,
        ),
        SizedBox(width: 12,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(authorName,style: TextStyle(fontSize: 16,),),
            SizedBox(height: 2,),
            Text(publishedDate,style: TextStyle(color: Colors.black38,fontSize: 16),),
          ],
        )
      ],
    );
  }
}
