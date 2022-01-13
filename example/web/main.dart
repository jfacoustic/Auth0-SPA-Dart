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

void main() async {
  querySelector('#output')?.text = 'Your Dart app is running.';
  final client = await createAuth0Client(clientId: clientId, domain: domain);

  _loginWithPopup = allowInterop(client.loginWithPopup);
  _getTokenSilently = allowInterop(() async {
    final token = await client.getTokenSilently();
    querySelector('#output')?.text = token;
  });
}
