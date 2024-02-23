import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:manage_my_store/web/ui/widgets/dashboard_slider_widgets/charts/income_out_going_chart.dart';

import '../widgets/dashboard_slider_widgets/charts/earning_by_item_type_chart.dart';
import '../widgets/dashboard_slider_widgets/charts/sales_analysis_chart.dart';
import '../widgets/dashboard_slider_widgets/charts/top_selling_items_chart.dart';
import '../widgets/dashboard_slider_widgets/charts/weekly_earning_goals_chart.dart';

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
                            width: PlatformDispatcher.instance.displays.first.size.width / 4 ,
                            height: height2,
                            child: const EarningByItemTypesChart()),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 5.0, bottom: 5.0),
                          child: Card(
                            margin: EdgeInsets.zero,
                            elevation: 5.0,
                            child: Container(
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                width:
                                PlatformDispatcher.instance.displays.first.size.width / 4 - 5,
                                height: height2/2-5,
                                child: const IncomeOutgoingsChart()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                          child: Card(
                            elevation: 5.0,
                            margin: EdgeInsets.zero,
                            child: Container(
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                width:
                                PlatformDispatcher.instance.displays.first.size.width / 4 - 5,
                                height: height2/2-5,
                                child: const IncomeOutgoingsChart()),
                          ),
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
                      height: height1/2,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TopSellingItemsDonutChart(),
                      )),
                ),
                const SizedBox(height: 10,),
                Card(
                  elevation: 5.0,
                  child: Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      height: height1/2,
                      child:  const Padding(
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

  void getWidth(){
    var currentWidth = PlatformDispatcher.instance.displays.first.size.width;
    if(currentWidth<1400){
      flex1 = 11;
      flex2= 7;
      height1 = 400;
      height2= 160;
    }
    else{
      flex1 = 11;
      flex2= 5;
      height1 = 450;
      height2 = 210;
    }
  }
}
