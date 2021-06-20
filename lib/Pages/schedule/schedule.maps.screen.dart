import 'dart:async';
import 'package:Quete/Routes.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:Quete/models/direction.dart';
import 'package:Quete/services/graphql/activity.service.dart';
import 'package:Quete/services/location/location.helper.services.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show SystemChrome, SystemUiOverlayStyle, rootBundle;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class LocationMap extends StatefulWidget {
  final String arguments;

  LocationMap({Key key, this.arguments}) : super(key: key);


  @override
  _LocationMapState createState() => _LocationMapState();
}
// sam
class _LocationMapState extends State<LocationMap> {
  String mapStyle;
  Position _currentLocation;
  Position lastPosition ;
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

  @override
  void initState() {
    rootBundle.loadString('assets/utils/map_style.txt').then((string) {
      mapStyle = string;
    });
    super.initState();

  }
  @override
  void dispose() {
    super.dispose();
  }

  DirectionDetails details=DirectionDetails(distanceText: "0 km away");

  CameraPosition _kGooglePlex = CameraPosition(
      // lastPosition??currentLocation??
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  String _textSelect(String str) {
    str = str.replaceAll('.', '');
    str = str.replaceAll(',', '.');
    str = str.replaceAll('(', '');
    str = str.replaceAll(')', '');
    return str;
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

    setState(()
    {
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
    final loadedShiftData = Provider.of<ActivityService>(context, listen: true).activities.firstWhere((element) => element.activityId==activityId);
    List<String> tempLocation=loadedShiftData.shift.job.jobLocation.split(',');
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
          ),

          AnimatedPositioned(
            duration: Duration(milliseconds: 0),
            bottom: 0,
            right: 0,
            left: 0,
            top: MediaQuery.of(context).size.height*.55,
            child: Container(
              padding: EdgeInsets.only(right: 20,left: 20,bottom: 10),
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
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0.0,
                    left: 20,
                    right: 20,
                    child:RichText(
                      text: TextSpan(
                          text: details.distanceText.split('km').first,
                          style: GoogleFonts.montserrat(
                            fontSize: ScreenUtil().setSp(120),
                            color:Colors.grey.withOpacity(.1),
                            fontWeight: FontWeight.w900,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'KM',
                                style: GoogleFonts.montserrat(
                                  fontSize: ScreenUtil().setSp(20),
                                  color:Colors.grey.withOpacity(.1),
                                  fontWeight: FontWeight.w900,))
                          ]
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Center(
                        child: AvatarGlow(
                          startDelay: Duration(milliseconds: 1000),
                          glowColor: Theme.of(context).primaryColor,
                          endRadius: 50.0,
                          duration: Duration(milliseconds: 1000),
                          repeat: true,
                          showTwoGlows: true,
                          repeatPauseDuration: Duration(milliseconds: 50),
                          child: MaterialButton(
                            onPressed: () {
                              locateShiftLocation(loadedShiftData.shift.job
                                  .jobLocation).then((value) {

                                if(isActive){
                                  Navigator.of(context).pushNamed(Routes
                                      .stopWatch,arguments:activityId );
                                }

                              });
                            },
                            elevation: 50.0,
                            shape: CircleBorder(),
                            child: Container(
                              width:90,
                              height:90,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                      color:Theme.of(context).primaryColor,
                                      width: .5 )

                              ),
                              child: Icon(Icons.alarm_add,color:isActive?Theme.of(context)
                                  .primaryColor:Colors.grey.withOpacity(.6),size: 30,),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            isActive=!isActive;
                          });
                        },
                        icon: Icon(Icons.alarm_add,color:isActive?Theme.of(context)
                            .primaryColor:Colors.grey.withOpacity(.6),size: 30,),
                      ),
                      Divider(),
                      // isActive?StopWatch(stopWatch: _stopwatch,):SizedBox(height: 1,),

                      Text(
                          "Distance",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontFamily: "Futura Book",
                              letterSpacing: .8,
                              height: 2,
                              color: Colors.black.withOpacity(.6),
                              fontSize: 14),
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
                          style: TextStyle(
                              fontFamily: 'Futura Heavy',
                              color: Colors.black.withOpacity(.8),
                              fontSize: 25,
                              height: 1.5,
                              letterSpacing: .8,
                              fontWeight: FontWeight.bold),

                      ),
                      SizedBox(
                        width:double.infinity,
                        child: Text(
                            _textSelect(tempLocation.getRange(1,3).toString()),
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: "Futura Book",
                                letterSpacing: .8,
                                height: 1.5,
                                color: Colors.black.withOpacity(.6),
                                fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Expanded(
                        flex: 4,
                        child:  InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {

                              MapsLauncher.launchQuery(loadedShiftData.shift.job.jobLocation);
                            },
                            child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                height: ScreenUtil().setHeight(50),
                                alignment: Alignment.center,
                                width: ScreenUtil().setWidth(150),
                                decoration: BoxDecoration(
                                  color:  Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                     "Open maps",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontFamily: "Futura Book",
                                          letterSpacing: .8,
                                          height: 1.5,
                                          color: Colors.white,
                                          fontSize: 13),
                                  ),
                                ),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
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
                  )
                ],
              ),
            ),
          ),


          // Floating appbar

        ],
      ),
    );
  }
}
