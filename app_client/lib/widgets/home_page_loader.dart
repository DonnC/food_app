import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/index.dart';
import 'package:shimmer/shimmer.dart';

Widget homePageLoader({
  BuildContext context,
}) {
  final Color _color = loginBgColor;
  final _size = MediaQuery.of(context).size;

  return Shimmer.fromColors(
    baseColor: loginBgColor,
    highlightColor: textColor,
    enabled: true,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 30,
          width: 90,
          color: _color,
        ),
        SizedBox(height: 8),
        Container(
          height: 30,
          width: 130,
          color: _color,
        ),
        SizedBox(height: 30),
        Row(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Spacer(),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Container(
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) => Container(
              //height: 40.0,
              //width: 90,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 25,
                  width: 75,
                  color: _color,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: _size.width * 0.5,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: _color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Center(
                          child: Container(
                            height: 60,
                            width: 60,
                            color: _color,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 40,
                        width: 30,
                        color: _color,
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 40,
                        width: 60,
                        color: _color,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 30,
                            color: _color,
                          ),
                          Spacer(),
                          CircleAvatar(
                            backgroundColor: _color,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (ctx, x) => SizedBox(width: 25),
              itemCount: 7,
            ),
          ),
        ),
      ],
    ),
  );
}
