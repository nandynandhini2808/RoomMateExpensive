
import 'package:room_mate_expensive/RMECommonFunctions/CommonFunctions.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SharedPref {

  void storeStringInSharedPreference(String key, String value) async {
    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await  sharedPreferences.setString(key, value);
    }catch(exception){
      CommonFunctions().printItem("storeStringInSharedPreference not stored $exception");
    }
  }

  Future<void> storeBoolInSharedPreference(String key, bool value) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setBool(key, value);
    } catch (exception) {
      CommonFunctions().printItem("storeBoolInSharedPreference not stored $exception");
    }
  }

  Future<bool> getBoolValueInSharedPreference(String key) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getBool(key) ?? false;
    } catch (exception) {
      CommonFunctions().printItem("getBoolValueInSharedPreference not retrive $exception");
      return false;
    }
  }

  Future<String> getStringValueInSharedPreference(String key)async{
    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getString(key) ?? "";
    }catch(exception){
      CommonFunctions().printItem("getStringValueInSharedPreference not retrive $exception");
      return "";
    }
  }
}