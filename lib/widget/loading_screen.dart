import 'package:d_task/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

const TWO_PI = 3.14 * 2;

class LoadingWidget extends StatelessWidget {
  final Function() onEnd;
  const LoadingWidget({
    super.key,
    required this.onEnd,
  });

  @override
  Widget build(BuildContext context) {
    const size = 200.0;

    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 4),
      onEnd: () {
        onEnd();
      },
      builder: (context, value, child) {
        // percentage to show in Center Text
        int percentage = (value * 100).ceil();
        return Container(
          width: size,
          height: size,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 5,
            ),
          ),
          child: Stack(
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return SweepGradient(
                    startAngle: 0.0,
                    endAngle: TWO_PI,
                    stops: [value, value],
                    center: Alignment.center,
                    colors: [
                      AppColors.primaryO100,
                      Colors.transparent,
                    ],
                  ).createShader(rect);
                },
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: Image.asset("assets/images/circle.png").image),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: size - 40,
                  height: size - 40,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "$percentage %",
                      style: TextStyle(
                        fontSize: 25,
                        color: AppColors.primaryO100,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
