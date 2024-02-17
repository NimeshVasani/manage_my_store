import 'package:flutter/material.dart';
import 'package:manage_my_store/mobile/ui/widgets/customtext.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Card(
                elevation: 2.0,
                surfaceTintColor: Colors.transparent,
                color: Colors.black87,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                          width: 300, height: 300, child: RevenueProfitsChart()),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, left: 20.0, right: 20.0),
                          child: customTextView(
                              "When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones.,When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones.,When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones.,When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones",
                              16,
                              FontWeight.normal,
                              Colors.blue,
                              10,
                              textAlign: TextAlign.justify),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20.0,),
            Expanded(
              flex: 1,
              child: Card(
                elevation: 2.0,
                surfaceTintColor: Colors.transparent,
                color: Colors.black87,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(
                          width: 300, height: 300, child: IncomeOutgoingsChart()),
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                          child: customTextView(
                              "When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones.,When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones.,When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones.,When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones",
                              16,
                              FontWeight.normal,
                              Colors.blue,
                              10,
                              textAlign: TextAlign.justify),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Card(
                elevation: 2.0,
                surfaceTintColor: Colors.transparent,
                color: Colors.black87,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                          width: 300, height: 300, child: RevenueProfitsChart()),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, left: 20.0, right: 20.0),
                          child: customTextView(
                              "When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones.,When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones.,When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones.,When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones",
                              16,
                              FontWeight.normal,
                              Colors.blue,
                              10,
                              textAlign: TextAlign.justify),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20.0,),
            Expanded(
              flex: 1,
              child: Card(
                elevation: 2.0,
                surfaceTintColor: Colors.transparent,
                color: Colors.black87,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(
                          width: 300, height: 300, child: IncomeOutgoingsChart()),
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                          child: customTextView(
                              "When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones.,When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones.,When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones.,When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones",
                              16,
                              FontWeight.normal,
                              Colors.blue,
                              10,
                              textAlign: TextAlign.justify),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Card(
                elevation: 2.0,
                surfaceTintColor: Colors.transparent,
                color: Colors.black87,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                          width: 300, height: 300, child: RevenueProfitsChart()),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, left: 20.0, right: 20.0),
                          child: customTextView(
                              "When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones.,When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones.,When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones.,When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones",
                              16,
                              FontWeight.normal,
                              Colors.blue,
                              10,
                              textAlign: TextAlign.justify),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20.0,),
            Expanded(
              flex: 1,
              child: Card(
                elevation: 2.0,
                surfaceTintColor: Colors.transparent,
                color: Colors.black87,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(
                          width: 300, height: 300, child: IncomeOutgoingsChart()),
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                          child: customTextView(
                              "When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones.,When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones.,When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones.,When a price pattern signals a change in trend direction, it is known as a reversal pattern; a continuation pattern occurs when the trend continues in its existing direction following a brief pause. There are many patterns used by traders—here is how patterns are made and some of the most popular ones",
                              16,
                              FontWeight.normal,
                              Colors.blue,
                              10,
                              textAlign: TextAlign.justify),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
