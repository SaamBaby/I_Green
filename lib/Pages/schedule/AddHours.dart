import 'dart:async';

import 'package:Quete/providers/jobs_provider.dart';
import 'package:Quete/providers/shifts.schedule.provider.dart';
import 'package:Quete/services/location_helper/location.helper.services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show SystemChrome, SystemUiOverlayStyle, rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class AddHours extends StatefulWidget {
  String title;
  static const routName = '/addHours-screen';

  @override
  _AddHoursState createState() => _AddHoursState();
}

class _AddHoursState extends State<AddHours> {
  Position _currentLocation;
  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController _googleMapController;

  void locateCurrentPosition() async {
    _googleMapController =await _controllerGoogleMap.future;
    _currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    String address =
        await LocationHelper.searchCoordinateAddress(_currentLocation);
    LatLng latLngPosition =
        LatLng(_currentLocation.latitude, _currentLocation.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLngPosition, zoom: 15);
    print("${cameraPosition.target.toJson()} current location");
    _googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void shiftLocation() {}

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
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            initialCameraPosition: _kGooglePlex,

            onMapCreated: (GoogleMapController controller) {
              locateCurrentPosition();
              _controllerGoogleMap.complete(controller);
            },
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 530,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    tileMode: TileMode.clamp,
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [
                      Color(0x1AFFFFFF),
                      Color(0x4DFFFFFF),
                      Colors.white
                    ]),
                color: Colors.white,
              ),
              child: Icon(
                Icons.arrow_back,
                color: Color(0xff344644),
                size: 24,
              ),
            ),
          ),
          Positioned(
            top: 65.0,
            left: 22,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        blurRadius: 4,
                        spreadRadius: 0.2,
                        offset: Offset(0.6, 0))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: CircleAvatar(

                  backgroundColor: Colors.white,
                  radius: 25,
                  child: Icon(
                    Icons.arrow_back,
                    color:  Color(0xFF00bf6f).withOpacity(.8),
                    size: 24,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
