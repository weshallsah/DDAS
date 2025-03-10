import 'package:ddas/screen/About.dart';
import 'package:ddas/screen/Scan.dart';
import 'package:ddas/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  

  List<String> actionName = [
    "DashBord",
    "Scan",
    "About",
  ];
  RxInt selection = 0.obs;
  RxList<Widget> screens = [HomeScreen(), ScanScreen(), AboutScreen()].obs;
}
