import 'dart:developer';

import 'package:dummy/Views/HomePage.dart';
import 'package:dummy/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  __LoginState createState() => __LoginState();
}

class __LoginState extends State<Login> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
   String name ="", password="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BgImage("assets/images/news.png"),
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Avathar(),
              SizedBox(
                height: 35.0,
              ),
              Column(
                children: [
                  InputField("user"),
                  SizedBox(height: 25.0),
                  InputField("password"),
                ],
              ),
              SizedBox(
                height: 35.0,
              ),
              MaterialButtonCust(context,"Login",0xff01c78f,name,password),
            ],
          ),
        ),
      ]),
    ));
  }

  MaterialButton MaterialButtonCust(BuildContext context, String text_string, int i, String name,String password) {
    return MaterialButton(color:Color(i),
                minWidth: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (HomePage())),
                    );
                  });
                  print(name);
                  if (name == "abcd" && password == "12345") {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Avathar()),
                      );
                    });
                  }
                },
                child: Text(text_string,
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              );

  }

  BoxDecoration BgImage(String image) {
    return BoxDecoration(
        image: DecorationImage(
      image: AssetImage("assets/images/news.png"),
      fit: BoxFit.cover,
    ));
  }

  TextField InputField(String s) {
    return TextField(
      onChanged: (String str) {
        if (s=="name"){
        setState(() {
          name = str;
          print(str);
        });}
        else {
          setState(() {
          password = str;
        });}
      },
      style: style,
      decoration: inputFieldDecoration(s),
    );
  }

  InputDecoration inputFieldDecoration(String s) {
    return InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: s,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)));
  }
}

class BgImageToContainer extends StatelessWidget {
  const BgImageToContainer(
    final String image, {
    Key? key,
  }) : super(key: key);

  String get image => image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      )),
    );
  }
}

class Avathar extends StatelessWidget {
  const Avathar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 30),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 50,
        backgroundImage: AssetImage(
          "assets/images/avathar.png",
        ),
      ),
    );
  }
}
