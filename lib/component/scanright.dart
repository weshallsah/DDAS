import 'package:ddas/controller/Sacn.controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ScanRightPanel extends StatelessWidget {
  ScanController controller;
  ScanRightPanel({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "File Detail's",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: GetBuilder<ScanController>(builder: (controller) {
              return Obx(
                () => Container(
                  child: controller.Info.isEmpty
                      ? Container(
                          child: Center(
                            child: Text(
                              "Select File to know info",
                            ),
                          ),
                        )
                      : Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Filename:= ${controller.Info[1]}",
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 5,
                                    child: Text(
                                      "FilePath:= ${controller.Info[2]}",
                                    ),
                                  ),
                                  Flexible(
                                    child: IconButton(
                                      onPressed: () {
                                        controller.openFile(controller.Info[2],
                                            controller.Info[1]);
                                      },
                                      icon: Icon(Icons.explore),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "FileSize:= ${controller.getFileSizeString(bytes: controller.Info[3])}",
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "CreateAt:= ${controller.Info[4]}",
                              ),
                              Text(
                                "ModifyAt:= ${controller.Info[5]}",
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "HashCode:= ${controller.Info[6]}",
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
