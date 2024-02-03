import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RevenueProfitsChart extends StatefulWidget {
  const RevenueProfitsChart({Key? key}) : super(key: key);

  @override
  State<RevenueProfitsChart> createState() => _RevenueProfitsChartState();
}

class _RevenueProfitsChartState extends State<RevenueProfitsChart> {
  String selectedInterval = 'Days'; // Default selection

  List<String> intervalOptions = ['Days', 'Months', 'Years'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            const Text(
              'Revenue',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Profits',
              style: TextStyle(color: Colors.orange, fontSize: 16),
            ),
            const Spacer(),
            DropdownButton<String>(
              value: selectedInterval,
              items: intervalOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedInterval = newValue!;
                });
              },
            ),
          ],
        ),
        Expanded(
          child: SfCartesianChart(
            margin: EdgeInsets.zero,
            primaryXAxis: const CategoryAxis(
              title: AxisTitle(text: 'Revenue vs Profit'),
            ),
            primaryYAxis: const NumericAxis(title: AxisTitle(text: 'Amount')),
            series: <CartesianSeries>[
              ColumnSeries<TransactionData, String>(
                dataSource:
                    selectedInterval == "Days" ? getWeekData() : getMonthData(),
                xValueMapper: (TransactionData transaction, _) =>
                    transaction.time,
                yValueMapper: (TransactionData transaction, _) =>
                    transaction.revenue,
                name: 'Revenue',
                color: Colors.blue,
                animationDuration: 1000,
                animationDelay: 0,
              ),
              ColumnSeries<TransactionData, String>(
                dataSource:
                selectedInterval == "Days" ? getWeekData() : getMonthData(),
                xValueMapper: (TransactionData transaction, _) =>
                    transaction.time,
                yValueMapper: (TransactionData transaction, _) =>
                    transaction.profits,
                name: 'Profits',
                color: Colors.orange,
                animationDuration: 1000,
                animationDelay: 0,
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<TransactionData> getWeekData() {
    return [
      TransactionData('Mon', 150.0, 80.0),
      TransactionData('Tue', 200.0, 120.0),
      TransactionData('Wed', 100.0, 50.0),
      TransactionData('Thu', 180.0, 90.0),
      TransactionData('Fri', 250.0, 150.0),
      TransactionData('Sat', 120.0, 80.0),
      TransactionData('Sun', 90.0, 60.0),
    ];
  }

  List<TransactionData> getMonthData() {
    return [
      TransactionData('Jan', 100.0, 80.0),
      TransactionData('Feb', 100.0, 120.0),
      TransactionData('Mar', 300.0, 50.0),
      TransactionData('Apr', 580.0, 90.0),
      TransactionData('May', 550.0, 150.0),
      TransactionData('Jun', 220.0, 80.0),
      TransactionData('Jul', 100.0, 60.0),
    ];
  }
}

class TransactionData {
  final String time;
  final double revenue;
  final double profits;

  TransactionData(this.time, this.revenue, this.profits);
}
