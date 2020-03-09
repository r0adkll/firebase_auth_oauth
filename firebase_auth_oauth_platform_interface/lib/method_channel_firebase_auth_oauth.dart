part of firebase_apple_auth_platform_interface;

/// Method channel implementation of [FirebaseAuthOAuth]
class MethodChannelFirebaseAuthOAuth extends FirebaseAuthOAuth {
  final FirebaseApp _app;

  static const MethodChannel _channel =
      const MethodChannel('me.amryousef.apple.auth/firebase_apple_auth');

  MethodChannelFirebaseAuthOAuth._({FirebaseApp app})
      : _app = app ?? FirebaseApp.instance,
        super._();

  @override
  Future<String> openSignInFlow(String provider, List<String> scopes,
      [Map<String, String> customOAuthParameters]) async {
    return await _channel.invokeMethod("openSignInFlow", {
      'provider': provider,
      'app': _app.name,
      'scopes': json.encode(scopes),
      if (customOAuthParameters != null)
        'parameters': json.encode(customOAuthParameters)
    });
  }

  @override
  FirebaseAuthOAuth withApp(FirebaseApp app) =>
      MethodChannelFirebaseAuthOAuth._(app: app);
}
