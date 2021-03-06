import 'dart:io';
import 'dart:math';

import 'package:Quete/Routes.dart';
import 'package:Quete/Utils/Widgets/pickers/file.pickers.dart';
import 'package:Quete/services/firebase/firebase.user.services.dart';
import 'package:Quete/services/graphql/user.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Utils/Widgets/shifts/activities.line.chart.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  // static List<charts.Series<TimeSeriesAttendance, DateTime>> _createRandomData() {
  //   final random = new Random();
  //   final data = [
  //     new TimeSeriesAttendance(new DateTime(2017, 9, 1), 10*random.nextDouble()),
  //     new TimeSeriesAttendance(new DateTime(2017, 9, 2), 10*random.nextDouble
  //       ()),
  //     new TimeSeriesAttendance(new DateTime(2017, 9, 3), 10*random.nextDouble
  //       ()),
  //     new TimeSeriesAttendance(new DateTime(2017, 9, 4), 10*random.nextDouble
  //       ()),
  //     new TimeSeriesAttendance(new DateTime(2017, 9, 5), 10*random.nextDouble
  //       ()),
  //     new TimeSeriesAttendance(new DateTime(2017, 9, 6), 10*random.nextDouble
  //       ()),
  //   ];
  //   return [
  //     new charts.Series<TimeSeriesAttendance, DateTime>(
  //       id: 'Attendance',
  //       domainFn: (TimeSeriesAttendance attendance, _) => attendance.date,
  //       measureFn: (TimeSeriesAttendance attendance, _) => attendance.hours,
  //       colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
  //       data: data,
  //     )
  //   ];
  // }
  FirebaseUserServices userServices;
  File imgFile;

  bool isNull(String text) {
    if (text == null) {
      return true;
    }
    return false;
  }

  Future getImage() async {
    final pickedFile = await FilePickers.pickImage();
    if (pickedFile != null) {
      setState(() {
        imgFile = File(pickedFile.path);
      });
      FirebaseUserServices.updateProfilePic(imgFile);
    } else {
      print('No image selected.');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black.withOpacity(.6),
        content: Text(
          "Please select a valid image as your profile "
          "picture",
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily: "Futura Book",
              letterSpacing: .8,
              height: 1.5,
              color: Colors.white,
              fontSize: 12),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.clear,
              size: 18,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.settings);
              },
              icon: Icon(
                Icons.more_vert_outlined,
                size: 18,
              ))
        ],
        title: Text(
          "My Account",
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily: "Futura Book",
              letterSpacing: .8,
              height: 1.5,
              color: Colors.black.withOpacity(.8),
              fontSize: 18),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50.0,
                              backgroundImage: imgFile != null
                                  ? FileImage(imgFile)
                                  : isNull(userInfo.user.profilePic)
                                      ? AssetImage(
                                          'assets/images/miscellaneous/default-pic'
                                          '.png')
                                      : NetworkImage(userInfo.user.profilePic)),
                          GestureDetector(
                            onTap: () {
                              getImage();
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 15.0,
                              child: Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.blueAccent,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: userInfo.user.firstName,
                                  style: Theme.of(context).textTheme.headline5),
                              TextSpan(
                                  text: userInfo.user.lastName,
                                  style: Theme.of(context).textTheme.headline5),
                            ]),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                          ),
                          RichText(
                            text: TextSpan(
                                text: userInfo.user.homeAddress
                                    .replaceAll(',', ' .')
                                    .split(""
                                        ".")
                                    .first,
                                style: TextStyle(
                                    fontFamily: 'Futura Book',
                                    color: Colors.black.withOpacity(.6),
                                    fontSize: 12,
                                    height: 1.5,
                                    letterSpacing: .8,
                                    fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' . ',
                                    style: TextStyle(
                                        fontFamily: 'Futura Book',
                                        color: Colors.black.withOpacity(.6),
                                        fontSize: 12,
                                        height: 1.5,
                                        letterSpacing: .8,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: (userInfo.user.homeAddress
                                            .replaceAll(
                                                ', ',
                                                ''
                                                    '.')
                                            .split('.')
                                            .last)
                                        .toString()
                                        .split(' ')
                                        .first,
                                    style: TextStyle(
                                        fontFamily: 'Futura Book',
                                        color: Colors.black.withOpacity(.6),
                                        fontSize: 12,
                                        height: 1.5,
                                        letterSpacing: .8,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "About",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: "Futura Book",
                      letterSpacing: .8,
                      height: 1.5,
                      color: Colors.black.withOpacity(.8),
                      fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam maximus, urna non mollis tempus, massa mi placerat tortor, ac vulputate tellus enim ac lorem.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: "Futura Book",
                      letterSpacing: .8,
                      height: 1.5,
                      color: Colors.black.withOpacity(.6),
                      fontSize: 13),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.personalInformation);
                  },
                  leading: Icon(
                    Icons.info,
                    color: Colors.blueAccent,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  title: Text(
                    "Personal-info",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: "Futura Book",
                        letterSpacing: .8,
                        height: 1.5,
                        color: Colors.black.withOpacity(.8),
                        fontSize: 14),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 18,
                  ),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.userShiftHistory);
                  },
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  leading: Icon(
                    Icons.work,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Shift-history",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: "Futura Book",
                        letterSpacing: .8,
                        height: 1.5,
                        color: Colors.black.withOpacity(.8),
                        fontSize: 14),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 18,
                  ),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.userDocuments);
                  },
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  leading: Icon(
                    Icons.alternate_email_sharp,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    "Documents",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: "Futura Book",
                        letterSpacing: .8,
                        height: 1.5,
                        color: Colors.black.withOpacity(.8),
                        fontSize: 14),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 18,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
