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
          Container(
            height: 50,
            width: 700,
            margin: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
            ),
            alignment: Alignment.center,
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search File",
                helperStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
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
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                "Original File's",
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
                                                child: ListView.builder(
                                                  itemCount: controller
                                                      .directory.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical: 2,
                                                        horizontal: 5,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        "${controller.directory[index]}",
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                "Duplicate File's",
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
                                                child: ListView.builder(
                                                  itemCount:
                                                      controller.files.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical: 2,
                                                        horizontal: 5,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        "${controller.files[index]}",
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
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
