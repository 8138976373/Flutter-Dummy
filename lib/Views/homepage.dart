import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dummy/Widget/Avathar.dart';
import 'package:dummy/Widget/CustPadding.dart';
import 'package:dummy/Widget/CustomBgImageContainer.dart';
import 'package:dummy/Widget/CustomCard.dart';
import 'package:dummy/Widget/CustomContainer.dart';
import 'package:dummy/Widget/CustomText.dart';
import 'package:dummy/Widget/hideContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController? _hideScrollController;
  bool? _isVisible = false;

  @override
  void initState() {
    super.initState();
    _isVisible = true;
    _hideScrollController = new ScrollController();
    _hideScrollController!.addListener(() {
      if (_hideScrollController!.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
          print("**** $_isVisible up");
        });
      }
      if (_hideScrollController!.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
          print("**** $_isVisible down");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double iconSize = 15;

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _isVisible!
            ? floatingActionButton()
            : HideContainer(isVisible: _isVisible),
        bottomNavigationBar:
            BottomAppBarView(isVisible: _isVisible, iconSize: iconSize),
        backgroundColor: Colors.white,
        body: ListView(controller: _hideScrollController, children: <Widget>[
          firstView(),
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
          secondView("assets/images/news.png"),
          thirdView("assets/images/avatharg.png"),
          firthView("assets/images/sea.png"),
          fitfhView("assets/images/images.png"),
          sixthView(context, screenWidth)
        ]));
  }



  CustomCard sixthView(BuildContext context, double screenWidth) {
    return CustomCard(
      padding: 10,
      child: Column(
        children: <Widget>[
          CustomContainerWithBgImage(
            height: 220,
            // width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "assets/images/imagesga.png",
                    fit: BoxFit.cover,
                    width: screenWidth / 2 - 30,
                  ),
                  Column(
                    children: [
                      CustomContainerWithBgImage(
                          image: "assets/images/imagesc.png",
                          width: screenWidth / 2 - 10,
                          height: 100),
                      CustomContainerWithBgImage(
                        image: "assets/images/imagesgb.png",
                        // fit: BoxFit.cover,
                        width: screenWidth / 2 - 10,
                        height: 100,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          CustomText(
              padding: 20,
              text: "Third Edition of the 60FT Dhow \nDalma Race",
              size: 20,
              maxLines: 2,
              fontWeight: FontWeight.bold),
          CustomText(
              padding: 20,
              text: "Under the patronage of His Highness Sheikh \nHamdan Bin Zayed Al Nahyan, Ruler's...More",
              textColor: Colors.grey,
              maxLines: 2,
              size: 15),
          newsBottomView(),
        ],
      ),
    );
  }

  CustomContainerWithBgImage fitfhView(String image) {
    return CustomContainerWithBgImage(
      height: 350,
      image: image,
      margin: 10,
    );
  }

  CustomCard firthView(String image) {
    return newsView(
      image,
      IconButton(
        iconSize: 60,
        icon: Icon(
          Icons.play_circle_fill,
          color: Colors.black,
        ),
        tooltip: 'message',
        onPressed: () {},
      ),
    );
  }

  CustomCard thirdView(String image) {
    return CustomCard(
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
                    image,
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
                                MaterialStateProperty.all<Color>(Colors.black),
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
    );
  }

  CustomCard secondView(String image) {
    return newsView(
      image,
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
    );
  }

  CustomContainer firstView() {
    return CustomContainer(
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
              Stack(
                children:[
                  Avathar(
                  paddingLeft: 5,
                  radius: 30,
                  bgimage: 'assets/images/avathar.png',
                ),
                  Positioned( left:45.0,right: 2,
                    child:    Image.asset(
                        'assets/images/circle.png',
                      ),
                  ),
                ]
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
    );
  }

  FloatingActionButton floatingActionButton() {
    return FloatingActionButton(
      child: Image.asset(
        'assets/images/flotting.png',
        width: 25,
        height: _isVisible! ? 25.0 : 0.0,
      ),
      backgroundColor: _isVisible! ? Colors.orange[700] : Colors.transparent,
      onPressed: () {},
    );
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

          CustomText(
              padding: 20,
              text: "Third Edition of the 60FT Dhow \nDalma Race",
              size: 20,
              maxLines: 2,
              fontWeight: FontWeight.bold),
          CustomText(
              paddingLeft: 20,paddingRight: 20,
              text: "Under the patronage of His Highness Sheikh \nHamdan Bin Zayed Al Nahyan, Ruler's...More",
              textColor: Colors.grey,
              maxLines: 2,
              size: 15),

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

class BottomAppBarView extends StatelessWidget {
  BottomAppBarView({
    Key? key,
    required bool? isVisible,
    required this.iconSize,
  })  : _isVisible = isVisible,
        super(key: key);

  final bool? _isVisible;
  final double iconSize;
  double width = 25;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container( margin: EdgeInsets.only(left: 16, right: 16),
          height: _isVisible! ? 60.0 : 0.0,
          child: _isVisible!
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: new Image.asset(
                        'assets/images/homed.png',width: width,
                      ),
                      iconSize: iconSize,
                      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                      onPressed: () {
                        HomePage();
                      },
                    ),
                    IconButton(
                      icon: new Image.asset(
                        'assets/images/likes.png',width: width,
                      ),
                      iconSize: iconSize,
                      padding: EdgeInsets.fromLTRB(0, 5, 20, 5),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: new Image.asset(
                        'assets/images/calender.png',width: width,
                      ),
                      iconSize: iconSize,
                      padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: new Image.asset(
                        'assets/images/aaaa.png',width: width,
                      ),
                      iconSize: iconSize,
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      onPressed: () {},
                    ),
                  ],
                )
              : HideContainer(isVisible: _isVisible),
        ));
  }
}
