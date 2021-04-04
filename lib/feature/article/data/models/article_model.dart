class ArticleModel{
  int numberOfLikes;
  int numberOfComments;
  String articleContent1;
  String articleContent2;
  String articleImagePath;

  ArticleModel({this.numberOfLikes=0,this.numberOfComments=0,this.articleContent1="",this.articleContent2="",this.articleImagePath}):
  assert(articleImagePath!=null,"Article image path can not be null");
}