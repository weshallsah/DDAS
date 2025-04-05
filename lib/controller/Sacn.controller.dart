import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';

class ScanController extends GetxController {
  RxBool isscaned = false.obs;
  RxBool isscaning = false.obs;

  String currentPath = "D:";
  RxList files = [].obs;
  RxList directory = [].obs;
  List<String> private = [
    "Recovery",
    "Windows",
    "System Volume Information",
    "games",
    "System",
  ];

  void ScanClicked() async {
    isscaned.value = true;
    isscaning.value = true;
    await Future.delayed(Duration(milliseconds: 100));
    _listDir(currentPath);
    isscaning.value = false;
  }

  void _listDir(String path) async {
    try {
      var dir = Directory(path);
      var children = dir.listSync();
      // int idx=0;
      files.value = [];
      directory.value = [];
      for (var el in children) {
        // print(idx);
        bool iscontain = false;
        for (var pvt in private) {
          if (el.path.contains(pvt)) {
            iscontain = true;
            break;
          }
        }
        if (iscontain) {
          continue;
        }
        if (el.path.contains('.')) {
          files.add(el);
        } else {
          dir = Directory(el.path);
          // print("Directory");
          directory.addAll(dir.listSync());
        }
      }
      // print(files);
      // print(directory);
    } catch (e) {
      print('Error reading directory: $e');
    }
  }

  void _goBack() {
    final parent = Directory(currentPath).parent;
    _listDir(parent.path);
  }
}
