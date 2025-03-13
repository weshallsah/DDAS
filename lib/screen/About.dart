import 'package:ddas/component/member.dart';
import 'package:ddas/controller/about.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});

  AboutController aboutController = Get.put(AboutController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "DDAS",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            Container(
              child: Text(
                "Detect and eliminate duplicate data effortlessly.\nEnsure data accuracy, integrity, and smarter decision-making.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  // fontWeight: FontWeight.w500,
                  wordSpacing: 2,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
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
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Meet our diverse team of world-class creators, designers, and problem solvers.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GetBuilder<AboutController>(builder: (controller) {
              return Container(
                width: 525,
                alignment: Alignment.center,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: controller.names.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return MemberInfo(
                      pair: controller.names[index],
                    );
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
