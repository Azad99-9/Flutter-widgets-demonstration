class Validators {
  static validateEmail (value) {
                  if (value == null)
                    return 'Please select the form field and type email';
                  if (value.isEmpty)
                    return 'You have selected form field but didn\'t type anything';
                  if (!value.contains('@')) return 'Invalid email';
                  return null;
                }

  static validatePassword (value) {
                  if (value == null)
                    return 'Please select the form field and type email';
                  if (value.isEmpty)
                    return 'You have selected form field but didn\'t type anything';
                  if (value.length < 8) return 'your password should be more than 8 characters';
                  return null;
                }
}