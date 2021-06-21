
import 'package:flutter/material.dart';

Widget buildArticleItem()=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        height: 120.0,
        width: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: const DecorationImage(
              image: NetworkImage('https://www.instagram.com/p/CMX8Q-IF-hX/'),
              fit: BoxFit.cover),
        ),
      ),
      const SizedBox(
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
              const Expanded(
                child: Text(
                  'Title',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Text(
                'welcome back Ahmed',
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
