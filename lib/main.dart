import 'package:bluepad_app/core/service_locator.dart';
import 'package:bluepad_app/feature/article/bloc/article_bloc.dart';
import 'package:bluepad_app/feature/article/ui/widgets/article_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [
         BlocProvider<ArticleBloc>(create: (_)=>serviceLocator<ArticleBloc>())
       ],
      child: MaterialApp(
        title: 'Bluepad',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:ArticleHomeWidget(),
      ),
    );
  }
}


