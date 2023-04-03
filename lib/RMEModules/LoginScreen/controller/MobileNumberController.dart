import 'package:flutter/material.dart';

class MobileNumberWithOtpController extends ChangeNotifier{
  FocusNode mobileNumberFocusNode = FocusNode();
  TextEditingController mobileNumberController = TextEditingController();

 updateUI(){
    notifyListeners();
  }

}