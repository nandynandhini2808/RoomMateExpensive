import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:room_mate_expensive/RMECommonFunctions/CommonFunctions.dart';
import 'package:room_mate_expensive/RMECommonWidgets/ColorConstants.dart';
import 'package:room_mate_expensive/RMECommonWidgets/CommonWidgets.dart';
import 'package:room_mate_expensive/RMECommonWidgets/StringConstants.dart';
import 'package:room_mate_expensive/RMEComponents/IconAssets/Icon_Assets.dart';
import 'package:room_mate_expensive/RMEComponents/RegExp.dart';
import 'package:room_mate_expensive/RMEComponents/SharedPref.dart';
import 'package:room_mate_expensive/RMEModules/LoginScreen/controller/MobileNumberController.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  double fontSize = 0;
  double textFieldFontSize = 0;
  double titleFontSize = 0;
  double errorFontSize = 0;
  double primaryHeightSpacer = 0;
  bool isLandscape = false;
  double appBarHeight = 0;
  double secondaryHeightSpacer = 0;
  double stepperHeight = 0;

  Widget bodyContainer = Container();
  Widget footerContainer = Container();
  CommonWidgets commonWidgets = CommonWidgets();
  CommonFunctions commonFunctions = CommonFunctions();
  SharedPref sharedPref = SharedPref();

  StringConstants stringConstants = StringConstants();

  Future<bool> onWillPop() {
    try {
      return commonWidgets.getBottomSheetForClosingApp(context, 20, fontSize);
    } catch (exception, stackTrace) {
      return false as Future<bool>;
    }
  }

  void backNavigation() {
    try {
      commonFunctions.backNavigatePage(context,
          navigationScreen: LoginScreenView(),
          currentScreen: LoginScreenView());
    } catch (exception) {}
  }

  @override
  Widget build(BuildContext context) {
    titleFontSize = commonFunctions.getTitleFontSizeWithValue(context, 0.03);
    fontSize = commonFunctions.getFontSize(context);
    textFieldFontSize = commonFunctions.getTextFieldFontSize(context);
    errorFontSize = commonFunctions.getErrorFontSize(context);
    stepperHeight = commonFunctions.getMediaQueryCalculation(context, 0.18);
    primaryHeightSpacer = MediaQuery.of(context).size.height * 0.3;
    secondaryHeightSpacer = MediaQuery.of(context).size.width * 0.02;
    footerContainer = makeFooterContainer(context);
    bodyContainer = makeBodyContainer(context);
    return commonWidgets.getNewScaffoldWithAppBarImage(
        context: context,
        title: "",
        bodyContainer: bodyContainer,
        onWillPop: onWillPop,
        titleFontSize: titleFontSize,
        fontSize: fontSize,
        bottomWidget: footerContainer,
        appBar: commonWidgets.getAppBar(context, () {}, fontSize));
  }

  Widget makeFooterContainer(BuildContext context) {
    try {
      return Consumer<MobileNumberWithOtpController>(
          builder: (context, MobileNumberWithOtpController controller, widget) {
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal:
                  commonFunctions.getMediaQueryCalculation(context, 0.04)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  commonWidgets.getTextFieldWidget(
                    context,
                    RMERegExp().supportAllFieldsForTextField,
                    placeHolder: stringConstants.mobileText,
                    controller: controller.mobileNumberController,
                    prefix: commonWidgets.getSizedBox(),
                    suffix: SvgPicture.asset(
                      IconAssets.mobileIcon,
                      color: ColorConstants.iconColor,
                      fit: BoxFit.none,
                    ),
                    focusNode: controller.mobileNumberFocusNode,
                    textInputType: TextInputType.number,
                    textCapitalization: TextCapitalization.none,
                    textInputAction: TextInputAction.done,
                    textAlign: TextAlign.start,
                    autoFocus: false,
                    maxLines: 1,
                    minLines: 1,
                    maxLength: 10,
                    onChange: (value) {
                      // controller.errorMessage= "";
                      if (controller.mobileNumberController.text.length == 10) {
                        FocusScope.of(context)
                            .requestFocus(controller.mobileNumberFocusNode);
                      }
                      controller.updateUI();
                    },
                    onSubmitted: (value) {},
                    enabled: true,
                    onTap: () {},
                    heightSpacer: secondaryHeightSpacer,
                    textFieldFontSize: textFieldFontSize,
                    fontSize: fontSize,
                  ),
                  commonWidgets.getSizedBox(height: secondaryHeightSpacer),
                  commonWidgets.getTextFieldWidget(
                    context,
                    RMERegExp().supportAllFieldsForTextField,
                    placeHolder: stringConstants.passwordText,
                    controller: controller.mobileNumberController,
                    prefix: commonWidgets.getSizedBox(),
                    suffix: SvgPicture.asset(
                      IconAssets.passwordEyeIcon,
                      color: ColorConstants.iconColor,
                      fit: BoxFit.none,
                    ),
                    focusNode: controller.mobileNumberFocusNode,
                    textInputType: TextInputType.text,
                    textCapitalization: TextCapitalization.none,
                    textInputAction: TextInputAction.done,
                    textAlign: TextAlign.start,
                    autoFocus: false,
                    maxLines: 1,
                    minLines: 1,
                    maxLength: 10,
                    onChange: (value) {
                      // controller.errorMessage= "";
                      if (controller.mobileNumberController.text.length == 10) {
                        FocusScope.of(context)
                            .requestFocus(controller.mobileNumberFocusNode);
                      }
                      controller.updateUI();
                    },
                    onSubmitted: (value) {},
                    enabled: true,
                    onTap: () {},
                    heightSpacer: secondaryHeightSpacer,
                    textFieldFontSize: textFieldFontSize,
                    fontSize: fontSize,
                  ),
                  commonWidgets.getSizedBox(height: secondaryHeightSpacer),
                  commonWidgets.getButtonWidget(
                      context,
                      StringConstants().loginText,
                      //      () {
                      //   controller.validateField(context, fontSize);
                      // }
                      null,
                      fontSize),
                  commonWidgets.getSizedBox(height: secondaryHeightSpacer),
                ],
              ),
              commonWidgets.getSizedBox(
                  height:
                      commonFunctions.getCalculatedHeightSized(context, 0.04)),
              Center(
                child: SizedBox(
                  width: commonFunctions.getCalculatedWidthSized(context, 0.8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          commonWidgets.getNormalTextWidget(
                              context,
                              "Privacy Policy  ",
                              ColorConstants.textColor,
                              fontSize,
                              TextDecoration: TextDecoration.underline),
                          commonWidgets.getNormalTextWidget(
                              context,
                              "|  Terms & Conditions",
                              ColorConstants.textColor,
                              fontSize,
                              TextDecoration: TextDecoration.underline),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              commonWidgets.getSizedBox(
                  height:
                      commonFunctions.getCalculatedHeightSized(context, 0.04)),
            ],
          ),
        );
      });
    } catch (exception) {
      return Container();
    }
  }

  Widget makeBodyContainer(BuildContext context) {
    try {
      return Consumer<MobileNumberWithOtpController>(
          builder: (context, MobileNumberWithOtpController controller, widget) {
        return getMainBodyWidget(context, controller);
      });
    } catch (exception) {
      return Container();
    }
  }

  Widget getMainBodyWidget(
      BuildContext context, MobileNumberWithOtpController controller) {
    try {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: commonFunctions.getMarginValueForHorizontal(context),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              commonWidgets.getSizedBox(
                height: commonFunctions.getCalculatedHeightSized(context, 0.15),
              ),
              commonWidgets.getTitleWidget(context,
                  title: stringConstants.loginText,
                  primaryHeightSpacer: primaryHeightSpacer,
                  // trailingHeightSpacer: secondaryHeightSpacer,
                  titleFontSize: titleFontSize,
                  fontSize: fontSize),
            ],
          ),
        ),
      );
    } catch (exception) {
      return const SizedBox();
    }
  }
}
