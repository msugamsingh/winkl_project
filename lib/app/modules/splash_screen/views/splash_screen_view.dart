import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winkl_project/app/theme/styles.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightBlue),
                  borderRadius: BorderRadius.circular(28),
                ),
                height: 200,
                width: 200,
                child: FlutterLogo(
                  duration: Duration(seconds: 2),
                  curve: Curves.bounceInOut,
                )),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Winkl', style: Styles.tsRegularLarge48),
                Text(
                  '.',
                  style:
                      Styles.tsRegularLarge48.copyWith(color: Colors.lightBlue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
