import 'package:flutter/material.dart';

class MemberInfo extends StatelessWidget {
  const MemberInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        // borderRadius: BorderRadius.circular(5),
        image: const DecorationImage(
            image: AssetImage(
              "./assets/team/Vishal Sah.png",
            ),
            fit: BoxFit.fill),
      ),
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: 5,
            ),
            width: 140,
            padding: EdgeInsets.only(bottom: 3),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: const Text(
                    "Vishal Sah",
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
                  child: const Text(
                    "Founder & CEO",
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
