import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  Widget? child;
  String? image;
  BoxFit? fit;
  double? width;
  double? height;
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
  Color? shadowColor;
  Color? cardColor;
  Color? backgroundColor;
  bool? borderOnForeground;
  BoxConstraints? constraints;
  CustomContainer(
      {Key? key,this.image,
        this.fit,
        this.height,
        this.width,
        this.margin,
        this.marginLeft,
        this.marginRight,
        this.marginTop,
        this.marginBottom,
        this.padding,
        this.paddingBottom,
        this.paddingRight,
        this.paddingTop,
        this.paddingLeft,
        this.borderOnForeground,
        this.backgroundColor,
        this.radius,
        this.cardColor,
        this.constraints,
        this.child}): super(key: key);


  double? setWidth() {
    if (this.width == 0 || this.width == null) {
      return this.width = 100.0;
    } else {
      return this.width;
    }
  }

  double? setHieght() {
    if (this.height == 0 || this.height == null) {
      return this.height = 100.0;
    } else {
      return this.height;
    }
  }

  Color? setshadowColor() {
    if ( this.shadowColor == null) {
      return this.shadowColor = Colors.black;
    } else {
      return this.shadowColor;
    }
  }

  Color? setBackGroundColor() {
    if (this.backgroundColor == 0 || this.backgroundColor == null) {
      return this.backgroundColor = Colors.white;
    } else {
      return this.backgroundColor;
    }
  }

  double? setRadius() {
    if (this.radius == 0 || this.radius == null) {
      return this.radius = 10.0;
    } else {
      return this.radius;
    }
  }

  bool? setBorderOnForeground() {
    if (borderOnForeground == null) {
      return this.borderOnForeground = false;
    } else {
      return this.borderOnForeground;
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

  double? setElevation() {
    if (this.elevation == 0 || this.elevation == null) {
      return this.elevation = 10.0;
    } else {
      print(this.elevation);
      return this.elevation;
    }
  }

  String? setImage() {
    if (this.image == null) {
      return this.image = "assets/images/white.jpg";
    } else {
      return this.image;
    }
  }

  BoxFit? setBoxFit() {
    if (this.fit == null) {
      return this.fit = BoxFit.cover;
    } else {
      return this.fit;
    }
  }

  Widget? setChild(){
    if (child == null && (constraints == null || !constraints!.isTight)) {
      return child = LimitedBox(
        maxWidth: 0.0,
        maxHeight: 0.0,
        child: ConstrainedBox(constraints: const BoxConstraints.expand()),
      );
    }
    else{
      return child;
    }
  }

  Color? setCardColor() {
    if ( this.cardColor == null) {
      return this.cardColor = Colors.white;
    } else {
      return this.cardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Card(
          borderOnForeground: setBorderOnForeground()!,
          color: setCardColor(),
          margin: setMargin(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(setRadius()!),
          ),
          child: Container(
              color: setBackGroundColor(),
              padding: setPadding(),
              margin: setMargin(),
              child: setChild(),
              width: this.width,
              height: this.height),
          shadowColor: setshadowColor(),
          elevation: setElevation(),
    );
  }
}