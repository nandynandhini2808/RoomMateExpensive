
class RMERegExp{
  final charOnlyForTextField = '^[a-zA-Z_ ]*';
  final numberOnlyForTextField = '[0-9]';
  final pinCodeRegEx = r'^[1-9][0-9]*$';
  final panCodeRegEx = '^[A-Z0-9]*';
  final emailRegEx = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  final capsAndNumbersForTextField = '[A-Z0-9]';
  final charAndNumberForTextField = '[a-zA-Z0-9_ \u0900-\u097F]';
  final supportAllFieldsForTextField = '[a-zA-Z0-9_ \u0020-\u007E-\u0024-\u00A9]';
  final emailForTextField = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
}
