class UpdatePasswordRequsetModel {
  final String oldPassword;
  final String newPassword;
  UpdatePasswordRequsetModel({
    required this.oldPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() => {
    "currentPassword": oldPassword,
    "password": newPassword,
    "rePassword": newPassword,
  };
}
