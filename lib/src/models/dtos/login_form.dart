class LoginForm {

  String email;
  String password;

  LoginForm();

  LoginForm.fromJson(Map<String, dynamic> json)
    : email = json['email'],
      password = json['password'];

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password
  };

  @override
  String toString() {
    return 'LoginForm{email: $email, password: $password}';
  }

}