class EndPoint {
  static String baseUrl = "https://ecommerce.routemisr.com/";
  static String signIn = "api/v1/auth/signin";
  static String signUp = "api/v1/auth/signup";
  static String forgetPass = 'api/v1/auth/forgotPasswords';
  static String verifyResetCode = 'api/v1/auth/verifyResetCode';
  static String changePass = 'api/v1/users/changeMyPassword';
  static String updateUser = 'api/v1/users/updateMe/';
  static String resetPass = 'api/v1/auth/resetPassword';
  static String allusers = 'api/v1/users';
  static String allSubCategories = 'api/v1/subcategories';
  static String brands = 'api/v1/brands?limit=10';
  static String allCategories = 'api/v1/categories';
  static String allProduct = 'api/v1/products';
  static String getUserCart = 'api/v1/cart';
}

class ApiKey {
  static String status = "status";
  static String statusMsg = 'statusMsg';
  static String email = "email";
  static String password = "password";
  static String repass = 'rePassword';
  static String currentPassword = "currentPassword";
  static String token = "token";
  static String newPass = 'newPassword';
  static String message = "message";
  static String id = "id";
  static String name = "name";
  static String role = 'role';
  static String phone = "phone";
  static String data = 'data';
}
