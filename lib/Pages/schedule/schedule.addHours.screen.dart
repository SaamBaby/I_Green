import 'dart:async';
import 'package:Quete/Utils/Widgets/schedule.stopwatch.dart';
import 'package:Quete/models/job_shifts.dart';
import 'package:Quete/providers/jobs_provider.dart';
import 'package:Quete/models/direction.dart';
import 'package:Quete/providers/schedule.shifts.provider.dart';
import 'package:Quete/services/location/location.helper.services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show SystemChrome, SystemUiOverlayStyle, rootBundle;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_webservice/directions.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddHours extends StatefulWidget {
  String title;
  final String arguments;

  AddHours({Key key, this.arguments}) : super(key: key);


  @override
  _AddHoursState createState() => _AddHoursState();
}
// sam
class _AddHoursState extends State<AddHours> {
  String mapStyle;
  @override
  void initState() {
    locateCurrentPosition();
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
  Position _currentLocation;
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController _googleMapController;
  List<LatLng> polyLineCoordinates =[];
  double bottomPaddingOfMap;
  Set<Polyline> polyLineSet={};
  CameraPosition cameraPosition;
  Set<Marker> markers={};
  Set<Circle> circles={};
  String _currentAddress;
  DirectionDetails details=DirectionDetails(distanceText: "0 km away");
  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  // Stop Watch variables
  bool isActive=false;
  bool isShitStarted = false;

  Stopwatch _stopwatch;
  Timer _timer;

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
    _googleMapController = await _controllerGoogleMap.future;
    _currentLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      await placemarkFromCoordinates(_currentLocation.latitude, _currentLocation.longitude).then((placemarks) {
    });

    //  convert current location using api
    _currentAddress = await LocationHelper.searchCoordinateAddress(_currentLocation);
    LatLng latLngCurrentPosition = LatLng(_currentLocation.latitude, _currentLocation.longitude);
    cameraPosition = new CameraPosition(target:  latLngCurrentPosition, zoom: 15);

    _googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  Future<void> shiftLocation(address) async {
    Position destination= await LocationHelper.searchAddressCoordinate(address);
     details= await LocationHelper.getAddressDirection(_currentLocation, destination);
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
        color: Colors.black,
        jointType: JointType.round,
        points: polyLineCoordinates,
        width: 3,
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

    _googleMapController
        .animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 70));
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
        content: Text('You have to be at the workplace to start the timer',style: TextStyle(
            fontFamily: 'Futura Book',
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold),),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));

    final String shiftId = ModalRoute.of(context).settings.arguments as String;
    final loadedShiftData = Provider.of<ShiftProvider>(context, listen: true)
        .fetchAvailableShifts().firstWhere((element) => element.shiftId ==
        widget.arguments);
     print(loadedShiftData.shiftName);
    final loadedJobData = Provider.of<Jobs>(context).getJobById(loadedShiftData.jobId);
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
              shiftLocation(loadedJobData.jobLocation);
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
                .5:MediaQuery.of(context).size.height*.6,
            child: Container(
              padding: EdgeInsets.only(right: 20,left: 20,bottom: 30),
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        blurRadius: 4,
                        spreadRadius: .5,
                        offset: Offset(0.3, 0.3))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 0,left: 100,right: 100,
                          bottom: 15),
                      child:  Divider(
                        thickness: 3.8,
                        color: Color(0xff344644).withOpacity(.2),
                      )),
                  isActive?StopWatch(stopWatch: _stopwatch,):SizedBox(height: 1,),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                        margin: EdgeInsets.only(right: 5),
                        width: 55,
                        height: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF00bf6f).withOpacity(.8),),
                        child: Text(
                          "Location",
                          style: TextStyle(
                              fontFamily: 'Futura Book',
                              color: Colors.white,
                              fontSize: 13.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 5,),
                      SizedBox(
                        width:180,
                        child: Text(
                          '${loadedJobData .jobLocation}',
                          style: TextStyle(
                              fontFamily: 'Futura Book',
                              color: Colors.black54.withOpacity(.7),
                              fontSize: 15,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      Text(
                        '( ${details.distanceText} away )',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontFamily: 'Futura Book',
                            color: Colors.black54.withOpacity(.7),
                            fontSize: 13,

                            fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    loadedJobData.jobName,

                    style: TextStyle(
                        fontFamily: 'Futura Heavy',
                        color: Color(0xff344644),
                        fontSize: 25,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "${loadedJobData.jobLocation.replaceAll(',', ' .').split(".").first} . 9AM - 5 PM ",

                    style:TextStyle(
                        fontFamily: 'Futura Book',
                        color: Colors.black54.withOpacity(.7),
                        fontSize: 16,
                        letterSpacing: 1.4,

                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5,),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                         if(isActive==false){
                          shiftLocation(loadedJobData.jobLocation);}
                         else if(isActive){
                           print(loadedShiftData.shiftDateTime);
                           setState(() {

                             shiftData =ShiftModel(
                                 shiftId: loadedShiftData.shiftId,
                                 shiftName: loadedShiftData.shiftName,
                                 jobId:loadedShiftData.jobId,
                                 shiftStartTime:DateTime.now(),
                                 shiftEndTime:shiftData.shiftEndTime,
                                 shiftDateTime:loadedShiftData.shiftDateTime,
                                 isComplete:shiftData.isComplete
                             );
                             isShitStarted=true;
                           });
                           handleStartStop();
                         }
                        },
                        child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            height: 45,
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width*.45,
                            decoration: BoxDecoration(
                              color: isActive?Color(0xFF00bf6f).withOpacity(.8):Color(0xfff2f2f2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: RichText(
                              text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(Icons.access_time_rounded,
                                          size: 20,color: Colors.white,),
                                    ),
                                TextSpan(
                                  text: "  "
                                ),
                                TextSpan(
                                  text:  isShitStarted? "Stop Shift ":"Start "
                                      "Shift",
                                  style: TextStyle(
                                    color: isActive?Colors.white:Colors.black12,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Futura Book',
                                  ),
                                )
                                  ]
                              ),
                            ) ),
                      ),
                      Spacer(),
                      InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              isActive=(!isActive);

                            });
                          },
                          child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 20,
                              alignment: Alignment.center,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Icon(
                                FontAwesomeIcons.recycle,
                                color: Colors.blue,
                                size: 17,
                              ))),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {},
                          child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 20,
                              alignment: Alignment.center,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Icon(
                                FontAwesomeIcons.calendar,
                                color: Colors.blue,
                                size: 17,
                              ))),



                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),


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
                      backgroundColor: Color(0xFF00bf6f).withOpacity(.8),
                      radius: 22,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 17),
                    width: 280,
                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(.5),
                              blurRadius: 2,
                              spreadRadius: .5,
                              offset: Offset(0.3, 0.3))
                        ]
                    ),
                    child: Text(
                      'Work Hours until ${(DateFormat('d. MMM . yyyy').format(DateTime.now()))}       30:00',
                      style: TextStyle(
                          fontFamily: 'Futura Book',
                          color: Colors.black,
                          fontSize: 13,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w900),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}