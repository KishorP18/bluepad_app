import 'package:bluepad_app/feature/article/bloc/article_bloc.dart';
import 'package:bluepad_app/feature/article/data/models/comments_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddCommentWidget extends StatefulWidget {
  const AddCommentWidget({Key key}):super(key:key);
  @override
  _AddCommentWidgetState createState() => _AddCommentWidgetState();
}

class _AddCommentWidgetState extends State<AddCommentWidget> {
  final _commentController=TextEditingController();

  @override
  void initState(){
    super.initState();
    _commentController.addListener(() {
      setState(() {

      });
    });
  }

  @override
  void dispose(){
    super.dispose();
    _commentController?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:12.0,bottom: 12.0),
      child: Row(
        children: [
           CircleAvatar(
             backgroundColor: Colors.black45,
             radius: 30,
             child: Text("K",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),),),
          SizedBox(width: 16.0,),
          Container(
            width: MediaQuery.of(context).size.width/1.8,
            child: TextField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText: 'Write a Comment...',
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  borderSide: BorderSide(color: Colors.black12, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),),
          ),
          SizedBox(width: 8,),
          InkWell(
            onTap: (){
              if(_commentController.text!=null&&_commentController.text.isNotEmpty){
                BlocProvider.of<ArticleBloc>(context).add( AddComments(
                  commentsModel: CommentsModel(comment:_commentController.text ,commentorName: "Kishore Purohit"),
                ));
                setState(() {
                  _commentController.clear();
                });

                Fluttertoast.showToast(msg: "Comment adedd");
              }
            },
            child: Text("Post",style: TextStyle(fontSize: 16,color: _commentController.text!=null&&_commentController.text.isNotEmpty?
            Theme.of(context).primaryColor:Theme.of(context).primaryColor.withOpacity(0.4),),)
          ),
        ],
      ),
    );
  }
}
