class AuthServiceAPI {
  // TODO Set environment variables such as API key with dontenv
  static const String signUpBaseUrl = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyANsw1pnYWVbGD0jq793x4UiIm8HFbq5yA';
  // TODO Set environment variables such as API key with dontenv
  static const String logInBaseUrl =
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyANsw1pnYWVbGD0jq793x4UiIm8HFbq5yA';
}

class RestaurantsServiceAPI {
  // TODO Set environment variables such as API key with dontenv
  static const String baseUrl = 'https://maps.googleapis.com/maps/api/place/textsearch/json?';
  // TODO Set environment variables such as API key with dontenv
  static const String nearByRestaurants = 'key=AIzaSyANsw1pnYWVbGD0jq793x4UiIm8HFbq5yA&type=restaurant';
}
