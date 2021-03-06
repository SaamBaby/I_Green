import 'package:Quete/services/cache/user.cache.service.dart';
import 'package:Quete/services/graphql/activity.service.dart';
import 'package:Quete/services/graphql/discovery.service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:uuid/uuid.dart';

class JobDetails extends StatefulWidget {
  final dynamic closedShiftId;

  const JobDetails({Key key, this.closedShiftId}) : super(key: key);

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

enum buttonState {
  ButtonUninitialized,
  ButtonPressing,
  ButtonPressed,
}

class _JobDetailsState extends State<JobDetails> {
  buttonState currentAcceptState = buttonState.ButtonUninitialized;
  buttonState currentDeclineState = buttonState.ButtonUninitialized;
  final _activityService = ActivityService();
  final _discoveryService = DiscoveryService();

  @override
  Widget build(BuildContext context) {
    // for location string manipulation
    String _textSelect(String str) {
      str = str.replaceAll('.', '');
      str = str.replaceAll(',', '.');
      str = str.replaceAll('(', '');
      str = str.replaceAll(')', '');
      return str;
    }

    // for  string manipulating the job description string to order list
    String _textToList(String str) {
      str = str.replaceAll('·', '\n\n• ');
      return str;
    }

    _showDialog(error) {
      showDialog(
          context: (context),
          builder: (ctx) => AlertDialog(
                title: Text(
                  'An error occurred while '
                  'applying the shift!',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: "Futura Book",
                      letterSpacing: .8,
                      height: 1.5,
                      color: Colors.black,
                      fontSize: 14),
                ),
                content: Text(error.toString()),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "Okay!",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: "Futura Book",
                          letterSpacing: .8,
                          height: 1.5,
                          color: Colors.white,
                          fontSize: 12),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ));
    }

