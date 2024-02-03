import 'package:flutter/material.dart';
import 'package:manage_my_store/web/ui/widgets/dashboardsliderwidgets/incomeoutgoingchart.dart';
import 'package:manage_my_store/web/ui/widgets/dashboardsliderwidgets/revenueprofitschart.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 2.0,
          surfaceTintColor: Colors.transparent,
          color: Colors.black87,
          margin: EdgeInsets.zero,
          child: Row(
            children: [
              SizedBox(width: 400, height: 400, child: RevenueProfitsChart()),
            ],
          ),
        ),
        SizedBox(height: 50,),
        Card(
          elevation: 2.0,
          surfaceTintColor: Colors.transparent,
          color: Colors.black87,
          margin: EdgeInsets.zero,
          child: Row(
            children: [
              SizedBox(width: 400, height: 400, child: IncomeOutgoingsChart()),
            ],
          ),
        ),
      ],
    );
  }
}
