

enum PasswordStrength { WEAK, MEDIUM, STRONG, VERY_STRONG }


extension PasswordStrengthExtension on PasswordStrength{
  String get key {
    switch(this){
      case PasswordStrength.WEAK:
        return "Weak";
      case PasswordStrength.MEDIUM:
        return "Medium";
      case PasswordStrength.STRONG:
        return "Strong";
      case PasswordStrength.VERY_STRONG:
        return "Very Strong";
    }
  }
}