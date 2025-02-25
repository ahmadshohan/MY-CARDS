import 'package:flutter/material.dart';
import 'package:mycarts/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatefulWidget {
  final Color color;
  final double size;
  final double height;
  final bool withBgOverlay;

  Loader(
      {this.color = AppColors.button,
      this.size = 50,
      this.height,
      this.withBgOverlay = true});

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.withBgOverlay ? Colors.black38 : Colors.transparent,
        height: widget.height ?? MediaQuery.of(context).size.height,
        child: Center(
            child: Shimmer.fromColors(
          baseColor: Colors.red,
          highlightColor: AppColors.button,
          direction: ShimmerDirection.ltr,
          enabled: true,
          child: SpinKitCircle(
              color: widget.color,
              size: widget.size,
              controller: AnimationController(
                  vsync: this, duration: const Duration(milliseconds: 1200))),
        )));
  }
}
