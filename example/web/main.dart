import 'dart:html';

import 'package:auth0_spa_dart/auth0_spa_dart.dart';
import 'package:js/js.dart';

const clientId = '{YOUR AUTH0 CLIENT ID}';
const domain = '{YOUR AUTH0 DOMAIN}';

@JS('loginWithPopup')
external set _loginWithPopup(void Function() f);

@JS()
external void loginWithPopup();

@JS('getTokenSilently')
external set _getTokenSilently(void Function() f);

@JS()
external void getTokenSilently();

@JS('console.log')
external void consoleLog(dynamic data);

void main() async {
  querySelector('#output')?.text = 'Your Dart app is running.';

  // Use localstorage to persist tokens across page refreshes/sessions.
  // default value is memory, in which user must reauthenticate on every page-load.
  final client = await createAuth0Client(
      clientId: clientId, domain: domain, useRefreshTokens: true, cacheLocation: "localstorage");
  try {
    // Detailed response includes accessToken, idToken, and expiresIn.
    // Default value is false, which only responds with accessToken.
    final token = await client.getTokenSilently(detailedResponse: true);
    consoleLog(token);
  } catch (e) {
    consoleLog(e);
  }

  _loginWithPopup = allowInterop(client.loginWithPopup);

  _getTokenSilently = allowInterop(() async {
    final token = await client.getTokenSilently(detailedResponse: true);
    consoleLog(token);
  });
}
