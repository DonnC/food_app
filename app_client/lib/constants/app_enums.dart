// DonnC

/// response action from [AuthService] service
enum AuthResponseAction {
  None,
  Success,
  Fail,
  Error,
}

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

enum ProductDetailsEventAction {
  // triggered on [ProductDetailsPage] view
  None,
  Success,
  Error,
}

enum ProfileEditField {
  // used to know which field is edited
  None,
  Contact,
  Email,
  PaymentMethod,
  Address,
}

enum PaymentMethods {
  CreditCard,
  Paypal,
  GooglePay,
}