// DonnC

enum AppServiceAlias {
  FAKE, // emulate fake services
  ACTUAL, // real api service
}

// event enums
enum AuthEventAction {
  // event action for login, signup and forgot password
  None,
  Success,
  Fail,
  Error,
  ForgotPassword,
  SuccessEmailSend, // forgot password, email send successfully
}

enum HomePageEventAction {
  // event triggered on the home page
  None,
  Success,
  Error,
}
