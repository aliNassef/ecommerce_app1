class EndPoint {
  static String baseUrl = "https://ecommerce.routemisr.com/";
  static String signIn = "api/v1/auth/signin";
  static String signUp = "api/v1/auth/signup";
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKey {
  static String status = "status";
  static String statusMsg = 'statusMsg';
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "id";
  static String name = "name";
  static String role = 'role';
  static String phone = "phone";
}
