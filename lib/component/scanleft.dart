import 'package:ddas/component/listview.dart';
import 'package:ddas/controller/Sacn.controller.dart';
import 'package:ddas/controller/home.controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ScanLeftPanel extends StatelessWidget {
  ScanController controller;
  ScanLeftPanel({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Scaned File's",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.hashcodes.length,
                  itemBuilder: (context, index) {
                    String hash = controller.hashcodes[index];
                    List files = controller.Original[hash];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                      padding: EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("hashcode := ${hash}"),
                          Text("this file has same hash-code:"),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: listfiles(
                                    files: files,
                                    controller: controller,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
