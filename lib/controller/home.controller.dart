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

  RxMap dataMap = {
    "Flutter": 5.0,
    "React": 3.0,
    "Xamarin": 2.0,
    "Ionic": 2.0,
  }.obs;

  late List<ChartData> data;
  late TooltipBehavior tooltip;

  RxBool isChartLoaded = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    data = [
      ChartData('CHN', 12, 13),
      ChartData('GER', 15, 18),
      ChartData('RUS', 30, 12),
      ChartData('BRZ', 6.4, 10),
      ChartData('IND', 14, 20)
    ];
    tooltip = TooltipBehavior(enable: true);
    isChartLoaded.value = true;
  }
}
