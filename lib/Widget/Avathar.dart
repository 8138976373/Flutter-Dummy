import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avathar extends StatelessWidget {
  double? radius;
  String bgimage;
  double? padding;
  double? paddingRight;
  double? paddingLeft;
  double? paddingBottom;
  double? paddingTop;
  Avathar({required this.bgimage,
    this.radius,this.paddingBottom,this.paddingRight,this.paddingTop,this.paddingLeft,this.padding,});

  double? setRadius() {
    if (this.radius == 0 || this.radius == null) {
      return this.radius = 10.0;
    } else {
      return this.radius;
    }
  }

  String? setBgImage() {
    if (this.bgimage == null) {
      return this.bgimage = "assets/images/white.jpg";
    } else {
      return this.bgimage;
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
    return Padding(
      padding: setPadding()!,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: setRadius()!,
        backgroundImage: AssetImage(
          setBgImage()!,
        ),
      ),
    );
  }
}
