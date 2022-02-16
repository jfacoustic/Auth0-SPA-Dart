import 'dart:js_util';

import 'package:js/js.dart';

import '../interop/auth0_client.dart' as interop;

class Auth0Client {
  final String clientId;
  final String domain;
  final String cacheLocation;
  final interop.Auth0Client _client;

  Auth0Client(
      {required this.clientId,
      required this.domain,
      this.cacheLocation = "memory"})
      : _client = interop.Auth0Client(interop.Auth0ClientOptions(
            client_id: clientId, domain: domain, cacheLocation: cacheLocation));

  Auth0Client.fromJavascript({
    required this.clientId,
    required this.domain,
    this.cacheLocation = "memory",
    required interop.Auth0Client jsClient,
  }) : _client = jsClient;

  Future<dynamic> handleRedirectCallback() async {
    return await promiseToFuture(_client.handleRedirectCallback());
  }

  Future<TokenResponse> getTokenSilently(
      {bool detailedResponse = false, String? audience}) async {
    final response = await promiseToFuture(_client.getTokenSilently(
        interop.GetTokenSilentlyOptions(
            detailedResponse: detailedResponse, audience: audience)));

    if (response.runtimeType == String) {
      return TokenResponse(accessToken: response);
    }
    final accessToken = getProperty(response, "access_token");
    final idToken = getProperty(response, "id_token");
    final expiresIn = getProperty(response, "expires_in");

    return TokenResponse(
        accessToken: accessToken, idToken: idToken, expiresIn: expiresIn);
  }

  Future<bool> isAuthenticated() async {
    return await promiseToFuture(_client.isAuthenticated());
  }

  Future<void> loginWithPopup({String? audience, String? scope}) async {
    await promiseToFuture(_client.loginWithPopup(
        interop.LoginWithPopupOptions(audience: audience, scope: scope)));
  }

  Future<String?> loginWithRedirect({String redirectUri = ''}) async {
    return await promiseToFuture(_client.loginWithRedirect(
        interop.RedirectLoginOptions(redirect_uri: redirectUri)));
  }
}

class TokenResponse {
  final String? accessToken;
  final String? idToken;
  final int? expiresIn;

  TokenResponse({this.accessToken, this.idToken, this.expiresIn});
}
