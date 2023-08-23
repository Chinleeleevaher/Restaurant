class ApiPaths {
  // static const baseURL = 'https://';
  static const baseURL = 'http://192.168.237.61:3005';

  /// HTTP request methods
  static const String getRequest = 'get';
  static const String postRequest = 'post';
  static const String putRequest = 'put';
  static const String patchRequest = 'patch';
  static const String deleteRequest = 'delete';

  // Sub paths
  static const String loginPath = '$baseURL/login';
  static const String tabletypepath = '$baseURL/tableType';
  static const String tablepath = '$baseURL/table';
  static const String productpath = '$baseURL/food';
  static const String producttypepath = '$baseURL/product-type';
  static const String unitpath = '$baseURL/Unit';

  static const imagePath = '/image';
  static const String defaulProfileImage =
      'https://img.freepik.com/free-icon/user_318-159711.jpg';
}
