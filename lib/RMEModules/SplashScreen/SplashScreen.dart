import 'package:flutter/material.dart';
import 'package:room_mate_expensive/RMECommonFunctions/CommonFunctions.dart';
import 'package:room_mate_expensive/RMEComponents/SharedPref.dart';
import 'package:room_mate_expensive/RMEModules/LoginScreen/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Curve curve = Curves.fastOutSlowIn;
  double imageHeight = 0;

  CommonFunctions commonFunctions = CommonFunctions();
  SharedPref sharedPref = SharedPref();

  @override
  void initState() {
    openLogoAnimationForImage();
    closeLogoAnimationForImage();
    navigateToIntroductionScreen();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future openLogoAnimationForImage() async {
    return await Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          imageHeight = MediaQuery.of(context).size.height * 0.35;
        });
      }
    });
  }

  Future closeLogoAnimationForImage() async {
    return await Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          imageHeight = 0;
        });
      }
    });
  }

  Future navigateToIntroductionScreen() async {
    return await Future.delayed(const Duration(seconds: 4), () {
      sharedPref.storeBoolInSharedPreference("shownSplashScreen", true);
      commonFunctions.navigatePage(context,
          navigationScreen: LoginScreenView());
    });
  }

  Widget buildSvgImageForIntro(String assetName) {
    return AnimatedContainer(
      // width: imageWidth,
      height: imageHeight,
      duration: Duration(seconds: 1),
      curve: curve,
      child: Image.asset(
        'assets/images/splashScreen.png',
        alignment: Alignment.center,
        height: imageHeight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: buildSvgImageForIntro("carouselOne.svg"),
      ),
    );
  }
}
