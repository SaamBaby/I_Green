import 'package:firebase_auth/firebase_auth.dart';
import 'package:graphql/client.dart';



class IgreenGraphQLClient {
  static GraphQLClient _client;

  static Future<GraphQLClient> getClient() async {
    final HttpLink _httpLink = HttpLink(
        uri:'https://igreen.hasura.app/v1/graphql',
          );


    String token;

    try {
      token = await FirebaseAuth.instance.currentUser.getIdToken(true);
    } catch (e) {
      print(e);
    }

    final AuthLink _authLink = AuthLink(getToken: () => token);
    final Link _link = _authLink.concat(_httpLink);

    _client = GraphQLClient(
      cache: InMemoryCache(),
      link: _link,
    );

    return _client;
  }
}
