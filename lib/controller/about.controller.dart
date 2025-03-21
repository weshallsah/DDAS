import 'package:get/get.dart';

class AboutController extends GetxController {
  RxList<Pair> names = [
    Pair("Vishal Sah", "Front-End & UI", true),
    Pair("Vipul Soni", "UI & UX", true),
    Pair("Shruti Vishwakarma", "Back-End", false),
    Pair("Zoya Ansari", "Designer", false),
    Pair("Rimple Kosta", "Researcher", false),
    Pair("Tanishka Dutta", "Researcher", false),
  ].obs;
}

class Pair {
  String name;
  String designation;
  bool isexist;
  Pair(this.name, this.designation, this.isexist);
}
