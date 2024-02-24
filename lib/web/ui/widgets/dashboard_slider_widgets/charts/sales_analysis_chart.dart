import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesAnalysisChart extends StatefulWidget {
  const SalesAnalysisChart({Key? key}) : super(key: key);

  @override
  State<SalesAnalysisChart> createState() => _SalesAnalysisChartState();
}

class _SalesAnalysisChartState extends State<SalesAnalysisChart> {
  late int selectedMonth = DateTime.now().month;
  late int selectedYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(Colors.orange[100]!);
    color.add(Colors.orange[200]!);
    color.add(Colors.orange[300]!);
    color.add(Colors.green.shade700);
    color.add(Colors.green.shade800);
    color.add(Colors.green.shade900);

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.2);
    stops.add(0.4);
    stops.add(0.6);
    stops.add(0.8);
    stops.add(1.0);
    final LinearGradient gradientColors = LinearGradient(
      colors: color,
      stops: stops,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            const Text(
              'Sales',
              style: TextStyle(color: Colors.purple, fontSize: 16),
            ),
            const Spacer(),
            DropdownButton<int>(
              dropdownColor: Colors.black87,
              value: selectedMonth,
              items: List.generate(12, (index) {
                return DropdownMenuItem<int>(
                  value: index + 1,
                  child: Text(
                    DateTime(2000, index + 1).month.toString().padLeft(2, '0'),
                    style: const TextStyle(color: Colors.black54),
                  ),
                );
              }),
              onChanged: (int? newValue) {
                setState(() {
                  selectedMonth = newValue!;
                });
              },
            ),
            const SizedBox(width: 10),
            DropdownButton<int>(
              dropdownColor: Colors.black87,
              value: selectedYear,
              items: List.generate(5, (index) {
                return DropdownMenuItem<int>(
                  value: DateTime.now().year - index,
                  child: Text(
                    (DateTime.now().year - index).toString(),
                    style: const TextStyle(color: Colors.black54),
                  ),
                );
              }),
              onChanged: (int? newValue) {
                setState(() {
                  selectedYear = newValue!;
                });
              },
            ),
            const Spacer(),
          ],
        ),
        Expanded(
          child: SfCartesianChart(
            trackballBehavior: TrackballBehavior(
              enable: true,
              tooltipDisplayMode: TrackballDisplayMode.nearestPoint,
              activationMode: ActivationMode.singleTap,
              tooltipSettings: InteractiveTooltip(
                format:
                    'Date: point.x/${DateTime(2000, selectedMonth).month.toString().padLeft(2, '0')} \nSales: \$point.y',
                textStyle: const TextStyle(color: Colors.white),
                color: Colors.blueGrey,
                borderWidth: 1,
                borderColor: Colors.white,
              ),
            ),
            plotAreaBorderWidth: 0.0,
            margin: EdgeInsets.zero,
            primaryXAxis: const CategoryAxis(
              majorGridLines: MajorGridLines(width: 0),
              majorTickLines: MajorTickLines(size: 0, width: 0),
              axisLine: AxisLine(width: 1, color: Colors.transparent),
              labelStyle: TextStyle(color: Colors.black87),
            ),
            primaryYAxis:  NumericAxis(
              title: const AxisTitle(
                  text: 'Amount', textStyle: TextStyle(color: Colors.black)),
              axisLine: AxisLine(width: 1, color: Colors.transparent),
              majorGridLines: MajorGridLines(width: 0.5,color: Colors.grey.shade200),
              majorTickLines: const MajorTickLines(size: 0, width: 0),
              labelStyle: const TextStyle(color: Colors.black87),
              minorGridLines: const MinorGridLines(width: 0),
              minorTickLines: const MinorTickLines(size: 0),
            ),
            series: <CartesianSeries>[
              SplineAreaSeries<TransactionData, String>(
                gradient: gradientColors,
                borderWidth: 4,
                borderGradient: const LinearGradient(colors: <Color>[
                  Color.fromRGBO(220, 217, 146, 1.0),
                  Color.fromRGBO(234, 186, 11, 1.0)
                ], stops: <double>[
                  0.2,
                  0.9
                ]),
                dataSource: getSalesData(),
                xValueMapper: (TransactionData transaction, _) =>
                    transaction.day,
                yValueMapper: (TransactionData transaction, _) =>
                    transaction.sales,
                name: 'Sales',
                color: Colors.green.shade200,
                animationDuration: 0,
                animationDelay: 0,
                opacity: 0.7,
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<TransactionData> getSalesData() {
    var sales = [
      150,
      90,
      120,
      100,
      110,
      70,
      56,
      130,
      160,
      110,
      190,
      160,
      200,
      130,
      150
    ];
    List<TransactionData> data = [];
    for (int i = 2; i <= 28; i += 2) {
      data.add(TransactionData(i.toString(), sales[i ~/ 2] * 10));
    }
    return data;
  }
}

class TransactionData {
  final String day;
  final double sales;

  TransactionData(this.day, this.sales);
}
