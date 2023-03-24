import 'bloc/login_form_bloc.dart';

class LoginFormValues {
  const LoginFormValues({
    required this.email,
  });

  final String email;

  LoginFormState toState() {
    return LoginFormState.fromValues(email: email);
  }

  @override
  String toString() {
    return "LoginFormValues(email:$email)";
  }
}
