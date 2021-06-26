import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dummy/Widget/Avathar.dart';
import 'package:dummy/Widget/CustPadding.dart';
import 'package:dummy/Widget/CustomBgImageContainer.dart';
import 'package:dummy/Widget/CustomCard.dart';
import 'package:dummy/Widget/CustomContainer.dart';
import 'package:dummy/Widget/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  // final autoSizeGroup = AutoSizeGroup();


  var _bottomNavIndex = 0;
  final iconList = <IconData>[
    Icons.brightness_5,
    Icons.brightness_4,
    Icons.brightness_4,
    Icons.calendar_today_outlined,
  ];


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
        // bottomNavigationBar: AnimatedBottomNavigationBar.builder(backgroundColor: Colors.black,
        //     itemCount:4 ,
        //     tabBuilder:  (int index, bool isActive) {
        //       final color = isActive ? Colors.grey : Colors.white;
        //       return Column(
        //         mainAxisSize: MainAxisSize.min,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           // Icon(
        //           //   alignment: Alignment.centerRight,
        //           //   iconSize: 25,
        //           //   icon: new Image.asset(
        //           //     'assets/images/bell.png',
        //           //     width: 25,
        //           //   ),
        //           //   tooltip: 'message',
        //           //   onPressed: () {},
        //           // ),
        //           Icon(
        //             iconList[index],
        //             size: 24,
        //             color: color,
        //           ),
        //           // const SizedBox(height: 4),
        //           // Padding(
        //           //   padding: const EdgeInsets.symmetric(horizontal: 8),
        //           //   child: AutoSizeText(
        //           //     "brightness $index",
        //           //     maxLines: 1,
        //           //     style: TextStyle(color: color),
        //           //     // group: AutoSizeGroup(),
        //           //   ),
        //           // )
        //         ],
        //       );
        //     },
        //   onTap: (int ) {  },
        //   activeIndex: _bottomNavIndex,
        //
        //   // onTap: (index) => setState(() => _bottomNavIndex = index)
        //     ),

        backgroundColor: Colors.white,
        body: ListView(children: <Widget>[

          CustomContainer(
            paddingLeft: 20,
            paddingTop: 40,
            paddingRight: 20,
            paddingBottom: 20,
            backgroundColor: Colors.black,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      alignment: Alignment.centerRight,
                      iconSize: 25,
                      icon: new Image.asset(
                        'assets/images/bell.png',
                        width: 25,
                      ),
                      tooltip: 'message',
                      onPressed: () {},
                    ),
                    Avathar(
                      paddingLeft: 5,
                      radius: 30,
                      bgimage: 'assets/images/avathar.png',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        CustomText(
                          text: "Available balance",
                          textColor: Colors.white,
                          size: 14,
                        ),
                        CustomText(
                          text: "\$1550.00",
                          textColor: Colors.white,
                          size: 25,
                          paddingTop: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
                CustPadding(
                  top: 56,
                  left: 5,
                  right: 5,
                  bottom: 25,
                  child: Image.asset(
                    "assets/images/view.png",
                    alignment: Alignment.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Drage down to see more",
                      size: 15,
                      textColor: Colors.white,
                      alignment: MainAxisAlignment.center,
                    ),
                    IconButton(
                      splashRadius: 2,
                      icon: Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Colors.white60,
                        size: 25,
                      ),
                      onPressed: () {
                        print("Clicked");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustPadding(
            padding: 8,
            child: Image.asset(
              "assets/images/line.png",
              alignment: Alignment.center,
            ),
          ),
          CustomText(
            text: "News Feed",
            size: 25,
            padding: 20,
            fontWeight: FontWeight.bold,
          ),
          newsView(
            "assets/images/news.png",
            CustomCard(
                elevation: 20.0,
                radius: 10,
                child: Column(
                  children: <Widget>[
                    CustomText(
                      paddingTop: 10,
                      text: "25",
                      size: 20,
                      fontWeight: FontWeight.bold,
                      alignment: MainAxisAlignment.center,
                    ),
                    CustomText(
                      paddingBottom: 10,
                      text: "JUNE",
                      size: 20,
                      fontWeight: FontWeight.w500,
                      alignment: MainAxisAlignment.center,
                    ),
                  ],
                ),
              ),
          ),
          CustomCard(
            margin: 10,
            child: CustPadding(
              padding: 20,
              child: Column(
                children: <Widget>[
                  CustPadding(
                    // mainAxisAlignment:MainAxisAlignment.start,
                    bottom: 20,
                    right: 220,
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/avatharg.png",
                          width: 70,
                        )
                      ],
                    ),
                  ),
                  CustomText(
                      text: "Request for your first license ",
                      size: 20,
                      fontWeight: FontWeight.bold),
                  CustomText(
                      text: "License is necessary to join the events",
                      size: 15,
                      textColor: Colors.grey,
                      fontWeight: FontWeight.bold),
                  CustPadding(
                    top: 20,
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black, // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {},
                          child: Text('Requset Now'),
                        ),
                        SizedBox(
                          width: 120,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Later',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          newsView(
            "assets/images/sea.png",
            IconButton(
              iconSize: 60,
              icon: Icon(
                Icons.play_circle_fill,
                color: Colors.black,
              ),
              tooltip: 'message',
              onPressed: () {},
            ),
          ),

          CustomContainerWithBgImage(
            height: 350,
            image: "assets/images/images.png",
            margin: 10,
          ),

          CustomCard(
            padding: 10,
            child: Column(
              children: <Widget>[
                CustomContainerWithBgImage(
                  height: 220,
                  // width: MediaQuery.of(context).size.width,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/imagesga.png", fit: BoxFit.cover,
                      ),
                      Column(
                        children: [
                          // Image.asset("assets/images/imagesga.png",alignment:Alignment.centerLeft ,) ,
                          CustomContainerWithBgImage(
                              image: "assets/images/imagesc.png",
                              width: MediaQuery.of(context).size.width / 2 - 7,fit: BoxFit.cover,
                              height:110
                          ),

                          CustomContainerWithBgImage(
                            image: "assets/images/imagesgb.png",fit: BoxFit.cover,
                            width: screenWidth / 2 - 10,
                            height: screenWidth/ 3 - 10,
                            // height: MediaQuery.removePadding(context: context, removeBottom: true,)
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CustPadding(
                  padding: 20,
                  child: Text(
                    "Third Edition of the 60FT Dhow Dalma Race",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                CustPadding(
                  left: 20,
                  right: 20,
                  child: Text(
                    "Under the patronage of His Highness Sheikh Hamdan Bin Zayed Al Nahyan, Ruler's...More",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
                newsBottomView(),
              ],
            ),
          )
        ]));
  }

  CustomCard newsView(String image, Widget child) {
    return CustomCard(
      padding: 10,
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              CustomContainerWithBgImage(
                margin: 15,
                height: 230,
                radius: 10,
                fit: BoxFit.fill,
                // boxShape: BoxShape.circle,
                image: image,
              ),
              Positioned(top: 30.0, left: 240.0, right: 30.0, child: child),
            ],
          ),
          CustPadding(
            padding: 20,
            child: Text(
              "Third Edition of the 60FT Dhow Dalma Race",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          CustPadding(
            left: 20,
            right: 20,
            child: Text(
              "Under the patronage of His Highness Sheikh Hamdan Bin Zayed Al Nahyan, Ruler's...More",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ),
          newsBottomView(),
        ],
      ),
    );
  }

  CustPadding newsBottomView() {
    EdgeInsetsGeometry padding = EdgeInsets.fromLTRB(20, 0, 5, 0);
    double splashRadius = 25;
    double iconSize = 25;

    return CustPadding(
      padding: 8,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            splashRadius: splashRadius,
            padding: padding,
            icon: new Image.asset(
              'assets/images/likes.png',
            ),
            iconSize: iconSize,
            tooltip: 'message',
            onPressed: () {},
          ),
          CustomText(
            text: "20",
            size: 15,
          ),
          IconButton(
            splashRadius: splashRadius,
            iconSize: iconSize,
            padding: padding,
            icon: new Image.asset(
              'assets/images/message.png',
            ),
            tooltip: 'message',
            onPressed: () {},
          ),
          CustomText(
            text: "20",
            size: 15,
          ),
          IconButton(
            splashRadius: splashRadius,
            iconSize: iconSize,
            padding: padding,
            icon: new Image.asset(
              'assets/images/share.png',
              width: 25,
            ),
            tooltip: 'share',
            onPressed: () {},
          ),
          CustomText(
            text: "20",
            size: 15,
          ),
          IconButton(
            iconSize: 20,
            splashRadius: splashRadius,
            padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
            icon: new Image.asset(
              'assets/images/save.png',
            ),
            tooltip: 'message',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
