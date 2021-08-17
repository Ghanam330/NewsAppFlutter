
import 'package:flutter/material.dart';

Widget buildArticleItem(dynamic article,context)=>Padding(
  padding:  EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        height: 120.0,
        width: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
              image: NetworkImage('${article['urlToImage']}'),
              fit: BoxFit.cover),
        ),
      ),
       SizedBox(
        width: 20.0,
      ),
      Expanded(
        // ignore: sized_box_for_whitespace
        child: Container(
          height: 120.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Expanded(
                child: Text(
                  '${article['title']}',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style:Theme.of(context).textTheme.bodyText1,
                ),
              ),
               Text(
                '${article['publishedAt']}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

Widget myDriver() => Center(child: CircularProgressIndicator(
));
