
import 'package:wasa_inventory/utils/test2.dart';
import 'package:flutter/material.dart';
import 'package:wasa_inventory/fragments/bidirectionalscroll.dart';
import 'package:wasa_inventory/fragments/dashboard_fragment.dart';
import 'package:wasa_inventory/fragments/fargment_home_page.dart';
import 'package:wasa_inventory/fragments/first_fragment.dart';
import 'package:wasa_inventory/fragments/home_fragment.dart';
import 'package:wasa_inventory/fragments/requisition_issue.dart';
import 'package:wasa_inventory/fragments/second_fragment.dart';
import 'package:wasa_inventory/fragments/test.dart';
import 'package:wasa_inventory/fragments/SearchList.dart';
import 'package:wasa_inventory/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

    Future<LoginResponse> getUser() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      LoginResponse user = prefs.get("user");
      return user;
    }




    class HomePageDrawerParticipant extends StatefulWidget {
      final drawerItems = [
        new DrawerItem("Class Routine", Icons.dehaze),
        new DrawerItem("Class Content by CMT", Icons.dehaze),
        new DrawerItem("Weekly Atttendance Plan", Icons.dehaze),
        new DrawerItem("Exam Routine", Icons.dehaze),
        new DrawerItem("Speaker Evaluation", Icons.dehaze),

      ];




  @override
  State<StatefulWidget> createState() {
    return new HomePageDrawerParticipantState();
  }
}


String name='';
String warehouse='';
class HomePageDrawerParticipantState extends State<HomePageDrawerParticipant> {

  @override
  void initState() {
    super.initState();
    getCredential();
  }

  //String name,warehouse;

  SharedPreferences sharedPreferences;
  getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      bool checkValue = sharedPreferences.getBool("check");
      if (checkValue != null) {
        if (checkValue) {
           warehouse= sharedPreferences.getString("warehouse");
           name = sharedPreferences.getString("username");

        } else {

          sharedPreferences.clear();
        }
      } else {
        checkValue = false;
      }
    });
  }



  int _selectedDrawerIndex = 0;


  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Fragment_home_page();
      case 1:
        return new SearchList();
      case 2:
        return new Bidirectional();
      case 3:
        return new Next();
      case 4:
        return new SearchList();
      case 5:
        return new SearchList();
      case 6:
        return new SearchList();
      case 7:
        return new SearchList();
      case 8:
        return new SearchList();

      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )

      );
    }



    return new Scaffold(
      appBar: new AppBar(


        actions: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new GestureDetector(
                      onTap: (){
                        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstFragment()));
                      },
                      child: new Container(
                        margin: EdgeInsets.only(right: 10),
                        child: new Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage('https://avatars2.githubusercontent.com/u/17681888?s=400&u=010445b61e6af342689d0dbf6fd81e47563d0c8c&v=4'),
                              ),
                              new Text(
                                "Sadi",
                              ),
                            ]
                        ),
                      )
                  ),
                ],
              ),

              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new GestureDetector(
                      onTap: (){
                       //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstFragment()));
                       },
                  child: new Container(
                  child: new Column(
                  children: [
                    new Text("10"),

                    Icon(
                    Icons.notifications,
                    size:22,
                    color: Colors.deepOrange,
                  ),
                  new Text(
                    "Requisition",
                  ),
                ]
                  ),
                )
              ),
                ],
                  ),

              new Container(
                padding: const EdgeInsets.only(right: 5.0),

              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new GestureDetector(
                      onTap: (){
                        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstFragment()));
                      },
                      child: new Container(
                        child: new Column(
                            children: [
                              new Text("0"),

                              Icon(
                                Icons.notifications,
                                size:22,
                                color: Colors.deepPurple,
                              ),
                              new Text(
                                "Stock transfer",
                              ),
                            ]
                        ),
                      )
                  ),
                ],
              ),

              new Container(
                padding: const EdgeInsets.only(right: 5.0),

              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new GestureDetector(
                      onTap: (){
                        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstFragment()));
                      },
                      child: new Container(
                        child: new Column(
                            children: [
                              new Text("0"),

                              Icon(
                                Icons.notifications,
                                size:22,
                                color: Colors.amber,
                              ),
                              new Text(
                                "Loan",
                              ),
                            ]
                        ),
                      )
                  ),
                ],
              ),
              new Container(
                padding: const EdgeInsets.only(right: 15.0),

              ),
            ],

          ),

        ],

      ),
      drawer: new Drawer(

        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: <Widget>[
        new UserAccountsDrawerHeader(
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage('https://avatars2.githubusercontent.com/u/17681888?s=400&u=010445b61e6af342689d0dbf6fd81e47563d0c8c&v=4'),

                ),

          accountName: new Text(name),
          accountEmail: new Text(warehouse),

        ),

    new Column(
                children: drawerOptions

            ),
//            ListTile(
//              title: Text('Item 1'),
//              onTap: () {
//                // Update the state of the app
//                // ...
//                // Then close the drawer
//                Navigator.pop(context);
//              },
//            ),
//            ListTile(
//              title: Text('Item 2'),
//              onTap: () {
//                // Update the state of the app
//                // ...
//                // Then close the drawer
//                Navigator.pop(context);
//              },
//            ),
//
//        ListTile(
//          title: Text('Item 2'),
//          onTap: () {
//            // Update the state of the app
//            // ...
//            // Then close the drawer
//            Navigator.pop(context);
//          },
//        ),
//
//
//        ListTile(
//          title: Text('Item 2'),
//          onTap: () {
//            // Update the state of the app
//            // ...
//            // Then close the drawer
//            Navigator.pop(context);
//          },
//        ),
//
//
//        ListTile(
//          title: Text('Item 2'),
//          onTap: () {
//            // Update the state of the app
//            // ...
//            // Then close the drawer
//            Navigator.pop(context);
//          },
//        ),
//
//        ListTile(
//          title: Text('Item 2'),
//          onTap: () {
//            // Update the state of the app
//            // ...
//            // Then close the drawer
//            Navigator.pop(context);
//          },
//        ),
//
//        ListTile(
//          title: Text('Item 2'),
//          onTap: () {
//            // Update the state of the app
//            // ...
//            // Then close the drawer
//            Navigator.pop(context);
//          },
//        ),
//
//        ListTile(
//          title: Text('Item 2'),
//          onTap: () {
//            // Update the state of the app
//            // ...
//            // Then close the drawer
//            Navigator.pop(context);
//          },
//        ),
//
//        ListTile(
//          title: Text('Item 2'),
//          onTap: () {
//            // Update the state of the app
//            // ...
//            // Then close the drawer
//            Navigator.pop(context);
//          },
//        ),
//        ListTile(
//          title: Text('Item 2'),
//          onTap: () {
//            // Update the state of the app
//            // ...
//            // Then close the drawer
//            Navigator.pop(context);
//          },
//        ),

          ],
        ),

