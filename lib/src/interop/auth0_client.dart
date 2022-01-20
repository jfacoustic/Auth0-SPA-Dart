// ignore_for_file: non_constant_identifier_names

@JS()
library auth0_spa;

import 'package:js/js.dart';

@JS('Auth0Client')
class Auth0Client {
  external Auth0Client(Auth0ClientOptions options);
  external buildAuthorizeUrl();
  external buildLogoutUrl();
  external checkSession();
  external getIdTokenClaims();
  external getTokenSilently(GetTokenSilentlyOptions options);
  external getTokenWithPopup();
  external getUser();
  external handleRedirectCallback();
  external isAuthenticated();
  external loginWithPopup();
  external loginWithRedirect(RedirectLoginOptions options);
  external logout();
}

@JS()
@anonymous
class Auth0ClientOptions {
  external factory Auth0ClientOptions(
      {String client_id,
      String domain,
      bool useRefreshTokens = false,
      String cacheLocation = "memory"});
  external String get client_id;
  external String get domain;
  external bool get useRefreshTokens;
  external String get cacheLocation;
}

@JS()
@anonymous
class RedirectLoginOptions {
  external factory RedirectLoginOptions({String redirect_uri});
  external String get redirect_uri;
}

@JS()
@anonymous
class GetTokenSilentlyOptions {
  external factory GetTokenSilentlyOptions({bool detailedResponse = false});
  external bool get detailedResponse;
}
