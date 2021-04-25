import 'package:Quete/models/User.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class UserServices{
  
  void createUser(String email,String uuid) async{
   final  url ='https://igreen-458f7-default-rtdb.firebaseio.com/users/$uuid.json';
    try {
      final response = await http.patch(
        url,
        body: json.encode({
          "userName": email,
          "firebaseUserId": uuid
        }),
      );
    } catch (error) {
      throw error;
    }



  }

  void updateUser(Map<String, dynamic> values,id ) async{
    final  url ='https://igreen-458f7-default-rtdb.firebaseio.com/users/$id.json';
    try {
      final response = await http.patch(
        url,
        body: json.encode(values),
      );
    } catch (error) {
      throw error;
    }
  }


  Future<UserModel> getUserById(String id){
    final  url ='https://igreen-458f7-default-rtdb.firebaseio.com/users/$id.json';
  }
}