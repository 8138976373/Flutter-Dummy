import 'package:dio/dio.dart';
import 'package:dummy/Views/homepage.dart';
import 'package:dummy/Widget/Avathar.dart';
import 'package:dummy/Widget/CustPadding.dart';
import 'package:dummy/Widget/CustomBgImageContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String name = "", password = "";
  final phoneController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: CustomContainerWithBgImage(
        height: MediaQuery.of(context).size.height,
        image: "assets/images/news.png",
        fit: BoxFit.cover,
        child: Column(children: <Widget>[
          CustPadding(
            padding: 36,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustPadding(
                  child:
                      Avathar(bgimage: "assets/images/avathar.png", radius: 50),
                  left: 20,
                  right: 20,
                  top: 40,
                  bottom: 30,
                ),
                SizedBox(
                  height: 35.0,
                ),
                Column(
                  children: [
                    NameField("user"),
                    SizedBox(height: 25.0),
                    PasswordField("password"),
                  ],
                ),
                SizedBox(
                  height: 35.0,
                ),
                LoginButton(
                  text: "Login",
                  color: Colors.black,
                  nameController: nameController,
                  phoneController: phoneController,
                ),
              ],
            ),
          ),
        ]),
      ),
    ));
  }

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
        onChanged: (String value) {},
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: s,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ));
  }

  InputDecoration inputFieldDecoration(String s) {
    return InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: s,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)));
  }
}

class LoginButton extends StatefulWidget {
  Color? color;
  String? text;
  TextEditingController? nameController;
  TextEditingController? phoneController;
  LoginButton({
    required this.text,
    this.color,
    required this.nameController,
    required this.phoneController,
    Key? key,
  }) : super(key: key);
  Color? setColor() {
    if (this.color == null) {
      return this.color = Colors.white24;
    } else {
      return this.color;
    }
  }

  @override
  _LoginButtonState createState() => _LoginButtonState(
      this.text, setColor(), nameController!, phoneController!);
}

class _LoginButtonState extends State<LoginButton> {
  Dio? dio;
  String? firstPostTitle;
  bool? isLoading;

  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  TextStyle style = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 20.0,
      color: Colors.white,
      fontWeight: FontWeight.bold);

  Color? color;
  String? text;

  _LoginButtonState(
      this.text, this.color, this.nameController, this.phoneController);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dio = Dio();
    firstPostTitle = 'Press the button 👇';
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)), // <-- Radius

        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (nameController.text == "123" && phoneController.text == "123") {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            });
          } else {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            });
            // final snackBar = SnackBar(
            //   content: Text('User name or password error!!'),
            //   action: SnackBarAction(
            //     label: 'Undo',
            //     onPressed: () {
            //       Navigator.pop(context,
            //           MaterialPageRoute(builder: (context) => HomePage()));
            //       // Some code to undo the change.
            //     },
            //   ),
            // );
            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          // child: Text('Show SnackBar'),
        },
        child: Text(text!, textAlign: TextAlign.center, style: style));
  }
}
