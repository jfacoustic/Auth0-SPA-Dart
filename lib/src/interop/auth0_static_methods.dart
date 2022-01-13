import 'package:js/js.dart';

import './auth0_client.dart';

@JS('createAuth0Client')
external Auth0Client createAuth0Client(Auth0ClientOptions options);
