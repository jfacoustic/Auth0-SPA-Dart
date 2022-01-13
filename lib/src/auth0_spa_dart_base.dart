import 'package:auth0_spa_dart/src/interop/auth0_client.dart';
import 'package:js/js_util.dart';

import 'interop/auth0_client_options.dart';
import 'interop/auth0_methods.dart';

class Auth0Spa {
  static late final Auth0Client client;
  static Future<void> init(
      {String? clientId,
      String? domain,
      String? audience,
      String? scope}) async {
    // final promise = await createAuth0Client(Auth0ClientOptions(
    //     client_id: clientId, domain: domain, audience: audience));
    // final future = promiseToFuture(promise);
    // client = await future;
  }
}
