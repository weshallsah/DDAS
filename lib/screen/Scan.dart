import 'package:ddas/component/listview.dart';
import 'package:ddas/component/scanleft.dart';
import 'package:ddas/component/scanright.dart';
import 'package:ddas/controller/Sacn.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScanScreen extends StatelessWidget {
  ScanScreen({super.key});

  final ScanController scanController = Get.put(ScanController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Container(
          //   height: 50,
          //   width: 700,
          //   margin: const EdgeInsets.symmetric(
          //     vertical: 20,
          //   ),
          //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          //   decoration: BoxDecoration(
          //     border: Border.all(color: Colors.white),
          //     borderRadius: BorderRadius.circular(25),
          //   ),
          //   alignment: Alignment.center,
          //   child: const TextField(
          //     decoration: InputDecoration(
          //       border: InputBorder.none,
          //       hintText: "Search File",
          //       helperStyle: TextStyle(
          //         fontSize: 30,
          //       ),
          //     ),
          //   ),
          // ),
          GetBuilder<ScanController>(builder: (controller) {
            return Obx(
              () => !controller.isscaned.value
                  ? Expanded(
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            controller.ScanClicked();
                          },
                          hoverColor: Colors.blueGrey,
                          enableFeedback: true,
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            height: 40,
                            width: 100,
                            margin: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              // color: Colors.amber,
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            alignment: Alignment.center,
                            child: Text("Scan"),
                          ),
                        ),
                      ),
                    )
                  : controller.isscaning.value
                      ? const Expanded(
                          child: Center(
                            child: Text("Scaning........."),
                          ),
                        )
                      : Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: ScanLeftPanel(
                                            controller: controller)),
                                    Container(
                                      width: 5,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      decoration: BoxDecoration(
                                          border: Border(
                                        left: BorderSide(color: Colors.white),
                                        right: BorderSide(color: Colors.white),
                                      )),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: ScanRightPanel(
                                        controller: controller,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                              // refresh button
                              Container(
                                margin: EdgeInsets.all(5),
                                child: InkWell(
                                  onTap: () {
                                    controller.ScanClicked();
                                  },
                                  hoverColor: Colors.blueGrey,
                                  enableFeedback: true,
                                  borderRadius: BorderRadius.circular(25),
                                  child: Container(
                                    height: 30,
                                    width: 120,
                                    margin: EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      // color: Colors.amber,
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.refresh_sharp,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("Re-Fresh "),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
            );
          }),
        ],
      ),
    );
  }
}
