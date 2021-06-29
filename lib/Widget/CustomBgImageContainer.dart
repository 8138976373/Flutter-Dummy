import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomContainerWithBgImage extends StatelessWidget {
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
  Color? borderColor;
  double? borderWidth;
  Color? backgroundColor;
  BoxShape? boxShape;
  BoxConstraints? constraints;
  CustomContainerWithBgImage(
      {Key? key,
      this.image,
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
      this.backgroundColor,
      this.radius,
      this.borderColor,
      this.borderWidth,
      this.constraints,
      this.boxShape,
      this.child})
      : super(key: key);

  double? setHeight() {
    if (this.height == 0 || this.height == null) {
      return this.height = 0;
    } else {
      return this.height;
    }
  }

  BoxShape? setBoxShape() {
    if (this.boxShape == null) {
      return this.boxShape = BoxShape.rectangle;
    } else {
      return this.boxShape;
    }
  }

  Color? setBorderColor() {
    if (this.borderColor == null) {
      return this.borderColor = Colors.transparent;
    } else {
      return this.borderColor;
    }
  }

  double? setBorderWidth() {
    if (this.borderWidth == 0 || this.borderWidth == null) {
      return this.borderWidth = 0;
    } else {
      return this.borderWidth;
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

  String? setImage() {
    if (this.image == null) {
      return this.image = "assets/images/white.jpg";
    } else {
      return this.image;
    }
  }

  double? setRadius() {
    if (this.radius == 0 || this.radius == null) {
      return this.radius = 0.0;
    } else {
      return this.radius;
    }
  }

  BoxFit? setBoxFit() {
    if (this.fit == null) {
      return this.fit = BoxFit.fill;
    } else {
      return this.fit;
    }
  }

  Widget? setChild() {
    if (child == null && (constraints == null || !constraints!.isTight)) {
      return child = LimitedBox(
        maxWidth: 0.0,
        maxHeight: 0.0,
        child: ConstrainedBox(constraints: const BoxConstraints.expand()),
      );
    } else {
      return child;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: setPadding(),
        margin: setMargin(),
        decoration: BoxDecoration(
          color: setBackGroundColor(),
          borderRadius: BorderRadius.all(Radius.circular(setRadius()!)),
          image: DecorationImage(
            image: AssetImage(setImage()!),
            fit: setBoxFit(),
          ),
          shape: setBoxShape()!,
          border: Border.all(
            color: setBorderColor()!,
            width: setBorderWidth()!,
          ),
        ),
        child: setChild(),
        width: width,
        height: setHeight());
  }
}
