import 'dart:convert';

import 'package:Quete/models/job_shifts.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ShiftProvider with ChangeNotifier {
  Map<String, ShiftModel> _items = {};
  var authToken;
  var uuid;

  ShiftProvider(this.authToken, this.uuid, this._items,);

  Map<String, ShiftModel> get items {
    return {..._items};
  }

  List<ShiftModel> get itemsList {
    fetchAllShifts();

    return {..._items}.values.toList();
  }

  Future<void> fetchAllShifts() async {
    final url = 'https://igreen-458f7-default-rtdb.firebaseio'
        '.com/users/$uuid/activities/shift_History.json?auth=$authToken';
    try {
      final response = await http.get(url);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((id, availableShiftsData) {
        _items.putIfAbsent(
            availableShiftsData['jobId'],
            () => ShiftModel(
                  shiftId: id,
                  shiftDateTime: DateTime.parse(availableShiftsData['shiftDate']),
                  jobId: availableShiftsData['jobId'],
                  shiftName: availableShiftsData['shiftName'],
                  isComplete: availableShiftsData['isComplete']
                ));


        notifyListeners();
      });
    } catch (error) {
      print(error);
    }
  }
  List <ShiftModel>  fetchAvailableShifts() {
    List<ShiftModel>temp =[];
    itemsList.forEach((element) {

      if(element.isComplete==false){
        temp.add(element);

      }
    }
    );
    return temp;
  }

  List <ShiftModel>  fetchShiftHistory() {
     var temp =[];
    itemsList.forEach((element) {
      if(element.isComplete==true){
       temp.add(element);
      }
    }
    );
    return temp;
  }
  Future<void> addShiftHistory(ShiftModel shiftModel) async {
    print(shiftModel.shiftId);
    final url = 'https://igreen-458f7-default-rtdb.firebaseio.com/users/$uuid/activities/shift_History/${shiftModel.shiftId}.json/?auth=$authToken';
    try {
      final value = await http.patch(
        url,
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          'shiftId': shiftModel.shiftId,
          'jobId': shiftModel.jobId,
          'shiftName':shiftModel.shiftName,
          'shitDateTime': shiftModel.shiftDateTime.toString(),
          'isComplete': shiftModel.isComplete,
          'shiftStartTime':shiftModel.shiftStartTime.toString(),
          'shiftEndTime':shiftModel.shiftEndTime.toString()
        }),

      );
      print(value.body);
      print(value.statusCode);

      notifyListeners();

    } catch (error) {
      throw error;
    }

    notifyListeners();
  }


}
