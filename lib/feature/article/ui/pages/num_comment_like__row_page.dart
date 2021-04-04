import 'package:bluepad_app/feature/article/bloc/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NumCommentLikePage extends StatelessWidget {
  const NumCommentLikePage({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc,ArticleState>(
    builder: (context,articleState){
    if(articleState is ArticleLoaded){
       return Padding(
         padding: const EdgeInsets.only(left: 20,right: 20.0),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text("${articleState.articleModel.numberOfLikes} Likes",style: TextStyle(color: Colors.black),),
             Text("${articleState?.commentsList?.length??0} Comments",style:TextStyle(color: Theme.of(context).primaryColor) ,)
           ],
         ),
       );
    }
    return SizedBox();
    }


    );
  }
}
