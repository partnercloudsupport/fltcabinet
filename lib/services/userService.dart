class UserService {}

// Verify if an user is sing in
bool verifyUser(String login, String passwd) {
  bool isHere = false;
  if (login.trim().toLowerCase().toString() == 'njaka' &&
      passwd.trim().toLowerCase().toString() == 'njakamdp') return !isHere;
  return isHere;
}
