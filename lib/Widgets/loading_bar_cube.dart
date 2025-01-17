import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBarCube extends StatelessWidget {
  final double size;
  final int duration;
  const LoadingBarCube(this.size, this.duration,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: SpinKitFadingCube(
        color: Theme.of(context).colorScheme.outline,
        duration: Duration(milliseconds: duration),
        size:size, // Change to your desired size
      ),
    );
  }
}
