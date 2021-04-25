import 'package:Quete/Utils/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graphql/client.dart';
import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

class IgreenGraphQLClient extends ChangeNotifier{

  static GraphQLClient _client;
 Map<String, String> defaultHeaders;
  static Future<GraphQLClient> getClient() async {
    final HttpLink _httpLink = HttpLink(Constants.graphqlEndpoint,
        defaultHeaders:const {
      'x-hasura-admin-secret': Constants.adminSecret
    });
    // final box = await Hive.openBox('graphql');

    String token;

    try {token = await FirebaseAuth.instance.currentUser.getIdToken(true);
    } catch (e) {
      print(e);
    }

    final AuthLink _authLink = AuthLink(getToken: () => token);
    print(_authLink);
    // final Link _link = _authLink.concat(_httpLink);


    _client = GraphQLClient(
      cache: GraphQLCache(),

      link: _httpLink,
    );

    return _client;
  }
}