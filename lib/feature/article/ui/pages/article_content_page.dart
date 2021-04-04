import 'package:bluepad_app/feature/article/bloc/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ArticleContentPage extends StatelessWidget {
  const ArticleContentPage({Key key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc,ArticleState>(
      builder: (context,articleState){
        if(articleState is ArticleLoaded){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(articleState.articleModel.articleContent1),
              SizedBox(height: 20,),
              Image.asset(articleState.articleModel.articleImagePath,width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.5,
              fit: BoxFit.cover,
              ),
              SizedBox(height: 20,),
              Text(articleState.articleModel.articleContent2),
            ],
          );
        }

        return Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
