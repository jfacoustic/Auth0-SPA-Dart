import 'dart:js_util';

import '../interop/auth0_client.dart' as interop;

class Auth0Client {
  final String clientId;
  final String domain;
  final String cacheLocation;
  final interop.Auth0Client _client;

  Auth0Client({required this.clientId, required this.domain, this.cacheLocation = "memory"})
      : _client = interop.Auth0Client(
            interop.Auth0ClientOptions(client_id: clientId, domain: domain, cacheLocation: cacheLocation));

  Auth0Client.fromJavascript({
    required this.clientId,
    required this.domain,
    this.cacheLocation = "memory",
    required interop.Auth0Client jsClient,
  }) : _client = jsClient;

  Future<dynamic> handleRedirectCallback() async {
    return await promiseToFuture(_client.handleRedirectCallback());
  }

  Future<dynamic> getTokenSilently({bool detailedResponse = false}) async {
    return await promiseToFuture(_client.getTokenSilently(
        interop.GetTokenSilentlyOptions(detailedResponse: detailedResponse)));
  }

  Future<bool> isAuthenticated() async {
    return await promiseToFuture(_client.isAuthenticated());
  }

  Future<void> loginWithPopup() async {
    await promiseToFuture(_client.loginWithPopup());
  }

  Future<String?> loginWithRedirect({String redirectUri = ''}) async {
    return await promiseToFuture(_client.loginWithRedirect(
        interop.RedirectLoginOptions(redirect_uri: redirectUri)));
  }
}
