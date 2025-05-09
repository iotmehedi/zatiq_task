
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/consts/app_assets.dart';
import '../../../core/utils/consts/app_colors.dart';
import '../../../core/utils/consts/app_sizes.dart';
import '../../widgets/circular_dot_animation/circular_dot_animation.dart';
import '../../widgets/custom_text/custom_text.dart';
import '../controller/splash_controller.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                 Expanded(
                  flex: 9,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.logo, height: 150, width:  150,),
                      ],
                    ),
                  ),
                ),
                 Center(
                  child: Container(
                    height: 30,
                    width: 30,
                    child:  CircularDotsAnimation(
                      dotSize: 6,
                      radius: 10,
                      padding: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        );
      }
    );
  }
}
