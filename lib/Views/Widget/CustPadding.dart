import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustPadding extends StatelessWidget {
  Widget? child;
  double? left,right,bottom,top,padding;
  CustPadding({required this.child,this.padding,this.left,this.right,this.bottom,this.top});

  EdgeInsetsGeometry? setPadding() {
    if (this.padding == 0 || this.padding == null) {
      if (this.bottom == 0 || this.bottom == null) {
        this.bottom = 0;
      }
      if (this.top == 0 || this.top == null) {
        this.top = 0;
      }
      if (this.right == 0 || this.right == null) {
        this.right = 0;
      }
      if (this.left == 0 || this.left == null) {
        this.left = 0;
      }
      return EdgeInsets.fromLTRB(
          left!, top!, right!, bottom!);
    } else {
      return EdgeInsets.all(this.padding!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: setPadding()!,
        child: child
    );
  }
}
