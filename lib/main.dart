import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'news_udmy/Nerwork/remote/dio_helper.dart';
import 'news_udmy/news_app/news_layout.dart';



void main() {

  Bloc.observer=BlocObserver();
  DioHelper.init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backwardsCompatibility: false,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black45,
            statusBarIconBrightness: Brightness.dark,

          ),
          backgroundColor: Colors.white,
           elevation: 0.0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          elevation: 30.0
        ),
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: const NewsLayout(),
    );
  }
}


// POST
// UPDATE
// DELETE

//GET

//base url : https://api.npoint.io/

// method (url) : 99c279bb173a6e28359c

// queries : country=/surat

