import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:manage_my_store/web/ui/widgets/dashboard_slider_widgets/other_widgets/current_data_list.dart';
import 'package:manage_my_store/web/ui/widgets/dashboard_slider_widgets/other_widgets/customer_reviews.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CurrentDataList(),
        Row(
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
                    margin: EdgeInsets.zero,
                    child: Container(
                        decoration:  BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
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
                                     BoxDecoration(color: Colors.white,                  borderRadius: BorderRadius.circular(10.0)
                                    ),
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
                            const SizedBox(
                              height: 10,
                            ),
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
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TopSellingItemsDonutChart(height: height1),
                    const SizedBox(
                      height: 10,
                    ),
                    WeeklyGoalsChart(height: height1),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomerReviews(height: height2)
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  void getWidth() {
    var currentWidth = PlatformDispatcher.instance.displays.first.size.width;
    if (currentWidth < 1400) {
      flex1 = 11;
      flex2 = 7;
      height1 = 400;
      height2 = 185;
    } else {
      flex1 = 11;
      flex2 = 5;
      height1 = 450;
      height2 = 200;
    }
  }
}
