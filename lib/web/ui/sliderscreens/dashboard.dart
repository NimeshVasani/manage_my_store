import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/dashboard_slider_widgets/charts/earning_by_item_type_chart.dart';
import '../widgets/dashboard_slider_widgets/charts/sales_analysis_chart.dart';
import '../widgets/dashboard_slider_widgets/charts/top_selling_items_chart.dart';
import '../widgets/dashboard_slider_widgets/charts/weekly_earning_goals_chart.dart';
import '../widgets/dashboard_slider_widgets/other_widgets/visit_widget.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late int flex1;
  late int flex2;
  late double height1;
  late double height2;
  double width = PlatformDispatcher.instance.displays.first.size.width;

  @override
  void initState() {
    super.initState();
    getWidth();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: flex1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 5.0,
                child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    height: height1,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SalesAnalysisChart(),
                    )),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Card(
                        elevation: 5.0,
                        child: Container(
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            width: width / 4,
                            height: height2,
                            child: const EarningByItemTypesChart()),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        DailyVisits(
                          width: width,
                          height: height2,
                          data: "\$12,990",
                          type: "VISIT",
                          img: "assets/web/chart1_img.png",
                        ),
                        const SizedBox(height: 10,),
                        DailyVisits(
                          width: width,
                          height: height2,
                          data: "46.7%",
                          type: "BOUNCE RATE",
                          img: "assets/web/chart2_img.png",
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          flex: flex2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                elevation: 5.0,
                child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    height: height1 / 2,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TopSellingItemsDonutChart(),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 5.0,
                child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    height: height1 / 2,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: WeeklyGoalsChart(),
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }

  void getWidth() {
    var currentWidth = PlatformDispatcher.instance.displays.first.size.width;
    if (currentWidth < 1400) {
      flex1 = 11;
      flex2 = 7;
      height1 = 400;
      height2 = 160;
    } else {
      flex1 = 11;
      flex2 = 5;
      height1 = 450;
      height2 = 210;
    }
  }
}
