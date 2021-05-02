import 'package:Quete/Pages/auth/signup.screen.dart';
import 'package:Quete/graphql/schema.graphql.dart';
import 'package:Quete/services/cache/user.cache.service.dart';
import 'package:Quete/services/graphql/discovery.service.dart';
import 'package:Quete/services/graphql/activity.service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class JobDetails extends StatefulWidget {
  final dynamic arguments;

  const JobDetails({Key key, this.arguments}) : super(key: key);


  @override
  _JobDetailsState createState() => _JobDetailsState();
}


class _JobDetailsState extends State<JobDetails> {

  final  _activityService = ActivityService();
  @override
  Widget build(BuildContext context) {

    // for string manipulation
    String _textSelect(String str) {
      str = str.replaceAll('.', '');
      str = str.replaceAll(',', '.');
      str = str.replaceAll('(', '');
      str = str.replaceAll(')', '');
      return str;
    }
    final jobId = widget.arguments as int;
    final loadedJobData = Provider.of<DiscoveryService>(context, listen:
    true).feed.firstWhere((element) => element.shift.job.jobId == jobId);

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
              toolbarHeight: 350,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50.0),

                child: Container(
                  width: double.infinity,
                  // margin: EdgeInsets.only(top: 50.0),
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              child: Image.network(loadedJobData.shift
                                  .job.jobLogo),
                            ),
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
                                        _textSelect(tempLocation .getRange(1,4).toString()),
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
                                              style: TextStyle(
                                                  fontFamily: 'Futura Book',
                                                  color: Colors.black54
                                                      .withOpacity(.8),
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.w900),
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
                                              style: TextStyle(
                                                  fontFamily: 'Futura Book',
                                                  color: Colors.black54
                                                      .withOpacity(.8),
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.w900),
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
                                              style: TextStyle(
                                                  fontFamily: 'Futura Book',
                                                  color: Colors.black54
                                                      .withOpacity(.8),
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.w900),
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

                    ],
                  ),
                ),
              ),
            ),
            body:  Container(
              padding:
              EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  ReadMoreText(
                    loadedJobData.shift.job.jobDescription,
                  colorClickableText: Theme.of(context).primaryColor,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  style: Theme.of(context).textTheme.bodyText1,
                  moreStyle:Theme.of(context).textTheme.bodyText2),

                    SizedBox(
                      height: 30,
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
                            loadedJobData.shift.job.jobResponsibilities,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
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
                            loadedJobData.shift.job.jobQualifications,
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
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

                            } catch (error) {
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
                            }finally{


                              Navigator.of(context).pop();
                            }
                          },
                          child: Container(
                              margin: EdgeInsets.only(bottom: 10,right: 20),
                              height: 60,
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "Accept",
                                style: Theme.of(context).textTheme.button,
                              )
                          )),
                    ),
                    Expanded(
                      flex: 1,
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
                              _activityService.createActivity(11,
                                loadedJobData.shiftId,UserCacheService.user
                                    .id,true);

                            } catch (error) {
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
                            }finally{

                            }
                          },
                          child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Theme.of(context).errorColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "Decline",
                                style: Theme.of(context).textTheme.button,
                              )
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
