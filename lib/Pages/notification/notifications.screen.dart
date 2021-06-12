import 'package:Quete/Utils/Widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:Quete/Pages/schedule/schedule.screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Divider(),
                    SizedBox(height: 10,),
                    Text(
                      "Today",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Futura Book',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),

                    Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        width: double.infinity,
                        height: 140,
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

                                 Badge(
                                   color:Color(0xffff4171),
                                   child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xFFa6e76c)),
                                      child:  Icon(
                                          FontAwesomeIcons.twitter,
                                          size: 22,
                                          color: Colors.white,
                                        ),
                                      ),
                                 ),
                                
                                
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    SizedBox(
                                      width: 250,
                                      child: Text(
                                          "Your Application has been submitted",
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontFamily: "Futura Heavy",
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    Text(
                                      "5 hours ago",
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
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                                    "Duis ultrices eros quis est laoreet maximus. Nullam pellentesque "
                                    "elementum nunc eu ultrices. Morbi commodo dolor vel augue placerat porttitor.",
                                textAlign: TextAlign.start,
                               overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontFamily: 'Futura Book',
                                    color: Colors.black.withOpacity(.6),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),

                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        width: double.infinity,
                        height: 140,
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
                                      color: Color(0xFFa6e76c)),
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
                                    SizedBox(height: 5,),
                                    SizedBox(
                                      width: 250,
                                      child: Text(
                                        "Your Application has been submitted",
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontFamily: "Futura Heavy",
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    Text(
                                      "5 hours ago",
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
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                                    "Duis ultrices eros quis est laoreet maximus. Nullam pellentesque "
                                    "elementum nunc eu ultrices. Morbi commodo dolor vel augue placerat porttitor.",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontFamily: 'Futura Book',
                                    color: Colors.black.withOpacity(.6),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),

                          ],
                        )),



                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
            ),

      );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text("Notifications",
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
              child: Icon(Icons.more_vert,
                size: 25,
                color: Colors.black,
              ),
            )
        ),
      ],
    );
  }
}
