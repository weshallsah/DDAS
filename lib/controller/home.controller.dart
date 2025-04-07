import 'package:ddas/service/dartpython.dart';
import 'package:ddas/util/chartdata.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeController extends GetxController {
  RxList info = [
    "Main Features",
    "Duplicate Detection",
    "Metadata Repository",
    "User Decision-Making",
    "Resource Management",
    "Security & Access"
  ].obs;

  RxBool isenable = false.obs;
  RxInt isresolve = 0.obs;

  RxMap dataMap = {
    "Video": 5.0,
    "Audio": 3.0,
    "Document": 2.0,
    "Image": 2.0,
    "Free": 4.0
  }.obs;

  late List<ChartData> data;
  late TooltipBehavior tooltip;

  RxBool isChartLoaded = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    data = [
      ChartData('Video', 12, 13),
      ChartData('Audio', 15, 18),
      ChartData('Document', 30, 12),
      ChartData('Image', 6.4, 10),
      // ChartData('IND', 14, 20)
    ];
    tooltip = TooltipBehavior(enable: true);
    isChartLoaded.value = true;
  }

  void backgroundprocess() {
    if (isenable.value) {
      DarttoPython().Stopmoniter();
    } else {
      DarttoPython().Startmoniter();
    }
    isenable.value = !isenable.value;
    print(isenable);
  }
}
