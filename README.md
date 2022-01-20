# Auth0-SPA-Dart

https://pub.dev/packages/auth0_spa_dart

## Features

Dart wrapper for [auth0-spa-js](https://github.com/auth0/auth0-spa-js#documentation)

## Getting started

Add the following to your index.html:

```html
<script src="https://cdn.auth0.com/js/auth0-spa-js/1.19/auth0-spa-js.production.js"></script>
```

## Usage

#### Create client:

```dart
  final client = await createAuth0Client(
      clientId: clientId,
      domain: domain,
      useRefreshTokens: true, // default = false
      cacheLocation: "localstorage" // default = "memory"
  );
```

Use "localstorage" for cacheLocation to persist tokens across refreshes and sessions.

#### Launch login popup:

```dart
  await client.loginWithPopup();
```

#### Login with redirect:

```dart
await client.loginWithRedirect();
```

#### Get token:

```dart
  final token = await client.getTokenSilently(
    detailedResponse: true // default = false.
  );
```

If detailedResponse is false, it returns only the accessToken as a string. Otherwise, it returns:

```json
{
  "id_token": "...",
  "access_token": "...",
  "expires_in": "..."
}
```

#### Check if authenticated:

```dart
await client.isAuthenticated();
```

## Contributing

Feel free contribute. This project is still in its infancy, so it will be informal unless it takes off.
