import 'package:ddas/controller/about.controller.dart';
import 'package:flutter/material.dart';

class MemberInfo extends StatelessWidget {
  Pair pair;
  MemberInfo({super.key, required this.pair});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        image: DecorationImage(
          image: AssetImage(
            pair.isexist
                ? "./assets/team/${pair.name}.png"
                : "./assets/team/profileimg.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: 5,
            ),
            width: 145,
            padding: EdgeInsets.only(bottom: 3),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    pair.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 14),
                  alignment: Alignment.topCenter,
                  child: Text(
                    pair.designation,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
