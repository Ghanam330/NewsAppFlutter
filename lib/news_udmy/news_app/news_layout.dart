import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappudemycourse/news_udmy/cubit/cubit.dart';
import 'package:newsappudemycourse/news_udmy/cubit/states.dart';


class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
              actions: [
                IconButton(
                  onPressed: (){},
                  icon: const Icon(
                  Icons.search
                ),)
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {

                  cubit.changeBottomBNavBar(index);
                },
                items: cubit.bottomItems
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
