import 'dart:async';
import 'package:Quete/Utils/Widgets/schedule.stopwatch.dart';
import 'package:Quete/models/job_shifts.dart';
import 'package:Quete/models/direction.dart';
import 'package:Quete/providers/schedule.shifts.provider.dart';
import 'package:Quete/services/graphql/activity.service.dart';
import 'package:Quete/services/location/location.helper.services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show SystemChrome, SystemUiOverlayStyle, rootBundle;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class AddHours extends StatefulWidget {
  final String arguments;

  AddHours({Key key, this.arguments}) : super(key: key);


  @override
  _AddHoursState createState() => _AddHoursState();
}
// sam
class _AddHoursState extends State<AddHours> {
  String mapStyle;
  Position _currentLocation;
  Position lastPosition ;
  CameraPosition currentLocation;
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController _googleMapController;
  List<LatLng> polyLineCoordinates =[];
  double bottomPaddingOfMap;
  Set<Polyline> polyLineSet={};
  CameraPosition cameraPosition;
  Set<Marker> markers={};
  Set<Circle> circles={};
  // Stop Watch variables
  bool isActive=false;
  bool isShitStarted = false;

  Stopwatch _stopwatch;
  Timer _timer;
  @override
  void initState() {
    rootBundle.loadString('assets/utils/map_style.txt').then((string) {
      mapStyle = string;
    });
    _stopwatch = Stopwatch();
    _timer = new Timer.periodic(new Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
    super.initState();

  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  DirectionDetails details=DirectionDetails(distanceText: "0 km away");

  CameraPosition _kGooglePlex = CameraPosition(
      // lastPosition??currentLocation??
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


  // Shift Model for saving the model
   var shiftData =ShiftModel(
       shiftName: '',
       jobId:'',
       shiftStartTime:DateTime.now(),
       shiftEndTime:DateTime.now(),
       shiftDateTime:DateTime.now(),
       isComplete:false
   );


  void handleStartStop() {
    if (_stopwatch.isRunning) {
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(
              "Do you want to Clock Out?",
              style: TextStyle(
                  fontFamily: 'Futura Heavy',
                  color: Colors.black,
                  fontSize: 25,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w900),
            ),
            actions: [
              Consumer<ShiftProvider>(
                builder: (_,shift,child) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      _stopwatch.stop();
                      setState(() {
                        shiftData =ShiftModel(
                            shiftName:shiftData.shiftName,
                            jobId:shiftData.jobId,
                            shiftId: shiftData.shiftId,
                            shiftStartTime:shiftData.shiftStartTime,
                            shiftEndTime:DateTime.now(),
                            shiftDateTime:shiftData.shiftDateTime,
                            isComplete:true
                        );
                        isShitStarted=false;

                      });
                      shift.addShiftHistory(shiftData);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 35,
                        alignment: Alignment.center,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFF00bf6f).withOpacity(.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: RichText(
                          text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.alarm_on_outlined,
                                    size: 16,color: Colors.white,),
                                ),
                                TextSpan(
                                    text: "  "
                                ),
                                TextSpan(
                                  text: "End Shift",
                                  style: TextStyle(
                                    color: isActive?Colors.white:Colors.black12,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Futura Book',
                                  ),
                                )
                              ]
                          ),
                        ) ),
                  );
                },
              ),

              FlatButton(
                onPressed: (){
                      Navigator.of(context).pop();
                },
                child:  Text(
                  "Cancel",
                  style: TextStyle(
                      fontFamily: 'Futura Book',
                      color: Colors.black,
                      fontSize: 14,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w900),
                ),
              )
            ],
            content:  Text(
              "This will be saved as your clock out location.Press to "
                  "confirm",
              style: TextStyle(
                  fontFamily: 'Futura Book',
                  color: Colors.black,
                  fontSize: 16,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w900),
            ),
          );
        }
      );
    } else {
      _stopwatch.start();
      setState(() {
        shiftData =ShiftModel(
            shiftName: shiftData.shiftName,
            jobId:shiftData.jobId,
            shiftStartTime:DateTime.now(),
            shiftEndTime:shiftData.shiftEndTime,
            shiftDateTime:shiftData.shiftDateTime,
            isComplete:shiftData.isComplete
        );
        isShitStarted=true;
      });
    }

    setState(() {});
  }



  void locateCurrentPosition() async {
      lastPosition = await Geolocator.getLastKnownPosition();
     _googleMapController = await _controllerGoogleMap.future;
      _currentLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      // await placemarkFromCoordinates(_currentLocation.latitude, _currentLocation.longitude);
    //  convert current location using api
    // _currentAddress = await LocationHelper.searchCoordinateAddress(_currentLocation);

    LatLng latLngCurrentPosition = LatLng(_currentLocation.latitude, _currentLocation.longitude);
    cameraPosition = new CameraPosition(target:  latLngCurrentPosition, zoom: 15);

    _googleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  Future<void> locateShiftLocation(address) async {
    Position destination= await LocationHelper.searchAddressCoordinate(address);
     details= await LocationHelper.getAddressDirection(_currentLocation, destination);
    drawPolyLines(destination,address);
  }

  void drawPolyLines(Position destination,String address){
    PolylinePoints  polylinePoints =PolylinePoints();
    List<PointLatLng> decodePolyLinePointsResult= polylinePoints.decodePolyline(details.encodePoints);
    polyLineCoordinates.clear();
    if(decodePolyLinePointsResult.isNotEmpty){
      decodePolyLinePointsResult.forEach((PointLatLng pointLatLng) {
        polyLineCoordinates.add(LatLng(pointLatLng.latitude,pointLatLng.longitude));
      });
    }

    setState(() {
      Polyline polyline =Polyline(
        polylineId: PolylineId("PolylineId"),
        color: Theme.of(context)
            .primaryColor,
        jointType: JointType.round,
        points: polyLineCoordinates,
        width: 4,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        geodesic: true,
      );
      polyLineSet.add(polyline);
    });

    LatLngBounds latLngBounds;
    if(_currentLocation.latitude>destination.latitude&& _currentLocation
        .longitude>destination.longitude)
    {
      latLngBounds= LatLngBounds(southwest: LatLng(destination.latitude,destination.longitude),northeast: LatLng(_currentLocation.latitude, _currentLocation.longitude));
    }

    else if(_currentLocation.longitude>destination.longitude){

      latLngBounds= LatLngBounds(southwest:LatLng(_currentLocation.latitude, destination.longitude) ,northeast:LatLng(destination.latitude,_currentLocation.longitude) );
    }


    else if(_currentLocation.latitude>destination.latitude){

      latLngBounds= LatLngBounds(southwest: LatLng(destination.latitude,_currentLocation.longitude),northeast: LatLng(_currentLocation.latitude, destination.longitude));
    }
    else{

      latLngBounds= LatLngBounds(southwest: LatLng(_currentLocation.latitude, _currentLocation.longitude),northeast: LatLng(destination.latitude,destination.longitude));
    }

    _googleMapController.animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 70));
    Marker destinationLocationMarker=Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(title:address,snippet: "Your Destination" ),
        position: LatLng(destination.latitude, destination.longitude),
        markerId: MarkerId("destinationLocationId")
    );
    setState(() {

      markers.add(destinationLocationMarker);
    });
    if(destination == _currentLocation){
      setState(() {
        isActive=true;
      });
    }else{
      final snackBar = SnackBar(
        content: Text('You have to be at the workplace to start the timer',
          style: Theme.of(context).textTheme.button,)
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));

    final activityId = widget.arguments;
    final loadedShiftData = Provider.of<ActivityService>(context, listen: true).feed.firstWhere((element) => element.activityId==activityId);
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(top: 400, right: 10, bottom: 00),
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomControlsEnabled: true,
            polylines: polyLineSet,
            markers: markers,
            circles: circles,
            zoomGesturesEnabled: true,
            initialCameraPosition:_kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              locateCurrentPosition();
              locateShiftLocation(loadedShiftData.shift.job.jobLocation);
              controller.setMapStyle(mapStyle);
              _controllerGoogleMap.complete(controller);

            },

          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 0),
            bottom: 0,
            right: 0,
            left: 0,
            top: isActive?MediaQuery.of(context).size.height*
                .5:MediaQuery.of(context).size.height*.62,
            child: Container(
              padding: EdgeInsets.only(right: 20,left: 20,bottom: 30),
              height: 300,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      tileMode: TileMode.clamp,
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: [
                        Color(0x1AFFFFFF),Color(0x4DFFFFFF), Colors.white]),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width:90,
                      height:90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color:Theme.of(context)
                            .primaryColor,width: 3 )
                      ),
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.alarm_add,color: Theme.of(context)
                            .primaryColor,size: 30,),
                      )
                    ),
                  ),

                  Divider(),
                  isActive?StopWatch(stopWatch: _stopwatch,):SizedBox(height: 1,),
                  SizedBox(height: 10,),
                  Text(
                     "Distance",
                      style:Theme.of(context).textTheme.bodyText1
                  ),
                  RichText(
                    text: TextSpan(
                        text: details.distanceText.split('km').first,
                        style: GoogleFonts.montserrat(
                          fontSize: ScreenUtil().setSp(50),
                          color:Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w900,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: ' KM',
                              style: GoogleFonts.nunito(
                                fontSize: ScreenUtil().setSp(20),
                                color:Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w900,))
                        ]
                    ),
                  ),
                  Text(
                    loadedShiftData.shift.shiftName,

                    style:Theme.of(context).textTheme.headline4
                  ),
                  SizedBox(height: 5,),

                  SizedBox(height: 5,),
                  SizedBox(
                    width:double.infinity,
                    child: Text(
                      '${loadedShiftData.shift.job.jobLocation}',
                      style:Theme.of(context).textTheme.bodyText1
                    ),
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     InkWell(
                  //       splashColor: Colors.transparent,
                  //       highlightColor: Colors.transparent,
                  //       onTap: () {
                  //        if(isActive==false){
                  //         locateShiftLocation(loadedShiftData.shift.job.jobLocation);}
                  //        else if(isActive){
                  //
                  //          setState(() {
                  //
                  //            // shiftData =ShiftModel(
                  //            //     shiftId: loadedShiftData.shiftId,
                  //            //     shiftName: loadedShiftData.shiftName,
                  //            //     jobId:loadedShiftData.jobId,
                  //            //     shiftStartTime:DateTime.now(),
                  //            //     shiftEndTime:shiftData.shiftEndTime,
                  //            //     shiftDateTime:loadedShiftData.shiftDateTime,
                  //            //     isComplete:shiftData.isComplete
                  //            // );
                  //            isShitStarted=true;
                  //          });
                  //          handleStartStop();
                  //        }
                  //       },
                  //       child: Container(
                  //           margin: EdgeInsets.only(bottom: 10),
                  //           height: 45,
                  //           alignment: Alignment.center,
                  //           width: MediaQuery.of(context).size.width*.45,
                  //           decoration: BoxDecoration(
                  //             color: isActive?Color(0xFF00bf6f).withOpacity(.8):Color(0xfff2f2f2),
                  //             borderRadius: BorderRadius.circular(20),
                  //           ),
                  //           child: RichText(
                  //             text: TextSpan(
                  //                 children: [
                  //                   WidgetSpan(
                  //                     child: Icon(Icons.access_time_rounded,
                  //                         size: 20,color: Colors.white,),
                  //                   ),
                  //               TextSpan(
                  //                 text: "  "
                  //               ),
                  //               TextSpan(
                  //                 text:  isShitStarted? "Stop Shift ":"Start "
                  //                     "Shift",
                  //                 style: TextStyle(
                  //                   color: isActive?Colors.white:Colors.black12,
                  //                   fontSize: 15,
                  //                   fontWeight: FontWeight.w900,
                  //                   fontFamily: 'Futura Book',
                  //                 ),
                  //               )
                  //                 ]
                  //             ),
                  //           ) ),
                  //     ),
                  //     Spacer(),
                  //     InkWell(
                  //         splashColor: Colors.transparent,
                  //         highlightColor: Colors.transparent,
                  //         onTap: () async {
                  //           List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");
                  //           List<Placemark> placemarks = await
                  //           placemarkFromCoordinates(52.2165157, 6.9437819);
                  //           print(placemarks.first.toString());
                  //           setState(() {
                  //             isActive=(!isActive);
                  //
                  //
                  //           });
                  //         },
                  //         child: Container(
                  //             margin: EdgeInsets.only(bottom: 10),
                  //             height: 20,
                  //             alignment: Alignment.center,
                  //             width: 20,
                  //             decoration: BoxDecoration(
                  //               color: Colors.transparent,
                  //             ),
                  //             child: Icon(
                  //               FontAwesomeIcons.recycle,
                  //               color: Colors.blue,
                  //               size: 17,
                  //             ))),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     InkWell(
                  //         splashColor: Colors.transparent,
                  //         highlightColor: Colors.transparent,
                  //         onTap: () {},
                  //         child: Container(
                  //             margin: EdgeInsets.only(bottom: 10),
                  //             height: 20,
                  //             alignment: Alignment.center,
                  //             width: 20,
                  //             decoration: BoxDecoration(
                  //               color: Colors.transparent,
                  //             ),
                  //             child: Icon(
                  //               FontAwesomeIcons.calendar,
                  //               color: Colors.blue,
                  //               size: 17,
                  //             ))),
                  //
                  //
                  //
                  //   ],
                  // ),




                ],
              ),
            ),
          ),

          // Floating appbar
          Positioned(
            top: 70.0,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF00bf6f).withOpacity(.8),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: CircleAvatar(
                      backgroundColor:Theme.of(context)
                          .primaryColor,
                      radius: 22,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
