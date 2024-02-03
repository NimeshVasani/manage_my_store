import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IncomeOutgoingsChart extends StatefulWidget {
  const IncomeOutgoingsChart({super.key});

  @override
  State<IncomeOutgoingsChart> createState() => _IncomeOutgoingsChartState();
}

class _IncomeOutgoingsChartState extends State<IncomeOutgoingsChart> {
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
              rangePadding: ChartRangePadding.none,
            ),
            primaryYAxis: const NumericAxis(title: AxisTitle(text: 'Amount',textStyle: TextStyle(color: Colors.white))),
            series: <CartesianSeries>[
              AreaSeries<TransactionData, String>(
                dataSource:
                    selectedInterval == "Days" ? getWeekData() : getMonthData(),
                xValueMapper: (TransactionData transaction, _) =>
                    transaction.day,
                yValueMapper: (TransactionData transaction, _) =>
                    transaction.income,
                name: 'Income',
                color: Colors.green,
                animationDuration: 1000,
                animationDelay: 0,
              ),
              AreaSeries<TransactionData, String>(
                
                dataSource:
                    selectedInterval == "Days" ? getWeekData() : getMonthData(),
                xValueMapper: (TransactionData transaction, _) =>
                    transaction.day,
                yValueMapper: (TransactionData transaction, _) =>
                    transaction.outgoings,

                name: 'Outgoings',
                color: Colors.red,
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
  final String day;
  final double income;
  final double outgoings;

  TransactionData(this.day, this.income, this.outgoings);
}
