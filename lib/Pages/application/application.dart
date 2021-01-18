import 'package:Quete/Pages/schedule/Schedule.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Applications extends StatefulWidget {
  @override
  _ApplicationsState createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: TabBarView(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffeaeaea)),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffeaeaea),
                                spreadRadius: 0,
                                blurRadius: 3,
                                offset: Offset(1, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black),
                                    child: Icon(
                                      FontAwesomeIcons.twitter,
                                      size: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Fulltime  contract".toUpperCase(),
                                        style: TextStyle(
                                            fontFamily: 'Futura Heavy',
                                            color: Color(0xFFa6e76c),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        "Senior Mobile Developer",
                                        style: TextStyle(
                                            fontFamily: 'Futura Book',
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        "Twitter . California . CA",
                                        style: TextStyle(
                                            fontFamily: 'Futura Book',
                                            color: Colors.black.withOpacity(.6),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text(
                                "Applied on 21 July 2020",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: 'Futura Book',
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffeaeaea)),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffeaeaea),
                                spreadRadius: 0,
                                blurRadius: 3,
                                offset: Offset(1, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black),
                                    child: Icon(
                                      FontAwesomeIcons.twitter,
                                      size: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Fulltime  contract".toUpperCase(),
                                        style: TextStyle(
                                            fontFamily: 'Futura Book',
                                            color: Colors.lightGreen,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        "Senior Mobile Developer",
                                        style: TextStyle(
                                            fontFamily: 'Futura Book',
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        "Twitter . California . CA",
                                        style: TextStyle(
                                            fontFamily: 'Futura Book',
                                            color: Colors.black.withOpacity(.6),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  )
                                ],
                              ),

                            ],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffeaeaea)),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffeaeaea),
                                spreadRadius: 0,
                                blurRadius: 3,
                                offset: Offset(1, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black),
                                    child: Icon(
                                      FontAwesomeIcons.twitter,
                                      size: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Fulltime  contract".toUpperCase(),
                                        style: TextStyle(
                                            fontFamily: 'Futura Book',
                                            color: Colors.lightGreen,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        "Senior Mobile Developer",
                                        style: TextStyle(
                                            fontFamily: 'Futura Book',
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        "Twitter . California . CA",
                                        style: TextStyle(
                                            fontFamily: 'Futura Book',
                                            color: Colors.black.withOpacity(.6),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  )
                                ],
                              ),

                            ],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ),
            Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.white,
                  child: Column(

                    children: [
                      SizedBox(height: 20,),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffeaeaea)),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffeaeaea),
                                spreadRadius: 0,
                                blurRadius: 3,
                                offset: Offset(1, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black),
                                    child: Icon(
                                      FontAwesomeIcons.twitter,
                                      size: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Fulltime  contract".toUpperCase(),
                                        style: TextStyle(
                                            fontFamily: 'Futura Heavy',
                                            color: Color(0xFFa6e76c),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        "Senior Mobile Developer",
                                        style: TextStyle(
                                            fontFamily: 'Futura Book',
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        "Twitter . California . CA",
                                        style: TextStyle(
                                            fontFamily: 'Futura Book',
                                            color: Colors.black.withOpacity(.6),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 13,),
                              Text(
                                "Approved on 21 July 2020",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: 'Futura Book',
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 20,
                      ),

                    ],
                  )
                ))
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,

      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      brightness: Brightness.light,
      title: Text("Applications",
          style: TextStyle(
              fontFamily: 'Futura Heavy',
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold),),
      actions: <Widget>[

        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Schedule()));
              },
              child: FaIcon(FontAwesomeIcons.calendarCheck,
                size: 25,
                color: Colors.black,
              ),
            )
        ),
      ],
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                  color: Color(0xfff1f1f1)),
              width: MediaQuery.of(context).size.width / 1.05,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1.5,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Applied (35)",
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Approved (15)",
                              style:TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  ]),
            ),
          )),
    );
  }
}
