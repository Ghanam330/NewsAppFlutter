

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappudemycourse/them%20mode/shard.dart';
import 'package:newsappudemycourse/them%20mode/stats.dart';

class NewsCubit extends Cubit<ProfileStates> {
  NewsCubit() : super(ProfileInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  bool isDark=false;
  ThemeMode appMode = ThemeMode.dark;

  void changeAppMode() {
    isDark = !isDark;
    CacheHelper.putData(key: 'isDark', value: isDark).then((value) =>
    {
      emit(ProfileAppModeChange())
    } );

  }

}