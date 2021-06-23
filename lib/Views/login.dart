import 'package:dummy/Views/HomePage.dart';
import 'package:dummy/Views/Widget/CustPadding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Widget/Avathar.dart';
import 'Widget/CustomBgImageContainer.dart';

class Login extends StatefulWidget {
  @override
  __LoginState createState() => __LoginState();
}

class __LoginState extends State<Login> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String name = "", password = "";
  final phoneController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      // child: CustomContainerWithBgImage(
      //   image: "assets/images/news.png",
      //   fit: BoxFit.cover,
      //
      //   child: Column(children: <Widget>[
      //     CustPadding(
      //       padding: 36,
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           CustPadding(
      //             child:
      //                 Avathar(image: "assets/images/avathar.png", radius: 50),
      //             left: 20,
      //             right: 20,
      //             top: 40,
      //             bottom: 30,
      //           ),
      //
      //           SizedBox(
      //             height: 35.0,
      //           ),
      //
      //           Column(
      //             children: [
      //               NameField("user"),
      //
      //               SizedBox(height: 25.0),
      //
      //               PasswordField("password"),
      //             ],
      //           ),
      //
      //           SizedBox(
      //             height: 35.0,
      //           ),
      //
      //           MaterialButtonCust(context, "Login", 0xff01c78f),
      //         ],
      //       ),
      //     ),
      //   ]),
      // ),
    ));
  }

  MaterialButton MaterialButtonCust(BuildContext context, String text_string, int i) {
    return MaterialButton(
      color: Color(i),
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: () {
        if (nameController.text == "abcd" && phoneController.text == "12345") {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          });
        } else {
          final snackBar = SnackBar(
            content: Text('User name or password error!!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                Navigator.pop(context,MaterialPageRoute(builder: (context)=>HomePage()));
                // Some code to undo the change.
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        // child: Text('Show SnackBar'),
      },
      child: Text(text_string,
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }

  // TextField InputField(String s) {
  //   final inputController = TextEditingController();
  //   return TextField(
  //     controller: inputController,
  //     onSubmitted: (String str) {
  //       if (s == "name") {
  //         setState(() {
  //           name = inputController.text;
  //           print(str);
  //         });
  //       } else {
  //         setState(() {
  //           password = inputController.text;
  //         });
  //       }
  //     },
  //     // onChanged: (String str) {
  //     //   if (s=="name"){
  //     //   setState(() {
  //     //     name = inputController.text;
  //     //     print(str);
  //     //   });}
  //     //   else {
  //     //     setState(() {
  //     //     password = inputController.text;
  //     //   });}
  //     // },
  //     style: style,
  //     decoration: inputFieldDecoration(s),
  //   );
  // }

  TextField PasswordField(String s) {
    return TextField(
      controller: phoneController,
      style: style,
      decoration: inputFieldDecoration(s),
    );
  }

  TextField NameField(String s) {
    return TextField(
      controller: nameController,
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