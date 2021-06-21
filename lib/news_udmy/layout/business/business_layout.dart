// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappudemycourse/news_udmy/component.dart';
import 'package:newsappudemycourse/news_udmy/cubit/cubit.dart';
import 'package:newsappudemycourse/news_udmy/cubit/states.dart';


class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (BuildContext context, state) {
        return ConditionalBuilder(
          condition: state is! NewsLoadingState,
          builder: (context) =>
              ListView.separated(
                  itemBuilder: (context, index) => buildArticleItem()
                  , separatorBuilder: (context, index) => Container(
                height: 1,)
                  , itemCount: 10
              ),
          fallback: (context) =>
          const Center(
            child: CircularProgressIndicator(

            ),
          ),
        );
      },
      listener: (BuildContext context, state) {},
    );
  }
}
