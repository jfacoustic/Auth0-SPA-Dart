import 'dart:html';

import 'package:auth0_spa_dart/auth0_spa_dart.dart';
import 'package:js/js.dart';

const clientId = 'y60Es81EyYmUiuxSHYbbLkZIroMO1Eru';
const domain = '32waves.auth0.com';

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
      clientId: clientId,
      domain: domain,
      useRefreshTokens: true,
      cacheLocation: "localstorage");
  try {
    // Detailed response includes accessToken, idToken, and expiresIn.
    // Default value is false, which only responds with accessToken.
    await fetchToken(client);
  } catch (e) {
    consoleLog(e);
  }

  _loginWithPopup = allowInterop(client.loginWithPopup);

  _getTokenSilently = allowInterop(() async {});
}

Future<void> fetchToken(Auth0Client client) async {
  final token = await client.getTokenSilently(detailedResponse: true);
  querySelector('#access_token')?.text = token.accessToken;
  querySelector('#id_token')?.text = token.idToken;
  querySelector('#expires_in')?.text = '${token.expiresIn}';
}
