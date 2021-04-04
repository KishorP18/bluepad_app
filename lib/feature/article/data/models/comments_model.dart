class CommentsModel{
  String commentorName;
  String comment;
  int numberOfLikes;
  DateTime dateTime;

  CommentsModel({this.commentorName,this.comment,this.numberOfLikes=0}){
    this.dateTime=DateTime.now();
  }
}