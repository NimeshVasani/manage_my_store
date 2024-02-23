import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TopSellingItemsDonutChart extends StatefulWidget {
  const TopSellingItemsDonutChart({super.key});

  @override
  State<TopSellingItemsDonutChart> createState() =>
      _TopSellingItemsDonutChartState();
}

class _TopSellingItemsDonutChartState extends State<TopSellingItemsDonutChart> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SfCircularChart(
          legend: const Legend(
            isVisible: true,
            position: LegendPosition.right,
            itemPadding: 5.0,
            orientation: LegendItemOrientation.vertical,
            textStyle:
                TextStyle(fontSize: 14,color: Colors.black,overflow: TextOverflow.ellipsis),
          ),
          title: const ChartTitle(text: 'Top 5 Product (quantity)',textStyle: TextStyle(),alignment: ChartAlignment.near),
          series: <DoughnutSeries>[
            DoughnutSeries<SalesData, String>(
              radius: '95%',
              dataSource: getTopSellingItemsData(),
              xValueMapper: (SalesData sales, _) => sales.item,
              yValueMapper: (SalesData sales, _) => sales.amount,
              animationDelay: 0,
              animationDuration: 0,
              innerRadius: '65%',
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                labelPosition:
                    ChartDataLabelPosition.inside, // Show data labels inside
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<SalesData> getTopSellingItemsData() {
    return [
      SalesData('Milk', 2500),
      SalesData('Ice Cream', 1800),
      SalesData('Indian Snacks', 1500),
      SalesData('Donuts', 1200),
      SalesData('Soft Drinks', 1000),
      // Add more items as needed
    ];
  }
}

class SalesData {
  final String item;
  final double amount;

  SalesData(this.item, this.amount);
}
