import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';
import 'dart:io';
import 'package:wasa_inventory/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasa_inventory/pages/home_page_drower.dart';
import 'package:wasa_inventory/utils/Appconstant.dart';
import 'package:wasa_inventory/utils/SharedPreferencesTest.dart';
import 'package:wasa_inventory/utils/globals.dart';
void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'New contact'),
    );
  }
}

class LoginResponse {

  //errormsg,successmsg,authentication_access
   String errormsg,successmsg,authentication_access;

   Authentication_info authentication_info = new Authentication_info();

   Logged_session_data logged_session_data = new Logged_session_data();


   LoginResponse({this.errormsg, this.successmsg, this.authentication_access,this.authentication_info,this.logged_session_data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      errormsg: json['errormsg'],
      successmsg: json['successmsg'],
      authentication_access: json['authentication_access'],
      authentication_info:Authentication_info.fromJson(json['authentication_info']),
        logged_session_data:Logged_session_data.fromJson(json['logged_session_data'])
    );
  }
}

 class Logged_session_data {



  String id,salutation,name,email,usertype,role,status,provider,provider_key,store_username,store_password,library_username,
      library_password,library_staff_username,library_staff_password;


  Logged_session_data({this.id, this.salutation, this.name, this.email,
      this.usertype, this.role, this.status, this.provider, this.provider_key,
      this.store_username, this.store_password, this.library_username,
      this.library_password, this.library_staff_username,
      this.library_staff_password});

  factory Logged_session_data.fromJson(Map<String, dynamic> json) {
    return Logged_session_data(
        id: json['id'],
        salutation: json['salutation'],
        name: json['name'],
        email: json['email'],
        usertype: json['usertype'],
        role: json['role'],
        status: json['status'],
        provider: json['provider'],
      provider_key: json['provider_key'],
      store_username: json['store_username'],
      store_password: json['store_password'],
      library_username: json['library_username'],
      library_password: json['library_password'],
      library_staff_username: json['library_staff_username'],
      library_staff_password: json['library_staff_password'],
    );
  }

 }


class Authentication_info {
  String email,password,oldauthenticate_code;

   Authentication_info({this.email, this.password, this.oldauthenticate_code});

  factory Authentication_info.fromJson(Map<String, dynamic> json) {
    return Authentication_info(
      email: json['email'],
      password: json['password'],
      oldauthenticate_code: json['oldauthenticate_code']
    );
  }
}




 bool connectivity(){
   var connectivityResult =  (new Connectivity().checkConnectivity());
   if (connectivityResult == ConnectivityResult.mobile) {
     return true;
   } else if (connectivityResult == ConnectivityResult.wifi) {
     return true;
   }else{
     return false;
   }
 }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool checkValue = false;

  SharedPreferences sharedPreferences;


  LoginResponse data;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passWordController = new TextEditingController();

  GlobalKey<FormState> _key = new GlobalKey();
  bool _autoValidate = false;
  String _email;
  String password;
  int _state = 0;
  @override
  Widget build(BuildContext context) {

    return new Scaffold(

      body: new Form(

        key: _key,
        autovalidate: _autoValidate,

        child: new Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Image.asset('images/bcs.png', scale: 1.0, width: 200.0, height: 200.0),
            new ListTile(
              leading: const Icon(Icons.person),
              title: new TextFormField(

                //validator: validateEmail,
                onSaved: (String val) {
                  _email = val;
                },
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: new TextStyle(
                    fontSize: 20.0,
                    height: 2.0,
                    color: Colors.black
                ),
                decoration: new InputDecoration(
                  hintText: "Email",
                ),

              ),
            ),

            new ListTile(
              leading: const Icon(Icons.enhanced_encryption),
              title: new TextFormField(

                //validator: validatePassWord,
                onSaved: (String val) {
                  password = val;
                },
                controller: passWordController,
                obscureText: true,
                style: new TextStyle(
                    fontSize: 20.0,
                    height: 2.0,
                    color: Colors.black
                ),
                decoration: new InputDecoration(
                  hintText: "Password",

                ),
              ),
            ),


            new Container(
              margin: const EdgeInsets.only(top: 40.0),
              width: 200.0,
              height: 50.0,
              child :  new RaisedButton(
                textColor: Colors.white,
                //child: const Text(' Sign In   '),
                color: Theme.of(context).accentColor,
                elevation: 8.0,
                splashColor: Colors.blueGrey,
                //onPressed: _sendToServer,
                child: setUpButtonChild(),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageDrawerParticipant()));
                 // _sendToServer();
                },

//            onPressed: () {
//              return showDialog(
//                context: context,
//                builder: (context) {
//                  return AlertDialog(
//                    // Retrieve the text the user has typed in using our
//                    // TextEditingController
//                    content: Text(emailController.text),
//                  );
//                },
//              );
//            },

              ),
            ),

          ],
        ),
      ),


    );
  }


  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        " Sign In",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

