import 'package:Quete/Pages/auth/SignUp.dart';
import 'package:Quete/models/Job.dart';
import 'package:Quete/providers/appliedJobs_provider.dart';
import 'package:Quete/providers/jobs_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JobDetails extends StatefulWidget {
  static const routName = '/job-details';

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final jobId = ModalRoute.of(context).settings.arguments as String;
    final loadedJobData = Provider.of<Jobs>(context, listen: true)
        .itemsList
        .firstWhere((element) => element.jobId == jobId);

    return DefaultTabController(
      length: 2,
      child: Container(
        color: Colors.white,
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Colors.lightGreen),
                ),
              )
            : Scaffold(
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
                  toolbarHeight: 400,
                  actions: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(right: 25.0),
                        child:  Consumer<JobModel>(
                          builder: (context, jobData, _) => GestureDetector(
                            onTap: () {
                              print(jobData.isFavourite);
                              jobData.toggleFavoriteStatus(jobId);
                            },
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              child: Icon(
                                  loadedJobData.isFavourite
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color: loadedJobData.isFavourite
                                      ? Colors.lightGreenAccent
                                      : Colors.black),
                            ),
                          ),
                        ),),
                  ],
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(30),
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
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.lightGreen,
                                  radius: 40,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [

                                        Text(
                                          loadedJobData.jobName,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'Futura Heavy',
                                              color: Color(0xff000000).withOpacity(.8),
                                              fontSize: 26,
                                              letterSpacing: 1.1,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                              text:  loadedJobData.jobLocation.replaceAll(',', ' .').split(".").first,
                                              style: TextStyle(
                                                  fontFamily: 'Futura Book',
                                                  color: Colors.black.withOpacity(.8),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: ' . ',
                                                  style:
                                                  TextStyle(
                                                      fontFamily: 'Futura Book',
                                                      color: Colors.black.withOpacity(.8),
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w700),
                                                ),
                                                TextSpan(
                                                  text:  loadedJobData.jobLocation.replaceAll(',', ' .').split(".").last,
                                                  style: TextStyle(
                                                      fontFamily: 'Futura Book',
                                                      color: Colors.black.withOpacity(.8),
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w700),

                                                )

                                              ]),
                                        ),

                                        SizedBox(
                                          height: 5,
                                        ),
                                        RichText(
                                          text: TextSpan(children: <TextSpan>[
                                            TextSpan(
                                                text: "\$CA ",
                                                style: TextStyle(
                                                    fontFamily: 'Futura Book',
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    height: 1.5,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            TextSpan(
                                                text: loadedJobData.jobSalary
                                                    .toString(),
                                                style: TextStyle(
                                                    fontFamily: 'Futura Book',
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    height: 1.5,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            TextSpan(
                                                text: ' /Hour',
                                                style: TextStyle(
                                                    fontFamily: 'Futura Book',
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    height: 1.5,
                                                    fontWeight:
                                                        FontWeight.w700))
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
                                              visible: loadedJobData.isFullTime,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 10),
                                                margin:
                                                    EdgeInsets.only(right: 5),
                                                width: 70,
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
                                              visible: loadedJobData.isPartTime,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 10),
                                                margin:
                                                    EdgeInsets.only(right: 5),
                                                width: 70,
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
                                              visible: loadedJobData.isContract,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 10),
                                                margin:
                                                    EdgeInsets.only(right: 5),
                                                width: 70,
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
                                  color: Colors.black.withOpacity(.1),
                                  width: .5),
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
                ),
                body: TabBarView(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .9,
                              child: Text(
                                loadedJobData.jobDescription,
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
                                    loadedJobData.jobResponsibilities,
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
                                    loadedJobData.jobQualifications,
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
                                  text: loadedJobData.jobLocation,
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
                    padding:
                        EdgeInsets.only(left: 18.0, bottom: 25.0, right: 18.0),
                    // margin: EdgeInsets.only(bottom: 25.0),
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[

                        Expanded(
                          child: SizedBox(
                            height: 65.0,
                            child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  try {
                                    Provider.of<AppliedJobs>(context,
                                        listen: false)
                                        .applyJob(jobId);
                                  } catch (error) {
                                    showDialog(
                                        context: (context),
                                        builder: (ctx) => AlertDialog(
                                          title: Text(
                                              'An error occured while applying the job!'),
                                          content: Text(error.toString()),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text("Okay!"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        ));
                                  }finally{
                                    setState(() {
                                      _isLoading = false;
                                    });

                                    Navigator.of(context).pop();
                                  }
                                },
                                child: Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    height: 60,
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFa6e76c),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      "Apply ",
                                      style: TextStyle(
                                          fontFamily: 'Futura Book',
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    )
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
