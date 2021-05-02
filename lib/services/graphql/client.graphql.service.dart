import 'package:Quete/Utils/const.dart';
import 'package:graphql/client.dart';
import 'package:flutter/material.dart';
import 'package:Quete/services/cache/user.cache.service.dart';
import 'package:hive/hive.dart';



class IgreenGraphQLClient extends ChangeNotifier {

  static GraphQLClient _client;
 Map<String, String> defaultHeaders;

  static Future<GraphQLClient> getClient() async {
    print("igreen client user id ${UserCacheService.user.id}");

    final HttpLink _httpLink = HttpLink(Constants.graphqlEndpoint,
        defaultHeaders:{
          'x-hasura-admin-secret': Constants.adminSecret,
          'X-Hasura-Role'        : 'user',
          'X-Hasura-User-Id'     : UserCacheService.user.id,
    });

    final box = await Hive.openBox('graphql');


    _client = GraphQLClient(
      cache: GraphQLCache(store: HiveStore(box)),

      link: _httpLink,
    );

    return _client;
  }
}