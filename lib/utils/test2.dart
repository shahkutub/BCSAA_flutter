import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
String _email='';
class Next extends StatefulWidget {

  _NextState __nextState = _NextState();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return __nextState;
  }


//  @override
//  _NextState createState() => _NextState();


}

class _NextState extends State<Next> {
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      // read
      //final myString = prefs.getString('my_string_key') ?? '';
// write
    //  prefs.setString('email', 'test@mail.com');

      _email = (prefs.getString('username')??'');
    });
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      child: new Text("read value from sharepreference is:"+_email),
    );
  }
}