import 'dart:async';

import 'package:complete_flutter_app/presentation/resources/assets_manager.dart';
import 'package:complete_flutter_app/presentation/resources/color_manager.dart';
import 'package:complete_flutter_app/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay(){
    _timer = Timer(Duration(seconds: 2),_goNextPage);
  }

  _goNextPage(){
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image(
          image:AssetImage(ImageAssets.splashLogo) ,),
      ),
    );
  }

}
