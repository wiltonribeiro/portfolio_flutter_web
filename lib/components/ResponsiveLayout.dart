import 'package:flutter_web/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key key,
    @required this.largeChild,
    this.mediumChild,
    this.smallChild,
    this.largeBreakPoint = 800.0,
    this.mediumBreakPoint = 500.0,
  })  : assert(largeChild != null),
        super(key: key);


  final Widget largeChild;

  final Widget mediumChild;

  final Widget smallChild;

  final double largeBreakPoint;

  final double mediumBreakPoint;

  @override
  Widget build(BuildContext context) {
    final smallestWidth = MediaQuery.of(context).size.shortestSide;
    if (smallestWidth >= largeBreakPoint) {
      return largeChild;
    } else if (smallestWidth >= mediumBreakPoint) {
      return mediumChild ?? largeChild;
    } else {
      return smallChild ?? mediumChild ?? largeChild;
    }
  }
}