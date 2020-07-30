import 'package:covidapp/api.dart';
import 'package:covidapp/data.dart';
import 'package:covidapp/settings.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  Data globalData = Data();
  Data nepalData = Data();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    ApiData().fetchGlobal().then((value) => setState(() {
          widget.globalData = value;
        }));

    return FutureBuilder<Data>(
      future: ApiData().fetchNepal(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          widget.nepalData = snapshot.data;

          var dateTime =
              DateTime.fromMillisecondsSinceEpoch(widget.nepalData.timestamp);

          return Scaffold(
              backgroundColor: Color(0xff1a1b25),
              body: Container(
                child: _getPage(currentPage),
              ),
              bottomNavigationBar: FancyBottomNavigation(
                barBackgroundColor: Color(0xff15161e),
                activeIconColor: Color(0xff242535),
                circleColor: Color(0xff7f43ff),
                inactiveIconColor: Color(0xff3d4e6e),
                initialSelection: 0,
                tabs: [
                  TabData(iconData: Icons.home, title: ""),
                  TabData(iconData: Icons.search, title: ""),
                  TabData(iconData: Icons.settings, title: "")
                ],
                key: bottomNavigationKey,
                onTabChangedListener: (position) {
                  setState(() {
                    currentPage = position;
                  });
                },
              )
          );
        }
        _getpage(int page){
          switch(page){
            case 2:
              return Text('hello');
          }
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  _getPage(int page) {
    var dateTime =
    DateTime.fromMillisecondsSinceEpoch(widget.nepalData.timestamp);
    switch (page) {
      case 0:
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Covid-19',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Expanded(
                        child: Container(
                          alignment: Alignment.topRight,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Container(
                              color: Color(0xff242535),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0,
                                    right: 15.0,
                                    top: 8.0,
                                    bottom: 8.0),
                                child: Text(
                                  'Nepal',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xff242535),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            40.0, 30.0, 0.0, 30.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Data for Covid 19 in Nepal',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xff7d7f97),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                'Updated on: ' + DateFormat.jm().add_yMd().format(dateTime),
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xff7d7f97),
                                    fontSize: 10.0),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                widget.nepalData.cases
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                  fontSize: 25.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'Confirmed Cases',
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xff7d7f97),
                                                  fontSize: 12.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  widget.nepalData.todayCases
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.white,
                                                    fontSize: 25.0,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  'Todays Cases',
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xff7d7f97),
                                                    fontSize: 12.0,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                widget.nepalData.deaths
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                  fontSize: 25.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'Total Confirmed Deaths',
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xff7d7f97),
                                                  fontSize: 12.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  widget.nepalData.todayDeaths
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.white,
                                                    fontSize: 25.0,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  'Todays Deaths',
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xff7d7f97),
                                                    fontSize: 12.0,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 4.0, 20.0, 20.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xff242535),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            40.0, 30.0, 40.0, 30.0),
                        child: Container(
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                          child: Text(
                                            'States',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xff7d7f97),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Cases',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xff7d7f97),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Deaths',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xff7d7f97),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Today',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xff7d7f97),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                          child: Text(
                                            'State 1',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xff96454c),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                          child: Text(
                                            'State 2',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xff96454c),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                          child: Text(
                                            'State 3',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xff96454c),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                          child: Text(
                                            'State 4',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xff96454c),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                          child: Text(
                                            'State 5',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xff96454c),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                          child: Text(
                                            'State 6',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xff96454c),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                          child: Text(
                                            'State 7 ',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xff96454c),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 3.0, 20.0, 20.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xff242535),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            40.0, 30.0, 0.0, 30.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Data for Covid 19 World Wide',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xff7d7f97),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                'Updated on ' + DateFormat.jm().add_yMd().format(dateTime),
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xff7d7f97),
                                    fontSize: 10.0),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                widget.globalData.cases
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                  fontSize: 25.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'Confirmed Cases',
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xff7d7f97),
                                                  fontSize: 12.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  widget.globalData.todayCases
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.white,
                                                    fontSize: 25.0,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  'Todays Cases',
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xff7d7f97),
                                                    fontSize: 12.0,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                widget.globalData.deaths
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                  fontSize: 25.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'Total Confirmed Deaths',
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xff7d7f97),
                                                  fontSize: 12.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  widget
                                                      .globalData.todayDeaths
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.white,
                                                    fontSize: 25.0,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  'Todays Deaths',
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xff7d7f97),
                                                    fontSize: 12.0,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        );
      case 1:
        return Container(
          child: Center(
            child: Text('Coming Soon :)',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: 30.0,
                fontWeight: FontWeight.bold
            ),),
          ),
        );
      case 2:
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 60.0,),
              Padding(
                padding: const EdgeInsets.only(left:20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text('Covid-19',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold
                            ),),
                        )),
                    Expanded
                      (child: Container(
                      alignment: Alignment.topRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          color: Color(0xff242535),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 8.0,bottom: 8.0),
                            child: Text('Nepal',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 15.0,
                              ),),
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xff242535),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 30.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Selected Country', style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xff7d7f97),
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                              SizedBox(height: 7.0,),
                              Text('Nepal-(NPL)', style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xff7d7f97),
                                  fontSize: 10.0
                              ),
                              ),
                              Divider(color: Colors.white,),
                              Padding(
                                padding: const EdgeInsets.only(top:20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text('About App', style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Colors.white,
                                                fontSize: 25.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              ),
                                              SizedBox(height: 20.0,),
                                              Text('App Version: 1.0', style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xff7d7f97),
                                                fontSize: 12.0,
                                              ),
                                              ),
                                              Text('Open Source android application for the COVID-19 information.', style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xff7d7f97),
                                                fontSize: 12.0,
                                              ),
                                              ),
                                              Text('stharawv23@gmail.com', style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xff7d7f97),
                                                fontSize: 12.0,
                                              ),
                                              ),
                                              Text('API used https://github.com/NovelCOVID/API', style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xff7d7f97),
                                                fontSize: 12.0,
                                              ),
                                              )
                                            ],
                                          ),
                                        )
                                    ),

                                  ],),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ),

            ],
          ),
        );
    }
  }
}
