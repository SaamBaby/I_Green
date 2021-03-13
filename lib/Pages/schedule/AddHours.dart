import 'dart:async';

import 'package:Quete/providers/jobs_provider.dart';
import 'package:Quete/models/direction.dart';
import 'package:Quete/providers/shifts.schedule.provider.dart';
import 'package:Quete/services/location_helper/location.helper.services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'

    show SystemChrome, SystemUiOverlayStyle, rootBundle;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddHours extends StatefulWidget {
  String title;
  static const routName = '/addHours-screen';

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
    super.initState();

  }
  Position _currentLocation;
  bool isActive=false;
  bool isShitStarted = false;
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

  Future<bool> shiftLocation(address) async {
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
    if(_currentLocation.latitude>destination.latitude&& _currentLocation.longitude>destination.longitude)
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

    Marker currentLocationMarker=Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      infoWindow: InfoWindow(title:_currentAddress,snippet: "Current Location" ),
      position: LatLng(_currentLocation.latitude, _currentLocation.longitude),
      markerId: MarkerId("currentLocationId")
    );
    Marker destinationLocationMarker=Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(title:address,snippet: "Your Destination" ),
        position: LatLng(destination.latitude, destination.longitude),
        markerId: MarkerId("destinationLocationId")
    );
    setState(() {

      markers.add(destinationLocationMarker);
    });
    if(destination != _currentLocation){
      setState(() {
        isActive=true;
      });

    }

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));
    final String shiftId = ModalRoute.of(context).settings.arguments as String;
    final loadedShiftData = Provider.of<ShiftProvider>(context, listen: true)
        .itemsList
        .firstWhere((element) => element.shiftId == shiftId);
    String jobId = loadedShiftData.jobId;
    final loadedJobData = Provider.of<Jobs>(context).getJobById(jobId);
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
            duration: Duration(milliseconds: 500),
            bottom: 0,
            right: 0,
            left: 0,
            top: isShitStarted?MediaQuery.of(context).size.height*
                .38:MediaQuery.of(context).size.height*.71,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              height: 250,
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
                      padding: EdgeInsets.only(top: 5,left: 100,right: 100,bottom: 30),
                      child:  Divider(
                        thickness: 3.8,
                        color: Color(0xff344644).withOpacity(.2),
                      )),

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
                        width:200,
                        child: Text(
                          '${loadedJobData .jobLocation}',
                          style: TextStyle(
                              fontFamily: 'Futura Book',
                              color: Colors.black54.withOpacity(.7),
                              fontSize: 16,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Text(
                        '( ${details.distanceText} away )',
                        style: TextStyle(
                            fontFamily: 'Futura Book',
                            color: Colors.black54.withOpacity(.7),
                            fontSize: 14,

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
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          shiftLocation(loadedJobData.jobLocation);
                        },
                        child: AnimatedContainer(
                            margin: EdgeInsets.only(bottom: 10),
                            duration: Duration(milliseconds: 300),
                            height: 45,
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width*.45,
                            decoration: BoxDecoration(
                              color: isActive?Color(0xFF00bf6f).withOpacity(.8):Color(0xfff2f2f2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              isShitStarted? "Stop Timer ":"Start Timer",
                              style: TextStyle(
                                color: isActive?Colors.white:Colors.black12,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Futura Book',
                              ),
                            )),
                      ),
                      Spacer(),
                      InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [


                    ],
                  )
                ],
              ),
            ),
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
                    width: 310,
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
                          fontSize: 14,
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
