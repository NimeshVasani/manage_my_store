import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:manage_my_store/web/ui/widgets/dashboard_slider_widgets/other_widgets/rating_bar.dart';

class CustomerReviews extends StatefulWidget {
  final double height;

  const CustomerReviews({super.key, required this.height});

  @override
  State<CustomerReviews> createState() => _CustomerReviewsState();
}

class _CustomerReviewsState extends State<CustomerReviews> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.zero,
      child: Container(
        decoration:  BoxDecoration(color: Colors.white,                  borderRadius: BorderRadius.circular(10.0)
        ),
        height: widget.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AutoSizeText(
                "Customer Reviews",
                style: TextStyle(fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  RatingBarIndicator(
                    rating: 4.2,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.blue.shade300,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const AutoSizeText(
                    "4.2 ",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const AutoSizeText(
                    "out of 5",
                    style: TextStyle(color: Colors.black38),
                  ),
                ],
              ),
              const AutoSizeText(
                "A total of 1,000 reviews",
                style: TextStyle(color: Colors.black38, fontSize: 10),
              ),
              const RatingProgressBar(stars: 5, percent: 38),
              const RatingProgressBar(stars: 4, percent: 24),
              const RatingProgressBar(stars: 3, percent: 16),
              const RatingProgressBar(stars: 2, percent: 12),
              const RatingProgressBar(stars: 1, percent: 10),
            ],
          ),
        ),
      ),
    );
  }
}
