import 'package:ddas/component/barchart.dart';
import 'package:ddas/component/graph.dart';
import 'package:ddas/component/sideinfo.dart';
import 'package:ddas/controller/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          GetBuilder<HomeController>(
            builder: (controller) => SideInfo(
              Info: controller.info,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 30,
              ),
              width: double.infinity,
              // color: Colors.teal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dashbord map's
                  Flexible(
                    child: Container(
                      // color: Colors.red,
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Dashbord Overview",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 52, 52, 52),
                                        borderRadius: BorderRadius.circular(
                                          25,
                                        ),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Duplicate's Files",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        GetBuilder<HomeController>(
                                          builder: (controller) => Obx(
                                            () => controller.isChartLoaded.value
                                                ? BarChart(
                                                    data: controller.data,
                                                    tooltip: controller.tooltip,
                                                  )
                                                : const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 10,
                                              width: 20,
                                              color: Colors.amber,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              height: 10,
                                              width: 20,
                                              color: Colors.teal,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                Flexible(
                                  flex: 3,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 52, 52, 52),
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Resources Status",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        GetBuilder<HomeController>(
                                          builder: (controller) => Container(
                                            height: 150,
                                            alignment: Alignment.centerLeft,
                                            child: Graph(
                                                dataMap: controller.dataMap),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // pending Alert's
                  const Text(
                    "pending alert's",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 52, 52, 52),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Alert's",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ListView.builder(
                            itemCount: 2,
                            physics: NeverScrollableScrollPhysics(),
                            // scrollDirection: Axis.,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                margin: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Alert notification 1",
                                    ),
                                    ElevatedButton(
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            WidgetStatePropertyAll(Colors.blue),
                                        foregroundColor: WidgetStatePropertyAll(
                                            Colors.white),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Resolve",
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
