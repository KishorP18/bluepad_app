import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bluepad_app/feature/article/data/models/article_model.dart';
import 'package:bluepad_app/feature/article/data/models/comments_model.dart';
import 'package:bluepad_app/feature/article/data/repository/articles_data_repo.dart';
import 'package:equatable/equatable.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitial());

  @override
  Stream<ArticleState> mapEventToState(
    ArticleEvent event,
  ) async* {
    if(event is FetchArticle){
     yield* _fetchArticle();
    }else if(event is IncrementLikes){
      yield* _incrementLikes();
    }else if(event is  AddComments){
      yield* _addComments(event);
    }
  }


  Stream<ArticleState> _fetchArticle()async*{
      yield ArticleLoading();
     yield ArticleLoaded(commentsList:[],articleModel:ArticlesDataRepo.articleData);
  }


  Stream<ArticleState> _incrementLikes()async*{
    if(state is ArticleLoaded){
      ArticleLoaded currentState=state;

      currentState.isLikeTapped?currentState.articleModel.numberOfLikes--:currentState.articleModel.numberOfLikes++;
      yield ArticleLoading();
      yield currentState.copyWith(
        isLikeTapped: currentState.isLikeTapped^true
      );
    }
  }


  Stream<ArticleState> _addComments(AddComments addComment)async*{
    if(state is ArticleLoaded){
      ArticleLoaded currentState=state;
      List<CommentsModel> commentstList=currentState.commentsList;
      commentstList.add(addComment.commentsModel);
      yield ArticleLoading();
      yield currentState.copyWith(
        commentsList:  commentstList,
      );
    }
  }



}
