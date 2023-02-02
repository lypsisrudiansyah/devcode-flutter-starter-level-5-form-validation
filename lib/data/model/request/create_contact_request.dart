dynamic createContactRequest(String fullname, String phoneNumber, String email) {
  return {
    'full_name': fullname,
    'phone_number': phoneNumber,
    'email': email
  };
}