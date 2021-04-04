part of 'article_bloc.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();
}

class ArticleInitial extends ArticleState {
  @override
  List<Object> get props => [];
}


class ArticleLoaded extends ArticleState{
  final ArticleModel articleModel;
  final List<CommentsModel> commentsList;
  final bool isLikeTapped;

  const ArticleLoaded({this.articleModel,this.commentsList,this.isLikeTapped=false});

  ArticleLoaded copyWith({ArticleModel articleModel,List<CommentsModel> commentsList,bool isLikeTapped}){
    return ArticleLoaded(
      articleModel: articleModel??this.articleModel,
      commentsList: commentsList??this.commentsList,
      isLikeTapped: isLikeTapped??this.isLikeTapped,
    );
  }

  @override
  List<Object> get props=>[];
}


class ArticleLoading extends ArticleState{
  @override
  List<Object> get props=>[];
}
