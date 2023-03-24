part of 'login_form_bloc.dart';

class LoginFormState extends Equatable {
  const LoginFormState({
    this.email = const Email.pure(),
    this.status = FormzStatus.pure,
  });

  final Email email;
  final FormzStatus status;

  LoginFormState copyWith({
    Email? email,
    FormzStatus? status,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }

  factory LoginFormState.fromValues({
    required String email,
  }) {
    return LoginFormState(
      email: Email.pure(email),
    );
  }

  LoginFormValues toValues() {
    return LoginFormValues(
      email: email.value,
    );
  }

  @override
  List<Object> get props => [email, status];
}
