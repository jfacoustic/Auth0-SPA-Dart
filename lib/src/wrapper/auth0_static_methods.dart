import 'package:js/js_util.dart';
import './auth0_client.dart';
import '../interop/interop.dart' as interop;

Future<Auth0Client> createAuth0Client(
    {required String clientId, required String domain}) async {
  final jsClient = await promiseToFuture(interop.createAuth0Client(
      interop.Auth0ClientOptions(client_id: clientId, domain: domain)));
  return Auth0Client.fromJavascript(
      clientId: clientId, domain: domain, jsClient: jsClient);
}
