import 'package:bluepad_app/feature/article/bloc/article_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator=GetIt.I;


void setupLocator(){
 serviceLocator.registerLazySingleton<ArticleBloc>(() => ArticleBloc());
}