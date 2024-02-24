import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

class CurrentDataList extends StatefulWidget {

  const CurrentDataList({super.key});

  @override
  State<CurrentDataList> createState() => _CurrentDataListState();
}

class _CurrentDataListState extends State<CurrentDataList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 2.0,
              child: Container(
                width: (PlatformDispatcher.instance.displays.first.size.width-320 )/5,
                clipBehavior: Clip.hardEdge,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.store,
                        color: Colors.green.shade900,
                        size: 20,
                      ),
                      const Text(
                        "Total Sales",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const Text(
                        "\$90,000",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Icon(
                        Icons.upload_sharp,
                        color: Colors.green.shade900,
                        size: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