//    Timer(Duration(milliseconds: 3300), () {
//      setState(() {
//        _state = 2;
//      });
//    });
  }

  static Future<Map> postData(Map data) async {
    http.Response res = await http.post("", body: {'Email': 'doodle', 'color': 'blue'}); // post api call
    Map data = json.decode(res.body);
    return data;
  }

  Future<LoginResponse> fetchPost(String email,String pass) async {

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('no connected');
      }
    } on SocketException catch (_) {
      print('not connected');
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has typed in using our
            // TextEditingController
            content: Text("No Internet Connection!"),
          );
        },
      );
    }

    setState(() {
      if (_state == 0) {
        animateButton();
      }
    });

    http.Response response = await http.post("http://123.49.41.11/api/login", body: {'email': email, 'password': pass}); // post api call
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
     final LoginResponse data = LoginResponse.fromJson(json.decode(response.body));
      //_saveValues(data.user);
     setState(() {
       _state = 2;
      // _onChanged(true,data.user.full_name,data.user.warehouse_name,data.user.warehouse_id);
     });



//     SharedPreferencesTest.setString(Appconstant.name,data.user.full_name);
//     saveUserData(data.user.full_name,data.user.warehouse_name);

//            return showDialog(
//                context: context,
//                builder: (context) {
//                  return AlertDialog(
//                    // Retrieve the text the user has typed in using our
//                    // TextEditingController
//                    content: Text(data.user.warehouse_name),
//                  );
//                },
//              );

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageDrawerParticipant()));
//      Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => HomePage()),
//      );
      //dispose();

    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }




//  _saveValues(User user) async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.setString("user", user.toString());
//  }



  Future<bool> connectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      print('not connected');
    }
  }

  void toast_show() {
    showToast("content");
  }

//  void _showToast(BuildContext context) {
//    final scaffold = Scaffold.of(context);
//    scaffold.showSnackBar(
//      SnackBar(
//        content: const Text('Added to favorite'),
//        action: SnackBarAction(
//            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
//      ),
//    );
//  }


  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }


  String validatePassWord(String value) {

    if (value.length == 0) {
      return "Password is Required";
    }
//    else if (value.length < 6) {
//      return "Password must be 6 digit";
//    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if(value.length != 10){
      return "Mobile number must 10 digits";
    }else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if(!regExp.hasMatch(value)){
      return "Invalid Email";
    }else {
      return null;
    }
  }


  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print("Email $_email");
      print("Password $password");

      fetchPost(_email,password);


//      if(!connectivity()){
//              return showDialog(
//                context: context,
//                builder: (context) {
//                  return AlertDialog(
//                    // Retrieve the text the user has typed in using our
//                    // TextEditingController
//                    content: Text("No internet connection!"),
//                  );
//                },
//              );
//      }else{
//
//      }



    } else {
      // validation error
      setState(() {
        _autoValidate= true;
      });
    }
  }


  _saveValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", "");
    prefs.setString("phone", "");
  }

  getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//    nameController.text = prefs.getString("name");
//    phoneController.text = prefs.getString("phone");
  }




  saveUserData(String name,String warehouse) async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {

      sharedPreferences.setString("username", name);
      sharedPreferences.setString("warehouse", warehouse);
      sharedPreferences.commit();
    });
  }

  _onChanged(bool value,String username,String warehouse,String warehouseid) async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = value;
      sharedPreferences.setBool("check", checkValue);
      sharedPreferences.setString("username", username);
      sharedPreferences.setString("warehouse", warehouse);
      sharedPreferences.setString("warehouseid", warehouseid);
      sharedPreferences.commit();
     // getCredential();
    });
  }

  getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = sharedPreferences.getBool("check");
      if (checkValue != null) {
        if (checkValue) {
          String warehouse= sharedPreferences.getString("warehouse");
          String username = sharedPreferences.getString("username");

        } else {

          sharedPreferences.clear();
        }
      } else {
        checkValue = false;
      }
    });
  }

}