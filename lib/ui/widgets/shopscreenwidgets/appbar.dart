import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

SliverAppBar appBar() {
  return SliverAppBar(
      backgroundColor: const Color(0xFF003300),
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
                padding: EdgeInsets.only(bottom: 20.0,left: 15.0),
                child: Text('Find your best item',style: TextStyle(fontWeight: FontWeight.w600),),
              ),
              Container(
                height: 40,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0))
                ),
                child:   const Center(
                  child: SizedBox(width:50,child: Divider(thickness: 3,color: Colors.black38,)),
                ),
              )
            ],
          ),
          centerTitle: false,
          titlePadding: EdgeInsets.zero,
          expandedTitleScale: 1,
          background:  Container(
            decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF003300), Color(0xFF336600)], // Add your desired colors
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.0,bottom: 8.0,top: 8.0),
                        child: Text(
                          'We have something for you',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0,top: 8.0,bottom: 8.0),
                        child: Icon(
                          Icons.notifications_on_outlined,
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
                      autoplay: true,
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
                                'assets/images/offer_${index+1}.png', fit: BoxFit.fill),
                          ),
                        );
                      },
                      viewportFraction: 0.6,
                      scale: 0.6 ,
                      itemCount: 3,
                      index: 1,
                      loop: true,

                    ),
                  )
                ]),
          )),
      snap: false,
      pinned: true,
      floating: false);
}
