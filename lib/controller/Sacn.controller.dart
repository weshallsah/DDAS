import 'dart:io';
import 'dart:math';

import 'package:ddas/service/dartpython.dart';
import 'package:get/get.dart';

class ScanController extends GetxController {
  RxBool isscaned = false.obs;
  RxBool isscaning = false.obs;

  String currentPath = "D:";
  RxList files = [].obs;
  RxList directory = [].obs;
  // List<String> private = [
  //   "Recovery",
  //   "Windows",
  //   "System Volume Information",
  //   "games",
  //   "System",
  // ];

  void ScanClicked() async {
    isscaned.value = true;
    isscaning.value = true;
    Map Original = {};
    await Future.delayed(Duration(milliseconds: 100));
    final result = await DarttoPython().scan();
    int idx=0;
    for (var el in result) {
      if(Original.containsKey(el[6])){
        files.add(idx);
      }
      else{
        Original[el[6]]=true;
      }
      idx++;
    }
    // print(Original);
    directory.value = result;
    isscaning.value = false;
  }

  // void _listDir(String path) async {
  //   try {
  //     var dir = Directory(path);
  //     var children = dir.listSync();
  //     // int idx=0;
  //     files.value = [];
  //     directory.value = [];
  //     for (var el in children) {
  //       // print(idx);
  //       bool iscontain = false;
  //       for (var pvt in private) {
  //         if (el.path.contains(pvt)) {
  //           iscontain = true;
  //           break;
  //         }
  //       }
  //       if (iscontain) {
  //         continue;
  //       }
  //       if (el.path.contains('.')) {
  //         files.add(el);
  //       } else {
  //         dir = Directory(el.path);
  //         // print("Directory");
  //         directory.addAll(dir.listSync());
  //       }
  //     }
  //     // print(files);
  //     // print(directory);
  //   } catch (e) {
  //     print('Error reading directory: $e');
  //   }
  // }

}
