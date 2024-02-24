import 'package:flutter/material.dart';

class RatingProgressBar extends StatelessWidget {
  final double stars;
  final int percent;

  const RatingProgressBar({super.key, required this.stars, required this.percent});

  @override
  Widget build(BuildContext context) {
    return  Row(
        children: [
          Text('$stars stars',style: const TextStyle(color: Colors.grey),),
          const SizedBox(width: 8),
          Expanded(
            child: LinearProgressIndicator(
              value: percent / 100,
              backgroundColor: Colors.black12,
              valueColor:  const AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ),
          const SizedBox(width: 8),
          Text('$percent%',style: const TextStyle(color: Colors.grey),),
        ],

    );
  }
}