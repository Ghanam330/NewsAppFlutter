import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappudemycourse/news_udmy/Nerwork/local/cach_helper.dart';
import 'package:newsappudemycourse/news_udmy/Nerwork/remote/dio_helper.dart';
import 'package:newsappudemycourse/news_udmy/layout/ScinenceScreen/science_screen.dart';
import 'package:newsappudemycourse/news_udmy/layout/Setting/seeting_screen.dart';
import 'package:newsappudemycourse/news_udmy/layout/business/business_layout.dart';
import 'package:newsappudemycourse/news_udmy/layout/sports/sports_screen.dart';
import 'states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'Science'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: 'Setting'),
  ];

  List<String> titles = [
    'BusinessNews',
    'SportsNews',
    'ScienceNews',
    'SettingAppp'
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingScreen()
  ];

  void changeBottomBNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  getBusiness() async {
    if (business.length == 0) {
      emit(NewsBusinessLoadingState());

      Dio dio = Dio();
      dio.options.baseUrl = 'http://newsapi.org/';

      await dio.get(
        'v2/top-headlines',
        queryParameters: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        business = value.data['articles'] as List;

        emit(NewsGetBusinessSuccessState());
      }).catchError((e) {
        emit(NewsGetBusinessErrorState(e.toString()));
      });
    }
  }

  //
  // void getBusiness() {
  //   emit(NewsBusinessLoadingState());
  //   DioHelper.getData(
  //     url: 'v2/top-headlines',
  //     query: {
  //       'country': 'eg',
  //       'category': 'business',
  //       'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
  //     },
  //   ).then((value) {
  //     business = value.data['articles'];
  //     emit(NewsGetBusinessSuccessState());
  //   }).catchError((onError) {
  //     emit(NewsGetBusinessErrorState(onError.toString()));
  //   });
  // }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsSportsLoadingState());

    if (sports.length == 0) {
      DioHelper.getData(

        url: 'v2/top-headlines',
        query: {

          'country': 'eg',
          'category': 'sports',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'

        },
      ).then((value) {
        sports = value.data['articles'];
        emit(NewsGetSportsSuccessState());
      }).catchError((onError) {
        emit(NewsGetSportsErrorState(onError.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsScienceLoadingState());

    if (science == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
        },
      ).then((value) {
        science = value.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((onError) {
        emit(NewsGetScienceErrorState(onError.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }



  bool isDark=false;
  ThemeMode appMode = ThemeMode.dark;

  void changeAppMode() {
    isDark = !isDark;
    CacheHelper.putData(key: 'isDark', value: isDark).then((value) =>
   {
    emit(NewsAppModeChange())
   } );

  }
}
