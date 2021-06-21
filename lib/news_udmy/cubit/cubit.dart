import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'Sports'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'Science'),
    const BottomNavigationBarItem(
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
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SettingScreen()
  ];

  void changeBottomBNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
      },
    ).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((onError) {
      emit(NewsGetBusinessErrorState(onError.toString()));
    });
  }
}
