import 'package:flutter/material.dart';

import 'member.dart';

class Teaminfo extends StatelessWidget {
  const Teaminfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(50),
            ),
            alignment: Alignment.center,
            child: Text(
              "Meet our team",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          child: Image.asset(
            "./assets/png/arrow.png",
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(
              top: 50,
            ),
            width: 525,
            alignment: Alignment.center,
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: 6,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                // return MemberInfo();
              },
            ),
          ),
        )
      ],
    );
  }
}
