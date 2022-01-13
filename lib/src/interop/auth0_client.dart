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
  external getTokenSilently();
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
  external factory Auth0ClientOptions({String client_id, String domain});
  external String get client_id;
  external String get domain;
}

@JS()
@anonymous
class RedirectLoginOptions {
  external factory RedirectLoginOptions({String redirect_uri});
  external String get redirect_uri;
}
