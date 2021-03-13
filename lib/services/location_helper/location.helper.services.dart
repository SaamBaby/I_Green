import 'package:Quete/Utils/const.dart';
import 'package:Quete/models/direction.dart';
import 'package:Quete/services/location_helper/location.request.service.dart';
import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static Future<String> searchCoordinateAddress(Position position) async {
    String placeAddress = "";
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=${Constants.locationAPI}";

    var response = await RequestHelper.getRequest(url);

    if (response != "failed") {
      placeAddress = response["results"][0]["formatted_address"];
    } else {
      print("Failed:googleS");
    }
    return placeAddress;
  }

  static Future<DirectionDetails> getAddressDirection(
      Position initialPosition, Position finalPosition) async {
    String directionUrl =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude},${initialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&mode=transit &key=${Constants.locationAPI}";

    var response = await RequestHelper.getRequest(directionUrl);

    if (response == "failed") {
      print("Failed:failed to get the direciton");
      return null;
    }

    DirectionDetails directionDetails = DirectionDetails();
    directionDetails.encodePoints =
        response["routes"][0]["overview_polyline"]['points'];

    directionDetails.distanceText =
        response["routes"][0]["legs"][0]["distance"]["text"];
    directionDetails.distanceValue =
        response["routes"][0]["legs"][0]["distance"]["value"];

    directionDetails.durationValue =
        response["routes"][0]["legs"][0]["duration"]["value"];
    directionDetails.durationText =
        response["routes"][0]["legs"][0]["duration"]["text"];

    return directionDetails;
  }

  static Future<Position> searchAddressCoordinate(String address) async {
    String placeAddress = address.replaceAll(" ", "+");
    String placeId = "";
    Position placePosition;
    // for getting the  place id from the address
    String geoLocatorUrl =
        "https://maps.googleapis.com/maps/api/geocode/json?address=${placeAddress}&key=${Constants.locationAPI}";
    var geolocatorResponse = await RequestHelper.getRequest(geoLocatorUrl);
    if (geolocatorResponse != "failed") {
      placeId = geolocatorResponse["results"][0]["place_id"];
    } else {
      print("Failed to get the place id");
    }
    //  for gettting the latitude and longitude

    String googlePlaceUrl =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=geometry&key=${Constants.locationAPI}";
    var googlePlaceResponse = await RequestHelper.getRequest(googlePlaceUrl);
    if (googlePlaceResponse != "failed") {
      double latitude =
          googlePlaceResponse["result"]["geometry"]["location"]["lat"];
      double longitude =
          googlePlaceResponse["result"]["geometry"]["location"]["lng"];
      placePosition = Position(longitude: longitude, latitude: latitude);
    } else {
      print("Failed to get latitude and longitude");
    }
    return placePosition;
  }
}