//        child: new Column(
//          children: <Widget>[
//            new UserAccountsDrawerHeader(
//                currentAccountPicture: const CircleAvatar(
//                  backgroundImage: NetworkImage('https://avatars2.githubusercontent.com/u/17681888?s=400&u=010445b61e6af342689d0dbf6fd81e47563d0c8c&v=4'),
//
//                ),
//                accountName: new Text(name.toString()),
//                accountEmail: new Text("ghghg")),
////            new Column(
////                children: drawerOptions
////
////            ),
//
//
//
//
//            LayoutBuilder(
//              builder: (BuildContext context, BoxConstraints viewportConstraints) {
//                return SingleChildScrollView(
//                  child: ConstrainedBox(
//                    constraints: BoxConstraints(
//                      minHeight: viewportConstraints.maxHeight,
//                    ),
//                    child: Column(
//                      children: <Widget>[
//                        ListTile(
//                          leading: new Icon(Icons.dehaze),
//                          title: new Text("Requisition"),
//                        ),
//
//                        ListTile(
//                          leading: new Icon(Icons.dehaze),
//                          title: new Text("Requisition"),
//                        ),
//
//                        ListTile(
//                          leading: new Icon(Icons.dehaze),
//                          title: new Text("Requisition"),
//                        ),
//
//
//                        ListTile(
//                          leading: new Icon(Icons.dehaze),
//                          title: new Text("Requisition"),
//                        ),
//
//
//                        ListTile(
//                          leading: new Icon(Icons.dehaze),
//                          title: new Text("Requisition"),
//                        ),
//
////                        Container(
////                          // A fixed-height child.
////
////                          color: Colors.yellow,
////                          height: 120.0,
////                        ),
////                        Container(
////                          // Another fixed-height child.
////                          color: Colors.green,
////                          height: 120.0,
////                        ),
//                      ],
//                    ),
//                  ),
//                );
//              },
//            )
//
//
//
//          ],
//        ),

      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),

    );
  }



}
