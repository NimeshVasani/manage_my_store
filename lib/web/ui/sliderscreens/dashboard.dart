import 'package:flutter/material.dart';
import 'package:manage_my_store/mobile/ui/widgets/customtext.dart';
import 'package:manage_my_store/web/ui/widgets/dashboardsliderwidgets/incomeoutgoingchart.dart';
import 'package:manage_my_store/web/ui/widgets/dashboardsliderwidgets/revenueprofitschart.dart';
import 'package:manage_my_store/web/ui/widgets/dashboardsliderwidgets/sales_analysis_chart.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 5.0,
                child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    height: 500,
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
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Card(
                        elevation: 5.0,
                        child: Container(
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            width: MediaQuery.of(context).size.width / 4 - 10,
                            height: 310,
                            child: const IncomeOutgoingsChart()),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 5.0),
                          child: Card(
                            margin: EdgeInsets.zero,
                            elevation: 5.0,
                            child: Container(
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                width:
                                    MediaQuery.of(context).size.width / 4 - 10,
                                height: 150,
                                child: const IncomeOutgoingsChart()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                          child: Card(
                            elevation: 5.0,
                            margin: EdgeInsets.zero,
                            child: Container(
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                width:
                                    MediaQuery.of(context).size.width / 4 - 10,
                                height: 150,
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
          flex: 1,
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        )
      ],
    );
  }
}
