String? validatingEmail({required String email}) {
  if (email.isEmpty) {
    return "البريد الإلكتروني: هذا الحقل مطلوب!";
  }
  if (!email.contains("@")) {
    return "البريد الإلكتروني: يجب أن يحتوي على الرمز '@'!";
  }
  if (email.contains(' ')) {
    return "البريد الإلكتروني:لا يجب أن تحتوي على مسافات!";
  }
  if (email.split("@")[0].length < 5) {
    return "البريد الإلكتروني: يجب أن لايقل الجزء الأول عن 5 أحرف!";
  }
  if (email.split("@")[1] != "gmail.com") {
    return "البريد الإلكتروني: يجب أن يحتوي على 'gmail.com'!";
  } else {
    return null;
  }
}

String? validatingPassword({required String password}) {
  if (password.isEmpty) {
    return "كلمة المرور: هذا الحقل مطلوب!";
  }
  if (password.contains(" ")) {
    return "كلمة المرور:لا يجب أن تحتوي على مسافات!";
  }
  if (password.length < 6) {
    return "كلمة المرور: يجب أن لا تقل عن 6 أحرف!";
  } else {
    return null;
  }
}
