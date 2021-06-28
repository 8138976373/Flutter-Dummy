
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HideContainer extends StatelessWidget {
  const HideContainer({
    Key? key,
    required bool? isVisible,
  }) : _isVisible = isVisible, super(key: key);

  final bool? _isVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _isVisible! ? 0.0 : 0.0,
      color: Colors.white,
      width: _isVisible! ? 0.0 : 0.0,
    );
  }
}