import 'package:Quete/Pages/auth/signup.screen.dart';
import 'package:Quete/graphql/schema.graphql.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:uuid/uuid.dart';
import 'package:Quete/services/cache/user.cache.service.dart';
import 'package:Quete/services/graphql/discovery.service.dart';
import 'package:Quete/services/graphql/activity.service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

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
  final  _activityService = ActivityService();
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
      str = str.replaceAll('·','\n\n• ');
      return str;
    }
   _showDialog(error){
     showDialog(
         context: (context),
         builder: (ctx) => AlertDialog(
           title: Text(
             'An error occurred while '
                 'applying the shift!',style:
           Theme.of(context).textTheme.bodyText1,),

           content: Text(error.toString()),
           actions: <Widget>[
             FlatButton(
               child: Text("Okay!",style: Theme.of(context).textTheme.headline5,),
               onPressed: () {
                 Navigator.of(context).pop();
               },
             )
           ],
         ));
   }
    progressButton(bool isAccept) {
      if(isAccept){
        if(currentAcceptState==buttonState.ButtonUninitialized){
          return Text(
             "Accept",
              style: Theme.of(context).textTheme.button
          );
        }else if(currentAcceptState==buttonState.ButtonPressing){
          return CircularProgressIndicator(
            value: null,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 4.0,
          );
        } else{
          return Icon(Icons.check, color:Colors.white);
        }
      }else{
        if(currentDeclineState==buttonState.ButtonUninitialized){
          return Text(
              "Decline",
              style: Theme.of(context).textTheme.subtitle1
          );
        }else if(currentDeclineState==buttonState.ButtonPressing){
          return CircularProgressIndicator(
            value: null,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 4.0,
          );
        } else{
          return Icon(Icons.check, color:Colors.white);
        }
      }
    }

    final closedShiftId = widget.closedShiftId as int;

    final loadedJobData = Provider.of<DiscoveryService>(context, listen:
    true).feed.firstWhere((element) => element.closedShiftsId==closedShiftId);

    List<String> tempLocation=loadedJobData.shift.job.jobLocation.split(',');

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
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body:  Container(
              padding:
              EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      image: new NetworkImage(loadedJobData.shift
                                          .job.jobLogo)
                                  )
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  loadedJobData.shift.job.jobName,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme.headline1
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _textSelect(tempLocation .getRange(1,3)
                                    .toString()),
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme.bodyText1,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                      text: "\$CA ",
                                      style: Theme.of(context)
                                          .textTheme.bodyText2),
                                  TextSpan(
                                      text: loadedJobData.shift.job.jobSalary
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme.bodyText2),
                                ]),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Visibility(
                                    visible: loadedJobData.shift
                                        .job.isFulltime,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 10,
                                          horizontal: 10),
                                      margin:
                                      EdgeInsets.only(right: 5),
                                      width: 80,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                              10),
                                          color: Color(0xffeef1f4)),
                                      child: Text(
                                        "Full-Time",
                                        style: Theme.of(context).textTheme.bodyText2,
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: loadedJobData.shift
                                        .job.isParttime,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 10),
                                      margin:
                                      EdgeInsets.only(right: 5),
                                      width: 80,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                              10),
                                          color: Color(0xffeef1f4)),
                                      child: Text(
                                        "Part-Time",
                                        style:  Theme.of(context).textTheme.bodyText2,

                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: loadedJobData.shift.job.isContract,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 10),
                                      margin:
                                      EdgeInsets.only(right: 5),
                                      width: 80,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                              10),
                                          color: Color(0xffeef1f4)),
                                      child: Text(
                                        "Contract",
                                        style: Theme.of(context).textTheme.bodyText2,

                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  Divider(),
                    SizedBox(
                      height: 10,
                    ),
                  ReadMoreText(
                    loadedJobData.shift.job.jobDescription,
                  colorClickableText: Theme.of(context).primaryColor,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  style: Theme.of(context).textTheme.bodyText1,
                  moreStyle:Theme.of(context).textTheme.bodyText2),

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
                      _textToList(loadedJobData.shift.job.jobResponsibilities),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
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
                      _textToList(loadedJobData.shift.job.jobQualifications),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: TextSpan(
                          text: loadedJobData.shift.job.jobLocation,
                          style: Theme.of(context).textTheme.caption,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {

                            },
                          children: <TextSpan>[
                            TextSpan(
                              text: ' 1 day ago',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 13),
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
                padding:
                EdgeInsets.only(left: 18.0, bottom: 25.0, right: 18.0),
                // margin: EdgeInsets.only(bottom: 25.0),
                color: Colors.white,
                child: Row(
                  children: <Widget>[

                    Expanded(
                      flex: 4,
                      child:  InkWell(
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
                                currentAcceptState=buttonState
                                    .ButtonPressing;
                              });
                              _activityService.createActivity(Uuid().v4(), loadedJobData.shiftId,UserCacheService.user.id,true).then((value) => {
                                if(value.activityId.isNotEmpty)
                                  {
                                    _discoveryService
                                        .deleteCloseShift(closedShiftId),
                                 setState(() {
                                   currentAcceptState=buttonState
                                       .ButtonPressed;
                                   })
                                  } else{
                                  _showDialog("An error was occurred while "
                                      "accepting the shift, Check your "
                                      "internet connection & try again ")
                                }
                              });

                              if(currentAcceptState==buttonState.ButtonPressed){

                              }

                            } catch (error) {
                              _showDialog(error);
                            }
                          },
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.only(bottom: 10,right: 20),
                              height: ScreenUtil().setHeight(50),
                              alignment: Alignment.center,
                              width: (currentAcceptState==buttonState.ButtonUninitialized)?MediaQuery.of
                                (context).size.width:ScreenUtil().setWidth(40),
                              decoration: BoxDecoration(
                                color:  Colors.black,
                                borderRadius: (currentAcceptState==buttonState.ButtonUninitialized)
                                    ?BorderRadius.circular(10):BorderRadius.circular(30),
                              ),
                              child: progressButton(true)
                          )),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              currentDeclineState=buttonState
                                  .ButtonPressing;
                            });
                            try {
                              _discoveryService.createOpenShift(Uuid().v4(), loadedJobData.shiftId).then((value) => {
                                if(value.returning.first.openShiftsId.isNotEmpty)
                                  {
                                    _discoveryService.deleteCloseShift
                                      (closedShiftId),
                                  setState(() {
                                    currentDeclineState=buttonState.ButtonPressed;
                                    }),
                                  }else{
                                  _showDialog("An error was occurred while "
                                      "declining the shift, Check your "
                                      " internet connection & try again ")
                                },
                              if(currentDeclineState==buttonState.ButtonPressed){
                                   print("test current "
                                       "state${currentDeclineState
                                       .toString()
                                   }"),
                                setState(() {
                                }),
                                  Navigator.of(context).pop()
                               }
                              });



                            }catch (error) {
                              _showDialog(error);
                            }
                          },
                          child:  AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.only(bottom: 10,),
                              height: ScreenUtil().setHeight(50),
                              alignment: Alignment.center,
                              width: (currentDeclineState==buttonState
                                  .ButtonUninitialized)?MediaQuery.of
                                (context).size.width*.55:ScreenUtil().setWidth
                            (30),
                              decoration: BoxDecoration(
                                color:  Theme.of(context).errorColor,
                                borderRadius:
                                (currentDeclineState==buttonState.ButtonUninitialized)
                                    ?BorderRadius.circular(10):BorderRadius
                                    .circular(30),
                              ),
                              child: progressButton(false)
                          )),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
