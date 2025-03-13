import 'package:get/get.dart';

class AboutController extends GetxController {
  RxList<Pair> names = [
    Pair("Vishal Sah", "Founder & CEO", true),
    Pair("Vipul Soni", "Founder & CEO", false),
    Pair("Shruti Vishwakarma", "Founder & CEO", false),
    Pair("Zoya Ansari", "Founder & CEO", false),
    Pair("Rimple Kosta", "Founder & CEO", false),
    Pair("Tanishka Dutta", "Founder & CEO", false),
  ].obs;
}

class Pair {
  String name;
  String designation;
  bool isexist;
  Pair(this.name, this.designation, this.isexist);
}