    progressButton(bool isAccept) {
      if (isAccept) {
        if (currentAcceptState == buttonState.ButtonUninitialized) {
          return Text(
            "Accept",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: "Futura Book",
                letterSpacing: .8,
                height: 1.5,
                color: Colors.white,
                fontSize: 16),
          );
        } else if (currentAcceptState == buttonState.ButtonPressing) {
          return CircularProgressIndicator(
            value: null,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 4.0,
          );
        } else {
          return Icon(Icons.check, color: Colors.white);
        }
      } else {
        if (currentDeclineState == buttonState.ButtonUninitialized) {
          return Text(
            "Decline",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: "Futura Book",
                letterSpacing: .8,
                height: 1.5,
                color: Colors.white,
                fontSize: 14),
          );
        } else if (currentDeclineState == buttonState.ButtonPressing) {
          return CircularProgressIndicator(
            value: null,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 4.0,
          );
        } else {
          return Icon(Icons.check, color: Colors.white);
        }
      }
    }

    final closedShiftId = widget.closedShiftId as int;

    final loadedJobData = Provider.of<DiscoveryService>(context, listen: true)
        .feed
        .firstWhere((element) => element.closedShiftsId == closedShiftId);
    List<String> tempLocation = loadedJobData.shift.job.jobLocation.split(',');

    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Scaffold(
            appBar: AppBar(
              leading: Transform.translate(
                offset: Offset(10, 0),
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    " 2 weeks ago",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontFamily: "Futura Book",
                                        letterSpacing: .8,
                                        color: Colors.black.withOpacity(.5),
                                        fontSize: 12),
                                  ),
                                  Visibility(
                                    visible: loadedJobData.shift.job.isFulltime,
                                    child: Text(
                                      "| Full-Time",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontFamily: "Futura Book",
                                          letterSpacing: .8,
                                          color: Colors.black.withOpacity(.5),
                                          fontSize: 12),
                                    ),
                                  ),
                                  Visibility(
                                    visible: loadedJobData.shift.job.isParttime,
                                    child: Text(
                                      "| Part-Time",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontFamily: "Futura Book",
                                          letterSpacing: .8,
                                          color: Colors.black.withOpacity(.5),
                                          fontSize: 12),
                                    ),
                                  ),
                                  Visibility(
                                    visible: loadedJobData.shift.job.isContract,
                                    child: Text(
                                      "Contract",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontFamily: "Futura Book",
                                          letterSpacing: .8,
                                          color: Colors.black.withOpacity(.5),
                                          fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*.6,
                                child: Text(loadedJobData.shift.job.jobName,
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context).textTheme.headline5),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  Text(
                                    _textSelect(
                                        tempLocation.getRange(1, 3).toString()),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontFamily: "Futura Book",
                                        letterSpacing: .8,
                                        color: Colors.black.withOpacity(.8),
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.attach_money_outlined,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  Text(
                                    loadedJobData.shift.job.jobSalary.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontFamily: "Futura Book",
                                        letterSpacing: 1,
                                        color: Colors.black.withOpacity(.8),
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: new NetworkImage(
                                        loadedJobData.shift.job.jobLogo)))),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    ReadMoreText(loadedJobData.shift.job.jobDescription,
                        colorClickableText: Theme.of(context).primaryColor,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Futura Book",
                            letterSpacing: .8,
                            height: 2,
                            color: Colors.black.withOpacity(.8),
                            fontSize: 13),
                        moreStyle: Theme.of(context).textTheme.bodyText2),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Responsibilities",
                      style: Theme.of(context).textTheme.headline5,
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
                              _textToList(
                                  loadedJobData.shift.job.jobResponsibilities),
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "Futura Book",
                                  letterSpacing: .8,
                                  height: 1.5,
                                  color: Colors.black.withOpacity(.8),
                                  fontSize: 13)),
                          // Text(
                          //   loadedJobData.shift.job.jobResponsibilities,
                          //   style: Theme.of(context).textTheme.bodyText1,
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Qualification",
                      style: Theme.of(context).textTheme.headline5,
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
                            _textToList(
                                loadedJobData.shift.job.jobQualifications),
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: "Futura Book",
                                letterSpacing: .8,
                                height: 1.5,
                                color: Colors.black.withOpacity(.8),
                                fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      _textToList(loadedJobData.shift.job.jobQualifications),
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: "Futura Book",
                          letterSpacing: .8,
                          height: 1.5,
                          color: Colors.black.withOpacity(.8),
                          fontSize: 13),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
                    RichText(
                      text: TextSpan(
                          text: "@ 2020 IGreen . By applying to this you are "
                              "agreeing to all the terms and conditions of "
                              "Greenline Employment Inc",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontFamily: "Futura Book",
                              letterSpacing: .8,
                              height: 1.5,
                              color: Colors.black.withOpacity(.8),
                              fontSize: 13),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'http://greenlineemployment.com/contact-us/',
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
            bottomNavigationBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: Container(
                padding: EdgeInsets.only(left: 18.0, bottom: 25.0, right: 18.0),
                // margin: EdgeInsets.only(bottom: 25.0),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            try {
                              // var input= ActivitiesInsertInput(
                              //   activityId: 11,
                              //   shiftId: loadedJobData.shiftId,
                              //   userId: UserCacheService.user.id,
                              //   isAccepted:true,
                              //   );
                              // _activityService.createActivity(input);
                              setState(() {
                                currentAcceptState = buttonState.ButtonPressing;
                              });
                              _activityService
                                  .createActivity(
                                      Uuid().v4(),
                                      loadedJobData.shiftId,
                                      UserCacheService.user.id,
                                      true)
                                  .then((value) => {
                                        if (value.activityId.isNotEmpty)
                                          {
                                            _discoveryService.deleteCloseShift(
                                                closedShiftId),
                                            setState(() {
                                              currentAcceptState =
                                                  buttonState.ButtonPressed;
                                            })
                                          }
                                        else
                                          {
                                            _showDialog(
                                                "An error was occurred while "
                                                "accepting the shift, Check your "
                                                "internet connection & try again ")
                                          }
                                      });

                              if (currentAcceptState ==
                                  buttonState.ButtonPressed) {}
                            } catch (error) {
                              _showDialog(error);
                            }
                          },
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.only(bottom: 10, right: 20),
                              height: ScreenUtil().setHeight(50),
                              alignment: Alignment.center,
                              width: (currentAcceptState ==
                                      buttonState.ButtonUninitialized)
                                  ? MediaQuery.of(context).size.width
                                  : ScreenUtil().setWidth(40),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: (currentAcceptState ==
                                        buttonState.ButtonUninitialized)
                                    ? BorderRadius.circular(10)
                                    : BorderRadius.circular(30),
                              ),
                              child: progressButton(true))),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              currentDeclineState = buttonState.ButtonPressing;
                            });
                            try {
                              _discoveryService
                                  .createOpenShift(
                                      Uuid().v4(), loadedJobData.shiftId)
                                  .then((value) => {
                                        if (value.returning.first.openShiftsId
                                            .isNotEmpty)
                                          {
                                            _discoveryService.deleteCloseShift(
                                                closedShiftId),
                                            setState(() {
                                              currentDeclineState =
                                                  buttonState.ButtonPressed;
                                            }),
                                          }
                                        else
                                          {
                                            _showDialog(
                                                "An error was occurred while "
                                                "declining the shift, Check your "
                                                " internet connection & try again ")
                                          },
                                        if (currentDeclineState ==
                                            buttonState.ButtonPressed)
                                          {
                                            print("test current "
                                                "state${currentDeclineState.toString()}"),
                                            setState(() {}),
                                            Navigator.of(context).pop()
                                          }
                                      });
                            } catch (error) {
                              _showDialog(error);
                            }
                          },
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.only(
                                bottom: 10,
                              ),
                              height: ScreenUtil().setHeight(50),
                              alignment: Alignment.center,
                              width: (currentDeclineState ==
                                      buttonState.ButtonUninitialized)
                                  ? MediaQuery.of(context).size.width * .55
                                  : ScreenUtil().setWidth(30),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: (currentDeclineState ==
                                        buttonState.ButtonUninitialized)
                                    ? BorderRadius.circular(10)
                                    : BorderRadius.circular(30),
                              ),
                              child: progressButton(false))),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
