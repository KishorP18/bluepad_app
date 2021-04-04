part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();
}

class FetchArticle extends ArticleEvent{
  @override
  List<Object> get props=>[];
}

class IncrementLikes extends ArticleEvent{
  @override
  List<Object> get props=>[];
}


class AddComments extends ArticleEvent{
  final CommentsModel commentsModel;

  const AddComments({this.commentsModel});
  @override
  List<Object> get props=>[];
}
