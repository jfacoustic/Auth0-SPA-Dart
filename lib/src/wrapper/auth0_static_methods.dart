import 'package:js/js_util.dart';
import './auth0_client.dart';
import '../interop/interop.dart' as interop;

Future<Auth0Client> createAuth0Client(
    {required String clientId, required String domain, bool useRefreshTokens = false, String cacheLocation = "memory"}) async {
  final jsClient = await promiseToFuture(interop.createAuth0Client(
      interop.Auth0ClientOptions(client_id: clientId, domain: domain, useRefreshTokens: useRefreshTokens, cacheLocation: cacheLocation)));
  return Auth0Client.fromJavascript(
      clientId: clientId, domain: domain, jsClient: jsClient, cacheLocation: cacheLocation);
}
