import 'dart:convert';

import 'package:Quete/models/job_shifts.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ShiftProvider with ChangeNotifier {
  Map<String, ShiftModel> _items = {};
  var authToken;

  ShiftProvider(this.authToken, this._items);

  Map<String, ShiftModel> get items {
    return {..._items};
  }

  List<ShiftModel> get itemsList {
    fetchAvailableShifts();

    return {..._items}.values.toList();
  }

  Future<void> fetchAvailableShifts() async {
    final url =
        'https://igreen-458f7-default-rtdb.firebaseio.com/available_Shifts.json?auth=$authToken';
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
                  userIds: availableShiftsData['userIds'],
                ));
        notifyListeners();
      });
    } catch (error) {
      print(error);
    }
  }

  List<ShiftModel> availableShifts(id) {
    return itemsList.where((element) => element.userIds.contains(id)).toList();
  }
}
