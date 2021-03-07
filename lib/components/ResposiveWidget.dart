import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {

  Widget mobileView;
  Widget tabletView;

  ResponsiveWidget({required this.mobileView, required this.tabletView});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return constraints.maxWidth <= 600 ? mobileView : tabletView;
    });
  }
}