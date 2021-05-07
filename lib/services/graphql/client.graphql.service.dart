import 'package:Quete/Utils/const.dart';
import 'package:graphql/client.dart';
import 'package:flutter/material.dart';
import 'package:Quete/services/cache/user.cache.service.dart';
import 'package:hive/hive.dart';



class IgreenGraphQLClient extends ChangeNotifier {

  static GraphQLClient _client;
 Map<String, String> defaultHeaders;

  static Future<GraphQLClient> getClient() async {
    final HttpLink _httpLink = HttpLink(Constants.httpEndpoint,
        defaultHeaders:{
          'x-hasura-admin-secret': Constants.adminSecret,
          'X-Hasura-Role'        : 'user',
          'X-Hasura-User-Id'     : UserCacheService.user.id,
    });

    // final WebSocketLink _webSocketLink = WebSocketLink(
    //     Constants.webSocketEndpoint,
    //   config: SocketClientConfig(
    //     autoReconnect: true,
    //     inactivityTimeout: Duration(seconds: 30),
    //     // ignore: deprecated_member_use
    //     initPayload: {
    //       'x-hasura-admin-secret': Constants.adminSecret,
    //       'X-Hasura-Role': 'user',
    //       'X-Hasura-User-Id': UserCacheService.user.id,
    //     }
    //   ),
    // );


    // final Link _link = Link.split((request) => request.isSubscription,
    //     _webSocketLink, _httpLink);
    final box = await Hive.openBox('graphql');


    _client = GraphQLClient(
      cache: GraphQLCache(store: HiveStore(box)),

      link: _httpLink,
    );

    return _client;
  }
}