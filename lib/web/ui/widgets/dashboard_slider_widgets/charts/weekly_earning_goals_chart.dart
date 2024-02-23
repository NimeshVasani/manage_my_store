import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeeklyGoalsChart extends StatelessWidget {
  const WeeklyGoalsChart({super.key});

  @override
  Widget build(BuildContext context) {
    List<SalesData> weeklyGoalData = getWeeklyGoalData();
    double totalEarnings = weeklyGoalData[0].amount + weeklyGoalData[1].amount;
    double achievedPercentage =
        (weeklyGoalData[0].amount / totalEarnings) * 100;

    return Stack(children: [
      SfCircularChart(
        legend: Legend(
            isVisible: true,
            legendItemBuilder:
                (String name, dynamic series, dynamic point, int index) {
              // Customize the legend items
              if (index == 0) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You have reached",
                      maxLines: 1,
                    ),
                    Text(
                      "${achievedPercentage.toStringAsFixed(2)}%",
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.green.shade900,
                          fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "Hurry up, You \nneed more..",
                      maxLines: 2,
                    ),
                    Text(
                      "${(100 - achievedPercentage).toStringAsFixed(2)}%",
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.red.shade900,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                );
              } else {
                return const SizedBox(
                  height: 2,
                  width: 2,
                );
              }
            }),
        title: const ChartTitle(
            text: ' Your weekly goal',
            textStyle: TextStyle(),
            alignment: ChartAlignment.near),
        series: <DoughnutSeries>[
          DoughnutSeries<SalesData, String>(
            dataSource: weeklyGoalData,
            xValueMapper: (SalesData sales, _) => sales.item,
            yValueMapper: (SalesData sales, _) => sales.amount,
            pointColorMapper: (SalesData sales, _) {
              // Highlight the achieved part in green, and remaining in grey
              return sales.item == 'Reached'
                  ? Colors.green
                  : Colors.grey.shade300;
            },
            animationDelay: 0,
            animationDuration: 0,
            innerRadius: '65%',
            radius: '95%',
          ),
        ],
      ),
      Positioned(
        top: 30,
        bottom: 0,
        left: -150,
        right: 0,
        child: Center(
          child: Text(
            "${achievedPercentage.toStringAsFixed(0)}%",
            style: const TextStyle(
                fontSize: 16, color: Colors.green, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    ]);
  }

  List<SalesData> getWeeklyGoalData() {
    return [
      SalesData('Reached', 2000), // Assume user reached $1500
      SalesData('Remaining', 1000), // Remaining goal to reach $3000
    ];
  }
}

class SalesData {
  final String item;
  final double amount;

  SalesData(this.item, this.amount);
}
