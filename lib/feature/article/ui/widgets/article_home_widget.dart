import 'package:bluepad_app/feature/article/bloc/article_bloc.dart';
import 'package:bluepad_app/feature/article/ui/pages/article_content_page.dart';
import 'package:bluepad_app/feature/article/ui/pages/comment_list_page.dart';
import 'package:bluepad_app/feature/article/ui/pages/comments_and_like_tab.dart';
import 'package:bluepad_app/feature/article/ui/pages/num_comment_like__row_page.dart';
import 'package:bluepad_app/feature/article/ui/widgets/quote_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'add_comment_widget.dart';
import 'article_details_widget.dart';
import 'author_card_title_widget.dart';

class ArticleHomeWidget extends StatefulWidget {
  @override
  _ArticleHomeWidgetState createState() => _ArticleHomeWidgetState();
}

class _ArticleHomeWidgetState extends State<ArticleHomeWidget> {
  final _scaffoleKey=GlobalKey<ScaffoldState>();
  final commentLikeTabKey = GlobalKey<State>();
  double fabOpacity = 1.0;
  ScrollController _scrollController=ScrollController();


  @override
  void initState(){
    super.initState();
    BlocProvider.of<ArticleBloc>(context).add(FetchArticle());
  }
  
  void _onHomeIconTapped(){
    _scaffoleKey.currentState.showSnackBar(
      SnackBar(content: Text("Home button tapped")),
    );
  }


  @override
  void dispose(){
    _scrollController.dispose();

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoleKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.home,color: Colors.black,size: 30,), onPressed: _onHomeIconTapped),
        title: Text("Bluepad",style: TextStyle(color: Colors.blueAccent,fontSize: 20.0),),
      ),
      body:NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scroll){
          var currentContext = commentLikeTabKey.currentContext;
          if (currentContext == null) return false;

          var renderObject = currentContext.findRenderObject();
          RenderAbstractViewport viewport = RenderAbstractViewport.of(renderObject);
          var offsetToRevealBottom = viewport.getOffsetToReveal(renderObject, 1.0);
          var offsetToRevealTop = viewport.getOffsetToReveal(renderObject, 0.0);

          if (offsetToRevealBottom.offset > scroll.metrics.pixels ||
              scroll.metrics.pixels > offsetToRevealTop.offset) {
            if (fabOpacity == 0.0) {
              setState(() {
                fabOpacity = 1.0;
              });
            }


          } else {
            if (fabOpacity != 0.0) {
              setState(() {
                fabOpacity = 0.0;
              });
            }
          }
          return false;
        },
        child: Padding(
          padding: const EdgeInsets.only(left:12.0,top: 8.0,right: 12.0),
          child: SingleChildScrollView(
            controller:_scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ArticleDetailsWidget(),
                AuthorCardTitleWidget(authorName:"Kishore Purohit" ,publishedDate: "4th Apr,2021",),
                SizedBox(height: 20,),
                QuoteWidget(),
                SizedBox(height: 20,),
                ArticleContentPage(),
                NumCommentLikePage(),
                CommentsAndLikeTab(key: commentLikeTabKey,onCommentsTapped: (){

                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 500),
                  );

                  Fluttertoast.showToast(msg: "Scroll controller not working as implemented");


                  debugPrint("Tappedddd");
                },),
                Divider(height: 2,color: Colors.grey,),
                AddCommentWidget(),
                Divider(height: 2,color: Colors.grey,),
                CommentListPage(),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:fabOpacity==0.0?SizedBox(height: 70,):CommentsAndLikeTab(),
    );
  }
}
