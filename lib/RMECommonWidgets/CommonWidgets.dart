import 'dart:developer';

import 'dart:io';

import 'package:percent_indicator/percent_indicator.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:room_mate_expensive/RMECommonFunctions/CommonFunctions.dart';
import 'package:room_mate_expensive/RMECommonWidgets/ColorConstants.dart';
import 'package:room_mate_expensive/RMECommonWidgets/RME/RMEImageAssets.dart';

class CommonWidgets {
  PreferredSize getAppBar(
    BuildContext context,
    VoidCallback onWillPop,
    double fontSize, {
    double leadingWidth = 0,
    Widget leading = const SizedBox(),
    Widget title = const SizedBox(),
    Widget trailing = const SizedBox(),
    double appBarHeight = 0,
  }) {
    try {
      return PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          bottomOpacity: 0.1,
          toolbarHeight: appBarHeight,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: leadingWidth,
          leading: GestureDetector(
            onTap: onWillPop,
            child: leading,
          ),
          // leadingWidth: 0,
          title: title,
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: trailing,
            ),
          ],
        ),
      );
    } catch (exception) {
      return PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.05),
          child: AppBar());
    }
  }

  PreferredSize getAOnlyTitleAppBar(
    BuildContext context,
    VoidCallback onWillPop,
    double fontSize, {
    double leadingWidth = 0,
    Widget leading = const SizedBox(),
    Widget title = const SizedBox(),
    Widget trailing = const SizedBox(),
  }) {
    try {
      return PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
        child: AppBar(
          bottomOpacity: 0.1,
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: leadingWidth,
          title: title,
        ),
      );
    } catch (exception) {
      return PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.05),
          child: AppBar());
    }
  }

  PreferredSize getCustomAppBar(
    BuildContext context,
    VoidCallback onWillPop,
    double fontSize, {
    Widget leading = const SizedBox(),
    Widget title = const SizedBox(),
    Widget trailing = const SizedBox(),
    double leadingWidth = 0,
  }) {
    try {
      return PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
        // height: MediaQuery.of(context).size.height * 0.2,
        child: AppBar(
          leadingWidth: leadingWidth,
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: onWillPop,
            child: leading,
          ),
          // leadingWidth: 0,
          title: title,
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: trailing,
            ),
          ],
        ),
      );
    } catch (exception) {
      return PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: SizedBox(),
      );
    }
  }

  Widget getLinearProgressIndicator(BuildContext context) {
    return const LinearProgressIndicator(
      backgroundColor: Colors.teal,
      color: Colors.white,
    );
  }

  Widget getImageContainer(BuildContext context, Color backGroundColor,
      String image, double imageHeight, double imageWidth) {
    try {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(image: AssetImage(image), height: imageHeight),
            ),
          ],
        ),
      );
    } catch (exception) {
      return Container();
    }
  }

  Widget getLayOutBuilderWidget(BuildContext context, Widget bodyContainer) {
    try {
      return LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 786) {
          return bodyContainer;
        } else if (constraints.maxWidth >= 786) {
          return bodyContainer;
        } else {
          return bodyContainer;
        }
      });
    } catch (exception) {
      return Container();
    }
  }

  Widget getMainBodyWidget(BuildContext context,
      {Widget headerWidget = const SizedBox(),
      Widget bodyWidget = const SizedBox(),
      Widget footerWidget = const SizedBox()}) {
    try {
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: headerWidget,
          ),
          SizedBox(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                color: Colors.red,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      // height: MediaQuery.of(context).size.height * 0.5,
                      child: bodyWidget,
                    ),
                    SizedBox(
                      // height: MediaQuery.of(context).size.height * 0.3,
                      child: footerWidget,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    } catch (exception) {
      return SizedBox();
    }
  }

  Widget getBGImage(String imgUrl, double width) {
    try {
      return Container(
        alignment: Alignment.center,
        child: Image(
          image: AssetImage(imgUrl),
          width: width,
        ),
      );
    } catch (exception) {
      return Container();
    }
  }

  Widget getPercentageIndicator(
      BuildContext context,
      String percentageValue,
      Color textColor,
      double percent,
      double padding,
      double lineHeight,
      Color backgroundColor,
      Color progressColor,
      double fontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: padding,
              bottom: CommonFunctions().getCalculatedWidthSized(context, 0.02)),
          child: getNormalTextWidget(
              context, percentageValue, textColor, fontSize),
        ),
        LinearPercentIndicator(
          padding: EdgeInsets.symmetric(horizontal: padding),
          alignment: MainAxisAlignment.center,
          curve: Curves.bounceIn,
          lineHeight: lineHeight,
          percent: percent,
          backgroundColor: backgroundColor,
          progressColor: progressColor,
          barRadius: Radius.circular(4),
        ),
      ],
    );
  }

  Decoration getBoxDecorationForContainer(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: ColorConstants.disabledTextFieldColor,
    );
  }

  Widget getIconWithTitle(
      {required BuildContext context,
      required String imageUrl,
      required Color imageColor,
      required String title,
      required Color titleColor,
      required double fontSize}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          width: 18,
          height: 18,
          imageUrl,
          color: imageColor,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: CommonFunctions().getCalculatedHeightSized(context, 0.02)),
          child: getNormalTextWidget(context, title, titleColor, fontSize),
        ),
      ],
    );
  }

  Widget getIconWithTitleAndTrailing({
    required BuildContext context,
    required String imageUrl,
    required Color imageColor,
    required String title,
    required Color titleColor,
    required double fontSize,
    required String trailingImageUrl,
    required Color trailingImageColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              width: 18,
              height: 18,
              imageUrl,
              color: imageColor,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: CommonFunctions()
                      .getCalculatedHeightSized(context, 0.02)),
              child: getNormalTextWidget(context, title, titleColor, fontSize),
            ),
          ],
        ),
        SvgPicture.asset(
          width: 20,
          height: 20,
          trailingImageUrl,
          color: trailingImageColor,
        ),
      ],
    );
  }

  Widget getSizedBox({double width = 0, double height = 0}) {
    try {
      return SizedBox(
        width: width,
        height: height,
      );
    } catch (exception) {
      return Container();
    }
  }

  Widget getSupportScreenCard(
      {required BuildContext context,
      required String imageUrl,
      required Color imageColor,
      required double imageAndTitleMiddleSpacing,
      required String title,
      required String subTitle,
      required Color titleColor,
      required double fontSize}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      height: MediaQuery.of(context).size.height * 0.12,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.whiteTextColor,
          border: Border.all(color: ColorConstants.borderColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: SvgPicture.asset(
              imageUrl,
              color: imageColor,
              fit: BoxFit.none,
            ),
          ),
          getSizedBox(
            height: imageAndTitleMiddleSpacing,
          ),
          getNormalTextWidget(context, title, titleColor, fontSize),
          getNormalTextWidget(context, subTitle, titleColor, fontSize),
        ],
      ),
    );
  }

  Widget getLocationContentContainer({
    required BuildContext context,
    required String iconUrl,
    required String title,
    required String subTitle,
    required double spacerHeight,
    required double fontSize,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SvgPicture.asset(
            alignment: Alignment.topLeft,
            iconUrl,
            color: ColorConstants.appPrimaryColor,
            fit: BoxFit.none,
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getNormalTextWidget(
                context,
                title,
                ColorConstants.textColor,
                fontSize,
                fontWeight: FontWeight.bold,
              ),
              getSizedBox(height: spacerHeight),
              getNormalTextWidget(
                  context, subTitle, ColorConstants.textColor, fontSize,
                  textAlign: TextAlign.left),
            ],
          ),
        ),
      ],
    );
  }

  Widget getOtpTextFieldWidget(
      {required BuildContext context,
      required TextEditingController controller,
      required int length,
      required String regEx,
      required FocusNode focusNode,
      required Color bgColor,
      required MainAxisAlignment mainAxisAlignment,
      required bool autoFocus,
      required bool autoUnfocus,
      required void Function(String?)? onCompleted,
      required void Function(String?)? onChanged}) {
    return PinCodeTextField(
      focusNode: focusNode,
      appContext: context,
      length: length,
      obscureText: false,
      animationType: AnimationType.fade,
      autoDisposeControllers: false,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: MediaQuery.of(context).size.height * 0.065,
          fieldWidth: MediaQuery.of(context).size.width * 0.12,
          activeFillColor: Colors.white,
          activeColor: ColorConstants.textFieldBorderColor,
          borderWidth: 0.8,
          inactiveColor: ColorConstants.textFieldBorderColor,
          selectedColor: ColorConstants.appPrimaryColor),
      autoUnfocus: true,
      mainAxisAlignment: mainAxisAlignment,
      autoFocus: true,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(regEx)),
      ],
      keyboardType: TextInputType.phone,
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: bgColor,
      controller: controller,
      onCompleted: onCompleted,
      onChanged: (value) {},
    );
  }

  Widget getToggleWidgetWidthTitle(
      {required BuildContext context,
      required String title,
      required Color titleColor,
      required void Function(bool?)? switchOnChanged,
      required bool switchValue,
      required double fontSize}) {
    try {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getNormalTextWidget(context, title, titleColor, fontSize),
          Switch(
            onChanged: switchOnChanged,
            value: switchValue,
            activeColor: ColorConstants.buttonBgColor,
            activeTrackColor: ColorConstants.buttonBgColor,
            inactiveThumbColor: ColorConstants.disabledTextFieldColor,
            inactiveTrackColor: ColorConstants.disabledTextFieldColor,
          ),
        ],
      );
    } catch (exception) {
      return SizedBox();
    }
  }

  Widget getNormalTextWidget(
      BuildContext context, String title, Color color, double fontSize,
      {FontWeight fontWeight = FontWeight.w400,
      TextDecoration = TextDecoration.none,
      TextAlign textAlign = TextAlign.start}) {
    try {
      return Text(title,
          textAlign: textAlign,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: TextDecoration,
          ));
    } catch (exception) {
      return Container();
    }
  }

  Widget getCheckBoxWidget(BuildContext context,
      {bool checkBoxSelectedValue = false,
      void Function(bool?)? checkBoxOnChanged,
      String title = "",
      double fontSize = 0.0,
      CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Checkbox(
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          value: checkBoxSelectedValue,
          onChanged: checkBoxOnChanged,
        ),
        Expanded(
          child: getNormalTextWidget(
            context,
            title,
            ColorConstants.textColor,
            fontSize,
          ),
        ),
      ],
    );
  }

  Widget getTitleSubTitleWidget(BuildContext context,
      {String title = "",
      Color titleColor = Colors.white,
      String subTitle = "",
      Color subTitleColor = Colors.black,
      double primaryHeightSpacer = 0.0,
      double secondaryHeightSpacer = 0.0,
      double trailingHeightSpacer = 0.0,
      double titleFontSize = 0.0,
      double fontSize = 0.0}) {
    try {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getSizedBox(height: primaryHeightSpacer),
          getNormalTextWidget(context, title, titleColor, titleFontSize,
              fontWeight: FontWeight.w600),
          getSizedBox(height: secondaryHeightSpacer),
          getNormalTextWidget(context, subTitle, subTitleColor, fontSize),
          getSizedBox(height: trailingHeightSpacer),
        ],
      );
    } catch (exception) {
      return const SizedBox();
    }
  }

  Widget getTitleWidget(BuildContext context,
      {String title = "",
      Color titleColor = Colors.white,
      String subTitle = "",
      double primaryHeightSpacer = 0.0,
      double secondaryHeightSpacer = 0.0,
      // double trailingHeightSpacer = 0.0,
      double titleFontSize = 0.0,
      double fontSize = 0.0}) {
    try {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getSizedBox(height: primaryHeightSpacer),
          getNormalTextWidget(context, title, titleColor, titleFontSize,
              fontWeight: FontWeight.w600),
          getSizedBox(height: secondaryHeightSpacer),
          // getNormalTextWidget(context, subTitle, subTitleColor, fontSize),
          // getSizedBox(height: trailingHeightSpacer),
        ],
      );
    } catch (exception) {
      return const SizedBox();
    }
  }

  Widget getNormalTextWithBoldWidget(
      BuildContext context, String title, Color color, double fontSize) {
    try {
      return Text(title,
          style: TextStyle(
              color: color, fontSize: fontSize, fontWeight: FontWeight.bold));
    } catch (exception) {
      return Container();
    }
  }

  Widget getNormalTextWithBoldtextalignWidget(
      BuildContext context, String title, Color color, double fontSize,
      {FontWeight fontWeight = FontWeight.w400,
      TextDecoration = TextDecoration.none,
      TextAlign textAlign = TextAlign.start}) {
    try {
      return Text(title,
          textAlign: textAlign,
          style: TextStyle(
              color: color, fontSize: fontSize, fontWeight: FontWeight.bold));
    } catch (exception) {
      return Container();
    }
  }

  Widget getCholaLogoWidget(BuildContext context, String imageUrl) {
    try {
      return Center(
        child: Image(
          width: MediaQuery.of(context).size.width * 0.5,
          alignment: Alignment.center,
          image: AssetImage(imageUrl),
        ),
      );
    } catch (exception) {
      return const SizedBox();
    }
  }

  Widget getNewScaffoldWithAppBarImage({
    required BuildContext context,
    required String title,
    required Widget bodyContainer,
    required WillPopCallback? onWillPop,
    required double titleFontSize,
    required double fontSize,
    required PreferredSize appBar,
    required Widget bottomWidget,
  }) {
    try {
      return WillPopScope(
        onWillPop: onWillPop,
        child: Container(
          
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              // fit: BoxFit.none,
              image: AssetImage(RMEImageAssets.top_Gradient),
              alignment: Alignment.topCenter,
            ),
          ),
          child: SafeArea(
            child: Scaffold(
              bottomNavigationBar: bottomWidget,
              // bottomSheet: bottomWidget,
              appBar: appBar,
              backgroundColor: Colors.transparent,
              body: bodyContainer,
            ),
          ),
        ),
      );
    } catch (exception) {
      return Container();
    }
  }

  Widget getNewScaffoldWithOutAppBarImage({
    required BuildContext context,
    required String title,
    required Widget bodyContainer,
    required WillPopCallback? onWillPop,
    required double titleFontSize,
    required double fontSize,
  }) {
    try {
      return WillPopScope(
        onWillPop: onWillPop,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              // fit: BoxFit.none,
              image: AssetImage(RMEImageAssets.top_Gradient),
              alignment: Alignment.topCenter,
            ),
          ),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: bodyContainer),
            ),
          ),
        ),
      );
    } catch (exception) {
      return Container();
    }
  }

  Widget getScaffoldWithOutAppBarWithBgImage(
      BuildContext context,
      String title,
      Widget bodyContainer,
      WillPopCallback? onWillPop,
      double titleFontSize,
      double fontSize,
      {Widget appBar = const SizedBox(),
      bool isShownFloatingButton = false,
      bool drawerLeft = true,
      String userName = ""}) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    try {
      return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          // extendBodyBehindAppBar: false,
          backgroundColor: Colors.white,
          drawerDragStartBehavior: DragStartBehavior.start,
          // appBar:  getAppBar(context, onWillPop),
          body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                // height: MediaQuery.of(context).size.height *0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Top_Gradient576.png'),
                      fit: BoxFit.none,
                      alignment: Alignment.topCenter,
                      scale: 02),
                ),
                child: bodyContainer,
              )),
        ),
      );
    } catch (exception) {
      return Container();
    }
  }

  Drawer getDrawerWidget(BuildContext context, String userName,
      double titleFontSize, double fontSize) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }

  performLogoutProcess(BuildContext context, double fontSize) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: getNormalTextWidget(context, "Are you sure want to log out?",
                Colors.black, fontSize),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                getSizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: getButtonWidget(context, "Yes", () {
                      Navigator.of(context).pop();
                    }, fontSize)),
                    getSizedBox(width: 20),
                    Expanded(
                        child: getButtonWidget(context, "No", () {
                      Navigator.of(context).pop();
                    }, fontSize)),
                  ],
                )
              ],
            ),
          );
        });
  }

  Widget getRoundedRectangleBox(BuildContext context, Widget child) {
    try {
      return Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.85,
        height: CommonFunctions().getCalculatedHeightSized(context, 0.5),
        margin: const EdgeInsets.all(20),
        child: Card(
          // shadowColor: ColorConstants.indigoColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          child: child,
        ),
      );
    } catch (exception) {
      return Container();
    }
  }

  getTermsNConditionsWidget(
      BuildContext context, Widget titleContainer, Widget contentContainer) {
    try {
      showDialog(
          context: context,
          builder: (BuildContext contexts) {
            return StatefulBuilder(builder: (context, setState) {
              return AlertDialog(
                insetPadding: EdgeInsets.all(15),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      // flex: 4,
                      child: titleContainer,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close, size: 20),
                    ),
                  ],
                ),
                content: contentContainer,
              );
            });
          });
    } catch (exception) {
      return Container();
    }
  }

  Widget getTextFieldWidget(BuildContext context, validCharacters,
      {required placeHolder,
      required TextEditingController controller,
      required Widget prefix,
      required Widget suffix,
      required FocusNode focusNode,
      required TextInputType textInputType,
      required TextCapitalization textCapitalization,
      required TextAlign textAlign,
      required TextInputAction textInputAction,
      required bool autoFocus,
      required int maxLines,
      required int minLines,
      required int maxLength,
      required bool enabled,
      required double heightSpacer,
      required double textFieldFontSize,
      required double fontSize,
      void Function()? onTap,
      void Function(String)? onChange,
      void Function(String)? onSubmitted}) {
    try {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getNormalTextWidget(
              context, placeHolder, ColorConstants.textColor, fontSize),
          getSizedBox(height: heightSpacer),
          TextField(
            controller: controller,
            textInputAction: textInputAction,
            focusNode: focusNode,
            textAlign: textAlign,
            autofocus: autoFocus,
            maxLines: maxLines,
            minLines: minLines,
            maxLength: maxLength,
            onChanged: onChange,
            onSubmitted: onSubmitted,
            onTap: onTap,
            enabled: enabled,
            keyboardType: textInputType,
            textCapitalization: textCapitalization,
            style: TextStyle(
                color: ColorConstants.textColor, fontSize: textFieldFontSize),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(validCharacters)),
            ],
            decoration: InputDecoration(
              suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10), child: suffix),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
              counterText: "",
              // labelText: hintText,
              labelStyle: TextStyle(
                  backgroundColor: Colors.transparent,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize),
              border: InputBorder.none,
              fillColor: enabled
                  ? Colors.white
                  : ColorConstants.disabledTextFieldColor,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorConstants.textFieldBorderColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorConstants.textFieldBorderColor,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorConstants.textFieldBorderColor,
                ),
              ),
            ),
          ),
        ],
      );
    } catch (exception) {
      return Container();
    }
  }

  Widget getTextFieldWidgetForBothTitleNPlaceHolder(
      BuildContext context, validCharacters,
      {required title,
      required placeHolder,
      required TextEditingController controller,
      required Widget prefix,
      required Widget suffix,
      required FocusNode focusNode,
      required TextInputType textInputType,
      required TextCapitalization textCapitalization,
      required TextAlign textAlign,
      required TextInputAction textInputAction,
      required bool autoFocus,
      required int maxLines,
      required int minLines,
      required int maxLength,
      required bool enabled,
      required double heightSpacer,
      required double textFieldFontSize,
      required double fontSize,
      void Function()? onTap,
      void Function(String)? onChange,
      void Function(String)? onSubmitted}) {
    try {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getNormalTextWidget(
              context, title, ColorConstants.textColor, fontSize),
          getSizedBox(height: heightSpacer),
          TextField(
            textInputAction: TextInputAction.next,
            controller: controller,
            focusNode: focusNode,
            textAlign: textAlign,
            autofocus: autoFocus,
            maxLines: maxLines,
            minLines: minLines,
            maxLength: maxLength,
            onChanged: onChange,
            onSubmitted: onSubmitted,
            onTap: onTap,
            enabled: enabled,
            keyboardType: textInputType,
            textCapitalization: textCapitalization,
            style: TextStyle(
                color: ColorConstants.textColor, fontSize: textFieldFontSize),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(validCharacters)),
            ],
            decoration: InputDecoration(
              hintText: placeHolder,
              suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10), child: suffix),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
              counterText: "",
              // labelText: placeHolder,
              hintStyle: TextStyle(
                  backgroundColor: Colors.transparent,
                  color: Colors.grey,
                  // fontWeight: FontWeight.bold,
                  fontSize: fontSize),
              labelStyle: TextStyle(
                  backgroundColor: Colors.transparent,
                  color: Colors.grey,
                  // fontWeight: FontWeight.bold,
                  fontSize: fontSize),
              border: InputBorder.none,
              fillColor: enabled
                  ? Colors.white
                  : ColorConstants.disabledTextFieldColor,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorConstants.textFieldBorderColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorConstants.textFieldBorderColor,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorConstants.textFieldBorderColor,
                ),
              ),
            ),
          ),
        ],
      );
    } catch (exception) {
      return Container();
    }
  }

  Widget getElevatedButtonWidget(
    BuildContext context,
    String buttonText,
    Color buttonBackColor,
    Color buttonTextColor,
    VoidCallback onTap,
    double fontSize, {
    Color disabledBackgroundColor = Colors.grey,
  }) {
    try {
      return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonBackColor,
          // textStyle: TextStyle(color: buttonTextColor,fontSize: fontSize),
          disabledBackgroundColor: disabledBackgroundColor,
          enabledMouseCursor: MouseCursor.uncontrolled,
          elevation: 2,
          fixedSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
          minimumSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.05),
          maximumSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
        ),
        child: getNormalTextWidget(
          context,
          buttonText,
          buttonTextColor,
          fontSize,
        ),
      );
    } catch (exception) {
      return Container();
    }
  }

  Widget getNormalTextField(
      BuildContext context,
      TextEditingController controller,
      TextInputType textInputType,
      String hintText,
      validCharacters,
      ValueChanged onChange,
      ValueChanged onSubmit,
      double fontSize,
      {int maxLength = 50,
      TextCapitalization textCapitalization = TextCapitalization.none,
      bool enabled = true}) {
    try {
      return TextField(
        style: TextStyle(fontSize: fontSize),
        controller: controller,
        textCapitalization: textCapitalization,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(validCharacters)),
        ],
        keyboardType: textInputType,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          // labelText: hintText,
          counterText: "",
          labelText: hintText,
          labelStyle: TextStyle(
              backgroundColor: Colors.transparent,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: fontSize),
          border: InputBorder.none,
          fillColor: const Color(0xffebf0f3),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xffebf0f3),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xffebf0f3),
            ),
          ),
        ),
        enabled: enabled,
        onChanged: onChange,
        maxLength: maxLength,
        onSubmitted: onSubmit,
      );
    } catch (exception) {
      return Container();
    }
  }

  Widget getOpenPopUpWidget(
    BuildContext context,
    TextEditingController textEditingController,
    String title,
    TextInputType textInputType,
    String regEx,
    VoidCallback onTap,
    double fontSize,
  ) {
    try {
      return InkWell(
        onTap: onTap,
        child: getNormalTextField(
          context,
          textEditingController,
          textInputType,
          title,
          regEx,
          (va) {},
          (_) {},
          fontSize,
          enabled: false,
        ),
      );
    } catch (exception) {
      return Container();
    }
  }

  Widget getCircularProgressIndicator(BuildContext context) {
    try {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          CircularProgressIndicator(),
        ],
      );
    } catch (exception) {
      return Container();
    }
  }

  // Future<bool?> getToastWidget(BuildContext context,String msg,Color textColor,double fontSize){
  //   return Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       textColor: textColor,
  //       backgroundColor: Colors.black,
  //       fontSize: fontSize);
  // }

  Widget getAlertDataPopUp(
      BuildContext context,
      String title,
      Color titleColor,
      double titleFontSize,
      Widget searchContainer,
      Widget contentWidget,
      double fontSize) {
    try {
      return AlertDialog(
        insetPadding: const EdgeInsets.all(15),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: searchContainer,
            ),
            // Expanded(
            //   flex: 1,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       CommonFunctions().performCancel(context);
            //     },
            //     child: Icon(Icons.close,size: 15),
            //   ),
            // )
          ],
        ),
        content: contentWidget,
      );
    } catch (exception) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: getNormalTextWidget(
                  context, "Choose City", titleColor, titleFontSize,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  CommonFunctions().performCancel(context);
                },
                child: const Icon(Icons.close, size: 15),
              ),
            )
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getNormalTextWidget(
                context, "Something went wrong", Colors.grey, fontSize),
            getNormalTextWidget(
                context, "Please try again later", Colors.grey, fontSize),
          ],
        ),
      );
    }
  }

  Widget getEmailTextField(
    BuildContext context,
    TextEditingController controller,
    TextInputType textInputType,
    String? hintText,
    ValueChanged onChange, {
    int maxLength = 50,
  }) {
    try {
      return TextField(
        controller: controller,
        keyboardType: textInputType,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          counterText: "",
          hintText: hintText,
          border: InputBorder.none,
          fillColor: const Color(0xffebf0f3),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xffebf0f3),
            ),
          ),
        ),
        onChanged: onChange,
        maxLength: maxLength,
      );
    } catch (exception) {
      return Container();
    }
  }

  Widget getSliderWidget(
      BuildContext context, minValue, maxValue, sliderValue, onChangePerform) {
    try {
      return SliderTheme(
        data: const SliderThemeData(
          showValueIndicator: ShowValueIndicator.always,
          valueIndicatorColor: Colors.black,
        ),
        child: Slider(
          min: minValue,
          max: maxValue,
          value: sliderValue,
          label: "\u{20B9} ${sliderValue.round()} L",
          onChanged: onChangePerform,
        ),
      );
    } catch (exception) {
      return Container();
    }
  }

  Widget getErrorMsgContainer(
      BuildContext context, String text, double fontSize,
      {AlignmentGeometry alignmentGeometry = Alignment.centerLeft}) {
    try {
      return Container(
        margin: const EdgeInsets.only(left: 10),
        alignment: alignmentGeometry,
        child: getNormalTextWidget(
          context,
          text,
          Colors.red,
          fontSize,
        ),
      );
    } catch (exception) {
      return Container();
    }
  }

  Widget getSmallButtonWidget(
      BuildContext context,
      buttonText,
      onTap,
      double fontSize,
      Color buttonTextColor,
      Color bgColor,
      Color borderColor) {
    try {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: CommonFunctions().getCalculatedHeightSized(context, 0.04),
          width: CommonFunctions().getCalculatedWidthSized(context, 0.3),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 2),
              color: bgColor,
              borderRadius: BorderRadius.circular(10)),
          child: getNormalTextWidget(
              context, buttonText, buttonTextColor, fontSize,
              fontWeight: FontWeight.bold),
        ),
      );
    } catch (exception) {
      return Container();
    }
  }

  Widget getPayEmiButtonWidget(
      BuildContext context,
      buttonText,
      Color buttonBGColor,
      Color borderColor,
      Color buttonTextColor,
      onTap,
      double width,
      double height,
      double fontSize) {
    try {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 2),
              color: buttonBGColor,
              borderRadius: BorderRadius.circular(10)),
          child: getNormalTextWidget(
              context, buttonText, buttonTextColor, fontSize,
              fontWeight: FontWeight.w500),
        ),
      );
    } catch (exception) {
      return Container();
    }
  }

  Future getToastWidget(
      {required BuildContext context,
      required String msg,
      required Toast toastLength,
      required ToastGravity gravity,
      required Color bgColor,
      required Color textColor,
      required double fontSize}) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: bgColor,
        textColor: textColor,
        fontSize: fontSize);
  }

  Widget getButtonWidget(
      BuildContext context, buttonText, onTap, double fontSize) {
    try {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: CommonFunctions().getCalculatedHeightSized(context, 0.06),
          // width: CommonFunctions().getCalculatedWidthSized(context, 0.8),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: ColorConstants.buttonBgColor,
              borderRadius: BorderRadius.circular(10)),
          child: getNormalTextWidget(
              context, buttonText, Colors.white, fontSize,
              fontWeight: FontWeight.w500),
        ),
      );
    } catch (exception) {
      return Container();
    }
  }

  Widget getRoundedButton(BuildContext context, Color buttonBGColor,
      String buttonText, Color buttonTextColor, double fontSize, onTap,
      {IconData icon = Icons.add}) {
    double height = 0;
    double iconHeight = 0;
    double width = 0;
    if (CommonFunctions().isLandscape(context)) {
      height = MediaQuery.of(context).size.width * 0.1;
      width = MediaQuery.of(context).size.width * 0.1;
    } else {
      height = MediaQuery.of(context).size.height * 0.08;
      width = MediaQuery.of(context).size.height * 0.08;
      iconHeight = MediaQuery.of(context).size.height * 0.03;
    }
    try {
      return InkWell(
        onTap: () {
          onTap();
          Navigator.of(context).pop();
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: buttonBGColor,
          ),
          // child: CommonWidgets().getNormalTextWidget(context, buttonText, buttonTextColor, fontSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Colors.indigo,
                size: iconHeight,
              ),
              getSizedBox(height: 3),
              getNormalTextWidget(
                  context, buttonText, buttonTextColor, fontSize),
            ],
          ),
        ),
      );
    } catch (exception) {
      return Container();
    }
  }

  getBottomSheetForClosingApp(
      BuildContext context, double sizedBoxHeight, double fontSize) async {
    double height = 0;
    if (CommonFunctions().isLandscape(context)) {
      height = MediaQuery.of(context).size.width * 0.2;
    } else {
      height = MediaQuery.of(context).size.height * 0.15;
    }

    try {
      return await showModalBottomSheet(
        backgroundColor: const Color(0xffebf0f3),
        context: context,
        builder: (context) {
          return Container(
            margin: const EdgeInsets.all(30),
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getNormalTextWidget(
                    context,
                    "Are you sure want to close the app ?",
                    Colors.black,
                    fontSize,
                    fontWeight: FontWeight.bold),
                getSizedBox(height: sizedBoxHeight),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        SystemChannels.platform
                            .invokeMethod('SystemNavigator.pop');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: CommonFunctions()
                            .getCalculatedWidthSized(context, 0.3),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: getNormalTextWidget(
                          context,
                          "Yes",
                          Colors.white,
                          fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: CommonFunctions()
                            .getCalculatedWidthSized(context, 0.3),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: ColorConstants.appPrimaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: getNormalTextWidget(
                          context,
                          "No",
                          Colors.white,
                          fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    } catch (exception) {
      return Container();
    }
  }

  getBottomSheet(BuildContext context, Widget child, double fontSize) async {
    double height = 0;
    if (CommonFunctions().isLandscape(context)) {
      height = MediaQuery.of(context).size.width * 0.3;
    } else {
      height = MediaQuery.of(context).size.height * 0.2;
    }

    try {
      return await showModalBottomSheet(
        backgroundColor: const Color(0xffebf0f3),
        context: context,
        builder: (context) {
          return Container(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                getNormalTextWidget(
                    context, "Choose Photo From", Colors.indigo, fontSize),
                child,
              ],
            ),
          );
        },
      );
    } catch (exception) {
      return Container();
    }
  }

  Widget getDropDownWidget(BuildContext context, String selectedDropDownValue,
      List<String> itemLists, Function onChangedValue, double fontSize) {
    try {
      return Container(
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            color: const Color(0xffebf0f3),
            borderRadius: BorderRadius.circular(10)),
        child: DropdownButton(
          isExpanded: true,
          value: selectedDropDownValue,
          items: itemLists.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: getNormalTextWidget(context, items, Colors.grey, fontSize,
                  fontWeight: FontWeight.bold),
            );
          }).toList(),
          underline: const SizedBox(),
          onChanged: (newValue) {
            onChangedValue(newValue);
          },
        ),
      );
    } catch (exception) {
      log("failed" + exception.toString());
      return Container();
    }
  }

  Widget getUploadDocumentWidget(
      BuildContext context,
      String title,
      Color titleColor,
      IconData icon,
      Color iconColor,
      double iconSize,
      double fontSize) {
    try {
      return Container(
        color: const Color(0xffebf0f3),
        child: DottedBorder(
          padding: const EdgeInsets.all(10.0),
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          dashPattern: const [5, 5],
          color: Colors.grey,
          strokeWidth: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: iconSize,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                    getNormalTextWidget(context, title, titleColor, fontSize),
              )
            ],
          ),
        ),
      );
    } catch (exception) {
      return Container();
    }
  }

  Widget getUploadedDocumentWidget(
      BuildContext context,
      File? idProofImage,
      String idFileName,
      IconData icon,
      Color iconColor,
      double iconSize,
      iconOnPressed,
      double fontSize) {
    try {
      return Container(
        color: const Color(0xffebf0f3),
        child: DottedBorder(
          padding: const EdgeInsets.all(5.0),
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          dashPattern: const [5, 5],
          color: Colors.grey,
          strokeWidth: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                child: Image.file(idProofImage!),
              ),
              Expanded(
                child: Container(
                  child: getNormalTextWidget(
                      context, idFileName, Colors.grey, fontSize),
                ),
              ),
              InkWell(
                onTap: iconOnPressed,
                child: Icon(
                  icon,
                  color: iconColor,
                  size: iconSize,
                ),
              ),
            ],
          ),
        ),
      );
    } catch (exception) {
      return Container();
    }
  }

  Widget documentUploadLoader(BuildContext context) {
    try {
      return Container(
        width: double.infinity,
        color: const Color(0xffebf0f3),
        child: DottedBorder(
          padding: const EdgeInsets.all(5.0),
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          dashPattern: const [5, 5],
          color: Colors.grey,
          strokeWidth: 2,
          child: Container(
              padding: const EdgeInsets.all(10),
              child: getCircularProgressIndicator(context)),
        ),
      );
    } catch (exception) {
      return Container();
    }
  }

  getLoaderWidget(
      {required BuildContext context,
      required String loaderTitle,
      required Color textColor,
      required String dialogName,
      required double fontSize}) {
    double height = 0;
    double width = 0;
    if (CommonFunctions().isLandscape(context)) {
      height = MediaQuery.of(context).size.width * 0.1;
      width = MediaQuery.of(context).size.height * 0.01;
    } else {
      height = MediaQuery.of(context).size.height * 0.1;
      width = MediaQuery.of(context).size.width * 0.01;
    }

    showDialog(
      context: context,
      barrierLabel: dialogName,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            alignment: Alignment.center,
            width: 0,
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  width: 30,
                ),
                CircularProgressIndicator(
                    color: ColorConstants.appPrimaryColor),
                const SizedBox(
                  width: 20,
                ),
                getNormalTextWidget(context, loaderTitle, textColor, fontSize),
              ],
            ),
          ),
        );
      },
    );
  }

  getLoaderWidgetForWeb(BuildContext context) {
    double height = 0;
    double width = 0;
    if (CommonFunctions().isLandscape(context)) {
      height = MediaQuery.of(context).size.width * 0.1;
      width = MediaQuery.of(context).size.height * 0.01;
    } else {
      height = MediaQuery.of(context).size.height * 0.1;
      width = MediaQuery.of(context).size.width * 0.01;
    }

    showDialog(
      useSafeArea: true,
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Dialog(
                insetPadding: EdgeInsets.zero,
                child: getLinearProgressIndicator(context),
              ),
            ],
          ),
        );
      },
    );
  }

  getSnakeBarWidget(BuildContext context, String title, Color bgColor,
      Color textColor, double fontSize) {
    final snackBar = SnackBar(
      content: getNormalTextWidget(context, title, textColor, fontSize),
      backgroundColor: bgColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
