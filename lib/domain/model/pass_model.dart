class PasswordModal{
  String? currentPass;
  String? newPass;

  PasswordModal({this.currentPass, this.newPass});

  Map<String, dynamic> toJson() {
    return{
      'current_password': currentPass,
      'new_password': newPass,
    };
  }

  @override
  String toString() {
    return 'PasswordModal{current_password: $currentPass, new_password: $newPass}';
  }
}