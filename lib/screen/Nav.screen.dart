import 'package:ddas/controller/Nav.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nav extends StatelessWidget {
  Nav({super.key});

  final NavController navController = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leadingWidth: 80,
        leading: Container(
          margin: EdgeInsets.all(10),
          child: Image.asset("./assets/png/database.png"),
        ),
        titleSpacing: 0,
        title: GetBuilder<NavController>(builder: (controller) {
          return Obx(
            () => Text(
              controller.selection.value == 2 ? "" : "DDAS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }),
        toolbarHeight: 60,
        actions: [
          GetBuilder<NavController>(
            builder: (controller) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.actionName.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Obx(
                    () => ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: controller.selection == index
                            ? const WidgetStatePropertyAll(Colors.blueGrey)
                            : const WidgetStatePropertyAll(null),
                      ),
                      onPressed: () {
                        controller.selection.value = index;
                      },
                      child: Text(
                        controller.actionName[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: GetBuilder<NavController>(
        builder: (controller) {
          return Obx(
            () {
              return controller.screens[controller.selection.value];
            },
          );
        },
      ),
    );
  }
}
