

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappudemycourse/news_udmy/cubit/cubit.dart';
import 'package:newsappudemycourse/news_udmy/cubit/states.dart';

import '../../component.dart';

class ScienceScreen extends StatelessWidget {

  ScienceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {

        var list= NewsCubit.get(context).science;

        return ConditionalBuilder(
          condition:list.length >0,
          builder: (context) =>
              ListView.separated(
                physics:BouncingScrollPhysics() ,
                itemBuilder: (context, index) => buildArticleItem(
                    list[index],
                  context
                ),
                separatorBuilder: (context, index) => myDriver(),
                itemCount: list.length,
              ),
          fallback: (context) =>
          const Center(
            child: CircularProgressIndicator(

            ),
          ),
        );
      },

    );
  }
}
