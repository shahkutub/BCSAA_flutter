
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bidirectional_scroll_view/bidirectional_scroll_view.dart';
class Fragment_home_page extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Fragment_home_page_state();
  }

}

class Fragment_home_page_state extends State<Fragment_home_page>{

  String _timeString;
  String _dateString ;
  @override
  void initState() {
    _timeString = _formatTime(DateTime.now());
    _dateString = _formatDate(DateTime.now());

    _getDate();

    Timer.periodic(
        Duration(seconds: 1), (Timer t) => _getTime()
    );

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List <DataModel> listTitle = new List();

    DataModel dataModel = new DataModel('name', 'username', 'id', 'email', 'mobile');
    DataModel dataMode2 = new DataModel('sadi2', 'shah2', '1', 'sadi@mail.com', '01723335972');
    DataModel dataMode3 = new DataModel('sadi3', 'shah3', '1', 'sadi@mail.com', '01723335972');
    DataModel dataMode4 = new DataModel('sadi4', 'shah4', '1', 'sadi@mail.com', '01723335972');
    DataModel dataMode5 = new DataModel('sadi5', 'shah5', '1', 'sadi@mail.com', '01723335972');

    listTitle.add(dataModel);
    listTitle.add(dataMode2);
    listTitle.add(dataMode3);
    listTitle.add(dataMode4);
    listTitle.add(dataMode5);

    String name = listTitle.elementAt(3).username;
    debugPrint('name: $name');


    List <String> listRow = new List();



    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(

        children: <Widget>[

          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new InkWell(
                    child: new Container(
                      margin: EdgeInsets.only(left: 0.0,top: 10.0,right: 0.0,bottom: 5.0),
                      width: 150.0,
                      height: 40.0,
                      decoration: new BoxDecoration(
                        color: Colors.blue,
                        border: new Border.all(color: Colors.white, width: 2.0),
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: new Center(child: new Text(_dateString, style: new TextStyle(fontSize: 18.0, color: Colors.white),),),
                    ),
                  ),
                ],
              ),

              new Container(
                padding: const EdgeInsets.only(right: 3.0),

              ),

              new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new InkWell(

                    child: new Container(
                      margin: EdgeInsets.only(left: 0.0,top: 10.0,right: 0.0,bottom: 5.0),
                      width: 150.0,
                      height: 40.0,
                      decoration: new BoxDecoration(
                        color: Colors.red,
                        border: new Border.all(color: Colors.white, width: 2.0),
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: new Center(child: new Text(_timeString,
                        style: new TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          new Container(
            child: new Card(
              child: new Container(
                decoration:new BoxDecoration(
                    color: Colors.white70
                ),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: new BoxDecoration(
                          color: Colors.black12
                      ),
                      child: new Column(
                        children: <Widget>[
                          new Row(

                            children: <Widget>[
                              new Icon(
                                Icons.collections_bookmark,
                                size: 30.0,

                              ),
                              new Text("  Law and Administration Course",
                                style: new TextStyle(fontSize: 15.0, color: Colors.black),
                              ),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new Text("Batch : ",
                                style: new TextStyle(fontSize: 18.0, color: Colors.black,fontWeight: FontWeight.bold),
                              ),
                              new Text("LAC115",
                                style: new TextStyle(fontSize: 15.0, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ),

                    new Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: new BoxDecoration(
                          color: Colors.white
                      ),
                      child: new Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new Icon(
                                Icons.fiber_manual_record,
                                size: 10.0,
                              ),
                              new Text("Course Coordinator : ",
                                style: new TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.bold),
                              ),

                              Flexible (child: Text(' Md. Nazmul Ahsan',style: new TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.normal))),
//                              new Text(" Md. Nazmul Ahsan",
//                                style: new TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.normal),
//                              ),
                            ],
                          ),

                          new Row(
                            children: <Widget>[
                              new Icon(
                                Icons.fiber_manual_record,
                                size: 10.0,
                              ),
                              new Text("Course Adviser : ",
                                style: new TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.bold),
                              ),
                              new Text(" Md. Nazmul Ahsan",
                                style: new TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),

                          new Row(
                            children: <Widget>[
                              new Icon(
                                Icons.fiber_manual_record,
                                size: 10.0,
                              ),
                              new Text("Course Director : ",
                                style: new TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.bold),
                              ),
                              new Text(" Md. Nazmul Ahsan",
                                style: new TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),

                          new Row(
                            children: <Widget>[
                              new Icon(
                                Icons.fiber_manual_record,
                                size: 10.0,
                              ),
                              new Text("Assistant Course Coordinator : ",
                                style: new TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.bold),
                              ),

                              Flexible (child: Text(' SAIKA SHAHADAT',style: new TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.normal))),

//                              new Text(" Md. Nazmul Ahsan",
//                                style: new TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.normal),
//                              ),
                            ],
                          ),

                        ],
                      ),

                    ),


                  ],
                ),

              ),
            ),
            
          ),

          new Container(
            child: new Card(
              child: new Container(
                decoration:new BoxDecoration(
                    color: Colors.white70
                ),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: new BoxDecoration(
                          color: Colors.black12
                      ),
                      child: new Column(
                        children: <Widget>[
                          new Row(

                            children: <Widget>[
                              new Icon(
                                Icons.watch_later,
                                size: 30.0,

                              ),
                              new Text("Class Routine",
                                style: new TextStyle(fontSize: 15.0, color: Colors.black),
                              ),
                            ],
                          ),

                        ],
                      ),

                    ),

                    new Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: new BoxDecoration(
                          color: Colors.white
                      ),
                      child: new Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[

                              new Text("Dress for Male : ",
                                style: new TextStyle(fontSize: 12.0, color: Colors.black,fontWeight: FontWeight.bold),
                              ),

                              Flexible (child: Text('  White Shirt, Black Pant, Black Shoe, Green/Maron/Blue Tie',
                                  style: new TextStyle(fontSize: 12.0, color: Colors.black,fontWeight: FontWeight.bold))),
//                              new Text(" Md. Nazmul Ahsan",
//                                style: new TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.normal),
//                              ),
                            ],
                          ),

                          new Row(
                            children: <Widget>[

                              new Text("Dress for Female : ",
                                style: new TextStyle(fontSize: 12.0, color: Colors.black,fontWeight: FontWeight.bold),
                              ),

                              Flexible (child: Text('Sharee, Toe Covered Black Shoe',
                                  style: new TextStyle(fontSize: 12.0, color: Colors.black,fontWeight: FontWeight.bold))),

                            ],
                          ),


                        ],
                      ),

                    ),

                    new Container(
                      height: 210.0,
                      decoration: new BoxDecoration(
                          color: Colors.black38
                      ),
                      child: new MyList(),
                    ),

                  ],
                ),

              ),
            ),

          ),



        ],
      ),
    );
  }


            void _getTime() {
              final DateTime now = DateTime.now();
              final String formattedDateTime = _formatTime(now);
              setState(() {
                _timeString = formattedDateTime;
              });
            }

            void _getDate() {
              final DateTime now = DateTime.now();
              final String formattedDateTime = _formatDate(now);
              setState(() {
                _dateString = formattedDateTime;
              });
            }

            String _formatTime(DateTime dateTime) {
              return DateFormat('HH:mm:ss a').format(dateTime);
            }

            String _formatDate(DateTime dateTime) {
              return DateFormat('EEE, MMM d, yy').format(dateTime);
            }



          }

          class DataModel {
            String name,username,userid,email,mobile;

            DataModel(this.name, this.username, this.userid, this.email, this.mobile);

          }


          class MyList extends StatefulWidget {
            MyList({Key key}) : super(key: key);

            @override
            _MyAppState createState() => _MyAppState();
          }

          class _MyAppState extends State<MyList> {
            @override
            Widget build(BuildContext context) {

              User selectedUser;
              List<User> users = <User>[const User('Foo'), const User('Bar')];

              List <DataModel> listTitle = new List();

//              DataModel dataModel = new DataModel('name', 'username', 'id', 'email', 'mobile');
//              DataModel dataMode2 = new DataModel('sadi2', 'shah2', '1', 'sadi@mail.com', '01723335972');
//              DataModel dataMode3 = new DataModel('sadi3', 'shah3', '1', 'sadi@mail.com', '01723335972');
//              DataModel dataMode4 = new DataModel('sadi4', 'shah4', '1', 'sadi@mail.com', '01723335972');
//              DataModel dataMode5 = new DataModel('sadi5', 'shah5', '1', 'sadi@mail.com', '01723335972');
//              DataModel dataMode6 = new DataModel('sadi6', 'shah6', '6', 'sadi@mail.com', '01723335972');
//
//              listTitle.add(dataModel);
//              listTitle.add(dataMode2);
//              listTitle.add(dataMode3);
//              listTitle.add(dataMode4);
//              listTitle.add(dataMode5);
//              listTitle.add(dataMode6);
//              listTitle.add(dataMode3);

              for (var i = 0; i < 10; i++) {
                if(i==0){
                  DataModel dataModel = new DataModel('name', 'username', 'id', 'email', 'mobile');
                  listTitle.add(dataModel);
                }else{
                  DataModel dataMode2 = new DataModel('sadi2', 'shah2', '1', 'sadi@mail.com', '01723335972');
                  listTitle.add(dataMode2);
                }
              }


              String name = listTitle.elementAt(3).username;
              debugPrint('name: $name');


              List <String> listRow = new List();

              String dropdownValue = 'One';

    return new Scaffold(
      body: new SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: new SizedBox(
          width: 1500.0,
          child: new ListView.builder(
            itemCount: listTitle.length,
            itemBuilder: (BuildContext context, int i) {
              //log('ipos: $i');
              //debugPrint('ipos: $i');
              listRow.clear();

              listRow.add(listTitle.elementAt(i).name);
              listRow.add(listTitle.elementAt(i).email);
              listRow.add(listTitle.elementAt(i).mobile);
              listRow.add(listTitle.elementAt(i).userid);
              listRow.add(listTitle.elementAt(i).username);



              return new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: new List.generate(listRow.length, (int j) {
                  //log('j pos: $j');
                  //debugPrint('jpos: $j');

                  if(i==0){
                    return new Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff5A6268),
                          image: DecorationImage(
                            image: ExactAssetImage('images/flowers.jpeg'),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        width: 300.0,
                        child: new Text(
                            listRow.elementAt(j),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 30
                            )
                        )
                    );

                  }else{
                    return new Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff7c94b6),

                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),

                      width: 300.0,
                          child: new Text(
                              listRow.elementAt(j),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 25
                              )
                          ),

//                      child: new DropdownButton<User>(
//                        hint: new Text("Select a user"),
//                        value: selectedUser,
//                        onChanged: (User newValue) {
//                          setState(() {
//                            selectedUser = newValue;
//                          });
//                        },
//                        items: users.map((User user) {
//                          return new DropdownMenuItem<User>(
//                            value: user,
//                            child: new Text(
//                              user.name,
//                              style: new TextStyle(color: Colors.black),
//                            ),
//                          );
//                        }).toList(),
//                      ),

                    );
                  }
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}

class User {
  const User(this.name);

  final String name;
}