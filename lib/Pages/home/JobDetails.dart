import 'package:Quete/Pages/auth/SignUp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class JobDetails extends StatefulWidget {
  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: buildAppBar(context),
          body: TabBarView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .9,
                        child: Text(
                          "Reporting to the Operations Manager, the Operations Supervisor is an intermediate building operations position and is "
                          "responsible for providing administrative, operational and technical service and support. The primary task of the Operations Supervisor"
                          " is to ensure that the building is being managed and maintained in a safe and environmentally responsible manner and to ensure operational efficiency."
                          " Responsibilities include preventative maintenance of all internal and external assets, tenant relations and coordination of maintenance staff duties and Operational Programs."
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          style: TextStyle(
                              fontFamily: 'Futura Book',
                              color: Colors.black.withOpacity(.7),
                              fontSize: 16,
                              height: 1.5,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Responsibilities",
                        style: TextStyle(
                            fontFamily: 'Futura Heavy',
                            color: Colors.black,
                            fontSize: 20,
                            height: 2,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Qualification",
                        style: TextStyle(
                            fontFamily: 'Futura Heavy',
                            color: Colors.black,
                            fontSize: 20,
                            height: 2,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Deerhurst Resort',
                            style: TextStyle(
                                fontFamily: 'Futura Book',
                                color: Colors.black.withOpacity(.5),
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                            children: <TextSpan>[
                              TextSpan(
                                text: ' 1 day ago',
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 13),
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Full-Time",
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: Container(
              padding: EdgeInsets.only(left: 18.0, bottom: 25.0, right: 18.0),
              // margin: EdgeInsets.only(bottom: 25.0),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(.5)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Icon(Icons.bookmark_border, color: Colors.black),
                  ),
                  SizedBox(width: 15.0),
                  Expanded(
                    child: SizedBox(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Color(0xFFa6e76c),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          "Apply ",
                          style: TextStyle(
                              fontFamily: 'Futura Book',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: Transform.translate(
        offset: Offset(10, 0),
        child: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 400,
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 25.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.more_vert_outlined,
                color: Colors.black,
              ),
            )),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: Container(
          width: double.infinity,
          // margin: EdgeInsets.only(top: 50.0),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.lightGreen,
                      radius: 40,
                    ),
                    SizedBox(height: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Senior HouseKeeper Asssistant Manager",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Futura Heavy',
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(height: 10,),

                            Text(
                              "Twitter . California . CA",
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black,
                                  fontSize: 16,
                                  height: 1.5,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "\$CA 2500/Monthly",
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  color: Colors.black,
                                  fontSize: 16,
                                  height: 1.5,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  margin: EdgeInsets.only(right: 5),
                                  width: 70,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xffeef1f4)),
                                  child: Text(
                                    "Full-Time",
                                    style: TextStyle(
                                        fontFamily: 'Futura Book',
                                        color: Colors.black54.withOpacity(.8),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  margin: EdgeInsets.only(right: 5),
                                  width: 70,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xffeef1f4)),
                                  child: Text(
                                    "Contract",
                                    style: TextStyle(
                                        fontFamily: 'Futura Book',
                                        color: Colors.black54.withOpacity(.8),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  margin: EdgeInsets.only(right: 5),
                                  width: 70,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xffeef1f4)),
                                  child: Text(
                                    "Part-Time",
                                    style: TextStyle(
                                        fontFamily: 'Futura Book',
                                        color: Colors.black54.withOpacity(.8),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Material(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(
                      color: Colors.black.withOpacity(.1), width: .5),
                ),
                child: TabBar(

                    unselectedLabelColor: Colors.black,
                    indicator: BoxDecoration(
                      color: Color(0xFFa6e76c),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    tabs: [
                      Tab(

                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Applied (35)",
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
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
                            child: Text(
                              "Company",
                              style: TextStyle(
                                  fontFamily: 'Futura Book',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
