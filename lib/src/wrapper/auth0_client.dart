import 'dart:js_util';

import '../interop/auth0_client.dart' as interop;

class Auth0Client {
  final String clientId;
  final String domain;
  final interop.Auth0Client _client;

  Auth0Client({required this.clientId, required this.domain})
      : _client = interop.Auth0Client(
            interop.Auth0ClientOptions(client_id: clientId, domain: domain));

  Future<dynamic> handleRedirectCallback() async {
    return await promiseToFuture(_client.handleRedirectCallback());
  }

  Future<String> getTokenSilently() async {
    return await promiseToFuture(_client.getTokenSilently());
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
