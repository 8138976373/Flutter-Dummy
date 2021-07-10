import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  Widget? child;
  double? radius;
  double? margin;
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
  Color? color;
  bool? borderOnForeground;
  CustomRow(
      {Key? key,
        this.child,
        this.radius,
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
        this.elevation,
        this.shadowColor,
        this.color,
        this.borderOnForeground})
      : super(key: key);

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
      return this.elevation;
    }
  }

  Color? setshadowColor() {
    if (this.shadowColor == 0 || this.shadowColor == null) {
      return this.shadowColor = Colors.black;
    } else {
      return this.shadowColor;
    }
  }

  Color? setColor() {
    if (this.color == 0 || this.color == null) {
      return this.color = Colors.white;
    } else {
      return this.color;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: setPadding()!,
      child: Card(
        borderOnForeground: setBorderOnForeground()!,
        color: setColor(),
        margin: setMargin(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(setRadius()!),
        ),
        child: child,
        shadowColor: setshadowColor(),
        elevation: setElevation(),
      ),
    );
  }
}
