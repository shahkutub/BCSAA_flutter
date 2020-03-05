import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesTest {


  addStringUserNameSF(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', "data");
  }


  addIntToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('intValue', 123);
  }

  addDoubleToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('doubleValue', 115.0);
  }


  getValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('username');
    //Return bool
    bool boolValue = prefs.getBool('boolValue');
    //Return int
    int intValue = prefs.getInt('intValue');
    //Return double
    double doubleValue = prefs.getDouble('doubleValue');
  }

  getUserNameSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('username');

  }


}