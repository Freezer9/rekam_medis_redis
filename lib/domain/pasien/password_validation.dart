String? validatePassword(String newPassword, String confirmPassword) {
  if (newPassword.isEmpty || confirmPassword.isEmpty) {
    return "Password tidak boleh kosong.";
  }

  if (newPassword.length < 8) {
    return "Password harus minimal 8 karakter.";
  }

  if (!RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(newPassword)) {
    return "Password harus mengandung setidaknya satu karakter unik (#?!@%^&*-).";
  }

  if (newPassword != confirmPassword) {
    return "Password dan konfirmasi password tidak sama.";
  }

  return null;
}
