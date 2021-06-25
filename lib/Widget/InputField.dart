
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InpuField extends StatelessWidget{

  Widget? child;
  String? text;
  String? hintText;
  BoxFit? fit;
  double? margin;
  double? radius;
  double? marginRight;
  double? marginLeft;
  double? marginBottom;
  double? marginTop;
  double? padding;
  double? paddingRight;
  double? paddingLeft;
  double? paddingBottom;
  double? paddingTop;
  double? elevation;
  Color? textColor;
  Color? backgroundColor;
  InpuField(
      {required this.text,
        this.hintText,
        this.fit,
        this.margin,
        this.radius,
        this.marginLeft,
        this.marginRight,
        this.marginTop,
        this.marginBottom,
        this.padding,
        this.paddingBottom,
        this.paddingRight,
        this.paddingTop,
        this.paddingLeft,
        this.textColor,
        this.backgroundColor,
        this.child});

  double? setRadius() {
    if (this.radius == 0 || this.radius == null) {
      return this.radius = 10.0;
    } else {
      return this.radius;
    }
  }

  String? setHintText(){
    if(hintText == null){
      return this.hintText ="";
    }
    else{
      return this.hintText;
    }
  }

  Color? setColor() {
    if (this.textColor == 0 || this.textColor == null) {
      return this.textColor = Colors.white;
    } else {
      return this.textColor;
    }
  }

  Color? setBackGroundColor() {
    if (this.backgroundColor == 0 || this.backgroundColor == null) {
      return this.backgroundColor = Colors.white;
    } else {
      return this.backgroundColor;
    }
  }

  EdgeInsetsGeometry? setMargin() {
    if (this.margin == 0 || this.margin == null) {
      if (this.marginBottom == 0 || this.margin == null) {
        this.marginBottom = 0;
      }
      if (this.marginTop == 0 || this.margin == null) {
        this.marginTop = 0;
      }
      if (this.marginRight == 0 || this.margin == null) {
        this.marginRight = 0;
      }
      if (this.marginLeft == 0 || this.margin == null) {
        this.marginLeft = 0;
      }
      return EdgeInsets.fromLTRB(
          marginLeft!, marginTop!, marginRight!, marginBottom!);
    } else {
      return EdgeInsets.all(this.margin!);
    }
  }

  EdgeInsetsGeometry? setPadding() {
    if (this.padding == 0 || this.padding == null) {
      if (this.paddingBottom == 0 || this.paddingBottom == null) {
        this.paddingBottom = 0;
      }
      if (this.paddingTop == 0 || this.paddingTop == null) {
        this.paddingTop = 0;
      }
      if (this.paddingRight == 0 || this.paddingRight == null) {
        this.paddingRight = 0;
      }
      if (this.paddingLeft == 0 || this.paddingLeft == null) {
        this.paddingLeft = 0;
      }
      return EdgeInsets.fromLTRB(
          paddingLeft!, paddingTop!, paddingRight!, paddingBottom!);
    } else {
      return EdgeInsets.all(this.padding!);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Card(color: Colors.red[500],
        child: TextField(
        onChanged: (String str) {
      // setState(() {
      //   name=str;
      // });
    },
    style: TextStyle(color: textColor,backgroundColor: backgroundColor),
    decoration: InputDecoration(
    contentPadding:setPadding(),
    hintText:setHintText(),
    border:
    OutlineInputBorder(borderRadius: BorderRadius.circular(setRadius()!))))

    );
  }

}