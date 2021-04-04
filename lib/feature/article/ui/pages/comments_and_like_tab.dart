import 'package:bluepad_app/feature/article/bloc/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommentsAndLikeTab extends StatelessWidget {
  final VoidCallback onCommentsTapped;
  const CommentsAndLikeTab({Key key,this.onCommentsTapped}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, articleState) {
      if (articleState is ArticleLoaded) {
        return Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _IconAndAction(
                title: "Like",
                icon: articleState.isLikeTapped
                    ? Icon(
                        Icons.thumb_up,
                        color: Theme.of(context).primaryColor,
                      )
                    : Icon(Icons.thumb_up_alt_outlined),
                onTap: () =>
                    BlocProvider.of<ArticleBloc>(context).add(IncrementLikes()),
              ),
              _IconAndAction(
                title: "Comments",
                icon: Icon(Icons.comment,color: Colors.black,),
                onTap: onCommentsTapped,

              ),
              _IconAndAction(
                title: "Share",
                icon: Icon(Icons.reply_rounded,color: Colors.black,),
                onTap: (){
                  Fluttertoast.showToast(msg: "Share button tapped");
                },

              ),
              _IconAndAction(
                title: "Save",
                icon: Icon(Icons.save_alt,color: Colors.black,),
                onTap: (){
                  Fluttertoast.showToast(msg: "Save button tapped");
                },
              )
            ],
          ),
        );
      }
      return SizedBox();
    });
  }
}

class _IconAndAction extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  final String title;

  const _IconAndAction({Key key, this.icon, this.title, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            height: 8.0,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 12),
          )
        ],
      ),
    );
  }
}
