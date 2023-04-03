import 'dart:io';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CommonFunctions {
  disableKeyBoard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  double getSizedBoxHeight(BuildContext context) {
    try {
      return MediaQuery.of(context).size.height * 0.05;
    } catch (exception) {
      return 0;
    }
  }

  double getSizedBoxWidth(BuildContext context) {
    try {
      return MediaQuery.of(context).size.height * 0.05;
    } catch (exception) {
      return 0;
    }
  }

  double getMarginCalculationForVertical(BuildContext context) {
    try {
      return MediaQuery.of(context).size.height * 0.05;
    } catch (exception) {
      return 0;
    }
  }

  double getMarginCalculationForHorizontal(BuildContext context) {
    try {
      return MediaQuery.of(context).size.width * 0.03;
    } catch (exception) {
      return 0;
    }
  }

  // double getMarginValueForHorizontal(BuildContext context){
  //   try{
  //     return MediaQuery.of(context).size.width * 0.1;
  //   }catch(exception){
  //     return 0;
  //   }
  // }

  double getFontSize(BuildContext context) {
    try {
      if (isLandscape(context)) {
        return MediaQuery.of(context).size.width * 0.013;
      } else {
        return MediaQuery.of(context).size.height * 0.015;
      }
    } catch (exception) {
      return 0;
    }
  }

  double getTextFieldFontSize(BuildContext context) {
    try {
      if (isLandscape(context)) {
        return MediaQuery.of(context).size.width * 0.013;
      } else {
        return MediaQuery.of(context).size.height * 0.018;
      }
    } catch (exception) {
      return 0;
    }
  }

  double getErrorFontSize(BuildContext context) {
    try {
      if (isLandscape(context)) {
        return MediaQuery.of(context).size.width * 0.01;
      } else {
        return MediaQuery.of(context).size.height * 0.015;
      }
    } catch (exception) {
      return 0;
    }
  }

  double getTinyFontSize(BuildContext context) {
    try {
      if (isLandscape(context)) {
        return MediaQuery.of(context).size.width * 0.01;
      } else {
        return MediaQuery.of(context).size.height * 0.012;
      }
    } catch (exception) {
      return 0;
    }
  }

  double getTitleFontSize(BuildContext context) {
    try {
      if (isLandscape(context)) {
        return MediaQuery.of(context).size.width * 0.03;
      } else {
        return MediaQuery.of(context).size.height * 0.03;
      }
    } catch (exception) {
      return 0;
    }
  }

  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } catch (exception) {
      printItem(
          "Error Came From CommonFunction file checkInternetConnection() function" +
              exception.toString());
      return false;
    }
  }

  Future<String> getNetworkTypeInfo() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return "Mobile network";
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return "Wifi network";
      // I am connected to a wifi network.
    } else if (connectivityResult == ConnectivityResult.vpn) {
      return "VPN network";
      // I am connected to a wifi network.
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      return "Ethernet network";
      // I am connected to a wifi network.
    } else {
      return "";
    }
  }

  String getWhichPlatForm() {
    if (Platform.isAndroid) {
      return "android";
    } else if (Platform.isIOS) {
      return "ios";
    } else {
      return "web";
    }
  }

  printItem(exception) {
    log(exception.toString());
  }

  printSuccessApiCalling(response) {
    print('\x1B[32m$response\x1B[0m');
  }

  printHighlights(response) {
    print('\x1B[33m$response\x1B[0m');
  }

  printErrorLogs(exception) {
    print('\x1B[31m$exception\x1B[0m');
  }

  navigatePage(
    BuildContext context, {
    PageTransitionType pageTransitionType = PageTransitionType.rightToLeft,
    Widget navigationScreen = const SizedBox(),
    Widget currentScreen = const SizedBox(),
  }) async {
    try {
      ///internally checks the google chrome is running with internet or not
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Navigator.pushReplacement(context,
            PageTransition(type: pageTransitionType, child: navigationScreen));
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>navigationScreen));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Container()));
      }
    } on SocketException catch (exception) {
      printItem("Error Came From CommonFunction file performCancel() function" +
          exception.toString());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Container()));
    }
  }

  backNavigatePage(
    BuildContext context, {
    Widget navigationScreen = const SizedBox(),
    Widget currentScreen = const SizedBox(),
  }) async {
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.leftToRight, child: navigationScreen));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Container()));
      }
    } on SocketException catch (exception) {
      printItem("Error Came From CommonFunction file performCancel() function" +
          exception.toString());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Container()));
    }
  }

  performCancel(BuildContext context, {String dialogName = ""}) {
    try {
      Navigator.of(context, rootNavigator: true).pop(dialogName);
    } catch (exception) {
      printItem(exception);
    }
  }

  bool isTablet(BuildContext context) {
    try {
      final dimensions = MediaQuery.of(context).size.shortestSide;
      if (dimensions >= 600) {
        return true;
      }
      return false;
    } catch (exception) {
      printItem(exception);
      return false;
    }
  }

  bool isLandscape(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return true;
    }
    return false;
  }

  double getAppBarHeight(BuildContext context) {
    if (isLandscape(context)) {
      return MediaQuery.of(context).size.width * 0.1;
    } else {
      return MediaQuery.of(context).size.height * 0.1;
    }
  }

  double getBiggerAppBarHeight(BuildContext context) {
    if (isLandscape(context)) {
      return MediaQuery.of(context).size.width * 0.1;
    } else {
      return MediaQuery.of(context).size.height * 0.15;
    }
  }

  double getCalculatedHeightSized(BuildContext context, double height) {
    if (isLandscape(context)) {
      return MediaQuery.of(context).size.width * height;
    } else {
      return MediaQuery.of(context).size.height * height;
    }
  }

  double getCalculatedWidthSized(BuildContext context, double width) {
    if (isLandscape(context)) {
      return MediaQuery.of(context).size.height * width;
    } else {
      return MediaQuery.of(context).size.width * width;
    }
  }

  double getFontSizeForMobileView(BuildContext context) {
    try {
      return MediaQuery.of(context).size.width * 0.05;
    } catch (exception) {
      return 0;
    }
  }

  double getFontSizeForTabView(BuildContext context) {
    try {
      return MediaQuery.of(context).size.width * 0.05;
    } catch (exception) {
      return 0;
    }
  }

  double getFontSizeForWebView(BuildContext context) {
    try {
      return MediaQuery.of(context).size.width * 0.03;
    } catch (exception) {
      return 0;
    }
  }

  double getErrorFontSizeForMobileView(BuildContext context) {
    try {
      return MediaQuery.of(context).size.width * 0.025;
    } catch (exception) {
      return 0;
    }
  }

  double getErrorFontSizeForTabView(BuildContext context) {
    try {
      return MediaQuery.of(context).size.width * 0.015;
    } catch (exception) {
      return 0;
    }
  }

  double getErrorFontSizeForWebView(BuildContext context) {
    try {
      return MediaQuery.of(context).size.width * 0.015;
    } catch (exception) {
      return 0;
    }
  }

  double getTitleFontSizeForMobileView(BuildContext context) {
    try {
      return MediaQuery.of(context).size.width * 0.025;
    } catch (exception) {
      return 0;
    }
  }

  double getTitleFontSizeForTabView(BuildContext context) {
    try {
      return MediaQuery.of(context).size.width * 0.025;
    } catch (exception) {
      return 0;
    }
  }

  double getTitleFontSizeForWebView(BuildContext context) {
    try {
      return MediaQuery.of(context).size.width * 0.025;
    } catch (exception) {
      return 0;
    }
  }

  double getSuffixIconSize(BuildContext context) {
    try {
      return MediaQuery.of(context).size.width * 0.02;
    } catch (exception) {
      return MediaQuery.of(context).size.width * 0.02;
    }
  }

  double getTitleFontSizeWithValue(BuildContext context, double value) {
    try {
      if (isLandscape(context)) {
        return MediaQuery.of(context).size.width * value;
      } else {
        return MediaQuery.of(context).size.height * value;
      }
    } catch (exception) {
      return 0;
    }
  }

  double getHeaderFontSize(BuildContext context) {
    try {
      if (isLandscape(context)) {
        return MediaQuery.of(context).size.width * 0.01;
      } else {
        return MediaQuery.of(context).size.height * 0.028;
      }
    } catch (exception) {
      return 0;
    }
  }

  double getSubHeaderFontSize(BuildContext context) {
    try {
      if (isLandscape(context)) {
        return MediaQuery.of(context).size.width * 0.01;
      } else {
        return MediaQuery.of(context).size.height * 0.02;
      }
    } catch (exception) {
      return 0;
    }
  }

  double getSubTitleFontSizeWithValue(BuildContext context, double value) {
    try {
      if (isLandscape(context)) {
        return MediaQuery.of(context).size.width * value;
      } else {
        return MediaQuery.of(context).size.height * value;
      }
    } catch (exception) {
      return 0;
    }
  }

  getMarginValueForHorizontal(BuildContext context) {
    if (isLandscape(context)) {
      return MediaQuery.of(context).size.height * 0.05;
    } else {
      return MediaQuery.of(context).size.width * 0.05;
    }
  }

  getPaddingValueForHorizontal(BuildContext context) {
    if (isLandscape(context)) {
      return MediaQuery.of(context).size.height * 0.05;
    } else {
      return MediaQuery.of(context).size.width * 0.05;
    }
  }

  getPaddingValueForVertical(BuildContext context) {
    if (isLandscape(context)) {
      return MediaQuery.of(context).size.height * 0.05;
    } else {
      return MediaQuery.of(context).size.width * 0.05;
    }
  }

  getMediaQueryCalculation(BuildContext context, double size) {
    if (isLandscape(context)) {
      return MediaQuery.of(context).size.width * size;
    } else {
      return MediaQuery.of(context).size.width * size;
    }
  }

  getMediaQueryWidthCalculation(BuildContext context, double size) {
    if (isLandscape(context)) {
      return MediaQuery.of(context).size.height * size;
    } else {
      return MediaQuery.of(context).size.width * size;
    }
  }
}
