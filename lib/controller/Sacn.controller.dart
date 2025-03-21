import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';

class ScanController extends GetxController {
  RxBool isscaned = false.obs;
  RxBool isscaning = false.obs;

  String currentPath = "D:";
  List<FileSystemEntity> files = [];
  List<String> private = ["Recovery", "Windows"];

  void ScanClicked() async {
    isscaned.value = true;

    _listDir(currentPath);

    isscaning.value = false;
  }

  void _listDir(String path) async {
    try {
      var dir = Directory(path);
      var children = dir.listSync();
      List<FileSystemEntity> directory=[];
      while (children.isNotEmpty) {
        bool iscontain = false;
        for (var pvt in private) {
          if (children[0].path.contains(pvt)) {
            iscontain = true;
            break;
          }
        }
        if (iscontain) {
          continue;
        }
        if (children[0].path.contains('.')) {
          files.add(children[0]);
        } else {
          dir = Directory(children[0].path);
          print("Directory");
          directory.addAll(dir.listSync());
        }
        children.remove(children[0]);
      }
      print(files);
    } catch (e) {
      print('Error reading directory: $e');
    }
  }

  void _goBack() {
    final parent = Directory(currentPath).parent;
    _listDir(parent.path);
  }
}
