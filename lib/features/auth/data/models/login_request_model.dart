class LoginRequestModel {
  final String identifier;
  final String password;

  LoginRequestModel({
    required this.identifier,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'identifier': identifier,
      'password': password,
    };
  }
}
