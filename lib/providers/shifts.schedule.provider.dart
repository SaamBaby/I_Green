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
    fetchAvailableShifts();

    return {..._items}.values.toList();
  }

  Future<void> fetchAvailableShifts() async {
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
                  shiftDateTime:
                      DateTime.parse(availableShiftsData['shiftDate']),
                  jobId: availableShiftsData['jobId'],
                  shiftName: availableShiftsData['shiftName'],

                ));
        notifyListeners();
      });
    } catch (error) {
      print(error);
    }
  }


}
