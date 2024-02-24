import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EarningByItemTypesChart extends StatefulWidget {
  const EarningByItemTypesChart({super.key});

  @override
  State<EarningByItemTypesChart> createState() => _EarningByItemTypesChartState();
}

class _EarningByItemTypesChartState extends State<EarningByItemTypesChart> {
  @override
  Widget build(BuildContext context) {
    List<SalesData> earningData = getEarningData();

    return SfCircularChart(
      legend: const Legend(
        isVisible: true,
        itemPadding: 5,
        alignment: ChartAlignment.center,
        position: LegendPosition.right,
        textStyle: TextStyle(fontSize: 14),
      ),
      title: const ChartTitle(text: 'Earning by Item Type',textStyle: TextStyle(),alignment: ChartAlignment.near),

      series: <CircularSeries>[
        PieSeries<SalesData, String>(

          radius: '100%',
          dataSource: earningData,
          xValueMapper: (SalesData sales, _) => sales.item,
          yValueMapper: (SalesData sales, _) => sales.amount,
          dataLabelSettings: const DataLabelSettings(
            margin: EdgeInsets.zero,
            isVisible: true,
            labelPosition: ChartDataLabelPosition.inside,
          ),
          animationDuration: 0,
          animationDelay: 0,
        ),
      ],
    );
  }

  List<SalesData> getEarningData() {
    return [
      SalesData('Produce', 500),
      SalesData('Dairy', 300),
      SalesData('Bakery', 120),
      SalesData('Frozen', 300),
    ];
  }
}

class SalesData {
  final String item;
  final double amount;

  SalesData(this.item, this.amount);
}