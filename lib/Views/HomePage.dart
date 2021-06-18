
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 230,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add_alert,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  backgroundColor:
                                  Colors.green[200]!.withOpacity(.3),
                                  content: Container(
                                    width: 10, height: 100,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0, top: 10, left: 10),
                                          child: Container(
                                            child: Text(
                                              "Save",
                                              style: TextStyle(
                                                  color: Colors.white60,
                                                  fontWeight: FontWeight.bold),
                                              textScaleFactor: 1.0,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0, top: 10, left: 10),
                                          child: Container(
                                            child: Text(
                                              "Share",
                                              style: TextStyle(
                                                  color: Colors.white60,
                                                  fontWeight: FontWeight.bold),
                                              textScaleFactor: 1.0,
                                            ),
                                            // height: 20,
                                          ),
                                        ),
                                        // Container(height: 1,color: Colors.grey,),
                                      ],
                                    ),
                                  ));
                            });
                      },
                    ),
                    Container(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            'assets/images/avathar.png',
                          ),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        "Available balance",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Text(
                        "\$1550.00",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Stack(children: <Widget>[
                  // Center(child: Image.asset("assets/images/view.png",alignment: Alignment.center,)),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      "assets/images/view.png",
                      alignment: Alignment.center,
                    ),
                  ),
                ]),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Drage down to see more",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Colors.white60,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
            child: Text(
              "News Feed",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),

          Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),),
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.all(20),
                        height: 230,
                        decoration: new BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.0)),
                            shape: BoxShape.rectangle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/images/news.png")))),
                    Positioned(
                      top: 30.0,
                      left: 240.0,
                      right: 30.0,
                      child: Card(
                        elevation: 20.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                              child: Text(
                                "JUNE",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text(
                        "Third Edition of the 60FT Dhow ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                      child: Text("Dalma Race",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 30),
                      child: Container(width: 300,
                        child: Text("Under the patronage of His Highness Sheikh Hamdan Bin Zayed Al Nahyan, Ruler's...More",
                          maxLines: 2,
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(padding: EdgeInsets.fromLTRB(15, 0,5, 0),
                        icon: new Image.asset('assets/images/heart.png',width: 25,),
                        tooltip: 'message', onPressed: () {  },
                      ),
                      Text(
                        "20",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      IconButton(padding: EdgeInsets.fromLTRB(20, 0, 5, 0),
                        icon: new Image.asset('assets/images/message.png',width: 25,),
                        tooltip: 'message', onPressed: () {  },
                      ),
                      Text(
                        "20",
                        style: TextStyle(fontSize: 15, color: Colors.black,),
                      ),
                      IconButton(padding: EdgeInsets.fromLTRB(15, 0, 5, 0),
                        icon: new Image.asset('assets/images/share.png',width: 25,),
                        tooltip: 'share', onPressed: () {  },
                      ),
                      Text(
                        "20",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      IconButton(iconSize: 25,padding: EdgeInsets.fromLTRB(70, 0,0, 0),
                        icon:Icon(  Icons.web_asset_rounded),
                        tooltip: 'message', onPressed: () {  },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            elevation: 20,
          ),

          Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 250, 20),
                    child: Stack(children: <Widget>[Image.asset("assets/images/user.png")],),
                  ),
                  Row(
                    children: [
                      Text(
                        "Request for your first license ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("License is necessary to join the events",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,),
                      ),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black, // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () { },
                          child: Text('Requset Now'),
                        ),
                        SizedBox(width: 120,),
                        Expanded(
                          child:
                          Column(
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                ),
                                onPressed: () { },
                                child: Text('Later',),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(1),
                              //   child: Divider(
                              //       color: Colors.black
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            elevation: 20,
          ),

          Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),),
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.all(20),
                        height: 230,
                        decoration: new BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.0)),
                            shape: BoxShape.rectangle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/images/sea.png")))),
                    Positioned(
                      top: 20.0,
                      left: 240.0,
                      right: 20.0,
                      child:  IconButton(iconSize: 60,
                        icon:Icon(  Icons.play_circle_fill),
                        tooltip: 'message', onPressed: () {  },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                      child: Container(width: 300,
                        child: Text(
                          "Third Edition of the 60FT Dhow Dalma Race ", maxLines: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 30),
                      child: Container(width: 300,
                        child: Text("Under the patronage of His Highness Sheikh Hamdan Bin Zayed Al Nahyan, Ruler's...More",
                          maxLines: 2,
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(padding: EdgeInsets.fromLTRB(15, 0,5, 0),
                        icon: new Image.asset('assets/images/heart.png',width: 25,),
                        tooltip: 'message', onPressed: () {  },
                      ),
                      Text(
                        "20",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      IconButton(padding: EdgeInsets.fromLTRB(20, 0, 5, 0),
                        icon: new Image.asset('assets/images/message.png',width: 25,),
                        tooltip: 'message', onPressed: () {  },
                      ),
                      Text(
                        "20",
                        style: TextStyle(fontSize: 15, color: Colors.black,),
                      ),
                      IconButton(padding: EdgeInsets.fromLTRB(15, 0, 5, 0),
                        icon: new Image.asset('assets/images/share.png',width: 25,),
                        tooltip: 'share', onPressed: () {  },
                      ),
                      Text(
                        "20",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      IconButton(iconSize: 25,padding: EdgeInsets.fromLTRB(70, 0,0, 0),
                        icon:Icon(  Icons.web_asset_rounded),
                        tooltip: 'message', onPressed: () {  },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            elevation: 20,
          ),
        ],
      ),
    );
  }

}


 class Textwid extends StatefulWidget {
   const Textwid({
     Key? key,
   }) : super(key: key);

   @override
   _TextwidState createState() => _TextwidState();
 }

 class _TextwidState extends State<Textwid> {
   @override
   Widget build(BuildContext context) {
     return TextField(onChanged:(String str){
       // setState(() {
       //   name=str;
       // });
     },
         // style: style,
         decoration: InputDecoration(
             contentPadding:
             EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
             hintText: "User name",
             border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(32.0))));
   }
 }