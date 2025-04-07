import 'dart:io';
import 'dart:math';

import 'package:ddas/service/dartpython.dart';
import 'package:get/get.dart';

class ScanController extends GetxController {
  RxBool isscaned = false.obs;
  RxBool isscaning = false.obs;

  String currentPath = "D:";
  RxList hashcodes = [].obs;
  RxMap Original = {}.obs;
  RxList Info = [].obs;

  void openFile(String path, String filename) {
    final splitstr = path.split("\\" + filename);
    print(splitstr.first);
    Process.start('explorer', [splitstr.first]);
  }

  void DeleteFile(int id, String path) async {
    final result = await DarttoPython().deleteFile(id, path);
    print(result);
    Info.value = [];
    Original.value = {};
    hashcodes.value = [];
    for (var el in result) {
      print(el[6]);
      if (Original.containsKey(el[6])) {
        Original[el[6]]!.add(el);
      } else {
        Original[el[6]] = [el];
        hashcodes.add(el[6]);
      }
    }
    print(Original);
  }

  void ScanClicked() async {
    isscaned.value = true;
    isscaning.value = true;

    // await Future.delayed(Duration(milliseconds: 100));
    final result = await DarttoPython().scan();
    Original.value = {};
    hashcodes.value = [];
    for (var el in result) {
      print(el[6]);
      if (Original.containsKey(el[6])) {
        Original[el[6]]!.add(el);
      } else {
        Original[el[6]] = [el];
        hashcodes.value.add(el[6]);
      }
    }
    print(Original);
    isscaning.value = false;
  }

  String getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = ["byte", "kb", "mb", "gb", "tb"];
    if (bytes == 0) {
      return "0 ${suffixes[0]}";
    }
    int i = (log(bytes) / log(1024)).toInt();

    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        " " +
        suffixes[i];
  }

  
}
