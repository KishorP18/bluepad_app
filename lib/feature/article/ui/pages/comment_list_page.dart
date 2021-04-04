import 'package:bluepad_app/feature/article/bloc/article_bloc.dart';
import 'package:bluepad_app/feature/article/data/models/comments_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


class CommentListPage extends StatelessWidget {
  const CommentListPage({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc,ArticleState>(
        builder: (context,articleState){
          if(articleState is ArticleLoaded&&articleState.commentsList!=null&&articleState.commentsList.isNotEmpty){
            return Column(
              children: articleState.commentsList.map((comment) => _CommentsSection(commentsModel: comment,)).toList(),
            );
          }
          return SizedBox();
        });
  }
}

class _CommentsSection extends StatelessWidget {
   final CommentsModel commentsModel;
   const _CommentsSection({Key key,this.commentsModel}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12,),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black45,
              radius: 24,
              child: Text(commentsModel?.commentorName?.trim()[0]??"N/A",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),),),
            SizedBox(width: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(commentsModel.commentorName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                SizedBox(height: 4,),
                Container(
                  width: MediaQuery.of(context).size.width/1.7,
                  child: Text(commentsModel.comment,
                    style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w400),),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                   _LikeButton(),
                    SizedBox(width: 12,),
                    _ReplyBtn(),
                    SizedBox(width: 12,),
                    Text("Apr 5,2021",style: TextStyle(color: Colors.black26,fontSize: 14,fontWeight: FontWeight.w400),),
                  ],
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 12,),
        Divider(height: 2,color: Colors.grey,),
      ],
    );
  }
}

class _LikeButton extends StatefulWidget {
  @override
  __LikeButtonState createState() => __LikeButtonState();
}

class __LikeButtonState extends State<_LikeButton> {
  bool isLiked=false;
  int numLike=0;

  void _ontap(){
    setState(() {
      isLiked=isLiked^true;
      if(isLiked){
        numLike=1;
      }else{
        numLike=0;
      }
    });


  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(icon: !isLiked?Icon(Icons.thumb_up_alt_outlined):Icon(Icons.thumb_up,color: Theme.of(context).primaryColor,), onPressed: (){
          _ontap();
        }),
        Text("${numLike} Like",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),)
      ],
    );
  }
}


class _ReplyBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(icon:Icon(Icons.comment),onPressed: (){
          Fluttertoast.showToast(msg: "TODO:add reply functionality");
        },),
        Text("1 Reply",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600,))
      ],
    );
  }
}



