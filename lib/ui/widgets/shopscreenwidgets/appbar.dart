import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

SliverAppBar appBar() {
  return SliverAppBar(
      backgroundColor: Colors.green,
      surfaceTintColor: Colors.transparent,
      // Set this height
      expandedHeight: 300,
      collapsedHeight: 90,
      clipBehavior: Clip.hardEdge,
      automaticallyImplyLeading: false,
      primary: false,
      flexibleSpace: FlexibleSpaceBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Find your best item',style: TextStyle(fontWeight: FontWeight.w600),),
              ),
              Container(
                height: 40,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0))),
              )
            ],
          ),
          centerTitle: false,
          titlePadding: EdgeInsets.zero,
          expandedTitleScale: 1,
          background:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Offers waiting for you',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.notifications_on_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.access_time_rounded,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 170,
                  width: double.infinity,
                  child: Swiper(
                    itemBuilder:
                        (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Card(
                          elevation: 5.0,
                          // Set the elevation value according to your preference
                          clipBehavior: Clip.hardEdge,
                          margin: EdgeInsets.zero,
                          color: Colors.transparent,
                          surfaceTintColor: Colors.transparent,
                          child: Image.asset(
                              'assets/images/login_img.png', fit: BoxFit.fill),
                        ),
                      );
                    },
                    viewportFraction: 0.5,
                    scale: 0.6 ,
                    itemCount: 3,
                    index: 1,
                    loop: true,

                  ),
                )
              ])),
      snap: false,
      pinned: true,
      floating: false);
}
