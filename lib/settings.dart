import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';


class Settings extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1a1b25),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50.0,),
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
        ),
        bottomNavigationBar: FancyBottomNavigation(
          barBackgroundColor: Color(0xff15161e),
          circleColor: Color(0xff242535),
          activeIconColor: Color(0xff7f43ff),
          inactiveIconColor: Color(0xff3d4e6e),

          tabs: [
            TabData(iconData: Icons.home, title: ""),
            TabData(iconData: Icons.search, title: ""),
            TabData(iconData: Icons.settings, title: "")
          ],
          onTabChangedListener: (position) {
            setState(() {

            });
          },
        )
    );
  }
}
